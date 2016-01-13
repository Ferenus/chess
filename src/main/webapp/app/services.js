angular.module("chatApp.services").service("GameService", function ($q, $timeout) {

    var service = {}, listener = $q.defer(), socket = {
        client: null,
        stomp: null
    }, ids = [];

    service.RECONNECT_TIMEOUT = 30000;
    service.SOCKET_URL = "/chess/chat";
    service.CHAT_TOPIC = "/topic/message";
    service.CHAT_BROKER = "/app/chat";
    service.MOVE_TOPIC = "/topic/move";
    service.MOVE_BROKER = "/app/move";
    service.SELECTION_BROKER = "/app/selection";
    service.SELECTION_TOPIC = "/topic/selection";

    service.receive = function () {
        return listener.promise;
    };

    service.sendMessage = function (message) {
        var id = Math.floor(Math.random() * 1000000);
        socket.stomp.send(service.CHAT_BROKER, {
            priority: 9
        }, JSON.stringify({
            message: message,
            id: id
        }));
        ids.push(id);
    };

    service.sendMove = function (chessPiece, start, end) {
        var id = Math.floor(Math.random() * 1000000);
        socket.stomp.send(service.MOVE_BROKER, {
            priority: 9
        }, JSON.stringify({
            chessPiece: chessPiece,
            start: start,
            end: end,
            id: id
        }));
        ids.push(id);
    };

    service.sendSelection = function (fieldId) {
        var id = Math.floor(Math.random() * 1000000);
        socket.stomp.send(service.SELECTION_BROKER, {
            priority: 9
        }, JSON.stringify({
            message: fieldId,
            id: id
        }));
        ids.push(id);
    };

    var reconnect = function () {
        $timeout(function () {
            initialize();
        }, this.RECONNECT_TIMEOUT);
    };

    var getMessage = function (data) {
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

    var getMove = function (data) {
        var move = JSON.parse(data), out = {};
        out.chessPiece = move.chessPiece;
        out.start = move.start;
        out.end = move.end;
        out.action = "move";
        if (_.contains(ids, move.id)) {
            out.self = true;
            ids = _.remove(ids, move.id);
        }
        return out;
    };

    var getSelection = function (data) {
        var selection = JSON.parse(data), out = {};
        out.selection = selection.message;
        out.action = "selection";
        if (_.contains(ids, selection.id)) {
            out.self = true;
            ids = _.remove(ids, selection.id);
        }
        return out;
    };

    var startListener = function () {
        socket.stomp.subscribe(service.CHAT_TOPIC, function (data) {
            listener.notify(getMessage(data.body));
        });
        socket.stomp.subscribe(service.MOVE_TOPIC, function (data) {
            listener.notify(getMove(data.body));
        });
        socket.stomp.subscribe(service.SELECTION_TOPIC, function (data) {
            listener.notify(getSelection(data.body));
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

