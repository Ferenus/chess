angular.module("chatApp.services").service("GameService", function ($q, $timeout) {

    var service = {}, listener = $q.defer(), socket = {
        client: null,
        stomp: null
    }, messageIds = [];

    service.RECONNECT_TIMEOUT = 30000;
    service.SOCKET_URL = "/spring-ng-chat/chat";
    service.CHAT_TOPIC = "/topic/message";
    service.CHAT_BROKER = "/app/chat";
    service.MOVE_TOPIC = "/topic/move";
    service.MOVE_BROKER = "/app/move";

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
        messageIds.push(id);
    };

    service.sendMove = function (message) {
        var id = Math.floor(Math.random() * 1000000);
        socket.stomp.send(service.MOVE_BROKER, {
            priority: 9
        }, JSON.stringify({
            message: message,
            id: id
        }));
        messageIds.push(id);
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
        if (_.contains(messageIds, message.id)) {
            out.self = true;
            messageIds = _.remove(messageIds, message.id);
        }
        return out;
    };

    var getMove = function (data) {
        var message = JSON.parse(data), out = {};
        out.message = message.message;
        out.action = "move";
        if (_.contains(messageIds, message.id)) {
            out.self = true;
            messageIds = _.remove(messageIds, message.id);
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

