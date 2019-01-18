<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="simpleSearch.SearchFMSBean" %>
<%@ page import="java.io.PrintWriter" %>
<%
	SearchFMSBean fmsdata = (SearchFMSBean)request.getAttribute("fmsdata");
	System.out.println(fmsdata);
	
	
	
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
	
	System.out.println(check_id);
	System.out.println("code?" + code);
	*/
	
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

 $(document).ready(function() 
{
	 $('#addMember_btn').click(function(){
			
		var formData = $("#AddMember").serialize();
		
		alert(formData);
			
		if (confirm("해당정보로 계정을 신청하시겠습니까?") == true){ 
			//alert(driver_name);
			   $.ajax({
			        type: 'post',
			        url: './MemberAddAction.do',
			        cache : false,
			        data : formData,
			        contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			        success: function(data){
			        	alert("신청이 완료되었습니다.");
			        	//$('#searchdrv').html(data);
			        }
			   });
			}
			   return false; //<- 이 문장으로 새로고침(reload)이 방지됨
			});
	 	
	 $('#searchcompany').click(function(){
		 var formData = $("#AddMember").serialize();
		 var company_license = $("#company_license").val();
		 
			//alert(result);
			   $.ajax({
			        type: 'get',
			        url: './SearchFMS.do?company_license='+company_license+'&flag=company',
			        cache : false,
			        data : formData,
			        success: function(data){
			        		$('#AddMember').html(data);

			        }
			   });
			   
			  
			   
			   return false; //<- 이 문장으로 새로고침(reload)이 방지됨
			   
			   
			   
			});
	 
	   //alert(result);
		});
 
	   
</script>
<html>
	<head>
		<title>ANC ITICS - 사용자 등록</title>
	</head>

<form name="AddMember" id="AddMember" method="post" action="">
<%-- <input type="hidden" name="result" id="result" value="<%=fmsdata%>"/> --%>

		<br>
		<!-- <div name="adduser" id="adduser" class="box container"> -->
		
		<!-- Header -->
		<header id="header">
			
			<h1 style="font-size:20px"><i class="fa fa-user-plus" aria-hidden="true"></i> 사용자 등록</h1>
			
		</header>
                            <br> 												
							<h1 style="font-size:12px"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> ITICS 신청서 작성</h1>
							
							<br>	
							<h1 style="font-size:12px"><i class="fa fa-user" aria-hidden="true"></i> 사용자 정보</h1>
							<table class="table">
								<colgroup>
										<col width="5%" />
									    <col width="10%" />
									    <col width="5%" />
									    <col width="10%" />
									</colgroup>
									
									<% if (fmsdata!= null) {%>
									  <tr>
									  	<th scope="row" class="th txtr">사업자번호</th>
									    <td class="td">
									    	<input name="company_license" id="company_license" style="border: 0px solid black; border-image: none; background-color: transparent; width:50%; float:left;" type="text" size="50" value="<%=fmsdata.getBusinessid()%>">
									    	<button id="searchcompany" style="border:0; cursor:pointer; float:right;"><i class="fa fa-search" aria-hidden="true"></i> 조회</button>		 
									    </td>
									    <th scope="row" class="th txtr">업체명</th>
									    <td class="td">
									    <input name="company_name" id="company_name" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="<%=fmsdata.getCustomername()%>">		 
									    </td>
									    

									  </tr>
									   <tr>
									   <th scope="row" class="th txtr">업체코드</th>
									    <td class="td">
									    <input name="company_code" id="company_code" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="<%=fmsdata.getCustomerid()%>">		 
									    </td>
									    <th scope="row" class="th txtr">업체종류</th>
									    <td class="td">
										    <select name="company_type" id="company_type">
										    	<option value="T">운송사</option>
										    	<option value="F">포워더</option>
										    	<option value="C">화주</option>
										    </select>
									    	<!-- <input  style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value=""> -->		 
									    </td>
									  </tr>
									  <tr>
									    <th scope="row" class="th txtr">아이디</th>
									    <td class="td">
									    	<input name="user_id" id="user_id" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="10" value="">
									    </td>
									    <th scope="row" class="th txtr">비밀번호</th>
									    <td class="td">
									    	<input name="user_pw" id="user_pw" type="password" style="border: 0px solid black; border-image: none; background-color: transparent;" size="10" value="">
									    </td>
								      </tr>
									 
									  <tr>
									    <th scope="row" class="th txtr">사용자명</th>
									    <td  class="td">
									    	<input name="user_name" id="user_name" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="5" placeholder="" value="">
									    </td>
									    <th scope="row" class="th txtr">휴대폰번호</th>
									    <td class="td">
									    	<input name="user_hp" id="user_hp" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="15" placeholder="" value="">
									    </td>
									   </tr>
									   
									    <tr>
									    <th scope="row" class="th txtr">사업장 주소</th>
									    <td  class="td">
									    	<input name="user_address" id="user_address" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="150" placeholder="" value="<%=fmsdata.getEngaddress()%>">
									    </td>
									    <th scope="row" class="th txtr">회사 전화번호</th>
									    <td  class="td">
									    	<input name="user_tel" id="user_tel" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="15" placeholder="" value="<%=fmsdata.getEngtel()%>">
									    </td>
									   </tr>
									   <tr>
									    <th scope="row" class="th txtr">사용 GPS 사이트 주소(URL)</th>
									    <td  class="td" colspan="3">
									    	<input name="gps_url" id="gps_url" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="150" placeholder="" value="">
									    </td>
									   </tr>
									   
									   <tr>
									    <th scope="row" class="th txtr">GPS 사이트 ID</th>
									    <td  class="td">
									    	<input name="gps_id" id="gps_id" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="10" placeholder="" value="">
									    </td>
									    <th scope="row" class="th txtr">GPS 사이트 비밀번호</th>
									    <td class="td">
									    	<input name="gps_pw" id="gps_pw" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="10" placeholder="" value="">
									    </td>
									   </tr>
									   <%}else{ %>
								  		<tr>
									  	<th scope="row" class="th txtr">사업자번호</th>
									    <td class="td" nowrap>
									    	<input name="company_license" id="company_license" style="border: 0px solid black; border-image: none; background-color: transparent; width:50%; float:left;" type="text" size="50" value="">
									    	<button id="searchcompany" style="border:0; cursor:pointer; float:right;"><i class="fa fa-search" aria-hidden="true"></i> 조회</button>		 
									    </td>
									    <th scope="row" class="th txtr">업체명</th>
									    <td class="td">
									    <input name="company_name" id="company_name" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="">		 
									    </td>
									    

									  </tr>
									   <tr>
									   <th scope="row" class="th txtr">업체코드</th>
									    <td class="td">
									    <input name="company_code" id="company_code" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value="">		 
									    </td>
									    <th scope="row" class="th txtr">업체종류</th>
									    <td class="td">
										    <select name="company_type" id="company_type">
										    	<option value="T">운송사</option>
										    	<option value="F">포워더</option>
										    	<option value="C">화주</option>
										    </select>
									    	<!-- <input name="company_type" id="company_type" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="50" value=""> -->		 
									    </td>
									  </tr>
									  <tr>
									    <th scope="row" class="th txtr">아이디</th>
									    <td class="td">
									    	<input name="user_id" id="user_id" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="10" value="">
									    </td>
									    <th scope="row" class="th txtr">비밀번호</th>
									    <td class="td">
									    	<input name="user_pw" id="user_pw" type="password" style="border: 0px solid black; border-image: none; background-color: transparent;" size="10" value="">
									    </td>
								      </tr>
									 
									  <tr>
									    <th scope="row" class="th txtr">사용자명</th>
									    <td  class="td">
									    	<input name="user_name" id="user_name" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="5" placeholder="" value="">
									    </td>
									    <th scope="row" class="th txtr">휴대폰번호</th>
									    <td class="td">
									    	<input name="user_hp" id="user_hp" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="15" placeholder="" value="">
									    </td>
									   </tr>
									   
									    <tr>
									    <th scope="row" class="th txtr">사업장 주소</th>
									    <td  class="td">
									    	<input name="user_address" id="user_address" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="150" placeholder="" value="">
									    </td>
									    <th scope="row" class="th txtr">회사 전화번호</th>
									    <td  class="td">
									    	<input name="user_tel" id="user_tel" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="15" placeholder="" value="">
									    </td>
									   </tr>
									   <tr>
									    <th scope="row" class="th txtr">사용 GPS 사이트 주소(URL)</th>
									    <td  class="td" colspan="3">
									    	<input name="gps_url" id="gps_url" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="150" placeholder="" value="">
									    </td>
									   </tr>
									   
									   <tr>
									    <th scope="row" class="th txtr">GPS 사이트 ID</th>
									    <td  class="td">
									    	<input name="gps_id" id="gps_id" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="10" placeholder="" value="">
									    </td>
									    <th scope="row" class="th txtr">GPS 사이트 비밀번호</th>
									    <td class="td">
									    	<input name="gps_pw" id="gps_pw" style="border: 0px solid black; border-image: none; background-color: transparent;" type="text" size="10" placeholder="" value="">
									    </td>
									   </tr>
								  		<%} %>	
							</table>
							
							<br>	
							
							
							
							
							<table class="table" style="text-align:center; width:100%;">
								 <ul style="text-align:center; padding-top:15px">
											<button id="addMember_btn"><i class="fa fa-save" aria-hidden="true"></i> 신청하기</button>
								</ul>
							</table>	
						<!-- </div> -->				
			</form>
</html>

