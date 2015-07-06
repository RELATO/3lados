<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Envio de E-mail</title>
</head>
<body>

<%@page import="javax.activation.*"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="br.com.relato.email.*"%>

<%
try{
	System.out.println("2323232323232323232323 teste");
	
	Dictionary fields = DumpMultipartRequest.doUpload(request, response);

	System.out.println("teste 1: " + fields.get("email"));

       	BodyPart body = new MimeBodyPart();

	StringBuffer buff = new StringBuffer();

	buff.append(fields.get("email")).append('\n');

	Session sessionmail;
	ArrayList dests = new ArrayList();

	Properties prop = new Properties();
	prop.put("mail.smtp.host", "smtp.relato.com.br");

	sessionmail = Session.getInstance(prop);
	InternetAddress from = new InternetAddress((String)fields.get("email"));

	dests.add(new InternetAddress("daniel@relato.com.br"));

	Message message = new MimeMessage(sessionmail);
	message.setFrom(from);
	InternetAddress[] dest = (InternetAddress[])dests.toArray(new  InternetAddress[dests.size()]);
	message.setRecipients(Message.RecipientType.TO, dest);

	message.setSentDate(new Date());
	message.setSubject("Envio de currículo!!");

	Multipart mp = new MimeMultipart();
	BodyPart bodyPart = null;

	if(buff.length() > 0) {
	    bodyPart = new MimeBodyPart();
	    bodyPart.setContent(buff.toString(), "text/plain");
	    mp.addBodyPart(bodyPart);
	}

	if(null != fields.get("upload")){
		mp.addBodyPart((BodyPart)fields.get("upload"));
	}

	message.setContent(mp);
	Transport.send(message);
}catch(Exception e){
	e.printStackTrace();
}
%>

<table width="770" border="0" align="left" cellpadding="0" cellspacing="0">
  <tr valign="middle">
    <td height="144">
		<div align="center">
			Email enviado com sucesso!!
			<br><br><a href="/index.jsp">Voltar</a>
		</div>
    </td>
  </tr>
</table>
</body>
</html>