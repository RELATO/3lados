<%@page import="java.util.*" %>
<%@page import="br.com.relato.util.SqlHelper" %>
<%@page import="br.com.relato.criteria.SearchCriteria" %>
<%@page import="br.com.relato.criteria.SQLExpression" %>

<html>

<head>

<script>
function doSubmit(){
	var obj = document.getElementById("nome").value;
	if ( obj == "" ){
		alert("Digite o nome!!");
		return false;
	}

	var obj1 = document.getElementById("email").value;
	if ( obj1 == "" ){
		alert("Digite o email!!");
		return false;
	}

	var obj2 = document.getElementById("login").value;
	if ( obj2 == "" ){
		alert("Digite o login!!");
		return false;
	}

	var obj3 = document.getElementById("pass").value;
	if ( obj3 == "" ){
		alert("Digite a senha!!");
		return false;
	}

	return true;
}

</script>

<style type="text/css">
	* { margin: 0px; padding: 0px; font-family: Verdana, verdana, Arial;}
	input { border: 1px solid black; font-family: verdana, Verdana, Arial; }
	td.texto{
		font-size: 12px;
		font-family: Verdana, verdana, Arial, sans-serif;
		color: #000000;
	}
	input.botao {
		border: 1px solid white;
		background-color: #000000;
		color: white;
		font-weight: bolder;
		font-family: Verdana, verdana, Arial, sans-serif;
		font-size: 10px;
		width: 120px;
		height: 20px;
		text-align: center;
		}
	input.botaoover {
		border: 1px solid #000000;
		background-color: white;
		color: #000000;
		font-weight: bolder;
		font-family: Verdana, verdana, Arial, sans-serif;
		font-size: 10px;
		width: 120px;
		height: 20px;
		text-align: center;
		cursor: pointer;
		}
</style>
</head>

<body style="color: #000000; font-size: 10px; font-family: verdana, Verdana, Arial;">
  <table style="border: 1px solid #000000; margin: 5px; margin-top: 10px;" width="770" cellpadding="0" cellspacing="0" bgcolor="#E7E7F7">
    <form name="form1" method="post" action="/extranet/controlusers">
    <tr style="background-color: #000000;"> 
      <td colspan="4" style="border-bottom: 1px solid #000000; padding-bottom: 3px;"><center>
          <strong><font color="#FFFFFF" size="3" face="verdana, verdana, Arial, Helvetica, sans-serif">Gerenciador de Usuários</font></strong>
        </center></td>
    </tr>
	<tr><td style="border: 1px solid #000000 padding: 5px; width: 700px; align: center">
<br>
<table border="0" align="center">
<tr>
	<td class="texto">
		Nome:
	</td>
	<td>
		<input type="text" name="nome" id="nome" maxlength="220" style="width: 300px;">
	</td>
</tr>
<tr>
	<td class="texto">
		Email: 
	</td>
	<td>
		<input type="text" name="email" id="email" maxlength="220" style="width: 300px;">
	</td>
</tr>
<tr>
	<td class="texto">
		Login:
	</td>
	<td>
		<input type="text" name="login" id="login" maxlength="220" style="width: 100px;">
	</td>
</tr>
<tr>
	<td class="texto">
		Senha:
	</td>
	<td>
		<input type="text" name="pass" id="pass" maxlength="220" style="width: 100px;">
	</td>
</tr>
<tr>
	<td class="texto">
		Ativo: 
	</td>
	<td>
		<select id="ativo" name="ativo">
		  <option value=""></option>
		  <option value="0">Não</option>
		  <option value="1">Sim</option>
		</select>		
	</td>
</tr>
<tr>
	<td class="texto">
		Administrador: 
	</td>
	<td>
		<select id="admin" name="admin">
		  <option value=""></option>
		  <option value="0">Não</option>
		  <option value="1">Sim</option>
		</select>		
	</td>
</tr>
<tr>	
	<td class="texto">
		Publicador: 
	</td>
	<td>
		<select id="publicador" name="publicador">
		  <option value=""></option>
		  <option value="0">Não</option>
		  <option value="1">Sim</option>
		</select>		
	</td>
</tr>
<tr>	
	<td class="texto">
		Editor: 
	</td>
	<td>
		<select id="editor" name="editor">
		  <option value=""></option>
		  <option value="0">Não</option>
		  <option value="1">Sim</option>
		</select>		
	</td>
</tr>
</table>

<br>
</td></tr>
<tr><td align="center" height="40" style="border: 1px solid #000000;">
<input type="hidden" name="action" id="action" value="add"> 
<input type="reset" class="botao" onMouseOver="this.className='botaoover'" onMouseOut="this.className='botao'" value=" Novo usuário "> 
<input type="submit" class="botao" onMouseOver="this.className='botaoover'" onMouseOut="this.className='botao'" value=" Incluir ">
<input type="button" class="botao" onMouseOver="this.className='botaoover'" onMouseOut="this.className='botao'" value=" Voltar " onClick="window.location.href='/extranet/users/gerenciadorusers.jsp'">
</td></tr>


</table></form>
</body>

</html>