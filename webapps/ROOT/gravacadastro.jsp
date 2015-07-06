
<jsp:useBean id="c"  scope="page" class="br.com.relato.ContatoBean"/>
<%@page import="com.relato.*" %>
<%@page import="com.relato.pool.PoolFilter" %>
<%@page import="com.relato.EmailHelper"%>
<%@page import="java.sql.*" %>


<%
String nome =request.getParameter("nome");
String empresa=request.getParameter("empresa");
String endereco=request.getParameter("endereco");
String municipio=request.getParameter("municipio");
String estado=request.getParameter("estado");
String pais=request.getParameter("pais");
String email=request.getParameter("email");
String ddd=request.getParameter("ddd");
String fone=request.getParameter("fone");
String assunto=request.getParameter("assunto");
String mensagem=request.getParameter("mensagem");

c.setNome( nome );
c.setEmpresa( empresa );
c.setEndereco( endereco );
c.setMunicipio( municipio );
c.setEstado( estado );
c.setPais( pais );
c.setEmail( email );
c.setDdd( ddd );
c.setFone( fone );
c.setAssunto( assunto );
c.setMensagem( mensagem );

c.salvaContato();

EmailHelper em = new EmailHelper("contato/neorelato");

//emails para quem vamos envias a mensagem
//em.addDest("contato@dradvogados.com.br");
em.addDest("haroldo@relato.com.br");
em.addDest("felipe@relato.com.br");

StringBuffer buff = new StringBuffer();

buff.append("Nome: ").append(nome).append('\n');
buff.append("Empresa: ").append(empresa).append('\n');
buff.append("Endereco: ").append(endereco).append('\n');
buff.append("Municipio: ").append(municipio).append('\n');
buff.append("Estado: ").append(estado).append('\n');
buff.append("Pais: ").append(pais).append('\n');
buff.append("Email: ").append(email).append('\n');
buff.append("DDD: ").append(ddd).append('\n');
buff.append("Fone: ").append(fone).append('\n');
buff.append("Assunto: ").append(assunto).append('\n');
buff.append("Mensagem: ").append(mensagem).append('\n');

em.envia("Novo contato NeoRelato", buff.toString());
%>

<div class="contact">
Obrigado!<br><br>
Em breve entraremos em contato com você.
<br>
<br>
<a href="index.jsp">Voltar</a></div>