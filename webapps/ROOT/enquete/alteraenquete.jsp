<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="br.com.relato.criteria.SearchCriteria" %>
<%@page import="br.com.relato.criteria.SQLExpression" %>
 
<%
	SearchCriteria criteria = new SearchCriteria();
	criteria.addField(new String[]{
	
	"idienquetevalor", "cdspergunta", "enquete.idienquete", "resposta", "cdinumeroresposta", 
	"opsativo"," if(cdspergunta2 is not null, cdspergunta2, cdspergunta) ",
	" if(cdspergunta3 is not null, cdspergunta3, cdspergunta) ",
	" if(cdspergunta4 is not null, cdspergunta4, cdspergunta) ",
	" if(resposta2 is not null, resposta2, resposta) ",
	" if(resposta3 is not null, resposta3, resposta) ",
	" if(resposta4 is not null, resposta4, resposta) "
	
	}); 
	criteria.addTable("enquete");
	
	criteria.addInnerJoin("enquetevalor", "enquete", "idienquete");
	
	criteria.addExpression(SQLExpression.SQL_IGUAL, "enquete.idienquete", request.getParameter("enquete"));

	List list = criteria.execute();
	System.out.println("ID === "+request.getParameter("enquete")+" - LISTA == "+list);
	Iterator i = list.iterator();

	String respostas = "";
	String respostas2 = "";
	String respostas3 = "";
	String respostas4 = "";
	String pergunta = "";
	String pergunta2 = "";
	String pergunta3 = "";
	String pergunta4 = "";
	String id = request.getParameter("enquete");
	String idresposta = "";
	String ativo = "";
	
	int numeroresposta = 0;

	while ( i.hasNext() ){
		List row = (List)i.next();
		pergunta = (String)row.get(1);
		pergunta2 = (null!= row.get(6) && !"".equals((String)row.get(6)) ? (String)row.get(6) : "");
		pergunta3 = (null!= row.get(7) && !"".equals((String)row.get(7)) ? (String)row.get(7) : "");
		pergunta4 = (null!= row.get(8) && !"".equals((String)row.get(8)) ? (String)row.get(8) : "");
		id = (String)row.get(2);
		numeroresposta = Integer.parseInt((String)row.get(4));
		ativo = (String)row.get(5);
		if ( i.hasNext() ){
			respostas += (String)row.get(3)+"/";
			idresposta += (String)row.get(0)+"/";
			respostas2 += (null!= row.get(9) && !"".equals((String)row.get(9)) ? (String)row.get(9) : " ")+"/";
			respostas3 += (null!= row.get(10) && !"".equals((String)row.get(10)) ? (String)row.get(10) : " ")+"/";
			respostas4 += (null!= row.get(11) && !"".equals((String)row.get(11)) ? (String)row.get(11) : " ")+"/";
		}else{
			respostas += (String)row.get(3);
			idresposta += (String)row.get(0);
			respostas2 += (null!= row.get(9) && !"".equals((String)row.get(9)) ? (String)row.get(9) : " ");
			respostas3 += (null!= row.get(10) && !"".equals((String)row.get(10)) ? (String)row.get(10) : " ");
			respostas4 += (null!= row.get(11) && !"".equals((String)row.get(11)) ? (String)row.get(11) : " ");
		}
	}
%>
<html>
<head>
<title>Relato Tecnologia :: HTML Editor</title>

<style type="text/css">
	* {margin: 0px; padding: 0px; font-family: Verdana, Tahoma, Arial;}
	body {margin: 5px;}
	.bloco {border: 1px solid white; border-collapse: collapse; margin-top: 5px; margin-bottom: 5px; width: 700px; background-color: #3163A0}
	.pad {padding: 15px 15px 15px 30px;}
	h3 {color: white; text-align: left; padding-left: 15px; display: inline;}
	h4 { font-size: 12px; color: white; text-align: left; padding-left: 15px; display: inline;}
	input.textfield {
		display: block;
		border: 1px solid black;
		text-align: left;
		}
	input.pergunta {
		display: inline;
		border: 1px solid black;
		width: 500px;
		text-align: left;
		padding-left: 2px;
		}
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

<body bgcolor="#003366">
<form name="form1" method="post" action="/controlenquete">
  <table width="980" align="center" cellpadding="0" cellspacing="0" border="0" class="bloco">
  		<tr>
			
      <td colspan="2" align="center" style="border: 1px solid white;"> 
       		<img src="/img/topo_gerenciadorenquete.gif"></td>
    </tr>
		<tr>
			<td width="210" style="padding: 4px;"><h4>Pergunta</h4></td>
			<td width="800"><input class="pergunta" type="text" value="<%=pergunta %>" name="pergunta1" id="pergunta1"></td>
		</tr>
		
		<tr>
			<td width="210" style="padding: 4px;"><h4>Pergunta (Inglês)</h4></td>
			<td width="800"><input class="pergunta" type="text" value="<%=pergunta2 %>" name="pergunta2" id="pergunta2"></td>
		</tr>
		
		<tr>
			<td width="210" style="padding: 4px;"><h4>Pergunta (Espanhol)</h4></td>
			<td width="800"><input class="pergunta" type="text" value="<%=pergunta3 %>" name="pergunta3" id="pergunta3"></td>
		</tr>

		<tr>
			<td width="210" style="padding: 4px;"><h4>Pergunta (Outros)</h4></td>
			<td width="800"><input class="pergunta" type="text" value="<%=pergunta4 %>" name="pergunta4" id="pergunta4"></td>
		</tr>
		
<%
		String[] split = respostas.split("/");
		String[] split2 = respostas2.split("/");
		String[] split3 = respostas3.split("/");
		String[] split4 = respostas4.split("/");
		if( split.length != 0 ){
		
			for ( int i1 = 0; i1 < numeroresposta; i1 ++ ){
	%>
				<tr>
	      			<td height="27" style="padding: 4px;">
						<h4>Resposta <%=i1+1%>: </h4></td>
					<td><input value="<%=split[i1]%>" name="r1x<%=i1+1%>" id="r1x<%=i1+1%>" class="textfield" size="35" type="text"></td>
				</tr>
				
				<tr>
	      			<td height="27" style="padding: 4px;">
						<h4>Resposta (Inglês) <%=i1+1%>: </h4></td>
					<td><input value="<%=split2[i1]%>" name="r2x<%=i1+1%>" id="r2x<%=i1+1%>" class="textfield" size="35" type="text"></td>
				</tr>
				
				<tr>
	      			<td height="27" style="padding: 4px;">
						<h4>Resposta (Espanhol) <%=i1+1%>: </h4></td>
					<td><input value="<%=split3[i1]%>" name="r3x<%=i1+1%>" id="r3x<%=i1+1%>" class="textfield" size="35" type="text"></td>
				</tr>
				
				<tr>
	      			<td height="27" style="padding: 4px;">
						<h4>Resposta (Outros) <%=i1+1%>: </h4></td>
					<td><input value="<%=split4[i1]%>" name="r4x<%=i1+1%>" id="r4x<%=i1+1%>" class="textfield" size="35" type="text"></td>
				</tr>
				
				
	<%
			}
		} 
	%>		
		<tr>
			<td style="padding: 4px;"><h3>Ativa</h3></td>
			<td>
				<select id="ativa" name="ativa">
                  <option value="I">Não</option>
                  <option value="A" <%="A".equals(ativo) ? "selected": ""%>>Sim</option>
                </select>				
			</td>
		</tr>
	<tr>
      <td height="40" colspan="2" align="center" style="border: 1px solid white;">
		<input type="hidden" name="action" id="action" value="">
		<input type="hidden" name="id" id="id" value="<%=id%>"> 
		<input type="hidden" name="idresposta" id="idresposta" value="<%=idresposta%>">
		<input type="hidden" name="respostas" id="respostas" value="<%=numeroresposta %>"> 
        <input type="submit" onClick="document.getElementById('action').value='modify'" class="botao" name="altera" value="Altera" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';">
        <input type="submit" onClick="document.getElementById('action').value='delete'" class="botao" name="exclui" value="Exclui" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';">
		<input type="button" class="botao" onMouseOver="this.className='botaoover'" onMouseOut="this.className='botao'" value=" Voltar " onClick="window.location.href='/enquete/gerenciadorenquete.jsp'">
	</td>
		</tr>
	</table>

</form>

</body>
</html>