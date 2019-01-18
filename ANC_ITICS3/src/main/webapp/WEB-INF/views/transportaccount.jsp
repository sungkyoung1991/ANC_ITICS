<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>ANC ITICS - 운송수단 등록</title>
		
	</head>
<%
String blno = request.getParameter("blno");
			
%>
	

		<form>


							<!-- Header -->
								<header id="header">
									
									
									<h1 style="font-size:20px">운송수단 등록</h1>
									
								</header>
								
						 		<div class="box container">
								<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> 조회조건</h1>
									<table class="table">
								
										<colgroup>
											<col width="5%" />
										    <col width="10%" />
										    <col width="5%" />
										    <col width="10%" />
										    <col width="10%" />
										</colgroup>
									
										<tr>
											<th scope="row" class="th txtr">마스터 B/L</th>
											<td class="td">
												<input type="text" name="query" id="query"   placeholder="M-B/L"  style="text-align:center; width:200px; height:25px;"/>
											</td>
											<th scope="row" class="th txtr">하우스 B/L</th>
											<td class="td">
												<input type="text" name="query" id="query" value="<%=blno %>"   placeholder="H-B/L"  style="text-align:center; width:200px; height:25px;"/>
											</td>
											<td align="center"><button  onclick="window.location.reload();">조회하기</button>
										</tr>
									
									 
								 </table>
								</div> 




			</form>
	
					
</html>