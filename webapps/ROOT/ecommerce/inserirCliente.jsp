<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>	
    <title>..::Relato Informática::..</title>
    <link href="/styles/estilo.css" rel="stylesheet" type="text/css"/>
    <script language="JavaScript" src="/scripts/formularioecommerce.js"></script>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="br.com.relato.ecommerce.*" %>
<%@ page import="br.com.relato.util.Cast" %>

<meta name="description" content="Relato Informática.">
</head>

<jsp:useBean id="cesta" scope="session" class="br.com.relato.ecommerce.Cesta"/>

<body>
<%
String nmsemail = (null != request.getParameter("nmsemail")?request.getParameter("nmsemail"):"");
//String login = (null != request.getParameter("login")?request.getParameter("login"):"");
String nmssenha = (null != request.getParameter("nmssenha")?request.getParameter("nmssenha"):"");
String cdstipocliente = (null != request.getParameter("cdstipocliente")?request.getParameter("cdstipocliente"):"");
String nmscompleto = (null != request.getParameter("nmscompleto")?request.getParameter("nmscompleto"):"");
String dtdaniversario = (null != request.getParameter("dtdaniversario")?request.getParameter("dtdaniversario"):"");
//String data_nasc_mes = (null != request.getParameter("data_nasc_mes")?request.getParameter("data_nasc_mes"):"");
//String obs = (null != request.getParameter("obs")?request.getParameter("obs"):"");
String cdscpfcnpj = (null != request.getParameter("cdscpfcnpj")?request.getParameter("cdscpfcnpj"):"");
String cdsrgie = (null != request.getParameter("cdsrgie")?request.getParameter("cdsrgie"):"");
//String identificador = (null != request.getParameter("identificador")?request.getParameter("identificador"):"");
//String end_tipo = (null != request.getParameter("end_tipo")?request.getParameter("end_tipo"):"");
String nmsendereco = (null != request.getParameter("nmsendereco")?request.getParameter("nmsendereco"):"");
String cdsnumero = (null != request.getParameter("cdsnumero")?request.getParameter("cdsnumero"):"");
String nmscomplemento = (null != request.getParameter("nmscomplemento")?request.getParameter("nmscomplemento"):"");
String nmsbairro = (null != request.getParameter("nmsbairro")?request.getParameter("nmsbairro"):"");
String nmscidade = (null != request.getParameter("nmscidade")?request.getParameter("nmscidade"):"");
String cdscep = (null != request.getParameter("cdscep")?request.getParameter("cdscep"):"");
String cdsestado = (null != request.getParameter("cdsestado")?request.getParameter("cdsestado"):"");
String cdstelefone = (null != request.getParameter("cdstelefone")?request.getParameter("cdstelefone"):"");
String cdsfax = (null != request.getParameter("cdsfax")?request.getParameter("cdsfax"):"");
String cdscelular = (null != request.getParameter("cdscelular")?request.getParameter("cdscelular"):"");
String opsenviaemail = (null != request.getParameter("opsenviaemail")?request.getParameter("opsenviaemail"):"");

/*
String log = (null != request.getParameter("log")?request.getParameter("log"):"");
String return_page = (null != request.getParameter("return_page")?request.getParameter("return_page"):"");
String cadastro_id = (null != request.getParameter("cadastro_id")?request.getParameter("cadastro_id"):"");
String loaded_areas = (null != request.getParameter("loaded_areas")?request.getParameter("loaded_areas"):"");
*/


Cliente cliente = new Cliente(-1, -1, nmscompleto,
		 nmsendereco,  cdsnumero,  nmscomplemento,
		 nmsbairro,  nmscidade,  cdsestado,
		 cdscep,  cdstelefone,  cdsfax,
		 cdscelular,  nmsemail,  nmssenha,
		 opsenviaemail,  cdstipocliente,  cdscpfcnpj,
		 cdsrgie,new Date() , new Date(),
		new Date());


System.out.println("nmsemail"+nmsemail);

//System.out.println("login" +login);

System.out.println("nmssenha" +nmssenha);

System.out.println("cdstipocliente" +cdstipocliente);

System.out.println("nmscompleto" +nmscompleto);

//System.out.println("dtdaniversario"+dtdaniversario+"/"+data_nasc_mes+"/"+1900);

//System.out.println("data_nasc_mes"+data_nasc_mes);

//System.out.println("obs"+obs);

//System.out.println("cdstipocliente" +cdstipocliente);

System.out.println("cdscpfcnpj" +cdscpfcnpj);

System.out.println("cdsrgie" +cdsrgie);

//System.out.println("identificador" +identificador);

//System.out.println("end_tipo" +end_tipo);

System.out.println("nmsendereco" +nmsendereco);

System.out.println("cdsnumero" +cdsnumero);

System.out.println("nmscomplemento" +nmscomplemento);

System.out.println("nmsbairro" +nmsbairro);

System.out.println("nmscidade" +nmscidade);

System.out.println("cdscep" +cdscep);

System.out.println("cdsestado"+cdsestado);

System.out.println("cdstelefone" +cdstelefone);

System.out.println("cdsfax" +cdsfax);

System.out.println("cdscelular" +cdscelular);

System.out.println("opsenviaemail" +opsenviaemail);

/*
System.out.println("log" +log);

System.out.println("return_page" +return_page);

System.out.println("cadastro_id" +cadastro_id);

System.out.println("loaded_areas" +loaded_areas);
*/

String back_to_url = (null != request.getParameter("back_to_url")?request.getParameter("back_to_url"):"");

if (cliente.pesquisaLogin(nmsemail)){
	back_to_url += "?mensagem=Email já Cadastrado!";
	response.setStatus( 303 );
	response.setContentType( "text/html" );
	response.setHeader( "Location", "formularioCliente.jsp?mensagem=Email já Cadastrado!" );
}else if ((nmsemail.indexOf("@")==-1) ){
	back_to_url += "?mensagem=Email Invalido!!";
	response.setStatus( 303 );
	response.setContentType( "text/html" );
	response.setHeader( "Location", "formularioCliente.jsp?mensagem=Email Invalido!" );
}else if(cliente.gravaCliente()){
	cesta.setIdicliente(cliente.getIdicliente());
	String send_to_url = (null != request.getParameter("send_to_url")?request.getParameter("send_to_url"):"");
	response.setStatus( 303 );
	response.setContentType( "text/html" );
	response.setHeader( "Location", "carrinho.jsp" );
}



%>



</body>
</html>
