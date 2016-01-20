<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300,700,400' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="assets/reset.css">
    <link rel="stylesheet" href="assets/style2.css">
    <script src="libs/js/modernizr.js"></script>

    <title>Chess - play a game!</title>
</head>
<body>

<section class="cd-intro video">
    <div class="cd-intro-content video">
        <h1 class="svg-wrapper">
            <svg class="svg-mask" x="0px" y="0px" width="4000px" height="3000px" viewBox="0 0 4000 3000">
                <title>Chess</title>
                <path fill="#FFFFFF" d="M0,0v3000h4000V0H0z"/>
            </svg> <!-- .svg-mask -->

            <svg class="svg-mask-mobile" x="0px" y="0px" width="2000px" height="3000px" viewBox="0 0 2000 3000">
                <title>Chess</title>
                <path fill="#FFFFFF" d="M0,0v3000h2000V0H0z"/>
            </svg> <!-- .svg-mask-mobile -->
        </h1>

        <p>"Some people think that if their opponent plays a beautiful game, it's ok to lose. I don't. You have to be merciless." - Magnus Carlsen</p>

        <div class="action-wrapper">
            <a href="game" class="cd-btn main-action">Play</a>
            <a href="#0" class="cd-btn">Log out</a>
        </div>

        <div class="cd-bg-video-wrapper" data-video="assets/video">
            <!-- video element will be loaded using jQuery -->
        </div>
    </div>
</section>

<script src="libs/jquery/jquery-1.11.0.min.js"></script>
<script src="app/jquery.js"></script>
<script src="libs/js/main.js"></script>
</body>
</html>
