<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="javax.mail.Transport" %>
<%@page import="javax.mail.Message" %>    
<%@page import="javax.mail.Address" %>
<%@page import="javax.mail.internet.InternetAddress" %>
<%@page import="javax.mail.internet.MimeMessage" %>
<%@page import="javax.mail.Session" %>
<%@page import="mail.SMTPAuthenticator" %>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties" %>
<%@ page import = "dbConnUtil.ConnUtil_ITICS" %>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>전송중..</title>
</head>
<body>
<%

//상태값 업데이트를 위해서.
Connection conn = null;
PreparedStatement ps = null;


request.setCharacterEncoding("euc-kr");


System.out.println(request.getParameter("txtCC"));
System.out.println(request.getParameter("txtSubject"));
System.out.println(request.getParameter("txtMessage"));


String from = "no-reply@ancintl.com";  //TEST 메일 주소
String to = request.getParameter("txtReceiver");
String subject = request.getParameter("txtSubject");
String content = request.getParameter("txtMessage");

String blno = request.getParameter("hblno"); //HBL번호
String driver_id = request.getParameter("driver_id"); //flag값
String Requestdate = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm").format(new java.util.Date()); //요청시간


Properties p = new Properties();

p.put("mail.smtp.host","mail.ancintl.com");

p.put("mail.smtp.port","2525");
p.put("mail.smtp.starttls.enable","true");
p.put("mail.smtp.auth","true");
p.put("mail.smtp.debug","true");
p.put("mail.smtp.socketFactory.port","2525");
//p.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback","false");

//SMTP 서버에 접속하기 위한 정보들

try{       
	
	//상태값 업데이트를 위해서.
	conn = ConnUtil_ITICS.getConnection();	 
	Statement stmt = conn.createStatement();
	
	Authenticator auth = new SMTPAuthenticator();
    Session ses = Session.getInstance(p, auth);
     
    ses.setDebug(true);
     
    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
    msg.setSubject(subject,"UTF-8"); // 제목
     
    Address fromAddr = new InternetAddress(from);
    msg.setFrom(fromAddr); // 보내는 사람
     
    Address toAddr = new InternetAddress(to);
    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
     
    msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
     
    Transport.send(msg); // 전송
} catch(Exception e){
    e.printStackTrace();
    out.println("<script>alert('Send Mail Failed..');history.back();</script>");
    // 오류 발생시 뒤로 돌아가도록
    return;
}

//성공시 상태값을 I 로 업데이트 한다.

/* 	System.out.println(blno);
	System.out.println("update tr_bl set status='I', RequestDate = '" + Requestdate + "' where hblno = ? ");
	if(flag.equals("B")){
		String sql = "update tr_bl set status='I', RequestDate = '" + Requestdate + "' where hblno = ? ";
		ps = conn.prepareStatement(sql);
		ps.setString(1,blno);
	}else if(flag.equals("T")){
		String sql = "update tr_bl set status='Y', RequestDate = '" + Requestdate + "' where hblno = ? ";
		ps = conn.prepareStatement(sql);
		ps.setString(1,blno);
	}
	
	ps.executeUpdate();
	 System.out.println("update tr_bl set status='I', RequestDate = '" + Requestdate + "' where hblno = "+ "'"+blno+"'" );
  */
	out.println("<script>alert('Send Mail Success!!');opener.parent.location.reload();window.close();</script>");
	// 성공 시

%>

</body>
</html>
