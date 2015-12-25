<!DOCTYPE HTML>
<html lang="en">
  <head>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700" rel="stylesheet" type="text/css" />
    <link href="assets/style.css" rel="stylesheet" type="text/css" />
  </head>
  <body ng-app="chatApp">
  <div class="chessboard">
    <!-- 1st -->
    <div class="white">&#9820;</div>
    <div class="black">&#9822;</div>
    <div class="white">&#9821;</div>
    <div class="black">&#9819;</div>
    <div class="white">&#9818;</div>
    <div class="black">&#9821;</div>
    <div class="white">&#9822;</div>
    <div class="black">&#9820;</div>
    <!-- 2nd -->
    <div class="black">&#9823;</div>
    <div class="white">&#9823;</div>
    <div class="black">&#9823;</div>
    <div class="white">&#9823;</div>
    <div class="black">&#9823;</div>
    <div class="white">&#9823;</div>
    <div class="black">&#9823;</div>
    <div class="white">&#9823;</div>
    <!-- 3th -->
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <!-- 4st -->
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <!-- 5th -->
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <!-- 6th -->
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <!-- 7th -->
    <div class="white">&#9817;</div>
    <div class="black">&#9817;</div>
    <div class="white">&#9817;</div>
    <div class="black">&#9817;</div>
    <div class="white">&#9817;</div>
    <div class="black">&#9817;</div>
    <div class="white">&#9817;</div>
    <div class="black">&#9817;</div>
    <!-- 8th -->
    <div class="black">&#9814;</div>
    <div class="white">&#9816;</div>
    <div class="black">&#9815;</div>
    <div class="white">&#9813;</div>
    <div class="black">&#9812;</div>
    <div class="white">&#9815;</div>
    <div class="black">&#9816;</div>
    <div class="white">&#9814;</div>
  </div>

    <div ng-controller="ChatCtrl" class="container">
      <form ng-submit="addMessage()" name="messageForm">
        <input type="text" placeholder="Compose a new message..." ng-model="message" />
        <div class="info">
          <span class="count" ng-bind="max - message.length" ng-class="{danger: message.length > max}">140</span>
          <button ng-disabled="message.length > max || message.length === 0">Send</button>
        </div>
      </form>
      <hr />
      <p ng-repeat="message in messages | orderBy:'time':true" class="message">
        <time>{{message.time | date:'HH:mm'}}</time>
        <span ng-class="{self: message.self}">{{message.message}}</span>
      </p>
    </div>

    
    <script src="libs/sockjs/sockjs.min.js" type="text/javascript"></script>
    <script src="libs/stomp-websocket/lib/stomp.min.js" type="text/javascript"></script>
    <script src="libs/angular/angular.min.js"></script>
    <script src="libs/lodash/dist/lodash.min.js"></script>
    <script src="app/app.js" type="text/javascript"></script>
    <script src="app/controllers.js" type="text/javascript"></script>
    <script src="app/services.js" type="text/javascript"></script>
  </body>
</html>
