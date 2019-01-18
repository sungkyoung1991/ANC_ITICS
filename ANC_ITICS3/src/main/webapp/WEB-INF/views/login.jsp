<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>ANC ITICS(Inland Trucking Information Consolidation System)</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="./resources/assets/css/main.css" />
		
		<link rel="stylesheet" href="./resources/assets/css/main.css" />
		<link rel="icon" href="./resources/images/favicon.ico" type="image/x-icon" />
   		<link rel="shortcut icon" href="./resources/images/favicon.ico" type="image/x-icon" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<body class="loading" oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
	
		<form action="/user/login" method="post" id="loginform">
		<div id="wrapper">
			<div id="bg"></div>
			<div id="overlay"></div>
			<div id="main">

				<!-- Header -->
					<header id="header">
					
						<h1 style="color:white; text-shadow: 0 0 15px #000000;">
						<img src="./resources/images/ANCLOGO.png" style="max-width:100%; height:auto;"/>
						</h1>
						<p style="text-shadow: 0 0 15px #000000; opacity:1 ;">Inland Trucking Information Consolidation System</p>
						<!-- <h1 style="color:red; text-shadow: 0 0 15px #000000;">[Express Mode]</h1> -->
						
						<p style="opacity:1;">	<a href="#contact" class="btn-example button big icon fa-arrow-circle-right" style="font-size:1.5em; background:#2ECCFA;">Login</a></p>
						
							<div class="dim-layer">
							    <div class="dimBg"></div>
							    <div id="contact" class="pop-layer">
							        <div class="pop-container">
							            <div class="pop-conts">
							            
							                <!--content //-->
							                <p style="color:black; font-size:9pt; "> 발급받으신 아이디와 패스워드를 입력하세요.</p>
							                
							                <p style="color:black; font-size:1em; vertical-align:middle;">
							                <label>아이디</label>
							                	<input type="text" name="user_id" id="user_id" style="width:150px;color:black;"/>
							                <label>비밀번호</label>
							                	<input type="password" name="user_pw" id="user_pw" onkeypress="if(event.keyCode==13) {document.getElementById('loginform').submit();}" style="width:150px;color:black;"/>
							                </p>
												<a onclick="document.getElementById('loginform').submit();" class="btn-layerClose">로그인</a>
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
		<script src="./resources/assets/js/jquery.min.js"></script>
		<script src="./resources/assets/js/skel.min.js"></script>
		<script src="./resources/assets/js/util.js"></script>
		<script src="./resources/assets/js/main.js"></script>
		
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script>
			window.onload = function() { document.body.className = ''; }
			window.ontouchmove = function() { return false; }
			window.onorientationchange = function() { document.body.scrollTop = 0; }
		</script>
		</form>
	</body>
</html>

