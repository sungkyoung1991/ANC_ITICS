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
<title>������..</title>
</head>
<body>
<%

//���°� ������Ʈ�� ���ؼ�.
Connection conn = null;
PreparedStatement ps = null;


request.setCharacterEncoding("euc-kr");


System.out.println(request.getParameter("txtCC"));
System.out.println(request.getParameter("txtSubject"));
System.out.println(request.getParameter("txtMessage"));


String from = "no-reply@ancintl.com";  //TEST ���� �ּ�
String to = request.getParameter("txtReceiver");
String subject = request.getParameter("txtSubject");
String content = request.getParameter("txtMessage");

String blno = request.getParameter("hblno"); //HBL��ȣ
String driver_id = request.getParameter("driver_id"); //flag��
String Requestdate = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm").format(new java.util.Date()); //��û�ð�


Properties p = new Properties();

p.put("mail.smtp.host","mail.ancintl.com");

p.put("mail.smtp.port","2525");
p.put("mail.smtp.starttls.enable","true");
p.put("mail.smtp.auth","true");
p.put("mail.smtp.debug","true");
p.put("mail.smtp.socketFactory.port","2525");
//p.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback","false");

//SMTP ������ �����ϱ� ���� ������

try{       
	
	//���°� ������Ʈ�� ���ؼ�.
	conn = ConnUtil_ITICS.getConnection();	 
	Statement stmt = conn.createStatement();
	
	Authenticator auth = new SMTPAuthenticator();
    Session ses = Session.getInstance(p, auth);
     
    ses.setDebug(true);
     
    MimeMessage msg = new MimeMessage(ses); // ������ ������ ���� ��ü
    msg.setSubject(subject,"UTF-8"); // ����
     
    Address fromAddr = new InternetAddress(from);
    msg.setFrom(fromAddr); // ������ ���
     
    Address toAddr = new InternetAddress(to);
    msg.addRecipient(Message.RecipientType.TO, toAddr); // �޴� ���
     
    msg.setContent(content, "text/html;charset=UTF-8"); // ����� ���ڵ�
     
    Transport.send(msg); // ����
} catch(Exception e){
    e.printStackTrace();
    out.println("<script>alert('Send Mail Failed..');history.back();</script>");
    // ���� �߻��� �ڷ� ���ư�����
    return;
}

//������ ���°��� I �� ������Ʈ �Ѵ�.

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
	// ���� ��

%>

</body>
</html>
