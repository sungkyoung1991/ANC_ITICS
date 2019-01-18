<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="db.AllocateBean"  %>
<%@ page import="java.util.*"  %>
<%@ page import="javax.servlet.http.HttpSession"  %>
<%@ page import = "dbConnUtil.ConnUtil_ITICS" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../assets/css/subpage.css" />

<%
	Connection con = null;
	PreparedStatement ps = null;
	
	
	 String express_name = request.getParameter("express_name");
	 String car_id = request.getParameter("car_id");
	 String driver_id = request.getParameter("driver_id");
	 String car_no = request.getParameter("car_no");
	 String driver_name = request.getParameter("driver_name");
	 String request_person = request.getParameter("request_person");
	 String express_person = request.getParameter("express_person");
	 String departure = request.getParameter("departure");
	 String depart_time = request.getParameter("depart_time");
	 String destination = request.getParameter("destination");
	 String arrive_estitime = request.getParameter("arrive_estitime");
	 String hblno = request.getParameter("hblno");
	 String fileno = request.getParameter("fileno");
	 String cntr_no = request.getParameter("cntr_no");
	 String seal_no = request.getParameter("seal_no");
	 String cntr_size = request.getParameter("cntr_size");
	 String linename = request.getParameter("linename");
	 String rececode = request.getParameter("rececode");
	 String disccode = request.getParameter("disccode");
	 String etc = request.getParameter("etc");
	 String flag = request.getParameter("flag");
	 
      
			
	//상태값 업데이트를 위해서.
	con = ConnUtil_ITICS.getConnection();	 
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	sql = "select B.gps_url,A.fileno,A.hblno,C.car_id,C.car_no,A.departure,A.destination,A.destination_person,C.car_type,C.car_size,D.driver_name,D.driver_hp,A.depart_time,A.arrive_estitime from AllocateCar A ";
	sql = sql+" left join usrInfo B";
	sql = sql+" on A.input_id = B.user_id";
	sql = sql+" left join TransportInfo C";
	sql = sql+" on A.car_id = C.car_id";
	sql = sql+" left join Managedriver D";
	sql = sql+" on A.driver_id = D.driver_id";
	sql = sql+" where A.car_id=" + "'"+car_id+"'" + " and A.driver_id=" + "'"+ driver_id +"'";
	
	
	pstmt=con.prepareStatement(sql);
	rs = pstmt.executeQuery();
	rs.next();
			
	String car_size = rs.getString("car_size");
	String driver_hp = rs.getString("driver_hp");		
			
		

	 
	

	 System.out.println("express_name=" + express_name);
	 System.out.println("fileno=" + fileno);
	 System.out.println("hblno=" + hblno);
	 System.out.println("car_id=" + car_id);
	 System.out.println("car_no=" + car_no);
	 System.out.println("departure=" + departure);
	 System.out.println("destination=" + destination);

	
	String body =""; //배차완료 이메일 양식
	
	body="<html><head>";
	body = body + "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>";
	body = body + "<title>email</title>";
	body = body + "</head><body>";
	body = body + "<table width='657' border='0' cellpadding='0' cellspacing='0' style='font-family:Arial; font-size:9pt;'>";
	body = body + "&nbsp;";
	body = body + "</td>";
	body = body + "</tr>";
	body = body + "</tr>";
	body = body + "</table>";
	body = body + "<p>";

	body = body + "<table style='font-family:Arial; font-size:9pt;'>";
	body = body + "<tr>";
	body = body + "<td>배차완료 상세정보</td>";
	body = body + "</tr>";
	body = body + "</table>";
	body = body + "<table width='880' border='1' bordercolor='lightgray' cellpadding='0' cellspacing='0' style='font-family:Arial; font-size:9pt;'>";
	body = body + "<tr>";
	body = body + " <th style='padding: 0; margin: 0;' align='center' bgcolor='lightgray'>Express Name</th>";
	/* body = body + " <th style='padding: 0; margin: 0;' align='center' bgcolor='lightgray'>FileNo</th>"; */
	body = body + " <th style='padding: 0; margin: 0;' align='center' bgcolor='lightgray'>House B/L No</th>";
	body = body + " <th style='padding: 0; margin: 0;' align='center' bgcolor='lightgray'>Car No</th>";
	body = body + " <th style='padding: 0; margin: 0;' align='center' bgcolor='lightgray'>Car Size</th>";
	body = body + " <th style='padding: 0; margin: 0;' align='center' bgcolor='lightgray'>CNTR No</th>";
	body = body + " <th style='padding: 0; margin: 0;' align='center' bgcolor='lightgray'>Driver Name</th>";
	body = body + " <th style='padding: 0; margin: 0;' align='center' bgcolor='lightgray'>Driver Phone No</th>";
	body = body + " <th style='padding: 0; margin: 0;' align='center' bgcolor='lightgray'>Departure</th>";
	body = body + " <th style='padding: 0; margin: 0;' align='center' bgcolor='lightgray'>Arrival</th>";
	body = body + " <th style='padding: 0; margin: 0;' align='center' bgcolor='lightgray'>Depart Time</th>";
	body = body + " <th style='padding: 0; margin: 0;' align='center' bgcolor='lightgray'>Arrive Time</th>";
	body = body + " <th style='padding: 0; margin: 0;' align='center' bgcolor='lightgray'>ETC</th>";
	body = body + "</tr>";
	body = body + "<tr>";
	body = body + "<td align='center'>"+ express_name + "</td>";
	/* body = body + "<td align='center'>"+ fileno + "</td>"; */
	body = body + "<td align='center'>"+ hblno + "</td>";
	body = body + "<td align='center'>"+ car_no + "</td>";
	body = body + "<td align='center'>"+ car_size + "</td>";
	body = body + "<td align='center'>"+ cntr_no + "</td>";
	body = body + "<td align='center'>"+ driver_name + "</td>";
	body = body + "<td align='center'>"+ driver_hp + "</td>";
	body = body + "<td align='center'>"+ departure + "</td>";
	body = body + "<td align='center'>"+ destination + "</td>";
	body = body + "<td align='center'>"+ depart_time + "</td>";
	body = body + "<td align='center'>"+ arrive_estitime + "</td>";
	body = body + "<td align='center'>"+ etc + "</td>";
	body = body + "</tr>";

	//out.println(body);
	
	/* out.println(body1);
	
	out.println(blno);
	out.println(flag);
	out.println(tr_car);
	out.println(BLTypeDC);
	out.println(MBLNo);
	out.println(ShipperName); */
	
	
%>

<script type="text/javascript" >
	function send(blno,flag){
		
		//alert("들어옴?");
		document.email_Send.action = "sendMail.jsp"
		document.email_Send.method = "post";
		document.email_Send.submit();
	
	}
</script>

<style type="text/css">

</style>


<title>Notice</title>
</head>
<body>
<form name="email_Send" method="post" action="">
<table border="0" cellspacing="0" cellpadding="2">


<b><font>ㆍNotice</font></b>
	
	
	<tr>
		<td align="right">Receiver :</td>
		<td><input type="text" name="txtReceiver" id="txtReceiver" size="107" value="anctrans@ancintl.com"></td>
	</tr>
	<%

	%>
	<tr>
		<td align="right">CC :</td>
		<td>
		<%
		
		%>
			<input type="text" name="txtCC" id="txtCC" size="107" value="">
		</td>
	</tr>

	<tr>
		<td align="right">Subject :</td>
		
		<td>
			<input type="text" name="txtSubject" id="txtSubject" size="107" value="배차완료 Notice HouseBL : <%=hblno %> ">
		</td>
	</tr>
	<tr>
		<td align="right">Mail Message :</td>
			<td><textarea name="txtMessage" id="txtMessage" value="<%=body %>" rows="3" cols="82"><%=body %></textarea></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<button id="sendmailbtn" onclick="send('<%=hblno%>','<%=driver_id%>')">전송</button>
			<%-- <input class="button medium gray"  type="button" value="전송"  onclick="send('<%=hblno%>','<%=driver_id%>')"/> --%>
		</td>
	</tr>
</body>
</html>