angular.module("chatApp.controllers").controller("ChatCtrl", function ($scope, GameService) {
    $scope.messages = [];
    $scope.message = "";
    $scope.max = 140;

    $scope.addMessage = function () {
        GameService.sendMessage($scope.message);
        $scope.message = "";
    };

    $scope.restartGame = function () {
        GameService.restart();
    };

    GameService.receive().then(null, null, function (message) {
        if (message.action === "message") {
            $scope.messages.push(message);
        }
        if (message.action === "refresh") {
            $.each(jQuery.parseJSON(message.board), function (index, value) {
                $("#" + index).text(value);
                $("#myModal").css('display', '');
            });
        }
    });
}).controller("MoveCtrl", function ($scope, GameService) {
    $scope.addMove = function (event) {
        var whitePieces = ["♙", "♖", "♘", "♗", "♔", "♕"];
        var blackPieces = ["♟", "♜", "♞", "♝", "♚", "♛"];
        var colorSel = $("#color");
        var color = null;
        if (colorSel.html().indexOf("white") >= 0) {
            color = "white";
        } else if (colorSel.html().indexOf("black") >= 0) {
            color = "black";
        }
        var element = event.target;
        var selected = $(".selected");
        var chessPiece;
        if (selected.length != 0) {
            chessPiece = selected.html();
            var start = selected.attr('id');
            selected.empty().toggleClass("selected");
            GameService.sendSelection("off");
            element.innerText = chessPiece;
            var end = element.id;
            GameService.sendMove(chessPiece, start, end);
        } else if (element.innerText.length != 0) {
            chessPiece = $(".mouseon").html();
            var makeMove;
            if (color === "white") {
                makeMove = $.inArray(chessPiece, whitePieces);
            } else if (color === "black") {
                makeMove = $.inArray(chessPiece, blackPieces);
            }
            if (makeMove >= 0) {
                element.classList.toggle("selected");
                element.classList.remove("mouseon");
                GameService.sendSelection(element.id);
            }
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
}).controller("SideCtrl", function ($scope, GameService) {
    var sessionId;
    $scope.chooseSide = function (sessiondId, color) {
        GameService.chooseColor(sessiondId, color);
        sessionId = sessiondId;
    };

    GameService.receive().then(null, null, function (color) {
        var displayMyModal2 = function() {
            $("#myModal2").css('display', '');
            var intervalId = setInterval(myFun, 2000);
            function myFun() {
                var url = "/chess/game/start";
                $.get(url, null, function (data) {
                    if (data) {
                        $("#myModal2").css('display', 'none');
                        clearInterval(intervalId);
                    }
                });
            }
        };
        if (color != null && color.action === "chooseColor") {
            $("#myModal").css('display', 'none');
            if (sessionId == color.sessionId) {
                if (color.color === "white") {
                    $("#color").text("You're playing white.");
                } else if (color.color === "black") {
                    $("#color").text("You're playing black.");
                }
                if (color.wait) {
                    displayMyModal2();
                }
            } else {
                if (color.color === "white") {
                    $("#color").text("You're playing black.");
                } else if (color.color === "black") {
                    $("#color").text("You're playing white.");
                }
                if (color.wait) {
                    displayMyModal2();
                }
            }
        }
    });
});

