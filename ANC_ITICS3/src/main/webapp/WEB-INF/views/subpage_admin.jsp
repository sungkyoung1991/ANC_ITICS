<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>ANC ITICS - Subpage(Admin)</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/subpage.css" />
		<link rel = "stylesheet" href = "ui/jquery.mobile-1.2.0.min.css" />
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<script type="text/javascript">

			function searchunipass(){
				
				var hblno = $("#hblNo").val();
				
				//window.open("http://61.78.158.211:8080/ANC_Transinform/trans/InputForm.jsp?blno="+blno+"&user_id="+user_id+"&code="+code, "_blank", "width=900, height=715, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, location=no, directories=no, status=no" );
				//window.open("http://61.78.158.211:8080/ANC_Transinform/trans/user_inform.jsp?user_id="+user_id, "_blank", "width=600, height=415, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, location=no, directories=no, status=no" );
				window.open("http://61.78.158.211:8080/ANC_ITICS/menu/SearchUnipass.jsp?hblNo="+hblno, "_blank", "width=1050, height=1200, toolbar=no, menubar=no, resizable=no,scrollbars=yes, copyhistory=no, location=no, directories=no, status=no" );
				//alert("2");
			}
		
		</script>
	</head>
	<body>
		
	<div class="topFixLogo" style="clear:both; background:#F2F2F2; border-bottom: 1px solid  #BDBDBD">
           		<a href="index_express.do" style="border:0;"><img src="./images/ancitics.png"  style="max-width:100%; height:auto; "/></a>
       		
       		<div class="usernavi">
		  			<nav style="margin:8px 30px 0px 0px;">
			  			<font face="맑은 고딕" color="orange"><span style="font-size:9pt;"><i class="fa fa-user-circle" aria-hidden="true"></i><b> E-Business (관리자)</b>님 로그인 중.</span></font>
                       	<font face="맑은 고딕"><span style="font-size:9pt;"><button style="box-shadow: inset 0 0 0 2px orange; color: orange !important; "><i class="fa fa-sign-out" aria-hidden="true"></i> 로그아웃</button></span></font>
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
										<input type="text" name="hblNo" id="hblNo" style="height: 2.75em; padding: 0em 0 0 3em;"  placeholder="B/L Search" onkeypress="if(event.keyCode==13) {searchunipass(); return false;}" />
									</form>
								</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>ITICS - 관리자</h2>
									</header>
									<ul>
										<!-- <li ><a href="index_express.html"><h style="font-size:25px"><i class="fa fa-home" aria-hidden="true"></i></h> 홈</a></li> -->
										<li>
											<span class="opener"><h style="font-size:27px;"><i class="fa fa-truck" aria-hidden="true"></i></h> 배차시스템</span>
											<ul>
												<li style="font-size:15px"><a id="AllocateCar"><i class="fa fa-list" aria-hidden="true"></i> 배차 등록</a></li>
												<li style="font-size:15px"><a id="AllocateCar_Status"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 배차 현황</a></li>
												<li style="font-size:15px"><a id="TransportAccount"><i class="fa fa-list" aria-hidden="true"></i> 운송수단 관리</a></li>
												<li style="font-size:15px"><a id="ManageDriver"><i class="fa fa-address-card-o" aria-hidden="true"></i> 운전자 관리</a></li>
											</ul>
										</li>
										<li>
											<span class="opener"><h style="font-size:25px"><i class="fa fa-bus" aria-hidden="true"></i></h> AEO(운송수단 안전관리)</span>
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
										</li>
										<li>
											<span class="opener"><h style="font-size:25px"><i class="fa fa-cog" aria-hidden="true"></i></h> 환경설정</span>
											<ul>
												<li style="font-size:15px"><a href="#"><i class="fa fa-history" aria-hidden="true"></i> 시스템 사용 로그</a></li>
												<li style="font-size:15px"><a id="AddMember"><i class="fa fa-user-plus" aria-hidden="true"></i> 사용자 추가</a></li>
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
											<a href="#" class="image" title="Global Forwarding"><img src="images/bg02.jpg" alt="" /></a>
											 <!--<p align="center">Global Forwarding</p> -->
										</article>
										<article>
											<a href="#" class="image" title="Global Logistics"><img src="images/gps.jpg" alt="" /></a>
											<!--<p align="center">Global Logistics</p>-->
										</article>
										<article>
											<a href="#" class="image" title="Inland Transportation"><img src="images/trucking.jpg" alt="" /></a>
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
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery-3.2.1.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
			<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script> -->
			<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script> 

	</body>
</html>