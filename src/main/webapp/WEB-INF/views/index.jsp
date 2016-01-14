<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700" rel="stylesheet" type="text/css"/>
    <link href="assets/style.css" rel="stylesheet" type="text/css"/>
    <script src="libs/jquery/jquery.min.js"></script>
</head>
<script language="javascript">
window.onload = function () {
    var selection = "${selection}";
    var board = ${board};
    if (selection != "off" && selection != null) {
        $("#" + selection).toggleClass("selected");
    }
    $.each( board, function(index,value){
        $("#" + index).text(value);
    })
};
</script>
<body ng-app="chatApp">
<div class="parent">
    <div ng-controller="MoveCtrl" class="chessboard">
        <div ng-click="addMove($event)">
        <!-- 8st -->
        <div class="white" id="A8"></div>
        <div class="black" id="B8"></div>
        <div class="white" id="C8"></div>
        <div class="black" id="D8"></div>
        <div class="white" id="E8"></div>
        <div class="black" id="F8"></div>
        <div class="white" id="G8"></div>
        <div class="black" id="H8"></div>
        <!-- 7nd -->
        <div class="black" id="A7"></div>
        <div class="white" id="B7"></div>
        <div class="black" id="C7"></div>
        <div class="white" id="D7"></div>
        <div class="black" id="E7"></div>
        <div class="white" id="F7"></div>
        <div class="black" id="G7"></div>
        <div class="white" id="H7"></div>
        <!-- 6th -->
        <div class="white" id="A6"></div>
        <div class="black" id="B6"></div>
        <div class="white" id="C6"></div>
        <div class="black" id="D6"></div>
        <div class="white" id="E6"></div>
        <div class="black" id="F6"></div>
        <div class="white" id="G6"></div>
        <div class="black" id="H6"></div>
        <!-- 5st -->
        <div class="black" id="A5"></div>
        <div class="white" id="B5"></div>
        <div class="black" id="C5"></div>
        <div class="white" id="D5"></div>
        <div class="black" id="E5"></div>
        <div class="white" id="F5"></div>
        <div class="black" id="G5"></div>
        <div class="white" id="H5"></div>
        <!-- 4th -->
        <div class="white" id="A4"></div>
        <div class="black" id="B4"></div>
        <div class="white" id="C4"></div>
        <div class="black" id="D4"></div>
        <div class="white" id="E4"></div>
        <div class="black" id="F4"></div>
        <div class="white" id="G4"></div>
        <div class="black" id="H4"></div>
        <!-- 3th -->
        <div class="black" id="A3"></div>
        <div class="white" id="B3"></div>
        <div class="black" id="C3"></div>
        <div class="white" id="D3"></div>
        <div class="black" id="E3"></div>
        <div class="white" id="F3"></div>
        <div class="black" id="G3"></div>
        <div class="white" id="H3"></div>
        <!-- 2th -->
        <div class="white" id="A2"></div>
        <div class="black" id="B2"></div>
        <div class="white" id="C2"></div>
        <div class="black" id="D2"></div>
        <div class="white" id="E2"></div>
        <div class="black" id="F2"></div>
        <div class="white" id="G2"></div>
        <div class="black" id="H2"></div>
        <!-- 1th -->
        <div class="black" id="A1"></div>
        <div class="white" id="B1"></div>
        <div class="black" id="C1"></div>
        <div class="white" id="D1"></div>
        <div class="black" id="E1"></div>
        <div class="white" id="F1"></div>
        <div class="black" id="G1"></div>
        <div class="white" id="H1"></div>
        </div>
    </div>

    <div ng-controller="ChatCtrl" class="container">
        <form ng-submit="addMessage()" name="messageForm">
            <input type="text" placeholder="Compose a new message..." ng-model="message"/>

            <div class="info">
                <span class="count" ng-bind="max - message.length" ng-class="{danger: message.length > max}">140</span>
                <button ng-disabled="message.length > max || message.length === 0">Send</button>
            </div>
        </form>
        <hr/>
        <p ng-repeat="message in messages | orderBy:'time':true" class="message">
            <time>{{message.time | date:'HH:mm'}}</time>
            <span ng-class="{self: message.self}">{{message.message}}</span>
        </p>
        <c:forEach items="${msgList}" var="message">
            <p class="message">
            <time><fmt:formatDate pattern="HH:mm" value="${message.time}" /></time>
            <span>${message.message}</span>
            </p>
        </c:forEach>
    </div>
</div>

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="app/jquery.js"></script>
<script src="libs/sockjs/sockjs.min.js" type="text/javascript"></script>
<script src="libs/stomp-websocket/lib/stomp.min.js" type="text/javascript"></script>
<script src="libs/angular/angular.min.js"></script>
<script src="libs/lodash/dist/lodash.min.js"></script>
<script src="app/app.js" type="text/javascript"></script>
<script src="app/controllers.js" type="text/javascript"></script>
<script src="app/services.js" type="text/javascript"></script>
</body>
</html>
