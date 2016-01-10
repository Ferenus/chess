angular.module("chatApp.controllers").controller("ChatCtrl", function ($scope, ChatService) {
    $scope.messages = [];
    $scope.message = "";
    $scope.max = 140;

    $scope.addMessage = function () {
        ChatService.send($scope.message);
        $scope.message = "";
    };

    ChatService.receive().then(null, null, function (message) {
        $scope.messages.push(message);
    });
}).controller("MoveCtrl", function ($scope, MoveService) {
    $scope.moves = [];

    $scope.addMove = function (event) {
        var element = event.target;
        var selected = $(".selected");
        if (selected.length != 0) {
            var piece = selected.html();
            var start = selected.attr('id');
            selected.empty().toggleClass("selected");
            element.innerText = piece;
            MoveService.send(piece + start +"-"+ element.id);
        } else if (element.innerText.length != 0) {
            element.classList.toggle("selected");
            selected.css("background", "");
            MoveService.send("selected field: " + element.id);
        }
    };

    MoveService.receive().then(null, null, function (move) {
        $scope.moves.push(move);
    });
});

