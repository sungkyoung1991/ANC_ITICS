<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "my.util.ConnUtil_uFMS" %>
    <%@ page import = "my.util.ConnUtil" %>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 
Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%


	String check_id ="";

	check_id = (String)session.getAttribute("s_id");
	
	System.out.println(check_id);
	
	/*  if(check_id == null)
     {
		 
		 
		 out.println("<script>alert('�������� ����!!');</script>");
		 out.println("<script>");
		 out.println("window.location.href('index.html');");
		 out.println("</script>");
		 out.flush();
     } */

%>

<style type="text/css">

table {
	border-collapse: collapse;
	font-family: 'Open Sans', sans-serif;
	font-size: 0.7em;
	margin: 0;
	padding: 0;
}
font{
	font-family: 'Open Sans', sans-serif;
	border-collapse: collapse;
}
caption {
	font-size: 1.4em;
	font-stretch: condensed;
	font-weight: bold;
	padding-bottom: 5px;
	text-align: left;
	text-transform: uppercase;
}
th, td {
	border-bottom: 1px solid #666;
	border-top: 1px solid #666;
	border-right: 1px solid #666;
	padding: 0.6em;
	vertical-align: 4px;
	text-align: center;
}
th {
	text-align: left;
	text-transform: uppercase;
}
tfoot th, tfoot td {
	background-color: #cc9;
	font-size: 1.1em;
}

tbody th {
	
	border-right: 1px solid #666;
	background-color:#cb6d51;  /* �÷� ��� ���� */
	text-align: center;
	font-weight: bold;
	color: #000000;
	font-family: 'Open Sans', sans-serif;
	
}

tbody tr:hover td, tbody tr:hover  {
	background-color: #E5E5CB;
}
tr.odd td, tr.odd th {
	background-color: #ddd;
}
tbody a {
	color: #333;
}
tbody a:visited {
	color: #999999;
}
tbody a:hover {
	color: #33c;
}
tbody a:active {
	color: #33c;
}
tbody td+td+td+td a {
	background: url(http://www.clacksweb.org.uk/images/external.gif) no-repeat right 0.4em;
	padding-right: 12px;
}
tfoot th {
	text-align: right;
}
tfoot th:after {
	content: ":";
}
 
</style>

<script type="text/javascript">

function hidePreload() { 
	  preload.style.visibility = "hidden"; 
	}

/* function makePreload(msg) { 
	  document.write("<div id=\"preload\" style=\"", 
	    "position:absolute;top:0;left:0;width:100%;height:100%;", 
	    "background-color:white;color:black;", 
	    "text-align:center;z-index:1\">", 
	    "<table border='0' height='100%'><tr><td>", 
	    msg, 
	    "</td></tr></table></div>"); 
	} 
	makePreload("������ �ε���. ��ø� ��ٷ� �ּ���."); 
	self.onload=hidePreload;  */
	
	function inform(blno,user_id,auth){
		var hblno = blno;
		
		//alert("1");
		window.open("http://61.78.158.211:8080/ANC_Transinform/trans/InputForm.jsp?blno="+blno+"&user_id="+user_id, "_blank", "width=900, height=715, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, location=no, directories=no, status=no" );
		
		//alert("2");
	}
	
	function sendFrameSize()
	{
		window.parent.resizeIFrame(document.body.scrollHeight);
	}

</script>

<html>
<head>
<!-- <link href="/style/memberStyle.css" rel="stylesheet" type="text/css"/>
<link href="/style/icono.min.css" rel="stylesheet" type="text/css"/>
<link href="css/button2.css" rel="stylesheet" type="text/css"/> -->
<link rel="stylesheet" href="assets/css/main.css" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />

<title>�����Ȳ</title>
</head>
<body class="box container"  style="background:#fffaf0; padding:12px 0px 0px 0px;">
<b>Status : N(�̹���) , I(������), Y(�����Ϸ�)</b>
<br>



<%
Connection conn = null;
PreparedStatement ps = null;

Connection conn2 = null;
PreparedStatement ps2 = null;

 
 String auth = "";
 String blno = request.getParameter("blno"); //�Է¹��� BL��ȣ  HBL
 String status_yn = request.getParameter("status"); //ALL , Y , N ���°� ����
 
/*  String Status =""; // ���°�
 String MBLNo = ""; //������ BL
 String HBLNo = ""; //�Ͽ콺 BL
 String Requestdate = ""; //��ۿ�û��
 
 String tr_car  = ""; //���� ����
 String tr_time = ""; // ���������ð�
 
 String PartnerConfirmDate = "";
 String ConfirmDate = ""; */
 
 try{
	 
	int cnt = 0; 
    ResultSet rs2 ;	 //������ ��ȸ
  //conn = ConnUtil_uFMS.getConnection(); // uFMS DB ����  
  conn = ConnUtil.getConnection();  // ������� �ý��� DB����
  
  Statement stmt = conn.createStatement();
  
  
  // ResultSet rs = stmt.executeQuery("select RefNo from dbo.TFDOI_BL where HBLNo='WLSO16078803' ");
 /*  ResultSet rs = stmt.executeQuery("select *  from tr_user where user_id = " +"'"+ check_id+"'" );
  
  rs.next();
  
  auth = rs.getString("Authority"); */
  
  //out.println("select *  from tr_user where user_id = " +"'"+ check_id+"'" );
  //out.println(auth);
  
  //ResultSet rs2 = stmt2.executeQuery("select  * from dbo.tr_trans where tr_blno = " +"'" +blno+"'");
  //ResultSet rs2 = stmt2.executeQuery("select  top 20 * from ANCX_uFMS.dbo.TFDOI_BL A left join tr_trans B on A.HBLNo = B.tr_bl left join tr_bl C  on A.HBLNo = C.HBLNo where A.HBLNo =  " +"'" +blno+"'" + "order by puncherDate desc");
  
  if (blno.length()!=0 && status_yn.equals("ALL") ){  //bl �Է��� �ϰ� ��ȸ�ҽ�.
	  rs2 = stmt.executeQuery("select  top 20 A.MBLNo,A.HBLNo,isnull(B.tr_car,'') as tr_car,isnull(B.tr_time,'') as tr_time,Isnull(b.tr_carno,'') AS tr_carno,Isnull(b.driver_name,'') AS driver_name,Isnull(b.driver_hp,'') AS driver_hp,Isnull(b.tr_curnavi,'') AS tr_curnavi, isnull(C.Status,'N') as Status, isnull(C.RequestDate,'') as RequestDate from ANCX_uFMS.dbo.TFDOI_BL A left join tr_trans B on A.HBLNo = B.tr_bl left join tr_bl C  on A.MBLNo = C.MBLNo AND A.HBLNo = C.HBLNo  where A.HBLNo =  " +"'" +blno+"'" + "AND A.ConsigneeCode = 'EWPS' "+ "order by puncherDate desc");
  	  out.println("1");
  }
  else{ //�������� ��ȸ�ҽ�..
	  
	  if(status_yn.equals("Y")){
		  rs2 = stmt.executeQuery("select * from tr_bl A left join tr_trans B on A.hblno = B.tr_bl where A.Status ='Y'");
		  out.println("select * from tr_bl A left join tr_trans B on A.hblno = B.tr_bl where A.Status ='Y'");
	  }
	  else{
	  rs2 = stmt.executeQuery("select  top 20 A.MBLNo,A.HBLNo,isnull(B.tr_car,'') as tr_car,isnull(B.tr_time,'') as tr_time,Isnull(b.tr_carno,'') AS tr_carno,Isnull(b.driver_name,'') AS driver_name,Isnull(b.driver_hp,'') AS driver_hp,Isnull(b.tr_curnavi,'') AS tr_curnavi,isnull(C.Status,'N') as Status, isnull(C.RequestDate,'') as RequestDate from ANCX_uFMS.dbo.TFDOI_BL A left join tr_trans B on A.HBLNo = B.tr_bl left join tr_bl C  on A.MBLNo = C.MBLNo AND  A.HBLNo = C.HBLNo  where  A.HBLNo <> '' " + "AND A.ConsigneeCode = 'EWPS' "+ "order by puncherDate desc");
	  }
  }
  
  //ResultSet rs2 = stmt2.executeQuery("select  top 20 A.MBLNo,A.HBLNo,isnull(B.tr_car,'') as tr_car,isnull(B.tr_time,'') as tr_time,isnull(C.Status,'N') as Status, isnull(C.RequestDate,'') as RequestDate from ANCX_uFMS.dbo.TFDOI_BL A left join tr_trans B on A.MBLNo = B.tr_bl left join tr_bl C  on A.MBLNo = C.MBLNo where A.HBLNo =  " +"'" +blno+"'"+ "and A.HBLNo <> '' " + "order by puncherDate desc");
  
  
  //���Ŀ� �� ������ ���� JOIN�ɰ��̹Ƿ� �׽�Ʈ
  
  //out.println("select  top 20 A.MBLNo,A.HBLNo,isnull(B.tr_car,'') as tr_car,isnull(B.tr_time,'') as tr_time,isnull(C.Status,'N') as Status, isnull(C.RequestDate,'') as RequestDate from ANCX_uFMS.dbo.TFDOI_BL A left join tr_trans B on A.MBLNo = B.tr_bl left join tr_bl C  on A.MBLNo = C.MBLNo where  A.HBLNo <> '' " + "order by puncherDate desc");
 // rs.next();
  
  //String RefNo = rs.getString("RefNo");
%>
<b></b>
<form>
		<table style="border: 1px solid #bcbcbc; border-radius: 8px; font-size:9pt; font-weight:100;">
		 
		 <tr>
		 	 <th>No</th>
		     <th>Status</th>
		     <th>MBL No</th>
		     <th>HBL No</th>
		     <th>Monitoring</th>
		     <!-- <th>Truck Type</th>
		     <th>Car No</th>
		     <th>Driver</th>
		     <th>Driver H.P</th>
		     <th>Current Navi</th> -->
		    		  
		 </tr>
		 
<% while(rs2.next()){
	
	
	System.out.println(rs2.getString("Status"));
	
	 String Status = rs2.getString("Status"); // ���°�
	 String MBLNo = rs2.getString("MBlno"); //������ BL
	 String HBLNo = rs2.getString("HBLNo"); //�Ͽ콺 BL
	 String Requestdate = rs2.getString("Requestdate"); //��ۿ�û��
	 
	 String tr_car  = rs2.getString("tr_car"); //���� ����
	 String tr_carno  = rs2.getString("tr_carno"); //���� ��ȣ
	 String driver_name  = rs2.getString("driver_name"); //�����ڸ�
	 String driver_hp  = rs2.getString("driver_hp"); //������ ��ȭ��ȣ
	 String tr_curnavi  = rs2.getString("tr_curnavi"); //���� ���� ��ġ
	 String tr_time = rs2.getString("tr_time"); // ���������ð�
	 
	 String PartnerConfirmDate = "";
	 String ConfirmDate = "";
	
	 cnt = cnt+1;
	 
	 
	 if (Status==null){
		 System.out.println("����!");		 
		 Status = "N";
	 }
	 
	// System.out.println(Status);
	 
	//System.out.println(MBLNo);
	

%>
		 <tr style="border: 1px solid #bcbcbc">
		 	 <td width="10px" style="border: 1px solid #bcbcbc"><%=cnt%></td>	
		     <td width="10px" style="border: 1px solid #bcbcbc"><%=Status%></td>
		     <td width="70px" style="border: 1px solid #bcbcbc" onclick="inform('<%=HBLNo%>','<%=check_id%>');"  style="cursor: pointer"><%=MBLNo%></td>
		     <td width="70px" style="border: 1px solid #bcbcbc" onclick="inform('<%=HBLNo%>','<%=check_id%>');"  style="cursor: pointer"><%=HBLNo%></td>
		     <td width="" style="border: 1px solid #bcbcbc"></td>
		 </tr>

<%
}
 }catch(Exception e){
  e.printStackTrace();
%>
<table style="border: 1px solid #bcbcbc; border-radius: 8px; font-size:9pt; font-weight:100;">
		 <tr>
		 	 <th width="15px">No</th>
		     <th width="15px">Status</th>
		     <th width="70px">MBL No</th>
		     <th width="70px">HBL No</th>
		     <th width="">Monitoring</th>		 
		 	 <!-- <th>No</th>
		     <th>Status</th>
		     <th>MBL No</th>
		     <th>HBL No</th>
		     <th>Truck Type</th>
		     <th>Car No</th>
		     <th>Driver</th>
		     <th>Driver H.P</th>
		     <th>Current Navi</th>	   -->
		 </tr>
</table>		 
<%
 }finally{
	 //ConnUtil_uFMS.close(ps, conn);
 }
%>		 
		 </table>
</form>
</body>
</html>

<script>
self.resizeTo(document.body.scrollWidth , document.body.scrollHeight + 10);
</script>
