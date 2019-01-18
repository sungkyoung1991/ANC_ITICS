<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="db.TransportBean" %>
<%@ page import="java.util.*"%>

<%
	List transportlist = (List)request.getAttribute("transportlist");
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
%>


<script type="text/javascript">

	function add_transport(){
		
		//alert("1");
		//window.open("http://61.78.158.211:8080/ANC_Transinform/trans/InputForm.jsp?blno="+blno+"&user_id="+user_id+"&code="+code, "_blank", "width=900, height=715, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, location=no, directories=no, status=no" );
		//window.open("http://61.78.158.211:8080/ANC_Transinform/trans/user_inform.jsp?user_id="+user_id, "_blank", "width=600, height=415, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, location=no, directories=no, status=no" );
		window.open("http://61.78.158.211:8080/ANC_ITICS/menu/add_transport.do", "_blank", "width=850, height=350, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, location=no, directories=no, status=no" );
		//alert("2");
	}
	function del_car(car_id){
		 
		//$('#delbtn_car').click(function(){
			
			//alert(car_id);
			var formData = $("#CarSearch").serialize();
			
			if (confirm("해당차량을 삭제하시겠습니까?") == true){
			   $.ajax({
			        type: 'get',
			        url: './TransportDeleteAction.do?car_id='+car_id,
			        cache : false,
			        data : formData,
			        success: function(data){
			        	$('#searchcar').html(data);
			            //alert(data);
			        }
			   });
			   alert("삭제되었습니다.");
			   
			   return false; //<- 이 문장으로 새로고침(reload)이 방지됨
			//});
		}
		}
	function movepage(page){
			
		var formData = $("#CarSearch").serialize();
		var car_no = $("#car_no").val();
		var status_yn = $("#status_yn").val();
		var flag="big";
		
		   $.ajax({
		        type: 'get',
		        url: './TransportSelectAction.do?car_no='+car_no+'&flag='+flag+"&page="+page,
		        cache : false,
		        data : formData,
		        success: function(data){
		        	$('#searchcar').html(data);
		            //alert(data);
		        }
		   });
			   return false; //<- 이 문장으로 새로고침(reload)이 방지됨
		}
	
	$('#searchbtn_car').click(function(){
		
		var formData = $("#CarSearch").serialize();
		var car_no = $("#car_no").val();
		var status_yn = $("#status_yn").val();
		var flag="big";
		
		   $.ajax({
		        type: 'get',
		        url: './TransportSelectAction.do?car_no='+car_no+'&flag='+flag,
		        cache : false,
		        data : formData,
		        success: function(data){
		        	$('#searchcar').html(data);
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



<form name="transportaccount" id="transportaccount" action="" method="post">
	<div id = "searchcar" name = "searchcar">
	<!-- Header -->
		<header id="header">
			<h1 style="font-size:20px;"><i class="fa fa-list" aria-hidden="true"></i> 운송수단 등록</h1>
		</header>

		<table class="table">
		
			<tr>
			     <th style="font-weight: bold">차량번호</th>
			     <td> <input type="text" size="25" maxlength="20" name="car_no" id="car_no"></td>
			     <th style="font-weight: bold">사용상태</th>
			     <td style="padding:0px 0px 0px 0px">  		     
			     		<select id="status_yn" name="status_yn">
						   <option value="ALL">ALL(전체)</option>
						   <option value="Y">Y(사용)</option>
						   <option value="N">N(정지)</option>
					   </select>
			     </td>
			     <td align="right">
			     	<button id="searchbtn_car"><i class="fa fa-search" aria-hidden="true"></i> 조회</button>
			     	<button onclick="add_transport();"><i class="fa fa-plus-square-o" aria-hidden="true"></i> 신규등록</button>
			     </td>
			</tr>
			</table>
			
			<%if (transportlist !=null){ 
				System.out.println("transportlist 수 :" +transportlist.size());
			%>
			
			<table class="table">
			 <tr>
			 	 <th width="2%">No</th>
			     <th width="9%">차량ID</th>
			     <th width="10%">차량 종류</th>
			     <th width="10%">차량 번호</th>
			     <th width="10%">비고</th>
			 </tr>
			 <%for (int i=0; i<transportlist.size(); i++){ 
			 	TransportBean transportdata = (TransportBean)transportlist.get(i);
			 %>
			 	<tr>
				 	<th scope="row" class="th txtr"><%=i+1%></th>
				    <td align="center" class="td">
				    	<input name="oup_car_id[]" id="oup_car_id[]" style="border: 0px solid black; border-image: none; background-color: transparent; font-size:8pt; cursor:pointer; text-align:center;" type="text" value="<%=transportdata.getCar_id() %>" onclick="input_car(form,'<%=i%>','<%=transportlist.size()%>');" readonly/>
				    </td>
				    <td align="center" class="td">
				    	<input name="oup_car_type[]" id="oup_car_type[]" style="border: 0px solid black; border-image: none; background-color: transparent; font-size:8pt; cursor:pointer; text-align:center;" type="text" value="<%=transportdata.getCar_type() %>" onclick="input_car(form,'<%=i%>','<%=transportlist.size()%>');" readonly/>
				    </td>
				    <td align="center" class="td">
				    	<input name="oup_car_no[]" id="oup_car_no[]" style="border: 0px solid black; border-image: none; background-color: transparent; font-size:8pt; cursor:pointer; text-align:center;" type="text" value="<%=transportdata.getCar_no() %>" onclick="input_car(form,'<%=i%>','<%=transportlist.size()%>');" readonly/>
				    </td>
				    <td align="center" class="td"><a href="#" onclick="del_car('<%=transportdata.getCar_id() %>'); return false;">삭제</a></td>
				 </tr>
			 
			  <%} %>
			  <tr align=center height=20>
				<td align="center" class="td" colspan="5">
					<%if(nowpage<=1){ %>
					[이전]
					<%}else{ %>
					<a href="#" onclick="movepage('<%=nowpage-1 %>')">[이전]</a>&nbsp;
					<%-- <a href="./TransportSelectAction.do?page=<%=nowpage-1 %>&flag=mini">[이전]</a>&nbsp; --%>
					<%} %>
					
					<%for(int a=startpage;a<=endpage;a++){
						if(a==nowpage){%>
						[<%=a %>]
						<%}else{ %>
						<a href="#" onclick="movepage('<%=a %>')">[<%=a %>]</a>&nbsp;
						<%-- <a href="./TransportSelectAction.do?page=<%=a %>&flag=mini">[<%=a %>]</a>&nbsp; --%>
						<%} %>
					<%} %>
					<%if(nowpage>=maxpage){ %>
					[다음]
					<%}else{ %>
					<a href="#" onclick="movepage('<%=nowpage+1 %>')">[다음]</a>
					<%-- <a href="./TransportSelectAction.do?page=<%=nowpage+1 %>&flag=mini">[다음]</a> --%>
					<%} %>
				</td>
			</tr>
		 </table>
		 <%}else{ %>
		 <table class="table">			
				 <tr>
				 	 <th width="2%">No</th>
				     <th width="9%">차량ID</th>
				     <th width="10%">차량 종류</th>
				     <th width="10%">차량 번호</th>
				     <th width="10%">비고</th>
				 </tr>
				 <tr>
				    <td align="center" class="td" colspan="5">No Data!!</td>
				 </tr>
		</table>
							
							<%} %>
		 
		 </div>
</form>
</body>
</html>

