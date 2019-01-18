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
%>


<!DOCTYPE HTML>

<html>
	<head>
		<title>ANC ITICS - 배차목록</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/subpage.css" />
		<script src="../assets/js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
		
		</script>
		
	</head>

	
<form name="AllocateCar_Add" method="post">

<div class="box container" style="border:none;">

							<!-- Header -->
								<header id="header">
									<h1 style="font-size:20px"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 배차 현황</h1>
								</header>
								
		<br>
		<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> 배차조회</h1>
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
									    <th rowspan="2" class="th txtc" scope="col">파일번호</th>
									    <th rowspan="2" class="th txtc" scope="col">B/L No</th>
									    <th scope="col" class="th txtc">차량ID</th>
									    <th scope="col" class="th txtc">차량번호</th>
									    <th scope="col" class="th txtc">출발지</th>
									    <th scope="col" class="th txtc">도착지(입고처)</th>
									  </tr>
									  <tr>
									    <th scope="col" class="th txtc">차량 종류</th>
									    <th scope="col" class="th txtc">운전자/전화번호</th>
									    <th scope="col" class="th txtc">출발시간</th>
									    <th scope="col" class="th txtc">도착시간</th>
									  </tr>
				<% if (allocatelist!=null) {
					System.out.println("allocateList 수 = "+ allocatelist.size());
				%>					  
						<%for (int i=0; i<allocatelist.size(); i++){ 
							AllocateBean allocate = (AllocateBean)allocatelist.get(i);
						%>
									  <tr>
									    <td rowspan="2" class="td">1</td>
									    <td align="center" rowspan="2" class="td"><%=allocate.getFileno() %></td>
									    <td align="center" rowspan="2" class="td"><%=allocate.getHblno() %></td>
									    <td align="center" scope="col" class="td"><%=allocate.getCar_id() %></td>
									    <td align="center" scope="col" class="td"><%=allocate.getCar_no() %></td>
									    <td align="center" scope="col" class="td"><%=allocate.getDeparture() %></td>
									    <td align="center" scope="col" class="td"><%=allocate.getDestination() %></td>
									  </tr>
									  <tr>
									    <td align="center" scope="col" class="td">2.5TON Truck</td>
									    <td align="center" scope="col" class="td">이정구 / 010-2342-1223</td>
									    <td align="center" scope="col" class="td"><%=allocate.getDepart_time() %></td>
									    <!--일단 도착 예정시간을 도착시간에 출력-->
									    <td align="center" scope="col" class="td"><%=allocate.getArrive_estitime() %></td>
									    
									  </tr>
									  <%} %>
				<%}else{ %>
							
				<%} %>					
							</table>
		</div>					
								
			</form>
</html>

