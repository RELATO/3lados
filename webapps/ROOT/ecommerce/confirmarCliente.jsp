<html>
<head>
<title>Meu Carrinho</title>
<head>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="br.com.relato.ecommerce.*" %>
<%@ page import="br.com.relato.util.Cast" %>

<link rel="stylesheet" href="../css/estilo.css">

<style>
.style2 {
		font-family: Verdana;
		font-size: 10px;
		font-weight: normal;
		color:#343458;
		}
</style>

<jsp:useBean id="cesta" scope="session" class="br.com.relato.ecommerce.Cesta"/>

<script language="JavaScript" src="../include/ecommerce.js"></script>

</head>
<body>
<%
	String user = Cast.toString(null != request.getParameter("user")?request.getParameter("user"):"??");
	String password = Cast.toString(null != request.getParameter("password")?request.getParameter("password"):"??");
	System.out.println("User:'"+user+"'\nPassword:'"+password+"'");
	int idcliente = Cliente.validaLogin(user,password);
	if (idcliente != -1){
		cesta.setIdicliente(idcliente);
		String send_to_url = (null != request.getParameter("send_to_url")?request.getParameter("send_to_url"):"");
		response.setStatus( 303 );
		response.setContentType( "text/html" );
		response.setHeader( "Location", send_to_url );
	}else{
		
		String back_to_url = (null != request.getParameter("back_to_url")?request.getParameter("back_to_url"):"");
		if (back_to_url.indexOf("?") == -1){
			back_to_url= back_to_url+"?login=true";
		}else{
			back_to_url= back_to_url+"&login=true";
		}
		response.setStatus( 303 );
		response.setContentType( "text/html" );
		response.setHeader( "Location", back_to_url );
	}
%>
</form>	
</body>
</html>