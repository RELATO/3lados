<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=windows-1252" %>
<%@ page import="java.util.*" %>
<%@ page import="br.com.relato.ecommerce.*" %>
<%@ page import="br.com.relato.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.text.MessageFormat"%>

<script language="JavaScript" src="/scripts/funcoes.js"></script>
<script language="JavaScript" src="/scripts/util.js"></script>
<script language="JavaScript" src="/scripts/util2.js"></script>
<script language="JavaScript" src="../include/ecommerce.js"></script>

<jsp:useBean id="produto" scope="request" class="br.com.relato.ecommerce.Produto"/>
<jsp:useBean id="cesta" scope="session" class="br.com.relato.ecommerce.Cesta"/>

<html>

<head>
	<title>..::Lista de Produtos::..</title>
	<style>
		.subTitulo3
		{
		   font-family: Arial,Tahoma, Verdana, "MS Sans Serif";
		   FONT-SIZE: 11pt;
		   FONT-WEIGHT: bold;
		}

		.campotipoproduto
		{
		   font-family: Arial,Tahoma, Verdana, "MS Sans Serif";
		   FONT-SIZE: 11pt;
		   FONT-WEIGHT: bold;
		   COLOR: #444444; 
		}
		
		input.botao {
			border: 1px solid white;
			background-color: #CE0000;
			color: white;
			font-weight: bolder;
			font-family: Verdana, Tahoma, Arial, sans-serif;
			font-size: 10px;
		}
		
		input.botaoover {
			border: 1px solid #CE0000;
			background-color: white;
			color: #CE0000;
			font-weight: bolder;
			font-family: Verdana, Tahoma, Arial, sans-serif;
			font-size: 10px;
		}
		
		.campotexto{
		    FONT-FAMILY: Tahoma;
		    FONT-SIZE: 8pt;
		}
		
		.campocombo{
		    FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif;
		    FONT-SIZE: 8pt;
		    font-weight: bolder;
		}
		
		.campoopcao{
		    FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif;
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
		
		A:link {text-decoration:none;color:black;}
	    A:visited {text-decoration:none;color:black;}
	    A:active {text-decoration:none;color:black;}
	    A:hover {text-decoration:underline;color:black;}
	     
	</style>

</head>

<body>
	
<script>

	//window.moveTo(0,0);
	//window.resizeTo(screen.availWidth,screen.availHeight);
	
	function validaSubmit(form){
		if(form.qtdproduto.value < 1){
			alert('Favor colocar quantidade no produto para compra!');
			return false;
		}
		return true;
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
	
	
	
	function soNumeros( obj ){
		var cValor = obj.value;
	  	bRetVal = false;
	  	bVirg = false;  
	  	nLen = cValor.length;
	  	if ( nLen > 0 ){
	    	for(ix=0;ix<=nLen-1;ix++){
	      		cDig = cValor.charAt(ix)
	      		if (((cDig >= "0") && (cDig <= "9")) || (cDig == ".")){
	        		bRetVal = true      
	      		} else {
	      		  	if (cDig == ','){
	          			if (bVirg == true){
	            			bRetVal = false
	            			break
	          			} else  {
				            bVirg = true
	          			}
	        		} else {
	          			bRetVal = false
	          			break
	          		}
	          	}
	   		}  
	  	} else {
	  		bRetVal = true;
	  	}
	  		
	  	if (!bRetVal) {
	  		obj.focus();
	  		alert("Valor inválido");
	  	}		
	  	return bRetVal
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
	
</script>

<%!
Locale pt_BR = new Locale("pt", "BR");
NumberFormat df = NumberFormat.getCurrencyInstance(pt_BR);
NumberFormat dfn = NumberFormat.getNumberInstance(pt_BR);
DateFormat df1 = DateFormat.getDateInstance(DateFormat.MEDIUM, new Locale("en", "US"));   
DateFormat df2 = DateFormat.getDateInstance(DateFormat.MEDIUM, pt_BR );

String dateformat(String date){
	Date data = Cast.toDate(date);
	if (date != null)
		return df2.format(date);
	return "";
}
String dateformat(Date date){
	if (date != null)
		return df2.format(date);
	return "";
}
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


<%
String tipoproduto = (null != request.getParameter("tipoproduto")?request.getParameter("tipoproduto"):"");
String nomeproduto = (null != request.getParameter("nomeproduto")?request.getParameter("nomeproduto"):"");
String pesquisar = (null != request.getParameter("pesquisar")?request.getParameter("pesquisar"):"S");
String ordenar = (null != request.getParameter("ordenar") && (!"".equals(request.getParameter("ordenar"))) ?request.getParameter("ordenar"):"2,8");

%>

	<table valign="top" border="0" width="100%" id="table_top" cellspacing="0" cellpadding="0" border="0" bordercolor="#000000" style="background-repeat: no-repeat;">
			<tr>
				<td valign="middle" align="left" width="50%" style="padding-left: 0px; padding-top: 15px; padding-bottom: 5px; top: 0px;">
				<a href="http://www.relato.com.br/" ><img src="/imgzz/logoneo.jpg" align="left" border="0"></a>
				</td>
				<td valign="middle" align="left" width="50%" style="padding-left: 0px; padding-right: 20px; top: 0px;">
					
				</td>
			</tr>	
	</table> 
	
	<table border="0">
	<form name="frmpesquisa" id="frmpesquisa" action="listadeprodutos.jsp">
		
			<tr>
				<td class="campoopcao"><strong>Ordenar</strong></td>
				<td class="campoopcao" align="center"><strong>Categoria</strong></td> 
				<td class="campoopcao" colspan="2"><strong>Pesquisa por Nome de produto</strong></td>
	  		</tr>
	  		<tr>
		  		<td>
			  		<select id="ordenar" name="ordenar" class="campocombo">
				        <option value="2">Nome</option>
				        <option value="5">Valor</option>
			      	</select>
		      	</td> 
		      	      	
		    	<td>
		    		<select id="tipoproduto" name="tipoproduto" class="campocombo">
		        		<option selected value=""></option>
					<%
					System.out.println("Passei aqui Rafa...");
					List listaTipos = produto.getListaTiposProdutos();
					System.out.println("Passei aqui Rafa..."+listaTipos);
					if(listaTipos.size() > 0){
						Iterator itt = listaTipos.iterator();
						while(itt.hasNext()){
							System.out.println("Passei aqui xxxx Rafa...");
							List rowt = (List)itt.next();
							System.out.println("Passei aqui yyyy Rafa...");
					%>	
						<option value="<%=rowt.get(0)%>"><%=String.valueOf(rowt.get(1)).toUpperCase()%></option>
					<% 		
						}
						
						
					}
					%>		        			
		      		</select>
		      	</td>
	    		<td>
	    			<input class="campotexto" type="text" id="nomeproduto" name="nomeproduto" value="" size="40">
	    		</td>
				<td>
					<input type="hidden" name="pesquisar" value="S" id="pesquisar">
					<input type="submit" class="botao" id="btnpesquisar" name="btnpesquisar" value="Pesquisar" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';">
				</td>
				
		</form>
		<form id="frmcarrinho" name="frmcarrinho" action="carrinho.jsp">
			<td>
				<input type="submit" id="carrinho" name="carrinho" value="Carrinho" class="botao" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" >
			</td>
		</form>
		<form id="frmlogin" name="frmlogin" action="loginCliente.jsp">
			<td>		
				<input type="submit" id="login" name="login" value="Login" class="botao" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" >
			</td>
		</form>
		</tr>
	</table>		
	<table width="100%" border="0" align="center" cellpadding="3" cellspacing="3">

<% 	
	if("S".equals(pesquisar)){
		List lista = produto.getListaProdutos(tipoproduto,nomeproduto,ordenar);	
		System.out.println("Rafael opcao "+lista);
		int cont = 1;
		int tipoprod = 0;
		int tipoprodold = 0;
		if(lista.size() > 0){
			Iterator ix = lista.iterator();
			while(ix.hasNext()){
				Produto p = (Produto)ix.next();
				System.out.println("PRODUTO : "+p.getNmscompleto()); 
				
	%>			
				<form id="frmproduto<%=cont%>" name="frmproduto<%=cont%>" onsubmit="validaSubmit(this);" action="inserirCarrinho.jsp">
					<input type="hidden" id="idproduto" name="idproduto" value="<%=p.getIdiproduto()%>">
					<input type="hidden" id="send_to_url" name="send_to_url" value="carrinho.jsp">
	<% 
					tipoprod = p.getIditipoproduto();
					if(tipoprod != tipoprodold){
	%>				
					<tr width="100%" >
						<td id="barraimg" width="100%" height="25" colspan="3"  style="background-repeat: no-repeat;">
				    		<div class="textproduto" align="center"><font color="#000000"><b> <%=(p.getNmstipoproduto()).toUpperCase()%><b></font></div>
						</td>
					</tr>	
								
	<% 					
						tipoprodold = tipoprod;
					}
	%>				
					
					<tr>
						<td width="40%" align="left" colspan="4">
							<table class="textproduto" border="0" bgcolor="D4DEE8" width="100%">
								<tr>
									<td>
										<a href="javascript:chamaDetalhe(document.frmproduto<%=cont%>.idproduto);">
										<%=p.getNmscompleto()%>
										</a>
									</td>
								</tr>
							</table>
						</td>
					</tr>		
					<tr>
						<td width="40%" align="right">
							<table align="center" border="0">
								
								<tr>
									<td>
									<% 
									if(!"".equals(p.getNmsimagem())){
									%>	
										<img src="imagens/<%=p.getNmsimagem()%>" width="170px" height="170px">
										<a href="imagens/<%=p.getNmsimagem()%>" target="_blank"><img src="imagens/ampliar1.gif" border="0"></a>	
									<% 								
									}else{
									%>
										<img src="imagens/semcadastro.JPG" width="170px" height="170px">
									<% 	
									}
									%>
									
									</td>
								</tr>
							</table>
						</td>
								
						<td width="40%" align="left" valign="top">
							<table class="textdescricao" border="0" bgcolor="ffffff">
							<tr>
								<td  >
									<%out.print((p.getDssdescricao()).replaceAll("\n","<br>"));%>
								</td>
							</tr>
							</table>
						</td>
						<td width="20%">
							<table >
								<tr>
									<td class="textdescricao">
										<nobr><span class="textdescricao">Quantidade:</span></nobr>
									</td>
									<td class="textdescricao">
										<input id="qtdproduto" type="text" name="qtdproduto" value="1" size="10" maxlength="2" class="numberproduto" onblur="calculaPrecoObj(document.frmproduto<%=cont%>.qtdproduto,document.frmproduto<%=cont%>.vldvenda,document.frmproduto<%=cont%>.vldtotal);">
									</td>
									<td valign="center">
										<table >
											<tr>
												<td>
												<a href="javascript:alteraQtdeObj(document.frmproduto<%=cont%>.qtdproduto,'0');calculaPrecoObj(document.frmproduto<%=cont%>.qtdproduto,document.frmproduto<%=cont%>.vldvenda,document.frmproduto<%=cont%>.vldtotal)">
													<img src="../img/ecommerce/maior.gif" width="9" height="6" border="0">
												</a>
												</td>
											</tr>
											<tr>
												<td>
												<a href="javascript:alteraQtdeObj(document.frmproduto<%=cont%>.qtdproduto,'1');calculaPrecoObj(document.frmproduto<%=cont%>.qtdproduto,document.frmproduto<%=cont%>.vldvenda,document.frmproduto<%=cont%>.vldtotal)">
													<img src="../img/ecommerce/menor.gif" width="9" height="6" border="0">
												</a>
												</td>
											</tr>
										</table>	
									</td>
								</tr>
								<tr>
									<td class="textdescricao">
										<nobr><span class="textdescricao">Preço Unit:</span></nobr>
									</td>
									
									<td class="textdescricao">
										<input id="vldvenda" type="text" name="vldvenda" value="<%=formataValor(p.getVldvenda())%>" size="10" class="numberproduto" readonly>
									</td>
								</tr>
								<tr>
									<td class="textdescricao">
										<nobr><span class="textdescricao">Preço Tot:</span></nobr>
									</td>
									<td class="textdescricao">
										<input id="vldtotal" type="text" name="vldtotal" value="<%=formataValor(p.getVldvenda())%>" size="10" class="numberproduto" readonly>
									</td>
								</tr>
								<tr>
									<td colspan="3" align="center">
										<img src="/img/comprar.gif" width="110" height="30" border="0" title="Comprar item" style="cursor: pointer;" id="comprar" name="comprar" onclick=document.frmproduto<%=cont%>.submit();>
										<!--<input type="submit" id="comprar" name="comprar" value="Comprar" class="botao" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" >-->
									</td>
								</tr>
							</table>
						</td>				
					</tr>
				</form>
				
	<% 			
				cont++;
			}
		}
	}else{
%>
				<tr>
					<td>
					    <div class="subTitulo3" align="center">Favor escolha parâmetros para pesquisa.</div>
					</td>
				</tr>				
		
<% 		
	}
%>			

		</table>
	
</body>

<script>
	var height = window.screen.height;
	var width = window.screen.width;

	if ( width < 1024 && height < 768 ){
		document.getElementById("barraimg").background="../img/fundorelato1.jpg";

	}

	if ( width >= 1024 && height >= 768 ){
		document.getElementById("barraimg").background="../img/fundorelato2.jpg";
		

	}
</script>


</html>

