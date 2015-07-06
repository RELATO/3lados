<%@page import="br.com.relato.EntryPoint"%>
<%@page import="br.com.relato.Constants"%>

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
</style>
<script>
function reloadPage(){
	pesquisa();
}

window.pesquisa = function(){
	var iframe = document.getElementById("grid");
	iframe.src = "/livrovisitas/grid.jsp";
	return false;
}

window.deleteLivro = function(){
	var i = getId();
	if ( i != "" ){
		var iframe = document.getElementById("grid");
		iframe.src = "/livrovisitas/grid.jsp?";
	}else
		alert("Nenhum registro selecionado!");
}

window.process = function(){
	var iframe = document.getElementById("grid");
	iframe.src = "/livrovisitas/grid.jsp";
}

window.getId = function(){
	return document.getElementById("id").value;
}

window.setId = function(id){
	document.getElementById("id").value = id;
}

</script>

</head>

<body leftmargin="0" rightmargin="0" topmargin="0" bgcolor="#FFFFFF">
<form action="" method="post" onSubmit="return pesquisa()">
<input type="hidden" name="id" id="id" value="">

  <table align="center" style="border: 1px solid #000000; margin: 5px; margin-top: 10px;" width="770" cellpadding="0" cellspacing="0" bgcolor="#EBEADB">
    <tr style="background-color: #000000;"> 
      <td style="border-bottom: 1px solid #000000; padding-bottom: 3px;"><center>
          <strong><font color="#FFFFFF" size="3" face="verdana, verdana, Arial, Helvetica, sans-serif">Controle do livro de visitas</font></strong>
        </center></td>
    </tr>
    <tr> 
      <td style="border-top: 1px solid #000000;" bgcolor="#EBEADB"> 
        <span > 
        <iframe id="grid" src="/livrovisitas/grid.jsp" frameborder="0" width="100%" height="238"></iFrame>
        </span> </td>
    </tr>
  </table>
</form>
<center><input type="button" onclick="window.location.href='/siteadmin/home.jsp'" value="Voltar" style="font-size: 12px;"></center>
</body>

</html>