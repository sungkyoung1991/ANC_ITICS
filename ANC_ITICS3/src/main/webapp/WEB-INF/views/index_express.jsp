<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<!--
	Aerial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>ANC ITICS</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="shortcut icon" href="/resources/images/favicon.ico" type="image/x-icon" />
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
						<img src="/resources/images/ANCLOGO.png" style="max-width:100%; height:auto;"/>
						</h1>
						<p style="text-shadow: 0 0 15px #000000;">Inland Trucking Information Consolidation System<br>[운송사 모드]</p>
						<!-- <h1 style="color:red; text-shadow: 0 0 15px #000000;">[Express Mode]</h1> -->
						
						<p>	<!-- <a href="#contact" class="btn-example button big icon fa-list" style="font-size:1.5em">화물 정보 조회</a> --></p>
							<div class="dim-layer">
							    <div class="dimBg"></div>
							    <div id="contact" class="pop-layer">
							        <div class="pop-container">
							            <div class="pop-conts">
							                <!--content //-->
							                <p style="color:black; font-size:9pt"> [로그인한 운송사가 내륙운송 데이터를 입력해야하는 B/L List가 나옵니다. 접근해야하는 아이콘도 출력]</p>
							                <p style="color:black;">
							                <label><i class="fa fa-wpforms" aria-hidden="true"></i> House B/L No</label>
							                <select name="hblno" style="color:black">
							                	<option value="">House B/L List</option>
							                </select>
							                <a onclick="window.open('http://mcube.ne.kr/interface/cargoTracking.do?yhtService=ufms&cargMtNo=&mblNo=PMKAiEwT5dHndn93XctpHg==&hblNo=dx3AQknkedkNu83y89Jn7g==&blYy=2018')" class="btn-layerClose">조회하기</a>
							                
							            <!--     <label for="name">Air/Ocean H/BL</label>
											<input type="text" name="name" id="name" style="color:black" /> <button type="submit"  type="submit" onclick="window.open('http://mcube.ne.kr/interface/cargoTracking.do?yhtService=ufms&cargMtNo=&mblNo=PMKAiEwT5dHndn93XctpHg==&hblNo=dx3AQknkedkNu83y89Jn7g==&blYy=2018')">조회하기</button> <br>
							                    <!--   [터미널 스케줄 조회]<br>
							                    [화물추적]<br>
							                    [통관진행정보] -->
							                </p>
							
							                <div class="btn-r">
							                    <a href="#" class="btn-layerClose">Close</a>
							                </div>
							                <!--// content-->
							            </div>
							        </div>
							    </div>
							</div>
						
						<nav>
							<ul>
								
								<li><a href="/allocate/allocateMain?menu=AllocateCar" class="fa fa-truck" title="입력"><span class="label">입력</span><p style="font-size:9pt;">배차 시스템</p></a></li> <!-- 배차데이터입력 -->
								<!-- <li><a href="subpage_express.do?menu=SaftyAEO " class="fa fa-font" title="AEO 운송수단 안전관리"><span class="label">AEO 운송수단 안전관리</span><p style="font-size:9pt;">AEO안전관리</p></a></li> 차량정보등록
								<li><a href="#" class="fa fa-pie-chart" title="통계" aria-hidden="true"><span class="label">통계</span><p style="font-size:9pt">데이터 통계</p></a></li> -->
						<!-- 		<li><a href="#" class="fa fa-font" title="AEO안전관리" aria-hidden="true"><span class="label">AEO</span><p style="font-size:9pt">AEO</p></a></li> -->
								<!-- <li><a href="#" class="fa fa-file-text" title="리포트" aria-hidden="true"><span class="label">리포트</span><p style="font-size:9pt">리포트</p></a></li> -->
						<!-- 	<li><a href="#" class="fa fa-cog" title="환경설정" aria-hidden="true"><span class="label">환경설정</span><p style="font-size:9pt">Options</p></a></li> <!-- 시스템 환경설정 -->
							</ul>
						</nav>
					</header>

				<!-- Footer -->
					<footer id="footer">
						
					</footer>

			</div>
			</div>
		<script src="/resources/assets/js/jquery.min.js"></script>
		<script src="/resources/assets/js/skel.min.js"></script>
		<script src="/resources/assets/js/util.js"></script>
		<script src="/resources/assets/js/main.js"></script>
		
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script>
			window.onload = function() { document.body.className = ''; }
			window.ontouchmove = function() { return false; }
			window.onorientationchange = function() { document.body.scrollTop = 0; }
		</script>
	</body>
</html>