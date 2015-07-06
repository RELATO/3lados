<%@ page contentType="text/html; charset=windows-1252" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Envio de E-mail</title>
<style type="text/css">

#botaolink{
	display: block;
	padding:10px 15px 10px;
	text-decoration: none;
	width: 100px;
	text-align: center;
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.8);
	font-weight: bold;
	//text-transform: uppercase;
	color: #FFF;
	font: bold .9em 'Lucida Grande',Arial;
	background:	#069cc7 url(/images/button-bg.png) 0 -183px repeat-x ; //
	-moz-border-radius: 5px;  
 	-webkit-border-radius: 5px;
 	-moz-box-shadow: 2px 2px 3px #000;
	-webkit-box-shadow: 2px 2px 3px #000;
	box-shadow: 2px 2px 3px #000;
	/* For IE 8 */
	-ms-filter: "progid:DXImageTransform.Microsoft.Shadow(Strength=3, Direction=135, Color='#000000')";
	/* For IE 5.5 - 7 */
	filter: progid:DXImageTransform.Microsoft.Shadow(Strength=3, Direction=135, Color='#000000');
 	border: 0px solid #28537d;
	margin: 0 10px 10px 0;
	}	
</style>	
</head>
<body>

<%@ page import="com.relato.EmailHelper" %>
<%@ page import="java.util.*" %>
<%

StringBuffer buff = new StringBuffer();
TreeMap params = new TreeMap();
String campo;
String valor;

String nome = null != request.getParameter("fullname") ? request.getParameter("fullname").toString() : "";
String email = null != request.getParameter("validemail") ? request.getParameter("validemail").toString() : "";
String mensagem = null != request.getParameter("message") ? request.getParameter("message").toString() : "";
String destform = null != request.getParameter("destform") ? request.getParameter("destform").toString() : "";

buff.append("<font color=111111><b>Nome").append(": </b></font>").append(nome).append("<br>");
buff.append("<font color=111111><b>Email").append(": </b></font>").append(email).append("<br>");
buff.append("<font color=111111><b>Mensagem").append(": </b></font>").append(mensagem).append("<br>");

String destino = destform;

System.out.println("Destinatario: "+destino);

if (buff.length() > 0) {
    
    EmailHelper em = new EmailHelper("contato@3lados.com.br");
    em.addDest(destino);
    em.envia("Mensagem Enviada - Contato 3 Lados", buff.toString());
}   
%>
<br><br><br>
<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr valign="middle">
    <td height="144">
		<div align="center">
		<font size="4" face="Verdana, Arial, Helvetica, sans-serif" color="#000000" >
		<center>Sua mensagem foi enviada com sucesso.<br><br>Muito Obrigado!</center></font>
			<br><br><a href="/index.jsp" id="botaolink">Voltar</a>
		</div>
	</td>
  </tr>
</table>
</body>
</html>