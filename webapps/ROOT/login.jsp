<html>
<head>
<title>Relato Tecnologia :: HTML Editor</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/styles/estilos.css" type="text/css">

<script language="javascript">

function validaForm(obj) {
   
    var bRet = true;
    if (obj.user.value=="") {
        alert ('É necessário preencher o campo \nUsuário!');
        obj.user.focus();
        bRet = false;
    }
    if ((bRet == true) && (obj.pass.value=="")) {
        alert ('É necessário preencher o campo \nSenha !');
        obj.pass.focus();
        bRet = false;
    }
    return (bRet);
}

</script>

<style type="text/css">
* { margin: 0px; }
table.principal {
	border: 1px solid #00125E; 
	
	}
td.coldir {
	border: 0px solid #e7e7e7;
	background-color: #003366;
	padding: 3px 3px 3px 3px;
	text-align: left;
	}
input {
	border: 1px solid white;
	background-color: #3163A0;
	color: white;
	font-family: Verdana, Tahoma, Arial, sans-serif;
	font-size: 10px;
	}
input.botao {
	border: 1px solid white;
	background-color: #3163A0;
	color: white;
	font-weight: bolder;
	font-family: Verdana, Tahoma, Arial, sans-serif;
	font-size: 10px;
	}
input.botaoover {
	border: 1px solid #3163A0;
	background-color: white;
	color: #3163A0;
	font-weight: bolder;
	font-family: Verdana, Tahoma, Arial, sans-serif;
	font-size: 10px;
}
span {
	font-weight: bolder;
	color: white;
	font-size: 10px;
	font-family: Verdana, Tahoma, Arial, sans-serif;
	text-align: left;
	margin-left: 14px;	
	}
span.produto {
	font-weight: bolder;
	color: #003366;
	font-size: 10px;
	font-family: Verdana, Tahoma, Arial, sans-serif;
	text-align: center;	
	}
</style>

<%
if ( request.getParameter("erro") != null ){
%>
<script>
	alert("Usuário e/ou Senha inválidos !!!");
</script>
<%
}
%>
<script>
	function foca(){
		document.getElementById("user").focus();
	}
</script>
</head>

<body onLoad="foca()">
<table border="0" width="100%" height="100%" align="center" valign="middle"><tr><td width="100%" height="100%" align="center" valign="middle">
<table class="principal" border="0" align="center" width="500" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2" style="border-bottom: 1px solid white;"><img src="/img/topo_htmleditor.jpg" width="500" height="67" border="0" usemap="#Map"></td>
  </tr>
  <tr> 
    <td width="357" height="200" align="center" valign="top" bgcolor="#FFFFFF"> 
      <br>
      <span class="produto">Produto licenciado para:<br>
      <br>
      <a href="/"><img src="img/suaempresa3.jpg"border="0"></a> 
      <br>
      <br>
      (Visualiza&ccedil;&atilde;o ideal: 1024 X 768)</span> </td>
    <td width="143" align="center" valign="top" class="coldir"> <img src="/img/login.jpg"> 
      <form name="frmLogin" method="post" action="/login">
        <span>Usuário</span><br>
        <div align="center" style="margin-bottom: 10px;"> 
          <input name="context" id="context" type="hidden" value="htmleditor">
          <input name="user" id="user" type="text" size="20">
        </div>
        <span>Senha</span><br>
        <div align="center"> 
          <input name="pass" type="password" size="20">
          <br>
          <br>
          <input class="botao" type="submit" name="login" value="Entrar" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';">
          <input class="botao" type="reset" name="limpar" value="Limpar" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';">
        </div>
      </form></td>
  </tr>
</table>
</td></tr></table>
<map name="Map">
  <area shape="rect" coords="1,3,100,59" href="http://www.relato.com.br" target="_blank" alt="www.relato.com.br">
</map>
</body>
</html>