<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.ancintl.ancitics.domain.Transport" %>

<%@ page import="java.util.*"%>

<%-- <%

	List transportlist = (List)request.getAttribute("transportlist");
	 System.out.println("sk : " + transportlist);

	int listcount=0;
	int nowpage=0;
	int maxpage=0;
	int startpage=0;
	int endpage=0;

	if (transportlist!=null){
		listcount=((Integer)request.getAttribute("listcount")).intValue();
		nowpage=((Integer)request.getAttribute("page")).intValue();
		maxpage=((Integer)request.getAttribute("maxpage")).intValue();
		startpage=((Integer)request.getAttribute("startpage")).intValue();
		endpage=((Integer)request.getAttribute("endpage")).intValue();
	}
%> --%>

<!DOCTYPE>

<html>
	<head>
		<title>ANC ITICS - 운송수단 등록</title>
	</head>
 
<script src="https://code.jquery.com/jquery-3.3.1.slim.js"></script>
<script type="text/javascript">

document


	function add_transport(){
		
		//alert("1");
		//window.open("http://61.78.158.211:8080/ANC_Transinform/trans/InputForm.jsp?blno="+blno+"&user_id="+user_id+"&code="+code, "_blank", "width=900, height=715, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, location=no, directories=no, status=no" );
		//window.open("http://61.78.158.211:8080/ANC_Transinform/trans/user_inform.jsp?user_id="+user_id, "_blank", "width=600, height=415, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, location=no, directories=no, status=no" );
		window.open("http://61.78.158.211:8080/ANC_ITICS/menu/add_transport.do", "_blank", "width=850, height=350, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, location=no, directories=no, status=no" );
		//alert("2");
	}
	
	 function movepage(page,flag){
		
		var formData = $("#CarSearch").serialize();
		var car_no = $("#sch_car_no").val();
		var flag = "mini";
		
		   $.ajax({
		        type: 'get',
		        url: './TransportSelectAction.do?car_no='+car_no+'&flag='+flag+'&page='+page,
		        cache : false,
		        data : formData,
		        success: function(data){
		        	$('#searchcar').html(data);
		            //alert(data);
		            
		        }
		   });
		   return false; //<- 이 문장으로 새로고침(reload)이 방지됨
	} 
	
 	function searchbtn_car(){
		var formData = $("#CarSearch").serialize();
		var car_no = $("#sch_car_no").val();
		var flag = "mini";
		
		var str ='';
		
		
		   $.ajax({
		        url: '/allocateRest/transportSelect?car_no='+car_no+'&flag='+flag,
		        method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
		          
				success : function(data , status) {
					
					$.each(data.list,function(i, item){
						rowno= i+1;
						str +=  '<tr>'; 
						str += '<th scope="row" class="th txtr" width="2%">' + rowno + '</th>';
					    str += '<td align="center" class="td" width="9%" >';
					    str += '<input name="oup_car_id[]" id="oup_car_id[]" style="border: 0px solid black; border-image: none; background-color: transparent; font-size:8pt; cursor:pointer;" type="text" value="'+item.car_id+'" onclick="input_car(form,' + i + ',' + data.length + ');" readonly/>';
					    str += '</td>';
					    str += '<td align="center" class="td" width="10%">';
					    str += '<input name="oup_car_type[]" id="oup_car_type[]" style="border: 0px solid black; border-image: none; background-color: transparent; font-size:8pt; cursor:pointer;" type="text" value="'+item.car_type+'" onclick="input_car(form,' + i + ',' + data.length + ');" readonly/>';
					    str += '</td>';
					    str += '<td align="center" class="td" width="10%">';
					    str += '<input name="oup_car_no[]" id="oup_car_no[]" style="border: 0px solid black; border-image: none; background-color: transparent; font-size:8pt; cursor:pointer;" type="text" value="'+item.car_no +'" onclick="input_car(form,' + i + ',' + data.length + ');" readonly/>';
					    str += '</td>';
					    str += '<td align="center" class="td" width="15%">-</td>';
					 	str += '</tr>';
						
					});
					
					console.log(data.listcount);
					
					$('#insert_car_info').html(str);
					
					
				}
		   
		   });
		   return false; 
		};  
		
		
		
</script>


<form name="CarSearch" id="CarSearch">



							
							<br>
							<div id = "searchcar" name = "searchcar">
								<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> 차량조회 </h1>
								<a style="border:0; cursor:pointer;"  onclick="add_transport();"><h1 align="right" style="font-size:13px"><i class="fa fa-plus-square-o" aria-hidden="true"></i> 신규등록</h1></a>
									<table class="table">
										<colgroup>
											<col width="5%" />
										    <col width="10%" />
										    <col width="5%" />
										</colgroup>
									
										<tr>
											<th style="font-size:12px" scope="row" class="th txtr">차량번호</th>
											<td class="td" align="center" style="border:0;">
												<input type="text" name="sch_car_no" id="sch_car_no"   placeholder="Car No"  style="text-align:center;  height:25px;"/>
											</td>
											<td align="right" style="border:0;"><i class="fa fa-search" aria-hidden="true"></i><span id="searchbtn_car" onclick="searchbtn_car();">조회</span>
											</td>
											
										</tr>
										
									</table>
							<table class="table">			
									 <tr>
									 	<th style="font-size:12px" width="2%">No</th>
									     <th style="font-size:12px" width="9%">차량ID</th>
									     <th style="font-size:12px" width="10%">차량 종류</th>
									     <th style="font-size:12px" width="10%">차량 번호</th>
									     <th style="font-size:12px" width="15%">안전관리 여부</th>
									 </tr>
							</table>
							
							<table class="table">
								<tr id="insert_car_info"> 
							</table>
									 
							<%-- <table class="table">
									 <tr align=center height=20>
										<td align="center" class="td" colspan="5">
											<%if(nowpage<=1){ %>
											[이전]
											<%}else{ %>
											<a href="#" onclick="movepage('<%=nowpage-1 %>','mini')">[이전]</a>&nbsp;
											<a href="./TransportSelectAction.do?page=<%=nowpage-1 %>&flag=mini">[이전]</a>&nbsp;
											<%} %>
											
											<%for(int a=startpage;a<=endpage;a++){
												if(a==nowpage){%>
												[<%=a %>]
												<%}else{ %>
												<a href="#" onclick="movepage('<%=a %>','mini')">[<%=a %>]</a>&nbsp;
												<a href="./TransportSelectAction.do?page=<%=a %>&flag=mini">[<%=a %>]</a>&nbsp;
												<%} %>
											<%} %>
											<%if(nowpage>=maxpage){ %>
											[다음]
											<%}else{ %>
											<a href="#" onclick="movepage('<%=nowpage+1 %>','mini')">[다음]</a>
											<a href="./TransportSelectAction.do?page=<%=nowpage+1 %>&flag=mini">[다음]</a>
											<%} %>
										</td>
									</tr>
							</table> --%>

							</div>
							
			
						
			</form>
</html>

