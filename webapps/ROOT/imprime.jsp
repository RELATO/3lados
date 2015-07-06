<html>
<head>
<title>ARRTE - UNB</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="styles.css" type="text/css">

<!-- Include Head - Inicio -->
<!-- Include Head - Término -->
</head>

<jsp:useBean id="cm" scope="session" class="system.ContentManager"/>
<%@ page import="java.util.ArrayList" %>
<%@ page import="system.UriUtil" %>

<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" bgcolor="#FFFFFF">

<%
int idConteudo;

try {
	idConteudo = (request.getParameter("conteudo") != null ? Integer.parseInt(request.getParameter("conteudo")) : 1);
} catch ( Exception e ) {
	idConteudo = 1;
}	
%>

<table width="760" align="center" height="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td width="100%" height="20" valign="top" align="right">
		<a class="text01" href="JavaScript: self.print()"><img src="imagens/icone-imprimir.gif" width="20" height="20" border=0 alt="Imprimir o conteúdo">&nbsp;Impressão</a>
	</td>
</tr>
<tr>
<td width="100%" valign="top">
<!--<td bgcolor="#F0F0F0" width="535" valign="top"> -->
	<table width="90%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td noclass align="left" valign="top">
				<%=UriUtil.decodeUri(cm.getContent(idConteudo))%>
			</td>
		</tr>
		<tr>
			<td height="10">
				&nbsp;
			</td>
		</tr>
	</table>
</td>
</tr>
</table>
</body>
</html>
