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
		background-color: #003366;
		color: white;
		font-weight: bolder;
		font-family: Tahoma, tahoma, Arial, sans-serif;
		font-size: 10px;
		height: 20px;
		width: 120px;
		text-align: center;
		padding: 0px;
		}
.botaoover {
		border: 1px solid #003366;
		background-color: white;
		color: #003366;
		font-weight: bolder;
		font-family: Tahoma, tahoma, Arial, sans-serif;
		font-size: 10px;
		height: 20px;
		width: 120px;
		text-align: center;
		padding: 0px;
		cursor: pointer;
	}
.botaomenu {
	border: 1px solid white;
	background-color: #003366;
	color: white;
	font-weight: bolder;
	font-family: Verdana, Tahoma, Arial, sans-serif;
	font-size: 11px;
	height: 20px;
	width: 100px;
	text-align: center;
	}
.botaoovermenu {
	border: 1px solid #003366;
	background-color: white;
	color: #003366;
	font-weight: bolder;
	font-family: Verdana, Tahoma, Arial, sans-serif;
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
	iframe.src = "/enquete/grid.jsp?action="+document.getElementById("operacao").value+
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
		url = "/enquete/alteraenquete.jsp?enquete=" + getId()
	else
		url = "/enquete/novaenquete.jsp"
	
	window.open(url, "_top");
}

</script>

</head>

<body leftmargin="0" rightmargin="0" topmargin="0" bgcolor="#003366">
<form action="" method="post" onSubmit="return pesquisa()">
<input type="hidden" name="id" id="id" value="">

  <table style="border: 1px solid white; margin: 5px; margin-top: 10px;" align="center" width="980" cellpadding="0" cellspacing="0" bgcolor="#3163A0">
    <tr style="background-color: #3163A0;"> 
      <td colspan="4" style="border-bottom: 1px solid white;"><img src="/img/topo_gerenciadorenquete.gif"></td>
    </tr>
    <tr style="padding-top: 3px;"> 
      <td width="130" style="padding-left: 9px;"><strong><font color="#ffffff" size="-2" face="Tahoma, tahoma, Arial, Helvetica, sans-serif">Campo</font></strong></td>
      <td width="130" style="padding-left: 1px;"><strong><font color="#ffffff" size="-2" face="Tahoma, tahoma, Arial, Helvetica, sans-serif">Comparador</font></strong></td>
      <td width="260" style="padding-left: 1px;"><strong><font color="#ffffff" size="-2" face="Tahoma, tahoma, Arial, Helvetica, sans-serif">Valor</font></strong></td>
      <td width="460" style="border-left: 1px solid white;"><font size="-2">&nbsp;</font></td>
	</tr>
    <tr style="padding-bottom: 5px;"> 
      <td style="padding-left: 8px"><select class="colunaum" id="campo" name="campo">
          <option value=""></option>
          <option value="idienquete">Id</option>
          <option value="cdspergunta">Pergunta</option>
          <option value="opsativo">Status</option>
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
	  <td style="border-left: 1px solid white;" align="center">
		<input type="button" class="botao" name="pesquisar" value="Pesquisar" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onClick="pesquisa();"> 
        <span style="padding-left: 5px;"></span>
		<input type="reset" class="botao" name="nova" value="Nova Pesquisa" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onClick="novapesquisa()">
	  	<span style="padding-left: 5px;"></span>	
		<input type="button" onClick="top.location.href='/siteadmin/home.jsp'" class="botaomenu" name="menu" value="Menu" onMouseOver="this.className='botaoovermenu';" onMouseOut="this.className='botaomenu';">
	  </td>
    </tr>
    
    <tr> 
      <td colspan="4" style="border-top: 1px solid white;" bgcolor="#3163A0"> 
        <span > 
        <iframe id="grid" src="grid.jsp" frameborder="0" width="100%" height="238"></iFrame>
        </span> </td>
    </tr>
  </table>
</form>
</body>

</html>