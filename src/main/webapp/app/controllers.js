angular.module("chatApp.controllers").controller("ChatCtrl", function ($scope, GameService) {
    $scope.messages = [];
    $scope.message = "";
    $scope.max = 140;

    $scope.addMessage = function () {
        GameService.sendMessage($scope.message);
        $scope.message = "";
    };

    GameService.receive().then(null, null, function (message) {
        if (message.action === "message") {
            $scope.messages.push(message);
        }
    });
}).controller("MoveCtrl", function ($scope, GameService) {
    $scope.moves = [];

    $scope.addMove = function (event) {
        var element = event.target;
        var selected = $(".selected");
        if (selected.length != 0) {
            var chessPiece = selected.html();
            var start = selected.attr('id');
            selected.empty().toggleClass("selected");
            element.innerText = chessPiece;
            var end = element.id;
            GameService.sendMove(chessPiece, start, end);
        } else if (element.innerText.length != 0) {
            element.classList.toggle("selected");
            selected.css("background", "");
            GameService.sendMessage("selected field: " + element.id);
        }
    };

    GameService.receive().then(null, null, function (move) {
        if (move.action === "move") {
            $scope.moves.push(move);
        }
    });
});

