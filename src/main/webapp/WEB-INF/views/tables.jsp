<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300,700,400' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="assets/tables.css">
    <title>Chess - play a game!</title>
</head>
<body ng-app="tablesApp">

<div class="rTable" ng-controller="GamesCtrl">
    <div class="rTableRow">
        <div class="background">
            <div class="scrollable">
                <%--c:if--%>
                <div class="oneTable">
                    #1
                    <a href="#" class="button grey"
                       style="margin: 2px 2px 2px 2px; position: relative; padding: 5px 10px;">&#9812; WHITE</a>
                    Player1 - Player2
                    <a href="#" class="button grey"
                       style="margin: 2px 2px 2px 2px; position: relative; padding: 5px 10px;">&#9818; BLACK</a>
                </div>
            </div>
        </div>
        <div class="rTableCell">
            <form name="addGame" ng-submit="addGame()">
                <a href="javascript: submitForm()" class="button grey">NEW TABLE</a>
                <button>test only</button>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    function submitForm() {   document.addGame.submit(); }
</script>

<script src="libs/jquery/jquery-1.11.0.min.js"></script>
<script src="app/jquery.js"></script>
<script src="libs/sockjs/sockjs.min.js" type="text/javascript"></script>
<script src="libs/stomp-websocket/lib/stomp.min.js" type="text/javascript"></script>
<script src="libs/angular/angular.min.js"></script>
<script src="libs/lodash/dist/lodash.min.js"></script>
<script src="app/app2.js" type="text/javascript"></script>
<script src="app/controllers2.js" type="text/javascript"></script>
<script src="app/services2.js" type="text/javascript"></script>
</body>
</html>
