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
int idproduto = Cast.toInt(null != request.getParameter("idproduto")?request.getParameter("idproduto"):0);
int qtdproduto = Cast.toInt(null != request.getParameter("qtdproduto")?request.getParameter("qtdproduto"):0);
System.out.println("AQUII OOOO ======= "+idproduto+""+qtdproduto);
cesta.addItemLista(idproduto,qtdproduto);
String send_to_url = (null != request.getParameter("send_to_url")?request.getParameter("send_to_url"):"");
response.setStatus( 303 );
response.setContentType( "text/html" );
response.setHeader( "Location", send_to_url );
%>
</form>	
</body>
</html>