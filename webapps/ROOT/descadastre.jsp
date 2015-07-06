<%@ page contentType="text/html; charset=windows-1252" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>Envio de e-mail - descadastrando conta</title>
	<link rel="stylesheet" href="/styles/styles.css" media="screen">
	
</head>
<body>

<%@page import="br.com.relato.*" %>
<%@ page import="java.util.*" %>
<%@ page import="net.sf.hibernate.Hibernate" %>
<%@ page import="net.sf.hibernate.HibernateException" %>
<%@ page import="net.sf.hibernate.Transaction" %>

<%@ page import="net.sf.hibernate.Session" %>

<%@ page import="br.com.relato.EntryPoint" %>
<%@ page import="br.com.relato.extranet.InvalidRequestException" %>
<%@ page import="br.com.relato.extranet.model.Prospect" %>

<%
String email = request.getParameter("target");
//System.out.println("Prospect descadastrado para email: " + email);
String msgResult = "OK";

Transaction tx = null;
try{
	Session sessionHbn = EntryPoint.getHbmsession();
	tx = sessionHbn.beginTransaction();

	List list = sessionHbn.find("from Prospect c where c.email = ?", email, Hibernate.STRING);
	if ( list.size() != 0 ){
		Prospect c = (Prospect)list.get(0);
		c.setAtivo("N");
		sessionHbn.update(c);		
		
		System.out.println("Prospect alterado para email: " + email);
	} else {
		msgResult = "Falhou";
	}

	sessionHbn.flush();
	tx.commit();

}catch(InvalidRequestException e){
	if ( e.getCause() != null ){
		e.getCause().printStackTrace();
		//request.setAttribute("exception", e.getCause());
		msgResult = e.getCause().getMessage();
		System.out.println("Prospect exception " + e.getCause());

	}
	if ( e.getMessage() != null ) {
		//request.setAttribute("erro", e.getMessage());
		msgResult = e.getMessage();
		System.out.println("Prospect error " + e.getMessage());
	}	

	try {
		tx.rollback();
	} catch (HibernateException e1) {
		e1.printStackTrace();
	}
} catch (HibernateException e) {
		if ( e.getCause() != null ){
			e.getCause().printStackTrace();
			//request.setAttribute("exception", e.getCause());
			msgResult = e.getCause().getMessage();			
			System.out.println("Prospect exception " + e.getCause());
		}
		if ( e.getMessage() != null ) {
			//request.setAttribute("erro", e.getMessage());
			msgResult = e.getMessage();
			System.out.println("Prospect error " + e.getMessage());
		}			

		try {
			tx.rollback();
		} catch (HibernateException e1) {
			e1.printStackTrace();
		}				
}
%>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr valign="top">
    <td>
		<div align="center"><img src="img/topo.jpg" border="0"></div>
	</td>
  </tr>
  <tr valign="middle">
    <td height="144">
		<div align="center" class="heading2">
			<%=msgResult %><br><br>
			
			<% if (msgResult.equals("OK")) { %>
				O seu e-mail: <b><%=email%></b> foi descadastrado com sucesso.<br>
				Você não receberá mais nossos informativos enviados por e-mail.
			<% } else { %>
				O seu e-mail: <b><%=email%></b> não foi encontrado no cadastro.<br>
			<% } %>
				
			<br><br><a href="/index.jsp">Voltar</a>
		</div>
	</td>
  </tr>
</table>
</body>
</html>