angular.module("tablesApp.controllers").controller("GamesCtrl", function($scope, GameService) {
    $scope.addGame = function (event) {
        GameService.createGame();
    };

});

