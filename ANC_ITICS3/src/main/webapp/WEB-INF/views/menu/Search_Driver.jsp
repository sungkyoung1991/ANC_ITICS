<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.ancintl.ancitics.domain.Driver"%>
<%@ page import="java.util.*"%>

<%
	//DriverBean driverdata = (DriverBean)request.getAttribute("driverdata");
	List driverlist = (List)request.getAttribute("driverlist");
%>

<!DOCTYPE HTML>

<script type="text/javascript">

 	/* function searchBL(){
   			frm.action = "./SearchFMS.do";
	        frm.submit();
	        
	}  */
	
	
	
	function add_driver(){
		
		//alert("1");
		//window.open("http://61.78.158.211:8080/ANC_Transinform/trans/InputForm.jsp?blno="+blno+"&user_id="+user_id+"&code="+code, "_blank", "width=900, height=715, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, location=no, directories=no, status=no" );
		//window.open("http://61.78.158.211:8080/ANC_Transinform/trans/user_inform.jsp?user_id="+user_id, "_blank", "width=600, height=415, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, location=no, directories=no, status=no" );
		window.open("http://61.78.158.211:8080/ANC_ITICS/menu/add_driver.jsp", "_blank", "width=850, height=350, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, location=no, directories=no, status=no" );
		
		//alert("2");
	}
	/* $('#input_driver').click(function(){
		var formData = $("#SearchDriver").serialize();
		var driver_name = $("#driver_name").val();
		
		alert($("#driver_name").val());
	}); */
	
	$('#searchbtn_drv').click(function(){
		var formData = $("#SearchDriver").serialize();
		var driver_name = encodeURIComponent($("#sch_driver_name").val()); //익스플로러 한글깨짐 방지
		
		//alert(driver_name);
		   $.ajax({
		        type: 'get',
		        url: './DriverSelectAction.do?driver_name='+driver_name,
		        cache : false,
		        data : formData,
		        contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		        success: function(data){
		        	$('#searchdrv').html(data);

		        }
		   });
		   
		   return false; //<- 이 문장으로 새로고침(reload)이 방지됨
		});

</script>
<html>
	<head>
		<title>ANC ITICS - 운송수단 등록</title>
	</head>

<form name="SearchDriver" id="SearchDriver" action="" method="post">
							<br>
							<div id = "searchdrv" name = "searchdrv">
								<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> 운전자조회 </h1>
								<a style="border:0; cursor:pointer;"  onclick="add_driver();"><h1 align="right" style="font-size:13px"><i class="fa fa-plus-square-o" aria-hidden="true"></i> 신규등록</h1></a>
									<table class="table">
											<colgroup>
												<col width="5%" />
											    <col width="10%" />
											    <col width="5%" />
											</colgroup>
											<tr>
												<th style="font-size:12px" scope="row" class="th txtr">운전자명</th>
												<td class="td" align="center" style="border:0;">
													<input type="text" name="sch_driver_name" id="sch_driver_name"   placeholder="Driver Name"  style="text-align:center; height:25px;"/>
												</td>
												<td align="right" style="border:0;"><button id="searchbtn_drv"><i class="fa fa-search" aria-hidden="true"></i> 조회</button>
												</td>
												
											</tr>
											
										</table>
								
									<% if (driverlist!=null){ 
										/* System.out.println("DriverList 수 :" +driverlist.size()); */
									%>
										
										
										<table class="table" id="schdriver_table" name="schdriver_table">			
												 <tr>
												 	 <th style="font-size:12px" width="2%">No</th>
												     <th style="font-size:12px" width="9%">소속</th>
												     <th style="font-size:12px" width="10%">등록번호</th>
												     <th style="font-size:12px" width="10%">운전자명</th>
												     <th style="font-size:12px" width="10%">전화번호</th>									     
												 </tr>
												 <% for (int i=0; i<driverlist.size(); i++) {
														Driver driverdata = (Driver)driverlist.get(i);
												 %>
												 <tr id="input_driver">
												 	<th scope="row" class="th txtr"><%=i+1%></th>
												    <td align="center" class="td">
												    	<input name="oup_express_name[]" id="oup_express_name[]"  style="border: 0px solid black; border-image: none; background-color: transparent; font-size:8pt; cursor:pointer;" type="text" value="<%=driverdata.getExpress_name() %>" onclick="input_driver(form,'<%=i%>',<%=driverlist.size()%>;" readonly/>
												    </td>
												    <td align="center" class="td">
												    	<input name="oup_driver_id[]" id="oup_driver_id[]" style="border: 0px solid black; border-image: none; background-color: transparent; font-size:8pt; cursor:pointer;" type="text" value="<%=driverdata.getDriver_id() %>" onclick="input_driver(form,'<%=i%>',<%=driverlist.size()%>);" readonly/>
												    </td>
												    <td align="center" class="td" >
												    	<input name="oup_driver_name[]" id="oup_driver_name[]" style="border: 0px solid black; border-image: none; background-color: transparent; font-size:8pt; cursor:pointer;" type="text" value="<%=driverdata.getDriver_name() %>" onclick="input_driver(form,'<%=i%>',<%=driverlist.size()%>);" readonly/>
												    </td>
												    <td align="center" class="td">
												    	<input name="oup_driver_hp[]" id="oup_driver_hp[]" style="border: 0px solid black; border-image: none; background-color: transparent; font-size:8pt; cursor:pointer;" type="text" value="<%=driverdata.getDriver_hp() %>" onclick="input_driver(form,'<%=i%>',<%=driverlist.size()%>);" readonly/>
												    </td>
												    <input type="hidden" name="oup_driver_birth[]" id="oup_driver_birth[]" style="border: 0px solid black; border-image: none; background-color: transparent; font-size:8pt; cursor:pointer;" type="text" value="<%=driverdata.getDriver_birth() %>" onclick="input_driver(form,'<%=i%>',<%=driverlist.size()%>);" readonly/>
												    <input type="hidden" name="oup_driver_etc[]" id="oup_driver_etc[]" style="border: 0px solid black; border-image: none; background-color: transparent; font-size:8pt; cursor:pointer;" type="text" value="<%=driverdata.getEtc() %>" onclick="input_driver(form,'<%=i%>',<%=driverlist.size()%>);" readonly/>
												 </tr>
												 <%} %>
										</table>
									<% }else{%>
										<table class="table">			
												 <tr>
												 	<th style="font-size:12px" width="2%">No</th>
												     <th style="font-size:12px" width="9%">소속</th>
												     <th style="font-size:12px" width="10%">등록번호</th>
												     <th style="font-size:12px" width="10%">운전자명</th>
												     <th style="font-size:12px" width="10%">전화번호</th>									     
												 </tr>
												 <tr>
												    <td align="center" class="td" colspan="5">No Data!!</td>
												 </tr>
										</table>
									<% }%>
							</div>
			</form>
</html>

