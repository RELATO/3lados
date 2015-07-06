<%@page import="java.util.*" %>
<%@page import="br.com.relato.util.SqlHelper" %>
<%@page import="br.com.relato.criteria.SearchCriteria" %>
<%@page import="br.com.relato.criteria.SQLExpression" %>

<html>

<head>

<script>
function doSubmit(){
	var obj = document.getElementById("nome");
	if ( obj.value == "" ){
		alert("Digite o nome!!");
		obj.focus();
		return false;
	}

	var obj1 = document.getElementById("email");
	if ( obj1.value == "" ){
		alert("Digite o email!!");
		obj1.focus();
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
    <form name="form1" method="post" action="/extranet/controlprospects" onsubmit="return doSubmit();">
    <tr style="background-color: #000000;"> 
      <td colspan="4" style="border-bottom: 1px solid #000000; padding-bottom: 3px;"><center>
          <strong><font color="#FFFFFF" size="3" face="verdana, verdana, Arial, Helvetica, sans-serif">Novo prospect</font></strong>
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
		Ativo: 
	</td>
	<td>
		<select id="ativo" name="ativo">
		  <option value=""></option>
		  <option value="N">Não</option>
		  <option value="S">Sim</option>
		</select>		
	</td>
</tr>
<tr>
	<td class="texto">
		Endereço:
	</td>
	<td>
		<input type="text" name="endereco" id="endereco" maxlength="220" style="width: 300px;">
	</td>
</tr>
<tr>
	<td class="texto">
		Bairro:
	</td>
	<td>
		<input type="text" name="bairro" id="bairro" maxlength="30" style="width: 220px;">
	</td>
</tr>
<tr>
	<td class="texto">
		Cidade:
	</td>
	<td>
		<input type="text" name="cidade" id="cidade" maxlength="30" style="width: 220px;">
	</td>
</tr>
<tr>
	<td class="texto">
		Estado:
	</td>
	<td>
		<input type="text" name="estado" id="estado" maxlength="2" style="width: 30px;">
	</td>
</tr>
<tr>
	<td class="texto">
		País:
	</td>
	<td>
		<input type="text" name="pais" id="pais" maxlength="30" style="width: 180px;">
	</td>
</tr>
<tr>
	<td class="texto">
		Cep:
	</td>
	<td>
		<input type="text" name="cep" id="cep" maxlength="9" style="width: 100px;">
	</td>
</tr>
<tr>
	<td class="texto">
		Telefone:
	</td>
	<td>
		<input type="text" name="telefone" id="telefone" maxlength="20" style="width: 150px;">
	</td>
</tr>
<tr>
	<td class="texto">
		Empresa:
	</td>
	<td>
		<input type="text" name="empresa" id="empresa" maxlength="220" style="width: 300px;">
	</td>
</tr>
</table>

<br>
</td></tr>
<tr><td align="center" height="40" style="border: 1px solid #000000;">
<input type="hidden" name="action" id="action" value="add"> 
<input type="reset" class="botao" onMouseOver="this.className='botaoover'" onMouseOut="this.className='botao'" value=" Novo usuário "> 
<input type="submit" class="botao" onMouseOver="this.className='botaoover'" onMouseOut="this.className='botao'" value=" Incluir ">
<input type="button" class="botao" onMouseOver="this.className='botaoover'" onMouseOut="this.className='botao'" value=" Voltar " onClick="window.location.href='/extranet/prospects/gerenciador.jsp'">
</td></tr>


</table></form>
</body>

</html>