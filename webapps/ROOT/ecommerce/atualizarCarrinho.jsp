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
cesta.zeraCesta();

System.out.println("lalalalalala");

for(int i=1;;i++){
	int id = Cast.toInt(null != request.getParameter("idproduto"+i)?request.getParameter("idproduto"+i):-1);
	System.out.println("id da desgraca =="+id);
	if (id<0) {
		break;
	}
	int qtd = Cast.toInt(null != request.getParameter("qtde_carrinho"+i)?request.getParameter("qtde_carrinho"+i):-1);
	float vldunitario = Cast.toFloat(null != request.getParameter("vldunitario"+i)?request.getParameter("vldunitario"+i):-1);
	float vldtotal = Cast.toFloat(null != request.getParameter("vldtotal"+i)?request.getParameter("vldtotal"+i):-1);
	System.out.println(id);
	System.out.println(qtd);
	System.out.println(vldtotal);
	System.out.println(vldunitario);
	if (qtd>0)
		cesta.addItemLista(id,qtd,vldunitario,0d,0d,vldtotal);
}

String urlDestino = (null != request.getParameter("send_to_url")?request.getParameter("send_to_url"):"");
response.setStatus( 303 );
response.setContentType( "text/html" );
response.setHeader( "Location", urlDestino );

%>
</body>
</html>