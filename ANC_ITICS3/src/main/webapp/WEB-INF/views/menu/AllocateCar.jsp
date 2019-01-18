<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%
	DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	Date today = new Date();
	String sDate = sdFormat.format(today);
%>

<%
	/* SearchFMS searchfms = new SearchFMS(); */

	/* String check_id ="";
	String auth = "";
	String mode = "";
	String code = "";
	
	check_id = (String)session.getAttribute("s_id");
	auth = (String)session.getAttribute("auth");
	code = (String)session.getAttribute("code"); */
	
	/*if (auth.equals("P")){
		mode ="포워더";
	}else if(auth.equals("C")){
		mode ="화주";
	}else if(auth.equals("T")){
		mode ="운송사";		
	}else if(auth.equals("M")){
		mode ="관리자";		
	}
	
	 /*  if(check_id == null)
     {
		 out.println("<script>alert('비정상적 접근!!');</script>");
		 out.println("<script>");
		 out.println("window.location.href('/ANC_ITICS/index.jsp');");
		 out.println("</script>");
		 out.flush();
     }  */

%>

<script type="text/javascript">


 function input_driver(frm,i,listsize){
	 	 
	/*  alert(frm.express_name.value);
	 
	 alert(frm.drv_name.value);
	 alert(frm.driver_hp.value); */
	 
	 if (i==0 && listsize==1){
		 this.express_name.value = frm["oup_express_name[]"].value;
		 this.driver_name.value = frm["oup_driver_name[]"].value;
		 this.driver_id.value = frm["oup_driver_id[]"].value;
	 }else{
		 this.express_name.value = frm["oup_express_name[]"][i].value;
		 this.driver_name.value = frm["oup_driver_name[]"][i].value;
		 this.driver_id.value = frm["oup_driver_id[]"][i].value;
	 }
 }
 
 function input_car(frm,i,listsize){
	 
		/*  alert(frm.express_name.value);
		 alert(frm.drv_name.value);
		 alert(frm.driver_hp.value); */
		 if (i==0 && listsize==1){
			 this.car_id.value = frm["oup_car_id[]"].value; 
			 this.car_no.value = frm["oup_car_no[]"].value;
		 }else{
			 this.car_id.value = frm["oup_car_id[]"][i].value; 
			 this.car_no.value = frm["oup_car_no[]"][i].value;	 
		 }
		  
	 } 
 
 $(document).ready(function() 
		 {
	 
	 $('#addAllocate_btn').click(function(){
			var formData = $("#AllocateCar").serialize();
			
			
			var express_name = encodeURIComponent($("#express_name").val()); //운송사이름
			var car_id = $("#car_id").val(); //차량 아이디
			var car_no = encodeURIComponent($("#car_no").val()); //차량번호
			var driver_id = $("#driver_id").val(); //운전자 등록ID
			var driver_name = encodeURIComponent($("#driver_name").val()); //운전자명
			var request_person = $("#request_person").val(); //운송요청자
			var express_person = encodeURIComponent($("#express_person").val()); //배차담당자
			var departure = encodeURIComponent($("#departure").val()); //출발지
			var depart_time = $("#depart_time").val(); //출발시각
			var destination = encodeURIComponent($("#destination").val()); //도착지
			var arrive_estitime = $("#arrive_estitime").val(); //도착(예정)시각
			
			
			//비엘부분
			var hblno = document.getElementById("hblno").value; //하우스비엘넘버
			var fileno = document.getElementById("fileno").value; //파일넘버
			var cntr_no = document.getElementById("cntr_no").value; //컨테이너 넘버
			var seal_no = document.getElementById("seal_no").value; //실 넘버
			var cntr_size = document.getElementById("cntr_size").value; //컨테이너 사이즈
			var linename = document.getElementById("linename").value; //LINE명
			var rececode = document.getElementById("rececode").value; //선적항
			var disccode = document.getElementById("disccode").value; //도착항
			var etc = encodeURIComponent(document.getElementById("etc").value); //특이사항
		


	        //alert(document.getElementById('chk_yn').value);

	        if (express_name == '') {
	            alert("운송사 항목을 입력해주시기 바랍니다.");
	            return false;
	        }
	        if (car_id == '') {
	            alert("차량ID를 입력해주시기 바랍니다.");
	            return false;
	        }
	        if (car_no == '') {
	            alert("차량번호를 입력해주시기 바랍니다.");
	            frm.user_id.focus();
	            return false;
	        }
	        if (driver_name == '') {
	            alert("운전자명을 입력해주시기 바랍니다.");
	            return false;
	        }
	        if (request_person == '') {
	            alert("운송요청자를 입력해주시기 바랍니다.");
	            return false;
	        }
	        if (express_person == '') {
	            alert("배차담당자를 입력해주시기 바랍니다.");
	            return false;
	        }
	        if (departure == '') {
	            alert("출발지를 선택해 주시기 바랍니다.");
	            return false;
	        }
	        if (depart_time == '') {
	            alert("출발시각을 입력해주시기 바랍니다.");
	            return false;
	        }
	        if (destination == '') {
	            alert("도착지를 선택해 주시기 바랍니다.");
	            return false;
	        }
	        if (arrive_estitime == '') {
	            alert("도착(예정)시각을 입력해주시기 바랍니다.");
	            return false;
	        }
	        if (hblno == '') {
	            alert("하우스 B/L을 입력해주시기 바랍니다.");
	            return false;
	        }
	        /* if (fileno == '') {
	            alert("파일번호를 입력해주시기 바랍니다.");
	            return false;
	        } */
	        
		if (confirm("해당정보로 배차완료 하시겠습니까?") == true){ 
			//alert(driver_name);
			   $.ajax({
			        type: 'get',
			        url: './AllocateInsertAction.do?express_name='+express_name+'&car_id='+car_id+'&driver_id='+driver_id+'&car_no='+car_no+'&driver_name='+driver_name+'&request_person='+request_person+'&express_person='+express_person+'&departure='+departure+'&depart_time='+depart_time+'&destination='+destination+'&arrive_estitime='+arrive_estitime+'&hblno='+hblno+'&fileno='+fileno+'&cntr_no='+cntr_no+'&seal_no='+seal_no+'&cntr_size='+cntr_size+'&linename='+linename+'&rececode='+rececode+'&disccode='+disccode+'&etc='+etc+'&flag=single',
			        cache : false,
			        data : formData,
			        contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			        success: function(data){
			        	
			        	//$('#searchdrv').html(data);
	
			        }
			   });
			   alert("배차완료 되었습니다.");
			   
			   if (confirm("담당자에게 배차완료 Notice를 발송하시겠습니까?") == true){
				   
				   window.open("http://61.78.158.211:8080/ANC_ITICS/menu/MailForm.jsp?express_name="+express_name+"&car_id="+car_id+"&driver_id="+driver_id+"&car_no="+car_no+"&driver_name="+driver_name+"&request_person="+request_person+"&express_person="+express_person+"&departure="+departure+"&depart_time="+depart_time+"&destination="+destination+"&arrive_estitime="+arrive_estitime+"&hblno="+hblno+"&fileno="+fileno+"&cntr_no="+cntr_no+"&seal_no="+seal_no+"&cntr_size="+cntr_size+"&linename="+linename+"&rececode="+rececode+"&disccode="+disccode+"&etc="+etc+"&flag=single", "_blank", "width=850, height=350, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, location=no, directories=no, status=no" );
					//alert(driver_name);
					  /*  $.ajax({
					        type: 'get',
					        url: '/MailForm.jsp?express_name='+express_name+'&car_id='+car_id+'&driver_id='+driver_id+'&car_no='+car_no+'&driver_name='+driver_name+'&request_person='+request_person+'&express_person='+express_person+'&departure='+departure+'&depart_time='+depart_time+'&destination='+destination+'&arrive_estitime='+arrive_estitime+'&hblno='+hblno+'&fileno='+fileno+'&cntr_no='+cntr_no+'&seal_no='+seal_no+'&cntr_size='+cntr_size+'&linename='+linename+'&rececode='+rececode+'&disccode='+disccode+'&etc='+etc+'&flag=single',
					        cache : false,
					        data : formData,
					        contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					        success: function(data){
					        	
			
					        }
					   });*/
					} 
			   
			   
			}
			   	
			   return false; //<- 이 문장으로 새로고침(reload)이 방지됨
			});//sk
	 
	 $('#addAllocateTemp_btn').click(function(){
			var formData = $("#AllocateCar").serialize();
			
			var express_name = $("#express_name").val(); //운송사이름
			var car_id = $("#car_id").val(); //차량 아이디
			var car_no = $("#car_no").val(); //차량번호
			var driver_id = $("#driver_id").val(); //운전자 등록ID
			var driver_name = $("#driver_name").val(); //운전자명
			var request_person = $("#request_person").val(); //운송요청자
			var express_person = $("#express_person").val(); //배차담당자
			var departure = $("#departure").val(); //출발지
			var depart_time = $("#depart_time").val(); //출발시각
			var destination = $("#destination").val(); //도착지
			var arrive_estitime = $("#arrive_estitime").val(); //도착(예정)시각
			
			
			//비엘부분
			var hblno = document.getElementById("hblno").value; //하우스비엘넘버
			var fileno = document.getElementById("fileno").value; //파일넘버
			var cntr_no = document.getElementById("cntr_no").value; //컨테이너 넘버
			var seal_no = document.getElementById("seal_no").value; //실 넘버
			var cntr_size = document.getElementById("cntr_size").value; //컨테이너 사이즈
			var linename = document.getElementById("linename").value; //LINE명
			var rececode = document.getElementById("rececode").value; //선적항
			var disccode = document.getElementById("disccode").value; //도착항
			var etc = document.getElementById("etc").value; //특이사항
			
			if (express_name == '') {
	            alert("운송사 항목을 입력해주시기 바랍니다.");
	            return false;
	        }
	        if (car_id == '') {
	            alert("차량ID를 입력해주시기 바랍니다.");
	            return false;
	        }
	        if (car_no == '') {
	            alert("차량번호를 입력해주시기 바랍니다.");
	            frm.user_id.focus();
	            return false;
	        }
	        if (driver_name == '') {
	            alert("운전자명을 입력해주시기 바랍니다.");
	            return false;
	        }
	        if (request_person == '') {
	            alert("운송요청자를 입력해주시기 바랍니다.");
	            return false;
	        }
	        if (express_person == '') {
	            alert("배차담당자를 입력해주시기 바랍니다.");
	            return false;
	        }
	        if (departure == '') {
	            alert("출발지를 선택해 주시기 바랍니다.");
	            return false;
	        }
	        if (depart_time == '') {
	            alert("출발시각을 입력해주시기 바랍니다.");
	            return false;
	        }
	        if (destination == '') {
	            alert("도착지를 선택해 주시기 바랍니다.");
	            return false;
	        }
	        if (arrive_estitime == '') {
	            alert("도착(예정)시각을 입력해주시기 바랍니다.");
	            return false;
	        }
	        if (hblno == '') {
	            alert("하우스 B/L을 입력해주시기 바랍니다.");
	            return false;
	        }
	       /*  if (fileno == '') {
	            alert("파일번호를 입력해주시기 바랍니다.");
	            return false;
	        } */
					
			
		if (confirm("해당정보로 배차추가 하시겠습니까?") == true){ 
			   $.ajax({
			        type: 'get',
			        url: './AllocateInsertAction.do?express_name='+express_name+'&car_id='+car_id+'&driver_id='+driver_id+'&car_no='+car_no+'&driver_name='+driver_name+'&request_person='+request_person+'&express_person='+express_person+'&departure='+departure+'&depart_time='+depart_time+'&destination='+destination+'&arrive_estitime='+arrive_estitime+'&hblno='+hblno+'&fileno='+fileno+'&cntr_no='+cntr_no+'&seal_no='+seal_no+'&cntr_size='+cntr_size+'&linename='+linename+'&rececode='+rececode+'&disccode='+disccode+'&etc='+etc+'&flag=multi',
			        cache : false,
			        data : formData,
			        contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			        success: function(data){
			        	
			        	//$('#searchdrv').html(data);
	
			        }
			   });
			   alert("배차추가 완료되었습니다.");
			}
			   	
			   return false; //<- 이 문장으로 새로고침(reload)이 방지됨
			});
	 
		 $('#destination_sel').change(function(){
			   $("#destination_sel option:selected").each(function () {
					
				   //alert($(this).val());
				   
					if($(this).val()== '1'){ //직접입력일 경우
						 $("#destination").val('');                        //값 초기화
						 $("#destination").attr("disabled",false); //활성화
					}else{ //직접입력이 아닐경우
						 $("#destination").val($(this).text());      //선택값 입력
						 $("#destination").attr("disabled",true); //비활성화
					}
			   });
			});

		});
 
 
 
 
	   
</script>
<html>
	<head>
	
	
		<title>ANC ITICS - 운송수단 등록</title>
	</head>

<form name="AllocateCar" id="AllocateCar" method="post" action="">

	<!-- Header -->
		<header id="header">
			
			<h1 style="font-size:20px"><i class="fa fa-list" aria-hidden="true"></i> 배차 등록</h1>
			
		</header>
								
		<br>
		
		<div class="box container" id="searchcar" style="float:left; width:49%; margin-right:15px; position: relative; ">
				<%-- <jsp:include page="Search_Car.jsp"/> --%>
				<%-- <%@include file="/WEB-INF/views/menu/Search_Car.jsp"%> --%>		
				<jsp:include page="/WEB-INF/views/menu/Search_Car.jsp"></jsp:include>		
		</div>
						
		<div class="box container" id = "searchdriver" style="float:left; width:49%; position: relative;">
				 <%-- <jsp:include page="Search_Driver.jsp"/> --%> 
				 <%-- <%@include file="/WEB-INF/views/menu/Search_Driver.jsp"%> --%>
				  <jsp:include page="/WEB-INF/views/menu/Search_Driver.jsp"></jsp:include>
		</div>
		
		
								
								
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<div class="box container">
                            <br> 												
							<h1 style="font-size:12px"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 배차등록서 작성</h1>
							
							<br>	
							<h1 style="font-size:12px"><i class="fa fa-truck" aria-hidden="true"></i> 차량정보</h1>
							<table class="table">
								<colgroup>
										<col width="5%" />
									    <col width="10%" />
									    <col width="5%" />
									    <col width="10%" />
									</colgroup>
									  <tr>
									  	<th scope="row" class="th txtr">운송사</th>
									    <td class="td" colspan="3">
									    <input name="express_name" id="express_name" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="">		 
									    </td>
									  </tr>	
									  <tr>
									    
									    <th scope="row" class="th txtr">차량ID</th>
									    <td class="td">
									    	<input name="car_id" id="car_id" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="">		 
									    </td>
									    
									    <th scope="row" class="th txtr">운전자ID</th>
										<td class="td">
										    <input name="driver_id" id="driver_id" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="">		 
									    </td>

									  </tr>
									   <tr>
									    <th scope="row" class="th txtr">차량번호</th>
									    <td class="td">
									    	<input name="car_no" id="car_no" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="">		 
									    </td>
									    <th scope="row" class="th txtr">운전자명</th>
									    <td class="td">
									    	<input name="driver_name" id="driver_name" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="">		 
									    </td>

									  </tr>
									  <tr>
										    <th scope="row" class="th txtr">운송요청자</th>
										    <td class="td">
										    	<input name="request_person" id="request_person" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="ANC">
										    </td>
										    <th scope="row" class="th txtr">배차 담당자</th>
										    <td class="td">
										    	<input name="express_person" id="express_person" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="<%=session.getAttribute("user_name") %>">
										    </td>
									    </tr>
									 
									  <tr>
									    <th scope="row" class="th txtr">출발지</th>
									    <td  class="td">
									    	<select name="departure" id="departure" style="width:100px;height:20px;display:inline-block;text-align:center;">
											<!--<option value=""></option>-->
												<option value="인천항">인천항</option>
												<option value="부산항" >부산항</option>
							                    <option value="인천공항">인천공항</option>
							                    <option value="CFS">CFS</option>
							                    <option value="1">직접입력</option>
											</select>
									    </td>
									    <th scope="row" class="th txtr">출발시각</th>
									    <td class="td">
									    	<input name="depart_time" id="depart_time" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="16" maxlength="16" placeholder="출발시각을 입력하세요." value="<%=sDate%>">
									    </td>
									   </tr>
									   
									    <tr>
									    <th scope="row" class="th txtr">도착지</th>
									    <td  class="td">
									    <input type="text" name="destination" id="destination" style="width:50%; float:left;" disabled value="">

									    <select name="destination_sel" id="destination_sel" style="width:50%;height:20px;display:inline-block;text-align:center; float:right;">
											<!--<option value=""></option>-->
												<option value="풍세(천안)">풍세(천안)</option>
												<option value="NKG(북항)" >NKG(북항)</option>
							                    <option value="이랜드창고(부평)">이랜드창고(부평)</option>
							                    <option value="성화(김포)">성화(김포)</option>
							                    <option value="옥천허브">옥천허브</option>
							                    <option value="이랜드가산사옥">이랜드가산사옥</option>
							                    <option value="1">직접입력</option>
										</select>
									    </td>
									    <th scope="row" class="th txtr">도착(예정)시각</th>
									    <td class="td">
									    	<input name="arrive_estitime" id="arrive_estitime" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="16" maxlength="16" placeholder="도착(예정)시각을 입력하세요." value="<%=sDate%>">
									    </td>
									   </tr>
								  
							</table>
							
							<br>	
							<div id="blsearch">
								<%-- <jsp:include page="AllocateCar_BLSearch.jsp" flush = "true" /> --%> 
								<%-- <%@include file="/WEB-INF/views/menu/AllocateCar_BLSearch.jsp"%> --%>
								<jsp:include page="/WEB-INF/views/menu/AllocateCar_BLSearch.jsp"></jsp:include>
							</div>
							
							
							
							<table class="table" style="text-align:center; width:100%;">
								 <ul style="text-align:center; padding-top:15px">
								 			<!-- <button id="addAllocateTemp_btn"><i class="fa fa-plus-square-o" aria-hidden="true"></i> 배차추가</button> -->
											<button id="addAllocate_btn"><i class="fa fa-save" aria-hidden="true"></i> 배차완료</button>
								</ul>
							</table>	
						</div>				
			</form>
</html>



