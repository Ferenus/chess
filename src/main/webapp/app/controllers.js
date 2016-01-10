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
    $scope.move = "";

    $scope.addMove = function () {
/*        MoveService.send($scope.start);
        MoveService.send($scope.end);
        MoveService.send($scope.chessPiece);*/
        MoveService.send($scope.move);
        $scope.move = "";
    };

    MoveService.receive().then(null, null, function (move) {
        $scope.moves.push(move);
    });
});

