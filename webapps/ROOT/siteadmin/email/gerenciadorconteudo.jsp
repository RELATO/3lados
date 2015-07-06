
<html>

<head>
<style type="text/css">
	.colunaum{ font-size: 10px; width: 120px;}
	.colunadois{ font-size: 10px; width: 120px;}
	.colunatres{ font-size: 10px; width: 180px;}
	input.botao {
	border: 1px solid white;
	background-color: #003366;
	color: white;
	font-weight: bolder;
	font-family: Verdana, Tahoma, Arial, sans-serif;
	font-size: 10px;
	height: 20px;
	width: 100px;
	text-align: center;
	}
input.botaoover {
	border: 1px solid #003366;
	background-color: white;
	color: #003366;
	font-weight: bolder;
	font-family: Verdana, Tahoma, Arial, sans-serif;
	font-size: 10px;
	height: 20px;
	width: 100px;
	text-align: center;
	cursor: pointer;
}
</style>
<script>
function visualiza(id){
	var iframe = document.getElementById("visualizacao");
	iframe.src = "/index.jsp?conteudo="+id+"&gerenciador=true";
}

function reloadPage(){
	window.focus();
	var idConteudo = window.top.frames.top2.getLocation();
	pesquisa();
	visualiza(idConteudo);
}

window.pesquisa = function(){
	var iframe = document.getElementById("grid");
	iframe.src = "grid.jsp?action="+document.getElementById("operacao").value+
			"&value="+document.getElementById("valor").value+
			"&field="+document.getElementById("campo").value;
	return false;
}

window.novapesquisa = function(){
	var iframe = document.getElementById("grid");
	iframe.src = "";
}

window.openFrame = function(id){
	document.getElementById("id").value = id;
	document.getElementById("idHE").value = id;
	visualiza(id);
}

function deleta(){
	var id = document.getElementById("id").value;
	if ( id != null && id.length != 0 ){
		if ( !confirm("Deseja excluir o registro selecionado?") )
			return;

		var iframe = document.getElementById("grid");
		iframe.src = "grid.jsp?delete=true&id="+id;
		document.getElementById("visualizacao").src = '';
	}else
		alert("Selecione um registro primeiro!!");
}

function checkTop(){
	var top2 = window.top.frames.top2;
	if ( top2 == null )
		window.location.href = "/siteadmin/home.jsp";
}

function doOpenHE(action){
	if ( action == 1 && document.getElementById("id").value == ""){
		alert("Selecione um registro primeiro!");
		return;
	}

	var id = window.top.frames.top2.document.getElementById("id");
	id.value = document.getElementById("id").value;
	var idHE = window.top.frames.top2.document.getElementById("idHE");
	idHE.value = document.getElementById("idHE").value;
	window.top.frames.top2.doOpenHE(action);	
}

window.gotoMenu = function(){
	window.location.href = "/siteadmin/menu.jsp";
}
</script>

</head>

<body bgcolor="#003366" onLoad="checkTop()">
<form action="" method="post" onSubmit="return pesquisa()">
<input type="hidden" name="idHE" id="idHE" value="">
<input type="hidden" name="id" id="id" value="">

<table align="center" style="border: 1px solid; margin-bottom: 15px;" width="980" cellpadding="0" cellspacing="0" bgcolor="#3163A0">
  <tr style="height: 65px;"> 
    <td colspan="5" style="border-bottom: 1px solid white; height: 60px;"><center>
        <img src="/img/topo_gerenciadorconteudo.jpg" width="500" height="67" align="top"> </center></td>
  </tr>
  <tr> 
    <td width="130" style="padding-left: 10px;"><strong><font color="#FFFFFF" size="-2" face="Verdana, Arial, Helvetica, sans-serif">Campo</font></strong></td>
    <td width="130" style="padding-left: 8px;"><strong><font color="#FFFFFF" size="-2" face="Verdana, Arial, Helvetica, sans-serif">Comparador</font></strong></td>
    <td width="188" style="padding-left: 8px;"><strong><font color="#FFFFFF" size="-2" face="Verdana, Arial, Helvetica, sans-serif">Valor</font></strong></td>
  	<td width="262"></td>
	<td width="268" style="padding-left: 8px; border-left: 1px solid white;"><strong><font color="#FFFFFF" size="-2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;</font></strong></td>
    </tr>
  <tr style="padding-bottom: 5px;"> 
    <td style="padding-left: 10px;"><select class="colunaum" id="campo" name="campo">
        <option value=""></option>
        <option value="id">Id</option>
        <option value="titulo">Título</option>
        <option value="texto">Conteúdo</option>
        <option value="tipo">Tipo</option>
        <option value="criacao.cdspadrao">Usuário criação</option>
        <option value="datahoracriacao">D/H criação</option>
        <option value="alteracao.cdspadrao">Usuário alteração</option>
        <option value="datahoraultalt">D/H alteração</option>
        <option value=replicacao>Replicação</option>
      </select></td>
    <td style="padding-left: 8px;"><select id="operacao" name="operacao" class="colunadois">
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
      </select></td>
    <td style="padding-left: 8px;"><input class="colunatres" type="text" id="valor" name="valor"></td>
	<td style="padding-left: 10px; padding-right: 10px;">
		<input type="button" class="botao" name="pesquisar" value="Pesquisar" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onClick="pesquisa();">
      <span style="padding-left: 10px;">&nbsp;</span> 
        <input type="reset" class="botao" name="nova" value="Nova Pesquisa" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onClick="novapesquisa()">
	</td>
	<td style="border-left: 1px solid white;" align="center">
	<input type="button" class="botao" name="incluir" value="Incluir" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onClick="doOpenHE(2)">
	<span style="padding-left: 7px;">&nbsp;</span> 
	<input type="button" class="botao" name="excluir" value="Excluir" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onClick="deleta()"></td>
  </tr>
  <tr> 
    <td colspan="5" style="border-top: 1px solid white;" bgcolor="#3163A0"> <span> 
      <iframe id="grid" src="grid.jsp" frameborder="0" width="100%" height="238"></iFrame>
      </span> </td>
  </tr>
</table>
</form>
<center><iFrame id="visualizacao" src='' frameborder="0" style="width:968px; height:768px; border: 6px dashed lightgreen;"></iFrame></center>
</body>

</html>