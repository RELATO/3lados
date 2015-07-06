<%@page import="br.com.neorelato.sql.Statement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<html>
<head>
<title>..::Seu Pedido::..</title>
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
	
	String opcao = (null != session.getAttribute("opcao")?String.valueOf(session.getAttribute("opcao")):"N");
	if("S".equals(opcao)){
		System.out.println("\n cesta.getIdicliente() before ==== "+cesta.getIdicliente());
		cesta.zeraCesta();
		System.out.println("\n cesta.getIdicliente() after ==== "+cesta.getIdicliente());
		for(int i=1;;i++){
			int id = Cast.toInt( null != request.getParameter("idproduto"+i)?request.getParameter("idproduto"+i): "-1" );
			System.out.println("id da desgraca =="+id);
			if (id<0) {
				break;
			}
			int qtd = Cast.toInt( (null != request.getParameter("qtde_carrinho"+i)? request.getParameter("qtde_carrinho"+i) : "0" ) );
			//float vldunitario = Cast.toFloat(null != request.getParameter("vldunitario"+i)?request.getParameter("vldunitario"+i):-1);
			double vldunitario = Cast.toDouble( (null != request.getParameter("vldunitario"+i) ? request.getParameter("vldunitario"+i) : "0") );
			double vldtotal = Cast.toDouble(request.getParameter("vldtotal"+i));
			System.out.println("ID ==== "+id);
			System.out.println("QUANTIDADE ========= "+qtd);
			System.out.println("VALOR TOTAL ========== "+vldtotal);

			
			if (qtd>0)
				cesta.addItemLista(id,qtd,vldunitario,0d,0d,vldtotal);
		}
		session.setAttribute("opcao","N");
		System.out.println("VALOR TOTAL AGORA<  ==== "+Cast.toDouble(request.getParameter("vldtotal"+1)));
	}
	
	List lstprodutos = cesta.getItens();
	
	String send_url = "/ecommerce/loginCliente.jsp";
	if(-1 != cesta.getIdicliente()){
		send_url = "/ecommerce/confirmarPedido1.jsp";
	}
	
	Cliente cli = Cliente.dadosCliente(cesta.getIdicliente());
	

%>
<%!
	String cClasse = "tableRowEven" ;
	Locale pt_BR = new Locale("pt", "BR");
	NumberFormat df = NumberFormat.getCurrencyInstance(pt_BR);
	NumberFormat dfn = NumberFormat.getNumberInstance(pt_BR);
	DateFormat df1 = DateFormat.getDateInstance(DateFormat.MEDIUM, new Locale("en", "US"));   
	DateFormat df2 = DateFormat.getDateInstance(DateFormat.MEDIUM, pt_BR );
	BigDecimal valorTotal = new BigDecimal(0);
	
	
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

<form action="/ecommerce/atualizarCarrinho.jsp" method="post" id="carrinho" name="carrinho">
	
	<input type="hidden" id="send_to_url" name="send_to_url" value="<%=send_url%>">

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	
<% 
	if(-1 != cesta.getIdicliente()){
	List lista = cesta.getItens();
		if(lista.size()>0){
			int idpedido = cesta.gravaPedido();
%>
		<tr>
			<td colspan="6" align="center" bgcolor="#C0C0C0"><div class="subTitulo3">Pedido Finalizado com Sucesso!</div><td>
		</tr>
		<tr>
			<td align="center" bgcolor="#C0C0C0" colspan="6"><div class="subTitulo3">O número do seu pedido é <font color=red size="4pt"><%=idpedido%></font></div><td>
		</tr>
		
	<% 
		}else{
			response.setStatus( 303 );
			response.setContentType( "text/html" );
			response.setHeader( "Location", "carrinho.jsp" );
		}
	}else{
		response.setStatus( 303 );
		response.setContentType( "text/html" );
		response.setHeader( "Location", "loginCliente.jsp" );
	
	}
%>		
	</table>
	<table width="100%" border="0" cellspacing="5" cellpadding="5">
		<tr>
			<td align="center" width="20%"><div class="subTitulo3">PRODUTO</div></td>
			<td align="center" width="15%"><div class="subTitulo3">QUANTIDADE</div></td>
			<td align="center" Width="15%"><div class="subTitulo3">VALOR UNITÁRIO</div></td>
			<td align="center" width="15%"><div class="subTitulo3">VALOR TOTAL</div></td>
			<td width="20%">&nbsp</td>
			<td width="15%">&nbsp</td>
		</tr>
<%
	int cont = 1;
	
	if(lstprodutos.size()>0){
		Iterator it = lstprodutos.iterator();
		valorTotal = new BigDecimal(0);
		
		while(it.hasNext()){
			ItemPedido ip = (ItemPedido) it.next();
			Produto p = ip.getProduto();
			
			
			valorTotal = valorTotal.add(Cast.toBigDecimal(ip.getVldtotal()));

%>
		<tr class = "<%=cClasse%>">
			<td><div class="style2"><%=p.getNmscompleto()%></div></td>
			<td align="right"><div class="style2"><%=ip.getQtidesejada()%></div></td>
			<td align="right"><div class="style2"><%=formataValor(p.getVldvenda())%></div></td>
			<td align="right"><div class="style2"><%=formataValor(ip.getVldtotal())%></div></td>
			<td>&nbsp</td>
			<td>&nbsp</td>
			
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
	
	
	System.out.println("\n\n\n\n\n\n Passei aqui pra ver o id\n\n\n\n"+cesta.getIdicliente());
	
	String conteudo = "";
	
	if(cli.getIdicliente()!= (-1)){
		conteudo = "Foi encaminhado os dados do pedido para o email "+cli.getNmsemail();
		
	}else{
		conteudo = "";
		
	}

%>
	<tr>
			<td colspan="2">&nbsp</td>
			<td align="center"><div class="subTitulo3">TOTAL À PAGAR</div></td>
			<td align="right"><div class="subTitulo3"><%=formataValor(valorTotal)%></div></td>
			<td>&nbsp</td>
			<td>&nbsp</td>
		</tr>
		
		
		
		<br>
		<tr>
			<td colspan="6" align="left"><div class="subTitulo3"><%=conteudo%></div></td>
		</tr>
		
		<tr>
			<td colspan="6" align="center"><br><br>
			 	<input type="submit" id="limpar" name="limpar" value="Fechar" class="botao" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onclick="window.close();">
			</td>
		</tr>
	</table>
	

</form>	
</body>
</html>