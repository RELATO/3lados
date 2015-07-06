<%@page import="com.relato.pool.PoolFilter" %>
<%@page import="com.relato.EmailHelper"%>
<%@page import="java.sql.*" %>
<html>

<head>
	<link rel="stylesheet" href="/styles/stylesindex.css" media="screen">
</head>

<body>
<center>
<h2 style="color: #005281; font-family: Verdana, Arial; vertical-align: middle;">

<%!
	String checkNull(String valor){
		if ( valor == null || "".equals(valor) || "null".equals(valor) )
			return "";
		return valor;
	}
%>
<br><br>
<%

boolean bOk = true;

String nome =request.getParameter("nome");
String empresa=request.getParameter("empresa");
String ddd=request.getParameter("ddd");
String fone=request.getParameter("fone");
String email=request.getParameter("email");
String mensagem=request.getParameter("mensagem");

EmailHelper em = new EmailHelper(email);

//emails para quem vamos enviar a mensagem
//em.addDest("vendas@hexagonmetrology.com.br");
em.addDest("sac@hexagonmetrology.com.br");
StringBuffer buff = new StringBuffer();
buff.append("Nome: ").append(nome).append('\n');
buff.append("Empresa: ").append(empresa).append('\n');
buff.append("DDD: ").append(ddd).append('\n');
buff.append("Telefone: ").append(fone).append('\n');
buff.append("Email: ").append(email).append('\n');
buff.append("Mensagem: ").append(mensagem).append('\n');

em.envia("CADASTRO-SITE", buff.toString());


	if( bOk ){
%>
Cadastro enviado com sucesso !!!<br><br>
    Obrigado. 
    <%
	}else{
%>
    Ocorreu algum erro ao enviar o cadastro !!! 
<%
}
%>

  </h2>
<br><br>
  <input name="fechar" type="button" id="enviar" class="botaologin" onClick="self.close()" value="&nbsp;&nbsp;Fechar&nbsp;&nbsp;">
</center>
</body>

</html>