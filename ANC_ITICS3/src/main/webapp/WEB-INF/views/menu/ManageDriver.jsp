<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
    <%@ page import = "dbConnUtil.ConnUtil_uFMS" %>
    <%@ page import = "dbConnUtil.ConnUtil" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "paging.PagingUtil" %>
    <%@ page import = "paging.PagingBean" %>




<script type="text/javascript">

	function hidePreload() { 
		  preload.style.visibility = "hidden"; 
		}
	
	function input_driver(frm,i,listsize){
		 
		  //alert("운전자관리화면");
		  //alert(i);
		  //alert(listsize);
		 
		  /* alert(frm.drv_name.value);
		 alert(frm.driver_hp.value); */
		 
		 if (i==0 && listsize==1){
			 
			 this.driver_name.value = frm["oup_driver_name[]"].value;
			 this.driver_id.value = frm["oup_driver_id[]"].value;
			 this.driver_hp.value = frm["oup_driver_hp[]"].value;
			 this.driver_etc.value = frm["oup_driver_etc[]"].value;
			 this.driver_birth.value = frm["oup_driver_birth[]"].value;
		 }else{
			 
			 this.driver_name.value = frm["oup_driver_name[]"][i].value;
			 this.driver_id.value = frm["oup_driver_id[]"][i].value;
			 this.driver_hp.value = frm["oup_driver_hp[]"][i].value;
			 this.driver_etc.value = frm["oup_driver_etc[]"][i].value;
			 this.driver_birth.value = frm["oup_driver_birth[]"][i].value;
		 }
	 }
	
	function del_driver(){
		 
		//$('#delbtn_car').click(function(){
			
			var formData = $("#ManageDriver").serialize();
			var driver_id = document.getElementById("driver_id").value;
			
			if (confirm("해당 운전자를 삭제하시겠습니까?") == true){
			   $.ajax({
			        type: 'get',
			        url: './DriverDeleteAction.do?driver_id='+driver_id,
			        cache : false,
			        data : formData,
			        success: function(data){
			        	$('#drvdetail').html(data);
			            //alert(data);
			        }
			   });
			   alert("삭제되었습니다.");
			   
			   return false; //<- 이 문장으로 새로고침(reload)이 방지됨
			//});
		}
	}
	
	/* function modi_driver(){
		 
		//$('#delbtn_car').click(function(){
			
			var formData = $("#ManageDriver").serialize();
			var driver_id = document.getElementById("driver_id").value;
			
			if (confirm("해당 운전자를 수정하시겠습니까?") == true){
			   $.ajax({
			        type: 'get',
			        url: './DriverUpdateAction.do?driver_id='+driver_id,
			        cache : false,
			        data : formData,
			        success: function(data){
			        	$('#drvdetail').html(data);
			            //alert(data);
			        }
			   });
			   alert("수정되었습니다.");
			   
			   return false; //<- 이 문장으로 새로고침(reload)이 방지됨
			//});
		}
	} */

	
	function add_new(){
		
		//alert("1");
		//window.open("http://61.78.158.211:8080/ANC_Transinform/trans/InputForm.jsp?blno="+blno+"&user_id="+user_id+"&code="+code, "_blank", "width=900, height=715, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, location=no, directories=no, status=no" );
		//window.open("http://61.78.158.211:8080/ANC_Transinform/trans/user_inform.jsp?user_id="+user_id, "_blank", "width=600, height=415, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, location=no, directories=no, status=no" );
		window.open("http://61.78.158.211:8080/ANC_ITICS/menu/add_driver.jsp", "_blank", "width=850, height=350, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, location=no, directories=no, status=no" );
		
		//alert("2");
	}
	
	function sendFrameSize()
	{
		window.parent.resizeIFrame(document.body.scrollHeight);
	}

</script>

<html>
<head>

<title>ANC ITICS - 운전자 관리</title>
</head>



<form name="ManageDriver" id="ManageDriver" action="">
	<!-- Header -->
		<header id="header">
			<h1 style="font-size:20px;"><i class="fa fa-address-card-o" aria-hidden="true"></i> 운전자 관리</h1>
		</header>

		<br>
		 
		 <div class="box container" id = "searchdriver" style="float:left; width:49%; margin-right:15px;">
				<%@include file="Search_Driver.jsp"%>
		 </div>
						
							<div id="drvdetail" name="drvdetail" class="box container" style="float:left; width:49%; ">
							
								<br>
								<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> 상세정보</h1>
								
								<table class="table">
								    <tr>
								        <td rowspan="2">
								            <p align="center"><span style="font-size:9pt;"><font face="맑은 고딕"><img src="images/xxx.jpg" style="width:80%; height:80%;"/></font></span></p>
								        </td>
								        <td  height="45">
								            <font face="맑은 고딕"><b>운전자 등록번호</b><input type="text" name="driver_id" id="driver_id" value="-" style="background-color:transparent;border:0 solid black;font-family:'맑은 고딕';font-size:10pt; padding-left: 10px;" size="5" readonly/></font>
								        </td>
								        <td>
								            <font face="맑은 고딕"><b>성명</b><input type="text" name="driver_name" id="driver_name" value="-" style="background-color:transparent;border:0 solid black;font-family:'맑은 고딕';font-size:10pt;padding-left: 10px;" size="15"></font>
								        </td>
								        <td>
								            <font face="맑은 고딕"><b>재직여부</b></font><select name="status_yn" id="status_yn" size="1" style="background-color:transparent;border:0 solid black;padding-left: 10px; font-family:'맑은 고딕';" OnKeyDown="">
								                <option value="Y"> 재직</option>
								                <option value="N"> 퇴직</option>
									</select>
								        </td>
								    </tr>
								    
								    <tr>
								        <td>
								            <font face="맑은 고딕"><b>생년월일</b><input type="text" name="driver_birth" id="driver_birth" value="-" style="background-color:transparent;border:0 solid black;font-family:'맑은 고딕';padding-left: 10px;font-size:10pt" size="7"></font>
								        </td>
								        <td>
								            <font face="맑은 고딕"><b>차량번호</b><input type="text" name="car_no" id="car_no" value="-" style="background-color:transparent;border:0 solid black;font-family:'맑은 고딕';padding-left: 10px;font-size:10pt" size="13"></font>
								        </td>
								        <td>
								            <font face="맑은 고딕"><b>전화번호</b><input type="text" name="driver_hp" id="driver_hp" value="-" style="background-color:transparent;border:0 solid black;font-family:'맑은 고딕';padding-left: 10px; font-size:10pt" size="9" readonly></font>
								        </td>
									</tr>
									
									<tr>
								        <td align="center">
								            <font face="맑은 고딕"><b>비고</b></font>
								        </td>
								        <td colspan="4">
								            <font face="맑은 고딕"><input type="text" name="driver_etc" id="driver_etc" value="-" style="background-color:transparent;border:0 solid black;" size="100"></font>
								        </td>
								    </tr>
								    <tr>
								       <td align="right" colspan="5">
											<button onclick="del_driver(form)" id="delDriver_btn"><i class="fa fa-minus-square-o" aria-hidden="true"></i> 삭제</button>
										</td>
								    </tr>
   
								</table>
								
								<br>
								<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> 배차 이력</h1>
								
								<table class="table">			
									 <tr>
									 	<th style="font-size:12px" width="2%">No</th>
									     <th style="font-size:12px" width="9%">날짜</th>
									     <th style="font-size:12px" width="10%">차량번호</th>
									     <th style="font-size:12px" width="10%">출발지</th>
									     <th style="font-size:12px" width="10%">도착지</th>
									 </tr>
									 <tr>
									 	<td class="td" align="center" colspan="5">No Data!!</td>
									 </tr>
									<!--   <tr>
									    <th scope="row" class="th txtr">1</th>
									    <td class="td" align="center">2018-03-21</td>
									    <td class="td" align="center">인천86자1646</td>
									    <td class="td" align="center">인천(에이엔씨익스프레스)</td>
									    <td class="td" align="center">풍세</td>
									 </tr>
									 
									  <tr>
									    <th scope="row" class="th txtr">2</th>
									    <td class="td" align="center">2018-01-03</td>
									    <td class="td" align="center">인천86자1646</td>
									    <td class="td" align="center">인천(에이엔씨익스프레스)</td>
									    <td class="td" align="center">풍세</td>
									 </tr>
									 
									  <tr>
									    <th scope="row" class="th txtr">3</th>
									    <td class="td" align="center">2017-12-23</td>
									    <td class="td" align="center">인천86자1646</td>
									    <td class="td" align="center">인천(에이엔씨익스프레스)</td>
									    <td class="td" align="center">남경</td>
									 </tr> -->
							</table>
							
							</div>
</form>
</body>
</html>

