<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.ancintl.ancitics.domain.SearchFMS" %>

<%
	SearchFMS fmsdata = (SearchFMS)request.getAttribute("fmsdata");
	/* System.out.println(fmsdata); */
%>

<!DOCTYPE HTML>

<script type="text/javascript">

 	/* function searchBL(){
   			frm.action = "./SearchFMS.do";
	        frm.submit();
	        
	}  */
	
 	$('#searchbtn').click(function(){
		var formData = $("#HBLSearch").serialize();
		var hblno = $("#hblno").val();
		//alert(hblno);
		   $.ajax({
		        type: 'get',
		        url: './SearchFMS.do?hblno='+hblno+'&flag=bl',
		        cache : false,
		        data : formData,
		        success: function(data){
		        	$('#searchbl').html(data);
		            //alert(data);
		        }
		   });
		   
		   return false; //<- 이 문장으로 새로고침(reload)이 방지됨
		});
</script>
<html>
	<head>
		<title>ANC ITICS - 운송수단 등록</title>
	</head>

<form name="HBLSearch" id="HBLSearch" action="" method="post">
							<div id = "searchbl" name = "searchbl">
								<br>
								<h1 style="font-size:12px"><i class="fa fa-file-text" aria-hidden="true"></i> B/L정보</h1>
								
								<table class="table">
									<colgroup>
										<col width="5%" />
									    <col width="10%" />
									    <col width="5%" />
									    <col width="10%" />
									</colgroup>
									<% if (fmsdata!= null) {%>
									<tr>
								    	<th scope="row" class="th txtr">* House B/L No</th>
									    <td class="td">
									    	<input name="hblno" id="hblno" style="border: 0px solid black; border-image: none; background-color: transparent; width:50%; float:left;" type="text" size="50" value="<%=fmsdata.getHblno()%>">
									    	<button id="searchbtn" style="border:0; cursor:pointer; float:right;"><i class="fa fa-search" aria-hidden="true"></i> 조회</button>		 
									    	<!-- <button id ="searchbtn"><i class="fa fa-search" aria-hidden="true" style="display:inline-block;"></i> 조회</button> -->
									    </td>
									    <th scope="row" class="th txtr">파일번호</th>
									    <td class="td">
									    	<!-- <input name="fileno" id="fileno" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" placeholder="업무자에게 전달받은 파일번호를 넣어주세요."  value=""> -->
									    	<input name="fileno" id="fileno" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" placeholder=""  value="" disabled>
									    </td>
									    </tr>  
									  <!-- <tr>
									    <th scope="row" class="th txtr">담당자</th>
									    <td  class="td">
									    	<input name="etc" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="ANC">
									    </td>
									    <th scope="row" class="th txtr">연락처</th>
									    <td class="td">
									    	<input name="etc" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="-">
									    </td>
									  </tr> -->
									  <tr>
									    <th scope="row" class="th txtr">CNTR 번호</th>
									    <td class="td">
									    	<input name="cntr_no" id="cntr_no" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="<%=fmsdata.getContainerNo() %>">
									    </td>
									    
									    <th scope="row" class="th txtr">SEAL 번호</th>
									    <td class="td">
									    	<input name="seal_no" id="seal_no" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="<%=fmsdata.getSealNo1() %>">
									    </td>
									  </tr>
									  <tr>
									    <th scope="row" class="th txtr">CNTR SIZE 및 수량</th>
									    <td class="td">
									    	<input name="cntr_size" id="cntr_size" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="<%=fmsdata.getNumberofpackage() %>">
									    </td>
									    <th scope="row" class="th txtr">LINE 명</th>
									    <td  class="td">
									    	<input name="linename" id="linename" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="<%=fmsdata.getLinename() %>">
									    </td>
									   <!--  <th scope="row" class="th txtr">CNTR PICK-UP, 연락처 및 담당자</th>
									    <td class="td">
									    	<input name="etc" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="-">
									    </td> -->
									  </tr>
									  
									  <tr>
									    <th scope="row" class="th txtr">선적항</th>
									    <td class="td">
									    	<input name="rececode" id="rececode" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="<%=fmsdata.getRececode() %>">
									    </td>
									    <th scope="row" class="th txtr">도착항</th>
									    <td class="td">
									    	<input name="disccode" id="disccode" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="<%=fmsdata.getDisccode() %>">
									    </td>
									    
									    </tr>
									   
									   <tr>
									     <th scope="row" class="th txtr">특이사항</th>
									    <td colspan="3" class="td">		 
									    	<input name="etc" id="etc" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="">				    				
									    </td>
									   </tr>
								
									   <%}else{%>
									    <tr>
								    	<th scope="row" class="th txtr">* House B/L No</th>
									    <td class="td">
									    	<input name="hblno" id="hblno" style="border: 0px solid black; border-image: none; background-color: transparent; width:50%; float:left;" type="text" size="50" value="">
									    	<button id="searchbtn" style="border:0; cursor:pointer; float:right;"><i class="fa fa-search" aria-hidden="true"></i> 조회</button>
									    	<!-- <button id ="searchbtn"><i class="fa fa-search" aria-hidden="true" style="display:inline-block;"></i> 조회</button> -->
									    </td>
									    <th scope="row" class="th txtr">파일번호</th>
									    <td class="td">
									    	<!-- <input name="fileno" id="fileno" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" placeholder="업무자에게 전달받은 파일번호를 넣어주세요."  value=""> -->
									    	<input name="fileno" id="fileno" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" placeholder=""  value="" disabled>
									    </td>
									    </tr>  
									  <!-- <tr>
									    <th scope="row" class="th txtr">담당자</th>
									    <td  class="td">
									    	<input name="etc" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="">
									    </td>
									    <th scope="row" class="th txtr">연락처</th>
									    <td class="td">
									    	<input name="etc" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="-">
									    </td>
									  </tr> -->
									  <tr>
									    <th scope="row" class="th txtr">CNTR 번호</th>
									    <td class="td">
									    	<input name="cntr_no" id="cntr_no" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="">
									    </td>
									    
									    <th scope="row" class="th txtr">SEAL 번호</th>
									    <td class="td">
									    	<input name="seal_no" id="seal_no" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="">
									    </td>
									  </tr>
									  <tr>
									    <th scope="row" class="th txtr">CNTR SIZE 및 수량</th>
									    <td class="td">
									    	<input name="cntr_size" id="cntr_size" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="">
									    </td>
									    <th scope="row" class="th txtr">LINE 명</th>
									    <td  class="td">
									    	<input name="linename" id="linename" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="">
									    </td>
									   <!--  <th scope="row" class="th txtr">CNTR PICK-UP, 연락처 및 담당자</th>
									    <td class="td">
									    	<input name="etc" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="-">
									    </td> -->
									  </tr>
									  
									  <tr>
									    <th scope="row" class="th txtr">선적항</th>
									    <td class="td">
									    	<input name="rececode" id="rececode" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="">
									    </td>
									    <th scope="row" class="th txtr">도착항</th>
									    <td class="td">
									    	<input name="disccode" id="disccode" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="">
									    </td>
									    
									    </tr>
									   
									   <tr>
									     <th scope="row" class="th txtr">특이사항</th>
									    <td colspan="3" class="td">		 
									    	<input name="etc" id="etc" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="">				    				
									    </td>
									   </tr>
									   <%}%>
									  
							</table>
							<h1 style="font-size:12px">* 배차완료 버튼을 누르시면 배차가 완료됩니다.</h1> 
							</div>
			</form>
</html>

