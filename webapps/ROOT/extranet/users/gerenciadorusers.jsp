<%@page import="br.com.relato.EntryPoint"%>
<html>

<head>
<style type="text/css">
	* {margin: 0px;}
	.colunaum{ font-size: 10px; width: 120px;}
	.colunadois{ font-size: 10px; width: 120px;}
	.colunatres{ font-size: 10px; width: 180px;}
.botao {
		border: 1px solid white;
		background-color: #000000;
		color: white;
		font-weight: bolder;
		font-family: verdana, verdana, Arial, sans-serif;
		font-size: 10px;
		height: 20px;
		width: 120px;
		text-align: center;
		padding: 0px;
		}
.botaoover {
		border: 1px solid #000000;
		background-color: white;
		color: #000000;
		font-weight: bolder;
		font-family: verdana, verdana, Arial, sans-serif;
		font-size: 10px;
		height: 20px;
		width: 120px;
		text-align: center;
		padding: 0px;
		cursor: pointer;
	}
.botaomenu {
	border: 1px solid white;
	background-color: #000000;
	color: white;
	font-weight: bolder;
	font-family: Verdana, verdana, Arial, sans-serif;
	font-size: 11px;
	height: 20px;
	width: 100px;
	text-align: center;
	}
.botaoovermenu {
	border: 1px solid #000000;
	background-color: white;
	color: #000000;
	font-weight: bolder;
	font-family: Verdana, verdana, Arial, sans-serif;
	font-size: 11px;
	height: 20px;
	width: 100px;
	text-align: center;
	cursor: pointer;
	}
</style>
<script>
function reloadPage(){
	pesquisa();
}

window.pesquisa = function(){
	var iframe = document.getElementById("grid");
	iframe.src = "/extranet/users/grid.jsp?action="+document.getElementById("operacao").value+
			"&value="+document.getElementById("valor").value+
			"&field="+document.getElementById("campo").value;
	return false;
}

window.novapesquisa = function(){
	var iframe = document.getElementById("grid");
	iframe.src = "";
}

window.getId = function(){
	return document.getElementById("id").value;
}

window.setId = function(id){
	document.getElementById("id").value = id;
}

function doOpen(action){
	if ( action != 2 && document.getElementById("id").value == ""){
		alert("Selecione um registro primeiro!");
		return;
	}
	var url = "";
	
	if (action == 1)
		url = "/extranet/users/alterausuario.jsp?id=" + getId()
	else
		url = "/extranet/users/novousuario.jsp"
	
	window.open(url, "body");
}

</script>

</head>

<body leftmargin="0" rightmargin="0" topmargin="0">
<form action="" method="post" onSubmit="return pesquisa()">
<input type="hidden" name="id" id="id" value="">

  <table style="border: 1px solid #000000; margin: 5px; margin-top: 10px;" width="770" cellpadding="0" cellspacing="0" bgcolor="#EBEADB">
    <tr style="background-color: #000000;"> 
      <td colspan="4" style="border-bottom: 1px solid #000000; padding-bottom: 3px;"><center>
          <strong><font color="#FFFFFF" size="3" face="verdana, verdana, Arial, Helvetica, sans-serif">Gerenciador de Usuários</font></strong>
        </center></td>
    </tr>
    <tr style="padding-top: 3px;"> 
      <td width="130" style="padding-left: 9px;"><strong><font color="#000000" size="-2" face="verdana, verdana, Arial, Helvetica, sans-serif">Campo</font></strong></td>
      <td width="130" style="padding-left: 1px;"><strong><font color="#000000" size="-2" face="verdana, verdana, Arial, Helvetica, sans-serif">Comparador</font></strong></td>
      <td width="210" style="padding-left: 1px;"><strong><font color="#000000" size="-2" face="verdana, verdana, Arial, Helvetica, sans-serif">Valor</font></strong></td>
      <td width="300" style="border-left: 1px solid #000000;"><font size="-2"></font></td>
	</tr>
    <tr style="padding-bottom: 5px;"> 
      <td style="padding-left: 8px"><select class="colunaum" id="campo" name="campo">
          <option value=""></option>
          <option value="idiusuario">Id</option>
          <option value="nmscompleto">Nome</option>
          <option value="cdsemail">Email</option>
          <option value="cdssenha">Senha</option>
          <option value="opsativo">Ativo</option>
          <option value="opsadministrador">Admin</option>
          <option value="opspublicador">Publicador</option>
          <option value="opseditor">Editor</option>
        </select></td>
      <td style="padding-left: 0px;"><select id="operacao" name="operacao" class="colunadois">
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
      <td><input class="colunatres" type="text" id="valor" name="valor"></td>
	  <td width="300" style="border-left: 1px solid #000000;" align="center">
		<input type="button" class="botao" name="pesquisar" value="Pesquisar" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onClick="pesquisa();"> 
        <span style="padding-left: 12px;"></span>
		<input type="reset" class="botao" name="nova" value="Nova Pesquisa" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onClick="novapesquisa()">
	  </td>
    </tr>
    
    <tr> 
    <tr> 
      <td colspan="4" style="border-top: 1px solid #000000;" bgcolor="#EBEADB"> 
        <span > 
        <iframe id="grid" src="/extranet/users/grid.jsp" frameborder="0" width="100%" height="238"></iFrame>
        </span> </td>
    </tr>
  </table>
</form>
</body>

</html>