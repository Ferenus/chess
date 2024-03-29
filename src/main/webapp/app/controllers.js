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
    $scope.addMove = function (event) {
        var element = event.target;
        var selected = $(".selected");
        if (selected.length != 0) {
            var chessPiece = selected.html();
            var start = selected.attr('id');
            selected.empty().toggleClass("selected");
            GameService.sendSelection("off");
            element.innerText = chessPiece;
            var end = element.id;
            GameService.sendMove(chessPiece, start, end);
        } else if (element.innerText.length != 0) {
            element.classList.toggle("selected");
            element.classList.remove("mouseon");
            GameService.sendSelection(element.id);
        }
    };

    GameService.receive().then(null, null, function (move) {
        if (move.action === "move" && move.self != true) {
            var chessPiece = move.chessPiece;
            var start = move.start;
            var end = move.end;
            $("#" + start).empty();
            $("#" + end).text(chessPiece);
        }
        if (move.action === "selection" && move.self != true) {
            var selection = move.selection;
            var selected = $(".selected");
            if (selected.length != 0) {
                selected.toggleClass("selected");
            } else {
                $("#" + selection).toggleClass("selected");
            }
        }
    });
});

