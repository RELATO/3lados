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

    <link rel="STYLESHEET" type="text/css" href="gerenciador.css">
    <link rel="STYLESHEET" type="text/css" href="/scripts/dhtmlx-script/dhtmlxGrid/codebase/dhtmlxgrid.css">
	<link rel="STYLESHEET" type="text/css" href="/scripts/dhtmlx-script/dhtmlxGrid/codebase/dhtmlxcustom.css">
	<link rel="stylesheet" type="text/css" href="/scripts/dhtmlx-script/dhtmlxGrid/codebase/skins/dhtmlxgrid_dhx_skyblue.css">
	<script src="/scripts/dhtmlx-script/dhtmlxGrid/codebase/dhtmlxcommon.js"></script>
	<script src="/scripts/dhtmlx-script/dhtmlxGrid/codebase/dhtmlxgrid.js"></script>		
	<script src="/scripts/dhtmlx-script/dhtmlxGrid/codebase/dhtmlxgridcell.js"></script>	
	<script src="/scripts/dhtmlx-script/dhtmlxGrid/codebase/excells/dhtmlxgrid_excell_link.js"></script>
	<script src="/he/scripts/script.js"></script>
	<script src="/he/scripts/script-htmleditor.js"></script>

<script>

function doOnCellEdit(stage,rowId,cellInd){
	var grid = this;
	var valor = grid.cells(rowId,cellInd).getValue();
	var rowInd = grid.getRowIndex(rowId);
	var numColunas = parseInt((grid.getColumnCount()).toString());
	var numLinhas = parseInt((grid.getRowsNum()).toString());
	
	if(stage==0){
		if(cellInd == 1){
			return true;
		}else{
			return false;
		}	
	}
	
	if(stage==1){
		if(cellInd == 1){
			return true;
		}else{
			return false;
		}
	}
	
	if(stage==2){
		if(cellInd == 1){
			return true;
		}else{
			return false;
		}
	}
}

function visualiza(id){
	var iframe = document.getElementById("visualizacao"); 
	var ling = document.getElementById("lingua").value;
	iframe.src = "/index.jsp?conteudo="+id+"&gerenciador=true&permission=true&lingua="+ling;
}

var idfilho;
function openFather(id){
	this.idfilho = id;
	parent.openFrame(id);
}

window.reloadContent = function(){
	window.focus();
	var idConteudo = window.top.frames.top2.getLocation();
	pesquisa();
	//alert('Reloading...')
	visualiza(idConteudo);
}

window.pesquisa = function(){
	
}

/*
window.novapesquisa = function(){
	mygrid.clearAll();
	document.getElementById('campo2').value = "";
	document.getElementById('operacao2').value = "";
	document.getElementById('valor2').value = "";
	document.getElementById('lingua2').value = "";
	document.getElementById('paginaselecionada').value = "";
}
*/

function novapesquisa(){
	mygrid.clearAll();
		
	document.getElementById('campo2').value = "";
	document.getElementById('operacao2').value = "";
	document.getElementById('valor2').value = "";
	document.getElementById('lingua2').value = "";
	document.getElementById('paginaselecionada').value = "";
	document.getElementById('campo').value = "";
	document.getElementById('operacao').value = "";
	document.getElementById('valor').value = "";
	document.getElementById('lingua').value = "";
	document.getElementById('paginaatual').value = "";
	document.getElementById('paginaselecionada').value = "";
	
	//setTimeout(function(){
		//mygrid.clearAll();
	//}, 3000 );
		
	//alert("oioioi == "+document.getElementById("campo").value);
} 
window.openFrame = function(id){
	document.getElementById("id").value = id;
	document.getElementById("idHE").value = id;
	visualiza(id);
}

function recarregaCombo(){
	var idselected = document.getElementById("idHE").value;
	if("" != idselected){
		visualiza(idselected);
	}
}

function deleta(id){
	//var id = document.getElementById("id").value;
	if ( id != null && id.length != 0 ){
		if ( !confirm("Deseja excluir o registro selecionado?") )
			return;
		deletaConteudo(id);
	}else{
		alert("Selecione um registro primeiro!!");
	}
}

function checkTop(){
	var top2 = window.top.frames.top2;
	if ( top2 == null )
		window.location.href = "/siteadmin/home.jsp";
}

function doOpenHE(action){
	if ( action != 2 && document.getElementById("id").value == ""){
		alert("Selecione um registro primeiro!");
		return;
	}
	if (action == 2){
		
		document.getElementById("idHE").value = "";
		window.top.frames.top2.doOpenHE(action);
		//return;

	}else{
		
		var id = window.top.frames.top2.document.getElementById("id");
		id.value = document.getElementById("id").value;
		var idHE = window.top.frames.top2.document.getElementById("idHE");
		idHE.value = document.getElementById("idHE").value;
		idHE.value = id.value;
		var linguaHE = window.top.frames.top2.document.getElementById("linguaHE");
		linguaHE.value = document.getElementById("lingua").value;
			window.top.frames.top2.doOpenHE(action);
			
	}
	
	
}

window.gotoMenu = function(){
	//alterar aki pois esta apontando para o site de teste wwt != www
	//var new_window = window.open("/siteadmin/home.jsp","html_name"); 
	//history.back();
	window.history.back();
	// form.send_to_url.value="/siteadmin/menu.jsp";
    // form.action="/siteadmin/menu.jsp";
    // form.submit();	
}

function proximaPagina(){
	var paginaAtual = document.getElementById("paginaselecionada").value;
	var totPaginas = document.getElementById("totpaginas").value;

	if(paginaAtual == ""){
		document.getElementById('paginaatual').value = 1;
		paginaAtual = 1;
	}else if(paginaAtual == totPaginas){
		document.getElementById("paginaatual").value = paginaAtual;
	}else{
		paginaAtual = parseInt(paginaAtual)+1;
		document.getElementById("paginaatual").value = paginaAtual;
	}
	frmSelDados.submit();
}

function anteriorPagina(){
	var paginaAtual = document.getElementById("paginaselecionada").value;
	//var totPaginas = document.getElementById("totalpaginas").value;
	
	if(paginaAtual == "1"){
		document.getElementById('paginaatual').value = 1;
		paginaAtual = 1;
	}else{
		paginaAtual = parseInt(paginaAtual)-1;
		document.getElementById("paginaatual").value = paginaAtual;
	}
	frmSelDados.submit();
}
function ultimaPagina(){
	var paginaAtual = document.getElementById("paginaselecionada").value;
	var totPaginas = document.getElementById("totpaginas").value;
	if(paginaAtual != "" || totPaginas != ""){
		document.getElementById('paginaatual').value = totPaginas;
	}
	frmSelDados.submit();
}

function primeiraPagina(){
	var paginaAtual = document.getElementById("paginaselecionada").value;
	var totPaginas = document.getElementById("totpaginas").value;
	if(paginaAtual != "" || totPaginas != ""){
		document.getElementById('paginaatual').value = 1;
	}
	frmSelDados.submit();
}

function checador(){
	var paginaAtual = document.getElementById("paginaselecionada").value;
	alert("paginaAtual=="+paginaAtual);
	alert("paginaAtual doc 2 =="+document.getElementById("paginaatual").value);
}

</script>
</head>    

<body onLoad="checkTop()">
<form name="frmSelDados" method="post" action="gerenciadorconteudo_new.jsp" onsubmit="pesquisa()" > 
<!-- form action="" method="post" onSubmit="return pesquisa()"> -->
<input type="hidden" name="idHE" id="idHE" value="">
<input type="hidden" name="id" id="id" value="">
<input type="hidden" name="linguaHE" id="linguaHE" value="">
<input type="hidden" name="paginaatual" id="paginaatual" value=""/>

<table align="center" id="tprincipal" cellpaging="0" cellspacing="0" border="1">
  <tr> 
    <td colspan="7" style="border-bottom: 1px solid #003366;">
       <img src="../img/topo_gerenciadorconteudo2.jpg" width="100%" height="100%">
    </td> 
  </tr>      
  <tr> 
    <td style="padding-left: 10px;padding-top: 4px;"><strong>Campo</strong></td>
    <td style="padding-left: 8px;padding-top: 4px;"><strong>Comparador</strong></td>
    <td style="padding-left: 8px;padding-top: 4px;"><strong>Valor</strong></td>
  	<td style="padding-left: 8px;padding-top: 4px;"><strong>Língua</strong></td>
  	<td colspan="2">&nbsp;</td>
  </tr>
  <tr> 
    <td style="padding-left: 10px;padding-bottom:7px;" >
		<select class="colunaum" id="campo" name="campo">
	        <option value=""></option>
	        <option value="id">Id</option>
	        <option value="titulo">Título</option>
	        <option value="texto">Conteúdo</option>
	        <option value="tipo">Tipo</option>
	        <option value="cdspadrao">Usuário criação</option>
	        <option value="datahoracriacao">D/H criação</option>
	        <option value="alteracao.cdspadrao">Usuário alteração</option>
	        <option value="datahoraultalt">D/H alteração</option>
			<option value=ativo>Ativo</option>
      	</select>
    </td>
    <td style="padding-bottom:7px;" >
    	<select id="operacao" name="operacao" class="colunadois">
	        <option value=""></option>
	        <option value="1">Igual</option>
	        <option value="2">Menor que</option>
	        <option value="3">Menor ou igual que</option>
	        <option value="4">Maior que</option>
	        <option value="5">Maior ou igual que</option>
	        <option value="6">Diferente</option>
	        <option value="7">Que Contenha</option>
	        <option value="8">Que nao Contenha</option>
	        <option value="9">Inicie com</option>
	        <option value="10">Termine com</option>
	     </select>
	</td>
    <td style="padding-bottom:7px;" >
    	<input class="colunatres" type="text" id="valor" name="valor"/>
    </td>
    
    <td style="padding-bottom:7px;">
		<select id="lingua" name="lingua" class="colunadois" onchange="recarregaCombo();">
	        <option value="1">Português</option>
	        <option value="2">Inglês</option>
	        <option value="3">Espanhol</option>
	        <option value="4">Outro</option> 
	    </select>
	</td>
    <td style="padding-bottom:7px;" valign="bottom" >
		<input type="Submit" class="botao2" name="pesquisar" value="Pesquisar" >
     </td>
     <td style="padding-bottom:7px;" valign="bottom">
        <input  type="Submit" class="botao2" name="nova" value="Nova Pesquisa" onClick="novapesquisa()">
	</td>
	<td align="center" style="padding-bottom:7px;" valign="bottom">
<%
	if ( !EntryPoint.isEditor() ){
%>		
		
		<a class="botao2" href="/siteadmin/menu.jsp" style="text-decoration:none;color:#fff;">
				Menu
		</a>
		
<%}else{%>
		<button class="botao2" onclick="window.location.href = '/logout'">Sair</button>
<%}%>
  	</td>
  </tr>
  
		<tr>
			<td colspan="7" style="border-top: 1px solid #003366;border-bottom: 1px solid #003366;" >
				<div id="gridbox" style="height:250px;width:980px;"></div>
			</td>
		</tr>
	<script>
		
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
			
			
			int NUM_REG_PAG = 10;
			
		
			System.out.println("\n1 no if ===");
			if(pagina.equals("")){
				pagina = pagina2;
			}
			if(campo.equals("")){
				campo = campopesq;
			}
			if(operacao.equals("")){
				operacao = operacaopesq;
			}
			if(valor.equals("")){
				valor = valorpesq;
			}
			if(lingua.equals("")){
				lingua = linguapesq;
			}
			
				
			System.out.println("\n1 campo ==="+campo+"\n operacao="+operacao+"\n valor="+valor+"\n lingua="+lingua);
			System.out.println("\n2 campo ==="+campopesq+"\n operacao="+operacaopesq+"\n valor="+valorpesq+"\n lingua="+linguapesq);
			List listaConteudo = gdc.pesquisaConteudo(campo,operacao,valor,lingua,pagina,NUM_REG_PAG);

			
		%>
		mygrid = new dhtmlXGridObject('gridbox');
		mygrid.setImagePath("/scripts/dhtmlx-script/dhtmlxGrid/codebase/imgs/");
		mygrid.setHeader("Id,Título,Tipo,Usuário Criação,Data Criação,Usuário Alteração, Data Alteração, Ativo");
		mygrid.setInitWidths("30,438,60,100,80,100,80,90,14")
		mygrid.setColAlign("left,left,left,left,left,left,left,left")
		mygrid.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro");
		mygrid.setColSorting("str,str,str,str,str,str,str,str")
		mygrid.setSkin("dhx_skyblue")
	   	
		mygrid.init();


		
		
		mygrid.attachEvent("onRowSelect",function(rowId,cellIndex){
			 var valor = mygrid.cells(rowId,0).getValue();
		     document.getElementById("id").value = valor;
		     visualiza(valor);
		     
		 });

		 
		<%
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
					linhaGrid=id+","+titulo+","+tipo+","+usuarioCriacao+","+dataEnt+","+usuarioAlt+","+dataUltAlt+","+chk;
				%> 
					mygrid.addRow(<%=id%>,"<%=linhaGrid%>");
				<%	
								
				}
			}else{
				%>
				alert('Não há registros para a pesquisa realizada!');
				<%	
			}
				int qtdpaginas = 0;
				
				int qtreg = gdc.qtdReg;
				
				//qtdpaginas = qtreg/10;
				
				
				qtdpaginas = (int) Math.round( (qtreg / 10) + 0.5  );
				String pgn = gdc.pagina;
				
				String campo2 = gdc.campo2;
				String operacao2 = gdc.operacao2;
				String valor2 = gdc.valor2;
				String lingua2 = gdc.lingua2;
				
				%>
				
			
			var paginaPresente = document.getElementById("paginaatual").value;
			//document.getElementById("qtdpaginas").value = paginaPresente
	</script>
	
	<!-- imputs para armazenar a pesquisa -->
		<input type="hidden" name="campo2" id="campo2" value="<%=campo2%>"/>
		<input type="hidden" name="operacao2" id="operacao2" value="<%=operacao2%>"/>
		<input type="hidden" name="valor2" id="valor2" value="<%=valor2%>"/>
		<input type="hidden" name="lingua2" id="lingua2" value="<%=lingua2%>"/>
	<!-- fim -->
	
	<tr><td colspan="7">
		<div id="tbnav">
				<!-- quebra do grid -->
			<div id="c1">
				<p><strong>Registros:</strong></p>
			</div>
			<div id="c2">
				<input class="botao" readonly type="text" value="<%=qtreg%>" id="totalpaginas" name="totalpaginas"/>
				<button class="botao" onclick='primeiraPagina()'>&lt;&lt;</button>
				<button class="botao" onclick='anteriorPagina()'>&lt;</button>
				<input class="botao" readonly  type="text" value="<%=pgn%>/<%=qtdpaginas%>" name="qtdpaginas" id="qtdpaginas"/>
				<input type="hidden" name="paginaselecionada" id="paginaselecionada" value="<%=pgn%>"/>
				<input type="hidden" name="totpaginas" id="totpaginas" value="<%=qtdpaginas%>"/>
				<button class="botao" onclick='proximaPagina()'>&gt;</button>
				<button class="botao" onclick='ultimaPagina()'>&gt;&gt;</button>
				<!-- fim -->
<!-- 				<div id="c3">	 -->
					<!-- funcoes -->
					&nbsp;&nbsp;&nbsp;
					<button class="botao2" onclick='doOpenHE(1);novapesquisa();'>Editar</button>
					<button class="botao2" onClick='doOpenHE(2);novapesquisa()'>Incluir</button>
					<button class="botao2" onclick='doOpenHE(3);novapesquisa()'>Duplicar</button>
					<button class="botao2" onClick='deleta(mygrid.getSelectedId());'>Excluir</button>
					<!-- fim -->
<!-- 				</div> -->
			</div>
		</div>
	</td></tr>
		
<!-- 
  <tr> 
    <td colspan="6" style="border-top: 1px solid white;" bgcolor="#FFFFFF"> <span> 
      <iframe id="grid" src="grid.jsp" frameborder="0" width="100%" height="358"></iFrame>
      </span> </td>
  </tr>
  -->
</table>
</form>
<br>
<center><iFrame id="visualizacao" src='' frameborder="0" style="width:976px; height:768px; border: 6px dashed lightgreen;"></iFrame></center>
</body>
</html>