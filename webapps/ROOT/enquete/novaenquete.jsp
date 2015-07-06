<%@page import="java.util.*" %>
<%@page import="br.com.relato.util.SqlHelper" %>
<%@page import="br.com.relato.criteria.SearchCriteria" %>
<%@page import="br.com.relato.criteria.SQLExpression" %>
 
<html>

<head>

<script>
function gerar(){
	var obj = document.getElementById("resp");
	var r = "";
	var lingua = "Português";
	if ( enquete.respostas.value != "" ){
		var count = parseInt(enquete.respostas.value);
		r += "<span id=\"resp\">"
		for ( var x = 1; x <= 4; x ++ ){
			if(x == 2){
				lingua = "(Inglês)";
			}else if(x == 3){
				lingua = "(Espanhol)";
			}else if(x == 4){
				lingua = "(Outros)";
			}else{
				lingua = "(Português)";
			}
			for ( var i = 1; i <= count; i ++ ){
					r += "Resposta " + i +" "+lingua+": <input type=\"text\" name=\"r"+x+"x"+i+"\" align=\"right\" size=\"35\" maxlength=\"35\"><br>"
			}
		}
		r += "</span>"
		obj.innerHTML = r;
	}else{
		alert("Digite um número de respostas!!");
	}
}

</script>

<style type="text/css">
	* { margin: 0px; padding: 0px; font-family: Verdana, Tahoma, Arial;}
	input { border: 1px solid black; font-family: Tahoma, Verdana, Arial; }
	input.botao {
		border: 1px solid white;
		background-color: #003366;
		color: white;
		font-weight: bolder;
		font-family: Verdana, Tahoma, Arial, sans-serif;
		font-size: 10px;
		width: 120px;
		height: 20px;
		text-align: center;
		}
	input.botaoover {
		border: 1px solid #003366;
		background-color: white;
		color: #003366;
		font-weight: bolder;
		font-family: Verdana, Tahoma, Arial, sans-serif;
		font-size: 10px;
		width: 120px;
		height: 20px;
		text-align: center;
		cursor: pointer;
		}
</style>
</head>

<body bgcolor="#003366" style="color: white; font-size: 12px; font-family: Tahoma, Verdana, Arial;">
<form name="enquete" action="/controlenquete" method="post">
<table align="center" width="980" style="margin-top: 15px; border: 1px solid white; background-color: #3163A0; border-collapse: collapse;">
	<tr>
      <td align="center"><img src="/img/topo_gerenciadorenquete.gif"></td>
    </tr>
	<tr><td style="border: 1px solid white; background-color: #3163A0; padding: 5px; width: 700px; align: center">
	Pergunta (Português): <input type="text" name="pergunta" id="pergunta" maxlength="220" style="width: 300px;">
	</tr>
	<tr><td style="border: 1px solid white; background-color: #3163A0; padding: 5px; width: 700px; align: center">
	Pergunta (Inglês): <input type="text" name="pergunta2" id="pergunta2" maxlength="220" style="width: 300px;">
	</tr>
	<tr><td style="border: 1px solid white; background-color: #3163A0; padding: 5px; width: 700px; align: center">
	Pergunta (Espanhol): <input type="text" name="pergunta3" id="pergunta3" maxlength="220" style="width: 300px;">
	</tr>
	<tr><td style="border: 1px solid white; background-color: #3163A0; padding: 5px; width: 700px; align: center">
	Pergunta (Outros): <input type="text" name="pergunta4" id="pergunta4" maxlength="220" style="width: 300px;">
	
	<br>
	<br>
	
<span id="numeroresposta">Número de respostas: <input type="text" name="respostas" id="respostas" size="2"> até 3 respostas.</span>
<br>
<input type="button" id="botaoresposta" class="botao" onMouseOver="this.className='botaoover'" onMouseOut="this.className='botao'" value=" Gerar respostas " onClick="gerar()">
<br>
<br>

<span id="resp">


</span>

<br>Ativa
<select id="ativa" name="ativa">
  <option value="I">Não</option>
  <option value="A">Sim</option>
</select>		
<br><br>
</td></tr>
<tr><td align="center" height="40">
<input type="hidden" name="action" id="action" value="add"> 
<input type="reset" class="botao" onMouseOver="this.className='botaoover'" onMouseOut="this.className='botao'" value=" Nova enquete "> 
<input type="submit" class="botao" onMouseOver="this.className='botaoover'" onMouseOut="this.className='botao'" value=" Incluir ">
<input type="button" class="botao" onMouseOver="this.className='botaoover'" onMouseOut="this.className='botao'" value=" Voltar " onClick="window.location.href='/enquete/gerenciadorenquete.jsp'">
</td></tr>


</table></form>
</body>

</html>