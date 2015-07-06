<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="br.com.relato.criteria.SearchCriteria" %>
<%@page import="br.com.relato.criteria.SQLExpression" %>

<%
	SearchCriteria criteria = new SearchCriteria();
	criteria.addField(new String[]{"IdiProspect", "NmsCompleto", "CdsEmail",
				"dssendereco", "nmsbairro", "nmscidade", "nmsestado","nmspais", 
				"cdscep", "cdstelefone","nmsempresa","opsativo"});
	criteria.addTable("prospect");
	criteria.addExpression(SQLExpression.SQL_IGUAL, "idiprospect", request.getParameter("id"));

	List list = criteria.execute();
	List row = (List)list.get(0);
%>
<html>
<head>
<title>Extranet</title>

<style type="text/css">
	* {margin: 0px; padding: 0px; font-family: Verdana, Tahoma, Arial;}
	body {margin: 5px;}
	.bloco {border: 1px solid white; border-collapse: collapse; margin-top: 5px; margin-bottom: 5px; width: 700px; background-color: #3163A0}
	.pad {padding: 15px 15px 15px 30px;}
	h3 {color: white; text-align: left; padding-left: 15px; display: inline;}
	h4 { font-size: 12px; color: white; text-align: left; padding-left: 15px; display: inline;}
	input { border: 1px solid black; font-family: verdana, Verdana, Arial; }
	td.texto{
		font-size: 12px;
		font-family: Verdana, verdana, Arial, sans-serif;
		color: #000000;
	}
	input.textfield {
		display: block;
		border: 1px solid black;
		text-align: left;
		}
	input.pergunta {
		display: inline;
		border: 1px solid black;
		width: 550px;
		text-align: left;
		padding-left: 2px;
		}
	input.botao {
		border: 1px solid white;
		background-color: #000000;
		color: white;
		font-weight: bolder;
		font-family: Verdana, Tahoma, Arial, sans-serif;
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
		font-family: Verdana, Tahoma, Arial, sans-serif;
		font-size: 10px;
		width: 120px;
		height: 20px;
		text-align: center;
		cursor: pointer;
	}

</style>

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

</head>

<body style="color: #000000; font-size: 10px; font-family: verdana, Verdana, Arial;">
  <table style="border: 1px solid #000000; margin: 5px; margin-top: 10px;" width="770" cellpadding="0" cellspacing="0" bgcolor="#E7E7F7">
	<form name="form1" method="post" action="/extranet/controlprospects" onsubmit="return doSubmit();">
    <tr style="background-color: #000000;"> 
      <td colspan="4" style="border-bottom: 1px solid #000000; padding-bottom: 3px;"><center>
          <strong><font color="#FFFFFF" size="3" face="verdana, verdana, Arial, Helvetica, sans-serif">Altera prospect</font></strong>
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
				<input type="text" name="nome" id="nome" maxlength="220" style="width: 300px;" value="<%=row.get(1) %>">
			</td>
		</tr>
		<tr>
			<td class="texto">
				Email: 
			</td>
			<td>
				<input type="text" name="email" id="email" maxlength="220" style="width: 300px;" value="<%=row.get(2) %>">
			</td>
		</tr>

		<tr>
			<td class="texto">
				Ativo: 
			</td>
			<td>
				<select id="ativo" name="ativo">
				  <option value=""></option>
                  <option value="N" <%="N".equals(String.valueOf(row.get(11))) ? "selected": ""%>>Não</option>
                  <option value="S" <%="S".equals(String.valueOf(row.get(11))) ? "selected": ""%>>Sim</option>
				</select>		
			</td>
		</tr>
			<tr>
				<td class="texto">
					Endereço:
				</td>
				<td>
					<input type="text" name="endereco" id="endereco" maxlength="220" style="width: 300px;"  value="<%=row.get(3)%>">
				</td>
			</tr>
			<tr>
				<td class="texto">
					Bairro:
				</td>
				<td>
					<input type="text" name="bairro" id="bairro" maxlength="30" style="width: 220px;" value="<%=row.get(4)%>">
				</td>
			</tr>
			<tr>
				<td class="texto">
					Cidade:
				</td>
				<td>
					<input type="text" name="cidade" id="cidade" maxlength="30" style="width: 220px;" value="<%=row.get(5)%>">
				</td>
			</tr>
			<tr>
				<td class="texto">
					Estado:
				</td>
				<td>
					<input type="text" name="estado" id="estado" maxlength="2" style="width: 30px;" value="<%=row.get(6)%>">
				</td>
			</tr>
			<tr>
				<td class="texto">
					País:
				</td>
				<td>
					<input type="text" name="pais" id="pais" maxlength="30" style="width: 180px;" value="<%=row.get(7)%>">
				</td>
			</tr>
			<tr>
				<td class="texto">
					Cep:
				</td>
				<td>
					<input type="text" name="cep" id="cep" maxlength="9" style="width: 100px;" value="<%=row.get(8)%>">
				</td>
			</tr>
			<tr>
				<td class="texto">
					Telefone:
				</td>
				<td>
					<input type="text" name="telefone" id="telefone" maxlength="20" style="width: 150px;" value="<%=row.get(9)%>">
				</td>
			</tr>
			<tr>
				<td class="texto">
					Empresa:
				</td>
				<td>
					<input type="text" name="empresa" id="empresa" maxlength="220" style="width: 300px;" value="<%=row.get(10)%>">
				</td>
			</tr>


		</table>
		<br>
		</td>
	</tr>
	<tr>
      <td height="40" align="center" style="border: 1px solid #000000;">
		<input type="hidden" name="action" id="action" value="">
		<input type="hidden" name="id" id="id" value="<%=request.getParameter("id")%>"> 
        <input type="submit" onClick="document.getElementById('action').value='modify'" class="botao" name="altera" value="Altera" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';">
        <input type="submit" onClick="document.getElementById('action').value='delete'" class="botao" name="exclui" value="Exclui" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';">
		<input type="button" class="botao" onMouseOver="this.className='botaoover'" onMouseOut="this.className='botao'" value=" Voltar " onClick="window.location.href='/extranet/prospects/gerenciador.jsp'">
	</td>
		</tr>
	</table>

</form>

</body>
</html>