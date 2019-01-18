<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->

<script type="text/javascript">

	
	function container_chk(){
		
		//alert("1");
		//window.open("http://61.78.158.211:8080/ANC_Transinform/trans/InputForm.jsp?blno="+blno+"&user_id="+user_id+"&code="+code, "_blank", "width=900, height=715, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, location=no, directories=no, status=no" );
		//window.open("http://61.78.158.211:8080/ANC_Transinform/trans/user_inform.jsp?user_id="+user_id, "_blank", "width=600, height=415, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, location=no, directories=no, status=no" );
		window.open("./images/Container_Check.gif", "_blank", "width=550, height=350, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, location=no, directories=no, status=no" );
		
		//alert("2");
	}
	

</script>

<html>
	<head>
		<title>ANC ITICS - 운송수단 등록</title>
		
	</head>
<%
String blno = request.getParameter("blno");
			
%>	
	
<form name="Code_New" method="post" action="Acccode_Proc.jsp">
							<!-- Header -->
								<header id="header">
									<h1 style="font-size:20px"><i class="fa fa-cube" aria-hidden="true"></i> 컨테이너 관리</h1>
									
								</header>
								<a style="border:0; cursor:pointer;"  onclick="container_chk()";><h1 align="right" style="font-size:13px"><i class="fa fa-question" aria-hidden="true"></i> <u>7Point 무결성 확인이란?</u></h1></a>

		<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> 컨테이너 조회</h1>
					<table class="table">
								
									<colgroup>
										<col width="5%" />
										<col width="20%" />
									    <col width="5%" />
									    
									</colgroup>
								
									<tr>
										<th scope="row" class="th txtr">컨테이너 번호</th>
										<td class="td" align="center">
											<input type="text" name="query" id="query"   placeholder="Container No"  style="text-align:center;  height:25px;"/>
										</td>
										<td align="right"><button><i class="fa fa-search" aria-hidden="true"></i> 조회</button>
									</tr>
									
									 
							</table>
							
							<table class="table">			
									 <tr>
									 	<th width="2%">No</th>
									     <th width="9%">컨테이너 번호</th>
									     <th width="9%">마스터 B/L No</th>
									     <th width="10%">최근 Seal 번호</th>
									     <th width="10%">최근 Seal 봉인일</th>
									     <th width="10%">최근 Seal 해제일</th>
									     <th width="10%">담당자 이름</th>
									     <th width="8%">변경 이력</th>
									 </tr>
							</table>
							
							<br>
							
							<div class="box container" style="float:left; width:49%; margin-right:15px; ">
							
								<br>
								<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> 컨테이너 안전관리 </h1>
								
								<table class="table">			
									 <tr>
									 	<th width="5%">날짜</th>
									     <th width="9%">컨테이너 번호</th>
									     <th width="9%">7Point 무결성확인</th>
							</table>
							
							<table class="table" style="text-align:center; width:100%;">
								 <ul style="text-align:center; padding-top:15px">
											<button><i class="fa fa-save" aria-hidden="true"></i> 저장</button>
								</ul>
							</table>
							
							</div>
						
							<div class="box container" style="float:left; width:49%; ">
							
								<br>
								<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> 안전관리 이력</h1>
								
								<table class="table">			
									 <tr>
									 	<th width="2%">No</th>
									 	<th width="9%">등록번호</th>
									     <th width="9%">컨테이너 번호</th>
									     <th width="5%">날짜</th>
									 </tr>
							</table>
							
							</div>
							
								
			</form>
</html>

<script>
$(document).ready(function(){ 
    $('button').click(function(e){
        	$(document).ready(function(){
        	    $("#contents").load("menu/transportaccount.jsp?blno=11111");
        	});
       
    });
});
</script>
