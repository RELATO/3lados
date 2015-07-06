<%@ page contentType="text/html; charset=windows-1252" %>
<%@ page import="java.util.*" %>
<%@ page import="br.com.relato.ecommerce.*" %>
<%@ page import="br.com.relato.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<jsp:useBean id="cesta" scope="session" class="br.com.relato.ecommerce.Cesta"/>

<script language="JavaScript" src="../include/ecommerce.js"></script>

<html>

<head>

<%
	String opc = (null != request.getParameter("opcao") ? request.getParameter("opcao") : "-1" ); 
	int prod = (null != request.getParameter("produto") ? Cast.toInt(request.getParameter("produto")) : -1 );
	int qtd = (null != request.getParameter("qtde") ? Cast.toInt(request.getParameter("qtde")) : 0 );
	double val = (null != request.getParameter("valor") ? Cast.toDouble(request.getParameter("valor")) : 0d );
	double des = (null != request.getParameter("desconto") ? Cast.toDouble(request.getParameter("desconto")) : 0d );
	double per = (null != request.getParameter("percentual") ? Cast.toDouble(request.getParameter("percentual")) : 0d );
	double tot = (null != request.getParameter("total") ? Cast.toDouble(request.getParameter("total")) : 0d );
	
	if("1".equals(opc)){
		//cesta.addItemLista(prod,qtd,val,per,des,tot);
		cesta.addItemLista(prod,qtd);
	}else if("0".equals(opc)){
		cesta.removeItemLista(prod);
	}else if("2".equals(opc)){
		cesta.gravaPedido();
	}
	
	System.out.println("CESTA\nVALOR"+cesta.getVldpedido());

	List lista = cesta.getItens();
	
	System.out.println("Rafael LISTA "+lista);

%>

</head>

<body>
	<form id="form_1" name="form_1" action="adicionaitemcesta.jsp">
	
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td>
				Opcao:<input type="textfield" id="opcao" name="opcao">
			</td>
		</tr>
		<tr valign="top">
			<td>
				Prod:<input type="textfield" id="produto" name="produto">
			</td>
		</tr>
		<tr valign="top">
			<td>
				Qtde:<input type="textfield" id="qtde" name="qtde">
			</td>
		</tr>
		<tr valign="top">
			<td>
				Valor:<input type="textfield" id="valor" name="valor">
			</td>
		</tr>
		<tr valign="top">
			<td>
				Desc:<input type="textfield" id="desconto" name="desconto">
			</td>
		</tr>
		<tr valign="top">
			<td>
				Perc:<input type="textfield" id="percentual" name="percentual">
			</td>
		</tr>
		<tr valign="top">
			<td>
				Total:<input type="textfield" id="total" name="total">
			</td>
		</tr>
		<tr valign="top">
			<td>
				<input type="submit" id="manda" name="manda" value="Manda Bala">
			</td>
		</tr>
		
	</table>
	
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
<% 			
	System.out.println("Rafael opcao "+opc);
	int cont = 1;
	if(lista.size() > 0){
		Iterator ix = lista.iterator();
		while(ix.hasNext()){
			ItemPedido ip = (ItemPedido)ix.next();
			Produto p = ip.getProduto();
			System.out.println("PRODUTO : "+p.getNmscompleto()); 
			
%>			
			<tr>
			<td width="53" height="51" background="../img/ecommerce/back_lista.gif">&nbsp;</td>
			<td width="400" background="../img/ecommerce/back_lista.gif"><%=p.getNmscompleto()%></td>
	
		  	<td width="90" align="center" background="../img/ecommerce/back_lista.gif" class="style2">R$ <input id="vldunitario<%=cont%>" name="vldunitario<%=cont%>" type="text" size="6" value="<%=p.getVldvenda()%>" readonly></td>
		  	<td width="40" align="center" background="../img/ecommerce/back_lista.gif">
			  	<table width="16%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td rowspan="3">
						<input type="hidden" name="send_to_url" value="loginCliente.jsp">
						<input type="hidden" name="id_produto<%=cont%>" value="<%=p.getIdiproduto()%>">
						<input id="qtde_carrinho<%=cont%>" type="text" name="qtde_carrinho<%=cont%>" class="campo" onblur="javascript:validaQuantidade_onBlur(this)" value=<%=ip.getQtidesejada()%> size="2" maxlength="2"> 
						<td valign="bottom"><a href="javascript:alteraQuantidade(document.form_1, '0','<%=cont%>')"><img src="../img/ecommerce/maior.gif" width="9" height="6" border="0"></a></td>
					</tr>
					<tr>
						<td><img src="../img/ecommerce/x.gif" width="10" height="2"></td>
					</tr>
					<tr>
						<td valign="top"><a href="javascript:alteraQuantidade(document.form_1, '1','<%=cont%>')"><img src="../img/ecommerce/menor.gif" width="9" height="6" border="0"></a></td>
					</tr>
				</table>
			</td>
				<td background="../img/ecommerce/back_lista.gif" width=100 class="style2">R$<input id="vldtotal<%=cont%>" name="vldtotal<%=cont%>" width="60" size="10" value=<%=(ip.getQtidesejada() * p.getVldvenda())%> align="right" background="../img/ecommerce/back_lista.gif" class="style2" readonly>
		  		</td>
		  		<td>
			  	<a href="removerCarrinho.jsp?idproduto=<%=ip.getIdiproduto()%>&send_to_url=<%=request.getRequestURL()%>">Excluir<!-- img src="../img/ecommerce/maior.gif" width="9" height="6" border="0"--></a>
			  	</td>
			</tr>
<% 			
			cont++;
		}
	}
%>			

		</table>
	
	</form>
</body>

</html>

