angular.module("tablesApp.services").service("GameService", function ($q, $timeout) {

    var service = {}, listener = $q.defer(), socket = {
        client: null,
        stomp: null
    }, ids = [];

    service.RECONNECT_TIMEOUT = 30000;
    service.SOCKET_URL = "/chess/chat";
    service.NEW_GAME_BROKER = "/app/newgame";
    service.NEW_GAME_TOPIC = "/topic/newgame";

    service.receive = function () {
        return listener.promise;
    };

    service.createGame = function () {
        socket.stomp.send(service.NEW_GAME_BROKER, {
            priority: 9
        }, JSON.stringify({
            id: "aaa"
        }));
    };

    var reconnect = function () {
        $timeout(function () {
            initialize();
        }, this.RECONNECT_TIMEOUT);
    };

    var getGame = function (data) {
        var message = JSON.parse(data), out = {};
        out.message = message.message;
        out.time = new Date(message.time);
        out.action = "message";
        if (_.contains(ids, message.id)) {
            out.self = true;
            ids = _.remove(ids, message.id);
        }
        return out;
    };

    var startListener = function () {
        socket.stomp.subscribe(service.CHAT_TOPIC, function (data) {
            listener.notify(getGame(data.body));
        });
    };

    var initialize = function () {
        socket.client = new SockJS(service.SOCKET_URL);
        socket.stomp = Stomp.over(socket.client);
        socket.stomp.connect({}, startListener);
        socket.stomp.onclose = reconnect;
    };

    initialize();
    return service;
});

