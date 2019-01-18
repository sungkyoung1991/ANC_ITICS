<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    <%@ page import = "my.util.ConnUtil_uFMS" %>
    <%@ page import = "my.util.ConnUtil" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "paging.PagingUtil" %>
    <%@ page import = "paging.PagingBean" %>
    <%@ page import = "java.net.InetAddress" %>
    <%@ page import = "java.net.UnknownHostException" %>

<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>ANC ITICS(Inland Trucking Information Consolidation System)</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<body class="loading">
		<div id="wrapper">
			<div id="bg"></div>
			<div id="overlay"></div>
			<div id="main">

				<!-- Header -->
					<header id="header">
						<h1 style="color:white; text-shadow: 0 0 15px #000000;">
						<img src="./images/ANCLOGO.png" style="max-width:100%; height:auto;"/>
						</h1>
						<p style="text-shadow: 0 0 15px #000000;">Inland Trucking Information Consolidation System</p>
						<!-- <h1 style="color:red; text-shadow: 0 0 15px #000000;">[Express Mode]</h1> -->
						
						<p>	<a href="#contact" class="btn-example button big icon fa-arrow-circle-right" style="font-size:1.5em; background:#2ECCFA;">Login</a></p>
						
							<div class="dim-layer">
							    <div class="dimBg"></div>
							    <div id="contact" class="pop-layer">
							        <div class="pop-container">
							            <div class="pop-conts">
							                <!--content //-->
							                <p style="color:black; font-size:9pt"> 로그인을 원하시면 발급받으신 아이디와 비밀번호를 입력하세요.</p>
							                <p style="color:black; font-size:1em;">
							                <label>ID</label>
							                	<input type="text" name="userid" id="userid" style="width:100px;color:black;"/>
							                <label>PW</label>
							                	<input type="password" name="password" id="password"  style="width:100px;color:black;"/>
							                	<a onclick="parent.location.href('index_express.html')" class="btn-layerClose">로그인</a>
							           
							                </p>
							
							                <div class="btn-r">
							                    <a href="#" class="btn-layerClose">Close</a>
							                </div>
							                <!--// content-->
							            </div>
							        </div>
							    </div>
							</div>
						
						
					</header>

				<!-- Footer -->
					<footer id="footer">
						
					</footer>

			</div>
			</div>
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/skel.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
		
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script>
			window.onload = function() { document.body.className = ''; }
			window.ontouchmove = function() { return false; }
			window.onorientationchange = function() { document.body.scrollTop = 0; }
		</script>
	</body>
</html>

