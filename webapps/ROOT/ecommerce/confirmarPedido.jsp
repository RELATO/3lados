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
	int idpedido = cesta.gravaPedido();
%>
<table width="604" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td colspan="2">Pedido enviado com Sucesso!<td>
	</tr>
	<tr>
		<td colspan="2">O número do seu pedido é: <font color=red><%=idpedido%></font><td>
	</tr>	
</table>
</form>	
</body>
</html>