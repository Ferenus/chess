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
                <path fill="#FFFFFF" d="M1836.9,1488h-2.9v24h2.1c3.5,0,6.1-1,7.7-3.1s2.5-5.2,2.5-9.4c0-3.9-0.8-6.8-2.3-8.7
					C1842.5,1488.9,1840.1,1488,1836.9,1488z"/>
                <path fill="#FFFFFF" d="M0,0v3000h4000V0H0z M1758.4,1521h-13.6l-14-42h13l5.8,21.5c1.2,4.8,1.9,8.1,2,10c0.1-1.4,0.4-3.1,0.8-5.2
					s0.8-3.5,1.1-4.7l5.9-21.7h12.9L1758.4,1521z M1801,1521h-12v-42h12V1521z M1852.4,1515.4c-3.9,3.9-9.5,5.6-16.6,5.6H1822v-42h14.8
					c6.9,0,12.2,1.6,15.9,5.1c3.7,3.5,5.6,8.4,5.6,15C1858.3,1506.3,1856.4,1511.6,1852.4,1515.4z M1903,1488h-13v7h12v9h-12v8h13v9
					h-25v-42h25V1488z M1957.7,1516.4c-3.5,3.8-8.7,5.6-15.5,5.6c-6.7,0-11.9-1.9-15.5-5.7c-3.6-3.8-5.4-9.3-5.4-16.5
					c0-7.1,1.8-12.6,5.3-16.3c3.6-3.8,8.7-5.6,15.5-5.6c6.8,0,12,1.9,15.5,5.6c3.5,3.7,5.3,9.2,5.3,16.4
					C1963,1507.2,1961.3,1512.7,1957.7,1516.4z M2036,1488h-14v7h13v9h-13v8h14v9h-26v-42h26V1488z M2081,1488h-14v8h13v9h-13v16h-12
					v-42h26V1488z M2125,1488h-14v8h13v9h-13v16h-11v-42h25V1488z M2169,1488h-13v7h12v9h-12v8h13v9h-25v-42h25V1488z M2208.6,1512.6
					c1.9,0,3.5-0.3,5.3-0.8s4.1-1.2,5.1-1.9v9.8c-3,1.6-7.4,2.4-11.9,2.4c-6.5,0-11.3-1.9-14.7-5.6c-3.4-3.8-5.1-9.2-5.1-16.3
					c0-4.4,0.9-8.3,2.5-11.7c1.7-3.4,4.1-5.9,7.2-7.7c3.1-1.8,6.8-2.7,11.1-2.7c4.6,0,9.1,1,13.3,3l-3.5,9.1c-1.6-0.7-3.2-1.4-4.7-1.9
					c-1.6-0.5-3.3-0.8-5.1-0.8c-2.8,0-4.9,1.1-6.4,3.4s-2.3,5.4-2.3,9.3C2199.2,1508.5,2202.3,1512.6,2208.6,1512.6z M2269,1488h-10v33
					h-12v-33h-10v-9h32V1488z"/>
                <path fill="#FFFFFF" d="M1942.3,1487.4c-5.8,0-8.7,4.2-8.7,12.5c0,8.3,2.9,12.4,8.6,12.4c2.9,0,5.1-1,6.5-3c1.4-2,2.1-5.1,2.1-9.4
					c0-4.3-0.7-7.4-2.2-9.5C1947.3,1488.5,1945.1,1487.4,1942.3,1487.4z"/>
            </svg> <!-- .svg-mask -->

            <svg class="svg-mask-mobile" x="0px" y="0px" width="2000px" height="3000px" viewBox="0 0 2000 3000">
                <title>Chess</title>
                <path fill="#FFFFFF" d="M1082,1445c-5.8,0-8.7,4.2-8.7,12.5s2.9,12.4,8.6,12.4c2.9,0,5.1-1,6.5-3s2.1-5.1,2.1-9.4s-0.7-7.4-2.2-9.5
					C1087,1446,1084.9,1445,1082,1445z"/>
                <path fill="#FFFFFF" d="M0,0v3000h2000V0H0z M1022.6,1436.2h25.4v9.3h-13.9v6.7h12.8v9.3h-12.8v8.1h13.9v9.4h-25.4V1436.2z
					 M971.3,1436.2h14.8c6.9,0,12.2,1.8,15.9,5.3s5.6,8.6,5.6,15.2c0,7.1-2,12.7-5.9,16.5c-3.9,3.9-9.5,5.8-16.6,5.8h-13.9v-42.8H971.3z
					 M907.4,1525.5h-13.9v6.7h12.8v9.3h-12.8v8.1h13.9v9.4H882v-42.8h25.4V1525.5z M903.8,1479l-14-42.8h13l5.8,21.7
					c1.2,4.8,1.9,8.2,2,10.1c0.1-1.4,0.4-3.1,0.8-5.1s0.8-3.7,1.1-4.8l5.9-21.8h12.9l-14,42.8L903.8,1479L903.8,1479z M947.4,1525.5
					h-13.9v8.2h12.8v9.3h-12.8v16.1h-11.4v-42.8h25.3L947.4,1525.5L947.4,1525.5z M954.9,1479h-11.6v-42.8h11.6V1479z M987,1525.5h-13.9
					v8.2h12.8v9.3h-12.8v16.1h-11.4v-42.8H987V1525.5z M1026.7,1525.5h-13.9v6.7h12.8v9.3h-12.8v8.1h13.9v9.4h-25.4v-42.8h25.4V1525.5z
					 M1061.1,1550.1c1.9,0,3.7-0.3,5.5-0.8s3.6-1.2,5.4-1.9v9.8c-3.6,1.6-7.6,2.4-12.1,2.4c-6.5,0-11.4-1.9-14.9-5.6
					c-3.4-3.8-5.2-9.2-5.2-16.3c0-4.4,0.8-8.3,2.5-11.7c1.7-3.4,4.1-5.9,7.2-7.7c3.1-1.8,6.8-2.7,11.1-2.7c4.6,0,9.1,1,13.3,3l-3.5,9.1
					c-1.6-0.7-3.2-1.4-4.7-1.9c-1.6-0.5-3.3-0.8-5.1-0.8c-2.8,0-4.9,1.1-6.4,3.4s-2.3,5.4-2.3,9.3
					C1051.7,1546,1054.8,1550.1,1061.1,1550.1z M1066.5,1473.9c-3.6-3.8-5.4-9.3-5.4-16.5c0-7.1,1.8-12.6,5.3-16.3
					c3.6-3.8,8.7-5.6,15.5-5.6s12,1.9,15.5,5.6s5.3,9.2,5.3,16.4c0,7.2-1.8,12.7-5.3,16.4s-8.7,5.6-15.5,5.6
					C1075.2,1479.6,1070.1,1477.7,1066.5,1473.9z M1116.8,1525.6h-10.4v33.4h-11.6v-33.4h-10.5v-9.5h32.5V1525.6z"/>
                <path fill="#FFFFFF" d="M993.2,1466.4c1.6-2,2.5-5.2,2.5-9.4c0-3.9-0.8-6.8-2.3-8.7c-1.6-1.9-3.9-2.8-7.1-2.8h-3.4v24h2.6
					C989,1469.5,991.6,1468.5,993.2,1466.4z"/>
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
