<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ancintl.ancitics.domain.User"%>


<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->

<% 
	User user = (User)session.getAttribute("user");
			
	String user_id = user.getUser_id();
	String company_name = user.getCompany_name();
	String auth = user.getUser_auth();
%>
<html>
	<head>
		<title>ANC ITICS - Subpage(Express)</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/resources/assets/css/subpage.css" />
		<link rel="shortcut icon" href="/resources/images/favicon.ico" type="image/x-icon" />
		<!-- <link rel = "stylesheet" href = "ui/jquery.mobile-1.2.0.min.css" /> -->
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		
		<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
		
		<script type="text/javascript">
		
			$(document).ready(function(){
    		
    	    
    	});	
		
		</script>
		
		
	</head>
	<body>
	
	
	<div class="topFixLogo" style="clear:both; background:#F2F2F2; border-bottom: 1px solid  #BDBDBD">
           		<a href="index_express.do" style="border:0;"><img src="/resources/images/ancitics.png"  style="max-width:100%; height:auto; "/></a>
       		
       		<div class="usernavi">
		  			<nav style="margin:8px 30px 0px 0px;">
			  			<font face="맑은 고딕" color="orange"><span style="font-size:9pt;"><i class="fa fa-user-circle" aria-hidden="true"></i><b> <%= user_id %> (<%= company_name %>) </b> 님 환영합니다.</span></font>
                       	<font face="맑은 고딕"><span style="font-size:9pt;"><button onclick="location.href='./MemberLogoutAction.do'" style="box-shadow: inset 0 0 0 2px orange; color: orange !important; "><i class="fa fa-sign-out" aria-hidden="true"></i> 로그아웃</button></span></font>
                       	<font face="맑은 고딕"><span style="font-size:9pt;"><button style="box-shadow: inset 0 0 0 2px orange; color: orange !important; "><i class="fa fa-question-circle-o" aria-hidden="true"></i> 시스템 도움말</button></span></font>
		           		<!--  <a href="index_express.html" style="border:0;"><h style="font-size:25px"><i class="fa fa-comments-o" aria-hidden="true"></i></h></a>-->
		           </nav>
       		</div>
       		
     </div>
     
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Main -->
					<div id="main">
						<div class="inner">

						<br>
								<div class="box container" id="contents" style="height:1600px;">
									 <jsp:include page="/WEB-INF/views/menu/AllocateCar.jsp"></jsp:include>
								</div>
								
							<!-- Banner -->
						

							<!-- Section -->						
						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
								<section id="search" class="alt" style="margin:-0.5em 0 1.44444em -1.8em;" >
									<form method="post" action="#">
										<input type="text" name="query" id="query" style="height: 2.75em; padding: 0em 0 0 3em;"  placeholder="B/L Search" />
									</form>
								</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>ITICS - 운송사</h2>
									</header>
									<ul>
										<!-- <li ><a href="index_express.html"><h style="font-size:25px"><i class="fa fa-home" aria-hidden="true"></i></h> 홈</a></li> -->
										<li>
											<span class="opener"><h style="font-size:27px;"><i class="fa fa-truck" aria-hidden="true"></i></h> 배차시스템</span>
											<ul>
												<li style="font-size:15px"><a id="AllocateCar"><i class="fa fa-list" aria-hidden="true"></i> 배차 등록</a></li>
												
												<% if(auth.equals("M")){ %> 
													<li style="font-size:15px"><a id="AllocateCar_Status"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 배차 현황</a></li>
												<% } %>
													
												<li style="font-size:15px"><a id="TransportAccount"><i class="fa fa-list" aria-hidden="true"></i> 운송수단 관리</a></li>
												<li style="font-size:15px"><a id="ManageDriver"><i class="fa fa-address-card-o" aria-hidden="true"></i> 운전자 관리</a></li>
											</ul>
										</li>
										<li>
											<!-- <span class="opener"><h style="font-size:25px"><i class="fa fa-bus" aria-hidden="true"></i></h> AEO(운송수단 안전관리)</span>
											<ul>
												
												<li style="font-size:15px"><a id="SaftyAEO"><i class="fa fa-check-square-o" aria-hidden="true"></i> 안전관리</a></li>
											</ul>
										</li>
										
										<li>
											<span class="opener"><h style="font-size:25px"><i class="fa fa-file-text" aria-hidden="true"></i></h> 보고 관리</span>
											<ul>
												<li style="font-size:15px;"><a id="AllocateCar_Finish"><i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;&nbsp;도착보고</a></li>
												<li style="font-size:15px"><a href="#"><i class="fa fa-minus-circle" aria-hidden="true"></i> 이상상황 보고</a></li>
											</ul>
										</li>
										<li>
											<span class="opener"><h style="font-size:25px"><i class="fa fa-pie-chart" aria-hidden="true"></i></h> 데이터 통계</span>
											<ul>
												<li style="font-size:15px;"><a href="#"><i class="fa fa-truck" aria-hidden="true"></i>&nbsp; 차량별 통계 </a></li>
												<li style="font-size:15px;"><a href="#"><i class="fa fa-map" aria-hidden="true"></i>&nbsp; 지역별 통계</a></li>
												<li style="font-size:15px;"><a href="#"><i class="fa fa-cubes" aria-hidden="true"></i> 입고지별 통계</a></li>
												<li style="font-size:15px;"><a href="#"><i class="fa fa-group" aria-hidden="true"></i>&nbsp; 화주별 통계</a></li>
												
											</ul>
										</li>
										<li>
											<span class="opener"><h style="font-size:25px"><i class="fa fa-pencil" aria-hidden="true"></i></h> 기초코드 관리</span>
											<ul>
												<li style="font-size:15px"><a href="#"><i class="fa fa-retweet" aria-hidden="true"></i> 출발지/도착지</a></li>
											</ul>
										</li> -->
										<li>
											<span class="opener"><h style="font-size:25px"><i class="fa fa-cog" aria-hidden="true"></i></h> 환경설정</span>
											<ul>
												<li style="font-size:15px"><a href="#"><i class="fa fa-history" aria-hidden="true"></i> 시스템 사용 로그</a></li>
											</ul>
										</li>
									</ul>
								</nav>
								
								
								
								<!-- Section -->
								<section>
									<header class="major">
										<h2>Our Services</h2>
									</header>
									
									
								
								
									<div class="mini-posts">
										<article>
											<a href="#" class="image" title="Global Forwarding"><img src="/resources/images/bg02.jpg" alt="" /></a>
											 <!--<p align="center">Global Forwarding</p> -->
										</article>
										<article>
											<a href="#" class="image" title="Global Logistics"><img src="/resources/images/gps.jpg" alt="" /></a>
											<!--<p align="center">Global Logistics</p>-->
										</article>
										<article>
											<a href="#" class="image" title="Inland Transportation"><img src="/resources/images/trucking.jpg" alt="" /></a>
											<!--<p align="center">Inland Transportation</p>-->
										</article>
									</div>
								</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Contact</h2>
									</header>
									<ul class="contact">
										<li class="fa-envelope-o"><a href="#">ebiz@ancintl.com</a></li>
										<li class="fa-phone">(02) 2660-6879</li>
										<li class="fa-home">서울특별시 강서구 남부순환로29<br />
										ANC 빌딩, <br />(02) 2666-0114</li>
									</ul>
								</section>
						</div>
					</div>
			</div>

		<!-- Scripts -->
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/jquery-3.2.1.js"></script>
			<script src="/resources/assets/js/skel.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/resources/assets/js/main.js"></script>
			<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script> -->
			<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script> 

	</body>
</html>