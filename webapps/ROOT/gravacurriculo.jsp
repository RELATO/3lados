
<jsp:useBean id="cur"  scope="page" class="br.com.relato.CurriculoBean"/>
<%@page import="com.relato.*" %>
<%@page import="com.relato.pool.PoolFilter" %>
<%@page import="com.relato.EmailHelper"%>
<%@page import="java.sql.*" %>


<%
String nome=request.getParameter("nome");
String cargo=request.getParameter("cargo");
String estadocivil=request.getParameter("estadocivil");
String sexo=request.getParameter("sexo");
String idade=request.getParameter("idade");
String endereco=request.getParameter("endereco");
String cep=request.getParameter("cep");
String bairro=request.getParameter("bairro");
String cidade=request.getParameter("cidade");
String estado=request.getParameter("estado");
String pais=request.getParameter("pais");
String email=request.getParameter("email");
String fone=request.getParameter("fone");
String arquivo=request.getParameter("uploaded");


cur.setNome( nome );
cur.setCargo( cargo );
cur.setEstadoCivil(estadocivil);
cur.setSexo(sexo);
cur.setIdade(idade);
cur.setEndereco( endereco );
cur.setCep( cep );
cur.setBairro( bairro );
cur.setCidade( cidade );
cur.setEstado( estado );
cur.setPais( pais );
cur.setEmail( email );
cur.setFone( fone );
cur.setArquivo( arquivo );

cur.salvaContato();

EmailHelper em = new EmailHelper("Curriculo");

//emails para quem vamos envias a mensagem
//em.addDest("contato@dradvogados.com.br");
em.addDest("haroldo@relato.com.br");
//em.addDest("felipe@relato.com.br");

StringBuffer buff = new StringBuffer();

buff.append("Nome: ").append(nome).append('\n');
buff.append("Cargo: ").append(cargo).append('\n');
buff.append("Idade: ").append(idade).append('\n');
buff.append("Sexo: ").append(sexo).append('\n');
buff.append("Estado Civil: ").append(estadocivil).append('\n');
buff.append("Endereco: ").append(endereco).append('\n');
buff.append("Cep: ").append(cep).append('\n');
buff.append("Bairro: ").append(bairro).append('\n');
buff.append("Cidade: ").append(cidade).append('\n');
buff.append("Estado: ").append(estado).append('\n');
buff.append("Pais: ").append(pais).append('\n');
buff.append("Email: ").append(email).append('\n');
buff.append("Fone: ").append(fone).append('\n');
buff.append("Curriculo: documentos/curriculos/").append(arquivo).append('\n');

em.envia("Novo Curriculo do Site! ", buff.toString());
%>

<div class="contact">
Obrigado!<br><br>
Em breve entraremos em contato com você.
<br>
<br>
<a href="index.jsp">Voltar</a></div>