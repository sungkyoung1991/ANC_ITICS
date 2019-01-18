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
	
	function change_type(trans_type) {
	    
	    if (trans_type == "TRA") {
	        
	        view1.style.display = "inline"
	        $('#view1').removeAttr("disabled");
	        
	        view2.style.display = "none"
            view2.disabled ="true"
            view3.style.display = "none"
            view3.disabled = "true"
            view4.style.display = "none"
            view4.disabled = "true"
	        view5.style.display = "none"
	        view5.disabled = "true"
	        view6.style.display = "none"
	    	view6.disabled = "true"
	    	view7.style.display = "none"
	    	view7.disabled = "true"
	    }
	    if (trans_type == "CON") {

	        view1.style.display = "none"
	        view1.disabled = "true"
	        
	        view2.style.display = "inline"
	        $('#view2').removeAttr("disabled");
	        
	        view3.style.display = "none"
	        view3.disabled = "true"
	        view4.style.display = "none"
	        view4.disabled = "true"
	        view5.style.display = "none"
	        view5.disabled = "true"
        	view6.style.display = "none"
    	    view6.disabled = "true"
    	    view7.style.display = "none"
    	    view7.disabled = "true"

	    }
	    if (trans_type == "ICON") {

	        view1.style.display = "none";
	        view1.disabled = "true"
	        view2.style.display = "none";
	        view2.disabled = "true"
	        
	        view3.style.display = "inline";
	        $('#view3').removeAttr("disabled");
	        
	        view4.style.display = "none";
	        view4.disabled = "true"
	        view5.style.display = "none";
	        view5.disabled = "true"
        	view6.style.display = "none"
        	view6.disabled = "true"
        	view7.style.display = "none"
        	view7.disabled = "true"
	    }
	    if (trans_type == "TRU") {

	        view1.style.display = "none"
	        view1.disabled = "true"
	        view2.style.display = "none"
	        view2.disabled = "true"
	        view3.style.display = "none"
	        view3.disabled = "true"
	        
	        view4.style.display = "inline";
	        $('#view4').removeAttr("disabled");
	        
	        view5.style.display = "none"
	        view5.disabled = "true"
	        view6.style.display = "none"
	        view6.disabled = "true"
	        view7.style.display = "none"
	        view7.disabled = "true"	        

	        
	    }
	    if (trans_type == "TREC") {

	    	view1.style.display = "none"
	        view1.disabled = "true"
	        view2.style.display = "none"
	        view2.disabled = "true"
	        view3.style.display = "none"
	        view3.disabled = "true"
        	view4.style.display = "none"
    	    view4.disabled = "true"
	        
   	    	view5.style.display = "inline";
	        $('#view5').removeAttr("disabled");
	        
	        view6.style.display = "none"
	        view6.disabled = "true"
	        view7.style.display = "none"
	        view7.disabled = "true"	        

	    }
	    if (trans_type == "TR") {

	    	view1.style.display = "none"
	        view1.disabled = "true"
	        view2.style.display = "none"
	        view2.disabled = "true"
	        view3.style.display = "none"
	        view3.disabled = "true"
        	view4.style.display = "none"
    	    view4.disabled = "true"
	        
   	    	view5.style.display = "none"
   	    	view5.disabled = "true"
	        
	        view6.style.display = "inline";
	        $('#view6').removeAttr("disabled");
	        
	        
	        view7.style.display = "none"
	        view7.disabled = "true"	
	    }
	    if (trans_type == "ETC") {

	    	view1.style.display = "none"
	        view1.disabled = "true"
	        view2.style.display = "none"
	        view2.disabled = "true"
	        view3.style.display = "none"
	        view3.disabled = "true"
        	view4.style.display = "none"
    	    view4.disabled = "true"
	        
   	    	view5.style.display = "none"
   	    	view5.disabled = "true"
	        
	    	view6.style.display = "none"
	    	view6.disabled = "true"
	        
	        
	        view7.style.display = "inline";
	        $('#view7').removeAttr("disabled");
	    }
	}
	

</script>

<html>
	<head>
		<title>ANC ITICS - 안전관리 현황</title>
	</head>
<%
String blno = request.getParameter("blno");
			
%>	
	
<form name="Code_New" method="post" action="Acccode_Proc.jsp">
							<!-- Header -->
								<header id="header">
									<h1 style="font-size:20px"><i class="fa fa-cube" aria-hidden="true"></i>  안전관리</h1>
								</header>
								<a style="border:0; cursor:pointer;"  onclick="truck_chk()";><h1 align="right" style="font-size:13px"><i class="fa fa-question" aria-hidden="true"></i> <u>안전관리란?</u></h1></a>
								<!-- <a style="border:0; cursor:pointer;"  onclick="container_chk()";><h1 align="right" style="font-size:13px"><i class="fa fa-question" aria-hidden="true"></i> <u>7Point 무결성 확인이란?</u></h1></a> -->
       
		<h1 style="font-size:13px"><i class="fa fa-list" aria-hidden="true"></i>  운송수단 종류</h1>
            <p> <font face="맑은 고딕"><span style="font-size:10pt;">
				<select name="trans_type" id="trans_type" style="font-family:'맑은 고딕';" onChange="change_type(this.options[this.selectedIndex].value)">
                    <!--<option value=""></option>-->
                    <option value="TRU" selected>트럭</option>
					<option value="CON" >컨테이너</option>
					<option value="TRA">트레일러</option>
                    <option value="ICON">냉동컨테이너</option>
                    <option value="TREC">트랙터</option>
                    <option value="TR">TR</option>
                    <option value="ETC">기타(무게차,유게차)</option>
			    </select>
				</span></font><span style="font-size:10pt;"></span></p>
        
		<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> 안전관리 현황 조회</h1>
		<div id="view1" style="display:none;"> <!-- 트레일러 -->
					<table class="table">
								
									<colgroup>
										<col width="5%" />
										<col width="20%" />
									    <col width="5%" />
									    
									</colgroup>
								
									<tr>
										<th scope="row" class="th txtr">트레일러 번호</th>
										<td class="td" align="center">
											<input type="text" name="query" id="query"   placeholder="Container No"  style="text-align:center;  height:25px;"/>
										</td>
										<td align="right"><button><i class="fa fa-search" aria-hidden="true"></i> 조회</button>
									</tr>
									
									 
							</table>
							
							<table class="table">			
									 <tr>
									 	<th width="2%">No</th>
									     <th width="9%">트레일러 번호</th>
									     <th width="10%">트레일러 종류</th>
									     <th width="8%">담당자 이름</th>
									     <th width="8%">담당자 번호</th>
									 </tr>
							</table>
							
							<br>
							
							<div class="box container" style="float:left; width:49%; margin-right:15px; ">
							
								<br>
								<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> 트레일러 안전관리 </h1>
								
								<table class="table">			
									 <tr>
									 	<th width="5%">날짜</th>
									     <th width="9%">트레일러 번호</th>
									     <th width="9%">10Point 무결성확인</th>
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
									     <th width="9%">트레일러 번호</th>
									     <th width="5%">날짜</th>
									 </tr>
							    </table>
							
							</div>
					</div>
					
					<div id="view2" style="display:none;"> <!-- 컨테이너 -->
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
					</div>
					
					<div id="view3" style="display:none;"> <!-- 냉동컨테이너 -->
					<table class="table">
								
									<colgroup>
										<col width="5%" />
										<col width="20%" />
									    <col width="5%" />
									    
									</colgroup>
								
									<tr>
										<th scope="row" class="th txtr">냉동컨테이너 번호</th>
										<td class="td" align="center">
											<input type="text" name="query" id="query"   placeholder="Container No"  style="text-align:center;  height:25px;"/>
										</td>
										<td align="right"><button><i class="fa fa-search" aria-hidden="true"></i> 조회</button>
									</tr>
									
									 
							</table>
							
							<table class="table">			
									 <tr>
									 	<th width="2%">No</th>
									     <th width="9%">냉동컨테이너 번호</th>
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
								<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> 냉동컨테이너 안전관리 </h1>
								
								<table class="table">			
									 <tr>
									 	<th width="5%">날짜</th>
									     <th width="9%">냉동컨테이너 번호</th>
									     <th width="9%">8Point 무결성확인</th>
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
									     <th width="9%">냉동컨테이너 번호</th>
									     <th width="5%">날짜</th>
									 </tr>
							    </table>
							
							</div>
					</div>
					
					<div id="view4"> <!-- 트럭 -->
					<table class="table">
								
									<colgroup>
										<col width="5%" />
										<col width="20%" />
									    <col width="5%" />
									    
									</colgroup>
								
									<tr>
										<th scope="row" class="th txtr">차량 번호</th>
										<td class="td" align="center">
											<input type="text" name="query" id="query"   placeholder="Container No"  style="text-align:center;  height:25px;"/>
										</td>
										<td align="right"><button><i class="fa fa-search" aria-hidden="true"></i> 조회</button>
									</tr>
									
									 
							</table>
							
							<table class="table">			
									 <tr>
									 	<th width="2%">No</th>
									     <th width="9%">트럭 번호</th>
									     <th width="9%">트럭 종류</th>
									     <th width="10%">담당자 이름</th>
									     <th width="8%">변경 이력</th>
									 </tr>
							</table>
							
							<br>
							
							<div class="box container" style="float:left; width:49%; margin-right:15px; ">
							
								<br>
								<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> 트럭 안전관리 </h1>
								
								<table class="table">			
									 <tr>
									 	<th width="5%">날짜</th>
									     <th width="9%">차량 번호</th>
									     <th width="9%">트럭구조검증확인</th>
							</table>
							
							<table class="table" style="text-align:center; width:100%;">
								 <ul style="text-align:center; padding-top:15px">
											<button><i class="fa fa-save" aria-hidden="true"></i> 저장</button>
								</ul>
							</table>
							
							</div>
						
							<div class="box container" style="float:left; width:49%; ">
							
								<br>
								<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> 트럭 안전관리 이력</h1>
								
								<table class="table">			
									 <tr>
									 	<th width="2%">No</th>
									 	<th width="9%">등록번호</th>
									     <th width="9%">트럭 번호</th>
									     <th width="5%">날짜</th>
									 </tr>
							    </table>
							
							</div>
					</div>
					
					<div id="view5" style="display:none;"> <!-- 트랙터 -->
					<table class="table">
								
									<colgroup>
										<col width="5%" />
										<col width="20%" />
									    <col width="5%" />
									    
									</colgroup>
								
									<tr>
										<th scope="row" class="th txtr">트랙터 번호</th>
										<td class="td" align="center">
											<input type="text" name="query" id="query"   placeholder="Container No"  style="text-align:center;  height:25px;"/>
										</td>
										<td align="right"><button><i class="fa fa-search" aria-hidden="true"></i> 조회</button>
									</tr>
									
									 
							</table>
							
							<table class="table">			
									 <tr>
									 	<th width="2%">No</th>
									     <th width="9%">트랙터 번호</th>
									     <th width="10%">담당자 이름</th>
									     <th width="8%">변경 이력</th>
									 </tr>
							</table>
							
							<br>
							
							<div class="box container" style="float:left; width:49%; margin-right:15px; ">
							
								<br>
								<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> 트랙터 안전관리 </h1>
								
								<table class="table">			
									 <tr>
									 	<th width="5%">날짜</th>
									     <th width="9%">트랙터 번호</th>
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
								<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> 트랙터 안전관리 이력</h1>
								
								<table class="table">			
									 <tr>
									 	<th width="2%">No</th>
									 	<th width="9%">등록번호</th>
									     <th width="9%">트랙터 번호</th>
									     <th width="5%">날짜</th>
									 </tr>
							    </table>
							
							</div>
					</div>
					
					<div id="view6" style="display:none;"> <!-- TR -->
					<table class="table">
								
									<colgroup>
										<col width="5%" />
										<col width="20%" />
									    <col width="5%" />
									    
									</colgroup>
								
									<tr>
										<th scope="row" class="th txtr">TR 번호</th>
										<td class="td" align="center">
											<input type="text" name="query" id="query"   placeholder="Container No"  style="text-align:center;  height:25px;"/>
										</td>
										<td align="right"><button><i class="fa fa-search" aria-hidden="true"></i> 조회</button>
									</tr>
									
									 
							</table>
							
							<table class="table">			
									 <tr>
									 	<th width="2%">No</th>
									     <th width="9%">TR 번호</th>
									     <th width="10%">담당자 이름</th>
									     <th width="8%">변경 이력</th>
									 </tr>
							</table>
							
							<br>
							
							<div class="box container" style="float:left; width:49%; margin-right:15px; ">
							
								<br>
								<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> TR  안전관리 </h1>
								
								<table class="table">			
									 <tr>
									 	<th width="5%">날짜</th>
									     <th width="9%">TR 번호</th>
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
								<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> TR 안전관리 이력</h1>
								
								<table class="table">			
									 <tr>
									 	<th width="2%">No</th>
									 	<th width="9%">등록번호</th>
									     <th width="9%">TR 번호</th>
									     <th width="5%">날짜</th>
									 </tr>
							    </table>
							
							</div>
					</div>
					
					<div id="view7" style="display:none;"> <!-- 기타(무게차,유게차) -->
					<table class="table">
								
									<colgroup>
										<col width="5%" />
										<col width="20%" />
									    <col width="5%" />
									    
									</colgroup>
								
									<tr>
										<th scope="row" class="th txtr">기타(무게차,유게차) 번호</th>
										<td class="td" align="center">
											<input type="text" name="query" id="query"   placeholder="Container No"  style="text-align:center;  height:25px;"/>
										</td>
										<td align="right"><button><i class="fa fa-search" aria-hidden="true"></i> 조회</button>
									</tr>
									
									 
							</table>
							
							<table class="table">			
									 <tr>
									 	<th width="2%">No</th>
									     <th width="9%">기타(무게차,유게차) 번호</th>
									     <th width="10%">담당자 이름</th>
									     <th width="8%">변경 이력</th>
									 </tr>
							</table>
							
							<br>
							
							<div class="box container" style="float:left; width:49%; margin-right:15px; ">
							
								<br>
								<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> 기타(무게차,유게차) 안전관리 </h1>
								
								<table class="table">			
									 <tr>
									 	<th width="5%">날짜</th>
									     <th width="9%">기타(무게차,유게차) 번호</th>
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
								<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> 기타(무게차,유게차) 안전관리 이력</h1>
								
								<table class="table">			
									 <tr>
									 	<th width="2%">No</th>
									 	<th width="9%">등록번호</th>
									     <th width="9%">기타(무게차,유게차) 번호</th>
									     <th width="5%">날짜</th>
									 </tr>
							    </table>
							
							</div>
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
