<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "dbConnUtil.ConnUtil_uFMS" %>
<%@ page import = "dbConnUtil.ConnUtil" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "paging.PagingUtil" %>
<%@ page import = "paging.PagingBean" %>
<%@ page import = "java.net.InetAddress" %>
<%@ page import = "java.net.UnknownHostException" %>
<%@ page import="java.util.*"%>
<%@ page import="db.AllocateBean"%>
<jsp:include page="calendar.jsp" />
<%
	List allocatelist =(List)request.getAttribute("allocatelist");
	System.out.println(allocatelist);
	
	int listcount=0;
	int nowpage=0;
	int maxpage=0;
	int startpage=0;
	int endpage=0;

	if (allocatelist!=null){
		listcount=((Integer)request.getAttribute("listcount")).intValue();
		nowpage=((Integer)request.getAttribute("page")).intValue();
		maxpage=((Integer)request.getAttribute("maxpage")).intValue();
		startpage=((Integer)request.getAttribute("startpage")).intValue();
		endpage=((Integer)request.getAttribute("endpage")).intValue();
	}
	
%>

<!DOCTYPE HTML>

<html>
	<head>
		<title>ANC ITICS - 배차현황</title>
		
	</head>
<%
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
String today = formatter.format(new java.util.Date());
			
%>	
<script type="text/javascript">

	function searchunipass(hblno){
		
		window.open("http://61.78.158.211:8080/ANC_ITICS/menu/SearchUnipass.jsp?hblNo="+hblno, "_blank", "width=1050, height=1200, toolbar=no, menubar=no, resizable=no,scrollbars=yes, copyhistory=no, location=no, directories=no, status=no" );
	}
	
	function movepage(page){
		
		var formData = $("#CarSearch").serialize();
		var car_no = $("#sch_car_no").val();
		var flag = "mini";
		
			$.ajax({
		        type: 'get',
		        url: './AllocateSelectAction.do?flag=all'+"&fileno="+fileno+"&hblno="+hblno+"&car_no="+car_no+"&fromDt="+fromDt+"&toDt="+toDt+"&page="+page,
		        cache : false,
		        data : formData,
		        contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		        success: function(data){
		        	$('#searchallocate').html(data);
		        }
		   });
		   return false; //<- 이 문장으로 새로고침(reload)이 방지됨
	}
	
	$(document).ready(function() 
			{
			 $('#schallocate_btn').click(function(){
					var formData = $("#AllocateCar_Status").serialize();
					var fileno = document.getElementById("fileno").value;
					var hblno = document.getElementById("hblno").value;
					var car_no = document.getElementById("car_no").value;
					var fromDt = document.getElementById("fromDt").value;
					var toDt = document.getElementById("toDt").value;
					
					   $.ajax({
					        type: 'get',
					        url: './AllocateSelectAction.do?flag=all'+"&fileno="+fileno+"&hblno="+hblno+"&car_no="+car_no+"&fromDt="+fromDt+"&toDt="+toDt,
					        cache : false,
					        data : formData,
					        contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					        success: function(data){
					        	$('#searchallocate').html(data);
					        }
					   });
				
					
					   return false; //<- 이 문장으로 새로고침(reload)이 방지됨
					});
			});
</script>
	
<form name="AllocateCar_Status" method="post">
<input type="hidden" name="flag" id="flag" value="all"/>
						
		<div id="searchallocate" name="searchallocate">
		<!-- Header -->
								<header id="header">
									<h1 style="font-size:20px"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 배차 현황</h1>
								</header>
		<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> 배차조회</h1>
					<table class="table">
								
									<colgroup>
										<col width="5%" />
										<col width="5%" />
										<col width="5%" />
									    <col width="5%" />
									    <col width="5%" />
									    <col width="5%" />
									    <col width="5%" />
									    <col width="15%" />
									    <col width="5%" />
									</colgroup>
								
									<tr>
										<th scope="row" class="th txtr">파일번호</th>
										<td class="td">
											<input type="text" name="fileno" id="fileno"   placeholder="File No"  style="text-align:center;  height:25px;"/>
										</td>
										<th scope="row" class="th txtr">B/L No</th>
										<td class="td">
											<input type="text" name="hblno" id="hblno"   placeholder="House B/L No"  style="text-align:center;  height:25px;"/>
										</td>
										<th scope="row" class="th txtr">차량번호</th>
										<td class="td">
											<input type="text" name="car_no" id="car_no"   placeholder="Car No"  style="text-align:center;  height:25px;"/>
										</td>
										<th scope="row" class="th txtr">날짜</th>
										<td class="td">
											<input name="fromDt" type="" id="fromDt" name="fromDt" size="10" maxlength="10" value ="<%=today %>"> ~ 
											<input name="toDt" type="" id="toDt" name="toDt" size="10" maxlength="10" value="<%=today%>">
										</td>
										<td align="right"><button id="schallocate_btn"><i class="fa fa-search" aria-hidden="true"></i> 조회</button></td>
									</tr>
									
									 
							</table>
							
							<table class="table">
							
									<colgroup>
										<col width="2%" />
										<col width="3%" />
										<col width="3%" />
										<col width="3%" />
									    <col width="10%" />
									    <col width="10%" />
									    <col width="10%" />
									    <col width="10%" />
									    <col width="10%" />
									    <col width="10%" />
									    <col width="10%" />
									</colgroup>
									  <tr>
									    <th rowspan="2" class="th txtc" scope="col">No</th>
									    <th rowspan="2" class="th txtc" scope="col">통관정보</th>
									    <th rowspan="2" class="th txtc" scope="col">GPS</th>
									    <th rowspan="2" class="th txtc" scope="col">안전관리</th>
									    <th rowspan="2" class="th txtc" scope="col">파일번호</th>
									    <th rowspan="2" class="th txtc" scope="col">B/L No</th>
									    <th scope="col" class="th txtc">차량ID</th>
									    <th scope="col" class="th txtc">차량번호</th>
									    <th scope="col" class="th txtc">출발지</th>
									    <th scope="col" class="th txtc">도착지(입고처)</th>
									    <th scope="col" class="th txtc">인수자</th>
									  </tr>
									  <tr>
									    <th scope="col" class="th txtc">차량 종류</th>
									    <th scope="col" class="th txtc">운전자/전화번호</th>
									    <th scope="col" class="th txtc">출발시간</th>
									    <th scope="col" class="th txtc">도착시간</th>
									    <th scope="col" class="th txtc">인수자정보</th>
									  </tr>
			<% if (allocatelist!=null) {
					System.out.println("allocateList 수 = "+ allocatelist.size());
				%>					  
						<%for (int i=0; i<allocatelist.size(); i++){ 
							AllocateBean allocate = (AllocateBean)allocatelist.get(i);
							
							System.out.println(allocate.getGps_url());
							String gps_url = allocate.getGps_url();
						%>									  
									  
									  <tr>
									    <td rowspan="2" class="td"><%=i+1 %></td>
									    <td rowspan="2" class="td" align="center"><a href="" onclick="searchunipass('<%=allocate.getHblno()%>')" target="_blank"><img src="images/customs.png"/></a></td>
									    <td rowspan="2" class="td" align="center"><a href="<%=gps_url%>" target="_blank"><img src="images/gps.png"/></a></td>
									    <td rowspan="2" class="td" align="center"><img src="images/AEO.png"/></td>
									    <td align="center" rowspan="2" class="td"><%=allocate.getFileno() %></td>
									    <td align="center" rowspan="2" class="td"><%=allocate.getHblno() %></td>
									    <td align="center" scope="col" class="td"><%=allocate.getCar_id() %></td>
									    <td align="center" scope="col" class="td"><%=allocate.getCar_no() %></td>
									    <td align="center" scope="col" class="td"><%=allocate.getDeparture() %></td>
									    <td align="center" scope="col" class="td"><%=allocate.getDestination() %></td>
									    <td align="center" scope="col" class="td"><%=allocate.getDestination_person() %></td>
									  </tr>
									  <!--차량 및 운전자 정보는 각 테이블에서 조인해서 가져올것.  -->
									  <tr>
									    <td align="center" scope="col" class="td"><%=allocate.getCar_size()%> / <%=allocate.getCar_type() %></td>
									    <td align="center" scope="col" class="td"><%=allocate.getDriver_name()%> / <%=allocate.getDriver_hp()%></td>
									    <td align="center" scope="col" class="td"><%=allocate.getDepart_time() %></td>
									    <!--일단 도착 예정시간을 도착시간에 출력-->
									    <td align="center" scope="col" class="td"><%=allocate.getArrive_estitime() %></td>
									    <td align="center" scope="col" class="td">-</td>
									  </tr>
						  <%} %>
						  		<tr align=center height=20>
										<td align="center" rowspan="2" class="td" colspan="11">
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
			<%}else{ %> 
									  <tr>
									    <td align="center" rowspan="2" class="td" colspan="11">No Data!!</td>
									    <!-- <td rowspan="2" class="td" align="center"><img src="images/customs.png"/></td>
									    <td rowspan="2" class="td" align="center"><img src="images/gps.png"/></td>
									    <td rowspan="2" class="td" align="center"><img src="images/AEO.png"/></td>
									    <td align="center" rowspan="2" class="td">M18RMG015</td>
									    <td align="center" rowspan="2" class="td">13846</td>
									    <td align="center" scope="col" class="td">EXP110111</td>
									    <td align="center" scope="col" class="td">서울23다1544</td>
									    <td align="center" scope="col" class="td">인천(에이엔씨익스프레스)</td>
									    <td align="center" scope="col" class="td">풍세</td>
									    <td align="center" scope="col" class="td">조길구</td> -->
									  </tr>
									  
									  
							<%} %>				
									
							</table>
							
						</div>		
			</form>
</html>