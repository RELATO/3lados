<html>
<head>
<title>..::Carrinho de Compras::..</title>
<head>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="br.com.relato.ecommerce.*" %>
<%@ page import="br.com.relato.util.Cast" %>
<%@ page contentType="text/html; charset=windows-1252" %>
<%@ page import="java.util.*" %>
<%@ page import="br.com.relato.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.text.MessageFormat"%>

<link rel="stylesheet" href="../css/estilo.css">

<style>
		.subTitulo3
		{
		   font-family: Verdana, "MS Sans Serif";
		   FONT-SIZE: 10pt;
		   FONT-WEIGHT: bold;
		}

		.campotipoproduto
		{
		   font-family: Verdana;
		   FONT-SIZE: 11pt;
		   FONT-WEIGHT: bold;
		   COLOR: #444444; 
		}
		
		input.botao {
			border: 1px solid white;
			background-color: #CE0000;
			color: white;
			font-weight: bolder;
			font-family: Verdana;
			font-size: 10px;
		}
		
		input.botaoover {
			border: 1px solid #CE0000;
			background-color: white;
			color: #CE0000;
			font-weight: bolder;
			font-family: Verdana;
			font-size: 10px;
		}
		
		.campotexto{
		    FONT-FAMILY: Verdana;
		    FONT-SIZE: 8pt;
		}
		
		.campocombo{
		    FONT-FAMILY: Verdana;
		    FONT-SIZE: 8pt;
		    font-weight: bolder;
		}
		
		.campoopcao{
		    FONT-FAMILY: Verdana;
		    FONT-SIZE: 8pt;
		    font-weight: bolder;
		}
		
		
		.textdescricao
		{
		    FONT-FAMILY: Verdana;
		    FONT-SIZE: 8pt;
		    TEXT-TRANSFORM:capitalize;
		}
		
		.textproduto
		{
		    FONT-FAMILY: Verdana;
		    FONT-SIZE: 10pt;
		    FONT-WEIGHT: bolder;
		    TEXT-TRANSFORM:uppercase;
		}
		
		.numberproduto
		{
		    FONT-FAMILY: Verdana;
		    FONT-SIZE: 10pt;
		    FONT-WEIGHT: bolder;
		    TEXT-ALIGN:right;
		}
		
		.style2 {
			font-family: Verdana;
			font-size: 15px;
			font-weight: normal;
			color:#343458;
		}
		
		.tableRowOdd
		{
		    BACKGROUND-COLOR: #FFFFFF;
		}
		.tableRowEven
		{
		    BACKGROUND-COLOR: #F6FAFC;
		}
		
		A:link {text-decoration:none;color:black;}
	    A:visited {text-decoration:none;color:black;}
	    A:active {text-decoration:none;color:black;}
	    A:hover {text-decoration:underline;color:black;}
	     
	</style>
	
	
<script>

	function calculaPrecoTotal(qtiprod, tolgeral){
		var valor = 0;
		if(qtiprod == 0){
			tolgeral.value = 0;
		}else{
			for(var x=1;x<=qtiprod;x++){
				var obj = document.getElementById(("vldtotal"+x.toString()));
				valor += parseFloat(trocaVirgulaPonto(obj.value));
			}
			tolgeral.value= formataVirgula(trocaPontoVirgula(valor));
		}
	}

	function calculaPrecoObj(qt,vl,vt){
		var qtde = parseInt(qt.value);
		var vlunit = parseFloat(trocaVirgulaPonto(vl.value));
		var tot = qtde*vlunit;
		vt.value = formataVirgula(trocaPontoVirgula(tot));
	}
	
	
	function chamaDetalhe(id){
		window.open('detalheproduto.jsp?idiproduto='+id.value,'_blank','');
	}
	
	function formataVirgula(numero){
		var number = numero.toString();
		if(number.indexOf(",") == -1){
			number += ",00";
		}else{
			var dig = number.substring((number.indexOf(",")+1),number.length);
			if(dig.length==1){
				dig = dig+"0";
				number = number.substring(0,(number.indexOf(",")));
				number = number+","+dig;
			}
		}
		return(number);
	}
	
	
	function trocaVirgulaPonto(fonte){
		var obj = fonte.toString();
		nLen = obj.length;
		var temp = "";
	  	if ( nLen > 0 ){
	  	   	for(ix=0;ix<=nLen-1;ix++){
	    		if(ix==0){
	    			while (obj.charAt(ix) == "0"){
	    				ix++;
	    			}
	    		}
	      		if (obj.charAt(ix) == ","){
	      			temp += ".";      		
	      		}else if(obj.charAt(ix) == "."){
	      			temp += "";
	      		}
	      		else{
	      			temp += obj.charAt(ix);
	      		}
	      	}
		}
		return(temp);
	}
	
	function voltaX(){
		 form.send_to_url.value="listadeprodutos.jsp";
       	 form.action="atualizarCarrinho.jsp";
        	form.submit();	
	}
	
	function trocaPontoVirgula(fonte){
		var obj = fonte.toString();
		nLen = obj.length;
		var temp = "";
	  	if ( nLen > 0 ){
	  	   	for(ix=0;ix<=nLen-1;ix++){
	    		if(ix==0){
	    			while (obj.charAt(ix) == "0"){
	    				ix++;
	    			}
	    		}
	      		if (obj.charAt(ix) == ","){
	      			temp += "";      		
	      		}else if(obj.charAt(ix) == "."){
	      			temp += ",";
	      		}
	      		else{
	      			temp += obj.charAt(ix);
	      		}
	      	}
		}
		return(temp);
	}
	
	
</script>

<jsp:useBean id="cesta" scope="session" class="br.com.relato.ecommerce.Cesta"/>

<script language="JavaScript" src="../include/ecommerce.js"></script>

</head>
<body>


<%

List lstprodutos = cesta.getItens();

String send_to_url = "/ecommerce/loginCliente.jsp";
if(-1 != cesta.getIdicliente()){
	send_to_url = "/ecommerce/confirmarPedido1.jsp";
}
%>
<%!
String cClasse = "tableRowEven" ;
Locale pt_BR = new Locale("pt", "BR");
NumberFormat df = NumberFormat.getCurrencyInstance(pt_BR);
NumberFormat dfn = NumberFormat.getNumberInstance(pt_BR);
DateFormat df1 = DateFormat.getDateInstance(DateFormat.MEDIUM, new Locale("en", "US"));   
DateFormat df2 = DateFormat.getDateInstance(DateFormat.MEDIUM, pt_BR );

BigDecimal varTotal = new BigDecimal(0);


private String formataValor( double value ) {
	String valor = df.format(Cast.toBigDecimal(value).setScale(2,BigDecimal.ROUND_HALF_EVEN));
	return valor.replaceAll("R\\$ ", "");
}

private String formataValor( Object value ) {
	String valor = df.format(Cast.toBigDecimal(value).setScale(2,BigDecimal.ROUND_HALF_EVEN));
	return valor.replaceAll("R\\$ ", "");
}

private String formataValor( BigDecimal value ) {
	String valor = df.format(Cast.toBigDecimal(value).setScale(2,BigDecimal.ROUND_HALF_EVEN));
	return valor.replaceAll("R\\$ ", "");
}
%>

<form action="confirmarPedido1.jsp" method="post" id="carrinho" name="carrinho">
	
	<input type="hidden" id="send_to_url" name="send_to_url" value="<%=send_to_url%>">
	
	
	<table valign="top" width="100%" id="table_top" background="../imgkana/bgrelato.jpg" cellspacing="0" cellpadding="0" border="0" bordercolor="#000000" style="background-repeat: no-repeat;">
			<tr>
				<td valign="middle" align="left" width="50%" style="padding-left: 0px; padding-top: 15px; padding-bottom: 5px; top: 0px;">
				<a href="http://www.safetyeyes.com.br/"TARGET="_blanck"><img src="../img/se.gif" align="left" border="0"></a>
				</td>
				<td valign="middle" align="left" width="50%" style="padding-left: 0px; padding-right: 20px; top: 0px;">
					<A href="/index.jsp?conteudo=1"><img src="../img/logogif.gif" align="right" border="0"></a>
				</td>
			</tr>	
	</table> 
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<br>
		<tr>
			<td height="25" colspan="6" bgcolor="D4DEE8" border="0" style="background-repeat: no-repeat;">
	    		<div class="textproduto" align="center"><font color="#000000"><b> CARRINHO<b></font></div>
			</td>
		</tr>			
		
		<tr border="2">
			<td width="20%">&nbsp</td>
			<td width="20%" align="left"><div class="textproduto">PRODUTO</div></td>
			<td width="20%" ><div class="textproduto">QUANTIDADE</div></td>
			<td Width="20%"><div class="textproduto">VALOR UNITARIO</div></td>
			<td width="20%" height="1%" border="0"><div class="textproduto">VALOR TOTAL</div></td>
			<td width="20%">&nbsp</td>
		</tr>
<%
	
	BigDecimal varTotal1 = new BigDecimal(0);
	int cont = 1;
	int qtiprodutos = lstprodutos.size();
	boolean DEBUG = false;
	varTotal = new BigDecimal(0);
	if(lstprodutos.size()>0){
		Iterator it = lstprodutos.iterator();
		varTotal = new BigDecimal(0);
		while(it.hasNext()){
			ItemPedido ip = (ItemPedido) it.next();
			Produto p = ip.getProduto();
			
			varTotal = varTotal.add(Cast.toBigDecimal(ip.getVldtotal()));
			
			//varTotal1 = varTotal1.add(Cast.toBigDecimal(ip.getVldtotal()));
			//System.out.println("vltot ==="+varTotal1);
%>
		
		<input type="hidden" id="idproduto<%=cont%>" name="idproduto<%=cont%>" value="<%=p.getIdiproduto()%>">
		
		
		
		<tr class = "<%=cClasse%>">
			<td>
				<table border="0" bordercolor="green" align="center">
					<tr>
						<td>
						<% 
						if(!"".equals(p.getNmsimagem())){
						%>	
							<img src="imagens/<%=p.getNmsimagem()%>" width="113px" height="113px"> 
						<% 								
						}else{
						%>
							<img src="imagens/semcadastro.JPG" width="113px" height="113px">
						<% 	
						}
						%>								
						</td>
					</tr>
				</table>
			</td>
			<td>
				<div class="textdescricao"><%=p.getNmscompleto()%></div>
			</td>
			<td>
				<table border="0" >
					<tr>
						<td>
							<input id="qtde_carrinho<%=cont%>" type="text" name="qtde_carrinho<%=cont%>" value="<%=ip.getQtidesejada()%>" size="2" class="numberproduto" maxlength="2">
						</td>
						<td valign="center">
							<table>
								<tr>
									<td>
									<a href="javascript:alteraQtdeObj(document.carrinho.qtde_carrinho<%=cont%>,'0');calculaPrecoObj(document.carrinho.qtde_carrinho<%=cont%>,document.carrinho.vldunitario<%=cont%>,document.carrinho.vldtotal<%=cont%>);calculaPrecoTotal(<%=qtiprodutos%>,document.carrinho.totalgeral);">
										<img src="../img/ecommerce/maior.gif" width="9" height="6" border="0">
									</a>
									</td>
								</tr>
								<tr>
									<td>
									<a href="javascript:alteraQtdeObj(document.carrinho.qtde_carrinho<%=cont%>,'1');calculaPrecoObj(document.carrinho.qtde_carrinho<%=cont%>,document.carrinho.vldunitario<%=cont%>,document.carrinho.vldtotal<%=cont%>);calculaPrecoTotal(<%=qtiprodutos%>,document.carrinho.totalgeral);">
										<img src="../img/ecommerce/menor.gif" width="9" height="6" border="0">
									</a>
									</td>
								</tr>
							</table>	
						</td>
					</tr>
				</table>
			</td>
			<td>
				<input id="vldunitario<%=cont%>" type="text" name="vldunitario<%=cont%>" value="<%=formataValor(p.getVldvenda())%>" size="15" class="numberproduto" readonly>
			</td>
			<td>
				<input id="vldtotal<%=cont%>" type="text" name="vldtotal<%=cont%>" value="<%=formataValor(ip.getVldtotal())%>" size="15" class="numberproduto" readonly><!--  -->
			</td>
			<% 
					if(!"null".equals(p.getNmscompleto())){
			%>
			<td>
			<a href="http://www.relato.com.br/ecommerce/listapromocao.jsp"></a>
				<img src="../img/oX.bmp" width="30" height="30" border="0" title="Exclui o Item" style="cursor: pointer;" id="remover" name="remover" value="Remover" onclick="excluirItemForm(<%=cont%>,document.carrinho);">
			</td>
			<% 
					}else{
			%>
			
		 	<script>
		 		 voltaX();
		 	</script>
		
			<%
					}
			%>
		</tr>
		
	
<%			
			if (cClasse.equals("tableRowOdd")) 
				cClasse = "tableRowEven"; 
			else 
				cClasse = "tableRowOdd";
			cont++;
		}
		cClasse = "tableRowEven";
		
	}
	
	
%>
	
		
			<tr>
				<td width="5">&nbsp</td>
				<td width="5">&nbsp</td>
				<td width="10" colspan=2>&nbsp</td>
				<td width="40" align="right" ><div class="textproduto">VALOR TOTAL</div></td>
				<td width="10" align="left">
					<input id="totalgeral" type="text" name="totalgeral" value="<%=formataValor(varTotal)%>" size="15" class="numberproduto" readonly>
				</td>
				<td width="10">&nbsp</td>
			</tr>
			
	</table>
	
	<table width="100%" border="0">
		<tr>
			<form id="frmlogin" name="frmlogin" action="loginCliente.jsp">
				<td colspan="6" align="center">		
					<input type="submit" id="login" name="login" value="Login" class="botao" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" >
				</td>
			</form>
		</tr>

		<tr>
			<form id="frmlista" name="frmlista" action="listadeprodutos.jsp">
				<td colspan="6" align="center">
				 	<input type="submit" id="volta" name="volta" value="Continuar Comprando" class="botao" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" >
				</td>
			</form>
		</tr>
		
		<tr>
			<form id="frmlimpa" name="frmlimpa" action="listadeprodutos.jsp">
				<input type="hidden" id="send_to_url" name="send_to_url" value="carrinho.jsp">
				<td colspan="6" align="center">
				 	<input type="submit" id="limpar" name="limpar" value="Limpar Carrinho" class="botao" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onclick="limpaCarrinho(<%=cont%>,document.frmlimpa);calculaPrecoTotal(<%=qtiprodutos%>,document.carrinho.totalgeral);">
				</td>
			</form>
		</tr>
		
		<tr>
			
			<td colspan="6" align="center">
			<%
				session.setAttribute("opcao","S");
			%>
				<input type="button" id="continuar" name="continuar" value="Confimar Compra" class="botao" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onclick="document.carrinho.submit();"> 
				
			</td>
		
		</tr>
		
	</table>
</form>	
</body>
</html>