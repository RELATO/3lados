<%@page import="br.com.relato.EntryPoint"%>
<%@page import="br.com.relato.Constants"%>
<%@page import="br.com.relato.xls.util.FormatUtils"%>
<%@page import="br.com.neorelato.util.Cast"%>
<%@page import="java.util.*" %>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.math.BigDecimal"%>
<jsp:useBean id="gdc" scope="page" class="br.com.relato.rotinas.GridGerenciadorConteudo"/>
<html>
<head>
	
<!-- 	<link type="text/css" href="../jquery_inicio/css/custom-theme/jquery-ui-1.8.22.custom.css" rel="stylesheet" /> -->
	<link rel="stylesheet" href="/css/lista.css" type="text/css" media="screen" charset="utf-8">
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script src="/js/application.js" type="text/javascript" charset="utf-8"></script>
	 <script>
	 function doSelect(ok) {
		// ok.style.border = "3px solid #08246B";
		var urllink = ok.id;
	 		
			//alert(urllink);
	 	
	    window.opener.document.form1.passaLink.value = document.getElementById(urllink).id;
	    
	    window.opener.atualizaLink();

        window.close();

        return false;
	 }
	 </script>
	 
	 
	 
</head>

<body id="index">

<h1 id="header">Escolha o Link:</h1>
		<form>
			
			<div id="pagewrap">
		      <div id="search">
		        <label for="filter">Filtro</label> <input type="text" name="filter" value="" id="filter" />
		      </div>
		      <div id="body">
		        <table cellpadding="1" cellspacing="1" id="resultTable">
		          <thead>
		            <tr>
		              <th>ID</th>
		              <th>Título</th>
		              <th>URL</th>
		              <th>&nbsp;</th>
		            </tr>
		          </thead>
		          <tbody>
					   	<%

							String campo = (request.getParameter("campo") != null ? request.getParameter("campo") : "");
							String operacao = (request.getParameter("operacao") != null ? request.getParameter("operacao") : "");
							String valor = (request.getParameter("valor") != null ? request.getParameter("valor") : "");
							String lingua = (request.getParameter("lingua") != null ? request.getParameter("lingua") : "");
							String pagina = (request.getParameter("paginaatual") != null ? request.getParameter("paginaatual") : "");
							String pagina2 = (request.getParameter("paginaselecionada") != null ? request.getParameter("paginaselecionada") : "");
							String campopesq = (request.getParameter("campo2") != null ? request.getParameter("campo2") : "");
							String operacaopesq = (request.getParameter("operacao2") != null ? request.getParameter("operacao2") : "");
							String valorpesq = (request.getParameter("valor2") != null ? request.getParameter("valor2") : "");
							String linguapesq = (request.getParameter("lingua2") != null ? request.getParameter("lingua2") : "");
							
							int NUM_REG_PAG = 1000;
							
							List listaConteudo = gdc.pesquisaConteudo(campo,operacao,valor,lingua,pagina,NUM_REG_PAG);
							
							String tipo = "";
							String chk = "";
							if(!listaConteudo.isEmpty()){
								Iterator ite = listaConteudo.iterator();
								int linhanum = 0;
								while(ite.hasNext()){
									linhanum++;
									List linhaEntrada = (List)ite.next();
									String linhaGrid = "";
									String id = Cast.toString(linhaEntrada.get(0));
									String titulo = Cast.toString(linhaEntrada.get(1));
									
									if(linhaEntrada.get(2).equals("C")){
										 tipo = "Conteúdo";	
									}else if(linhaEntrada.get(2).equals("N")){
										 tipo = "Noticia";
									}else if(linhaEntrada.get(2).equals("A")){
										 tipo = "Agenda";
									}
									String usuarioCriacao = Cast.toString(linhaEntrada.get(3));
									String dataEnt = null!=Cast.toDate(linhaEntrada.get(4))?FormatUtils.dateformat(Cast.toDate(linhaEntrada.get(4))):"-";
									String usuarioAlt = Cast.toString(linhaEntrada.get(5));
									String dataUltAlt = null!=Cast.toDate(linhaEntrada.get(6))?FormatUtils.dateformat(Cast.toDate(linhaEntrada.get(6))):"-";
									
									if(linhaEntrada.get(8).equals("S")){
										chk = "Sim";
									}else if(linhaEntrada.get(8).equals("N")){	
										chk = "Não";
									}
									
									String url = Cast.toString(linhaEntrada.get(9));
									
									linhaGrid="index.jsp?u="+url;
							
							
							%>
								<tr>
									
									<td>
										<p name="<%=linhaGrid%>" id="<%=linhaGrid%>" onClick="javascript:return doSelect(this);"><%=id%></p>
									</td>
									<td>
										<p name="<%=linhaGrid%>" id="<%=linhaGrid%>" onClick="javascript:return doSelect(this);"><%=titulo%></p>
									</td>
									<td>
										<p name="<%=linhaGrid%>" id="<%=linhaGrid%>" onClick="javascript:return doSelect(this);"><%=url%></p>
									</td>
									<td>
										<div><input type="button" class="linha" name="<%=linhaGrid%>" id="<%=linhaGrid%>" onClick="javascript:return doSelect(this);" value="ok"></div>
									</td>
									
								<tr>
							<%
									}
							}else{
							%>
									Não há registros para a pesquisa realizada!
							<%
							}
							%>
							
						</tbody>
			        </table>
			      </div>
			    </div>
</form>
</body>
</html>