<%@page import="com.relato.pool.PoolFilter" %>
<%@page import="com.relato.EmailHelper"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<html>

<head>
	<link rel="stylesheet" href="/styles/stylesindex.css" media="screen">
</head>

<body>
<center>
<h2 style="font-family: Verdana, Arial; vertical-align: middle;">

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
boolean branco = false;

String nome =request.getParameter("nome");
String email=request.getParameter("email");
String mensagem=request.getParameter("mensagem");

final String sql = " insert into livrovisitas set " +
					" nmscompleto = ?, " +
					" nmsemail = ?, " +
					" dssmensagem = ?, " +
					" dhdcadastro = now(), " +
					" cdsstatus = 'I' ";
try{

	PreparedStatement pstmt = PoolFilter.getConnection().prepareStatement(sql);

	pstmt.setString(1, checkNull(nome));
	pstmt.setString(2, checkNull(email));
	pstmt.setString(3, checkNull(mensagem));
	pstmt.execute();
	
    if ( pstmt != null )
		pstmt.close();

EmailHelper em = new EmailHelper(email);

//emails para quem vamos envias a mensagem
em.addDest("daniel@relato.com.br");

StringBuffer buff = new StringBuffer();
buff.append("nome: ").append(nome).append('\n');
buff.append("email: ").append(email).append('\n');
buff.append("mensagem: ").append(mensagem).append('\n');

em.envia("LIVRO DE VISITAS", buff.toString());

}catch(Exception e){
	e.printStackTrace();
	bOk = false;
}

	if( bOk ){
%>
Livro de Visitas registrado com sucesso!<br><br>
    Obrigado. 
<%
	}else{
%>
Algum erro aconteceu ao enviar sua mensagem, por favor tente mais tarde.

<%
	}
%>


</h2>
<br><br>
&nbsp;<input name="voltar" type="button" id="enviar" class="botaologin" onClick="window.location.href='/livrovisitas.jsp'" value="&nbsp;&nbsp;Voltar&nbsp;&nbsp;">

</center>
</body>

</html>