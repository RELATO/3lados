<html>
<head>
<title>Compra</title>
<head>

<link rel="stylesheet" href="../css/estilo.css">

<style>
.style2 {
		font-family: Verdana;
		font-size: 10px;
		font-weight: normal;
		color:#343458;
		}
</style>

<jsp:useBean id="cmp" scope="page" class="br.com.relato.ecommerce.Cesta"/>

<script language="JavaScript" src="../include/ecommerce.js"></script>

</head>
<body>
<table width="604" border="0" cellspacing="0" cellpadding="0">
	<form action method="POST" name="form_1">
	<tr> 
		<td width="53" height="51" background="../img/ecommerce/back_lista.gif"><a href="detalhe.asp?categoria=catPascoa&amp;subcategoria=catAzeites&amp;idproduto=3209431" title="Ver detalhe do produto" class="centerlista"><img border="0" src="../img/ecommerce/3209431_t1.jpg"></a></td>
		<td width="400" background="../img/ecommerce/back_lista.gif">  <a href="detalhe.asp?categoria=catPascoa&amp;subcategoria=catAzeites&amp;idproduto=3209431" title="Ver detalhe do produto" class="centerlista">Azeite Argentino Extra Virgem Clásico OLIOVITA Vidro 500ml</a></td>

	  	<td width="60" align="center" background="../img/ecommerce/back_lista.gif" class="style2">R$ 17,58 </td>
	  	<td width="40" align="center" background="../img/ecommerce/back_lista.gif">
		  	<table width="16%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td rowspan="3"><input type="text" name="qtde_carrinho" class="campo" value="1" size="1" maxlength="2" onkeypress="javascript:validaQuantidade_KeyPress(this, window.event.keyCode)" onblur="javascript:validaQuantidade_onBlur(this)"></td>
					<td valign="bottom"><a href="javascript:alteraQuantidade(document.form_1, '0')"><img src="../img/ecommerce/maior.gif" width="9" height="6" border="0"></a></td>
				</tr>
				<tr>
					<td><img src="../img/ecommerce/x.gif" width="10" height="2"></td>
				</tr>
				<tr>
					<td valign="top"><a href="javascript:alteraQuantidade(document.form_1, '1')"><img src="../img/ecommerce/menor.gif" width="9" height="6" border="0"></a></td>
				</tr>
			</table>
		</td>
	  
	  
	  	<td width="52" align="center" background="../img/ecommerce/back_lista.gif"><a href="javascript:processaCarrinho(document.form_1, '3209431', 'catPascoa','catAzeites');mudaCarrinho('car1');enviaPagina('',document.form_1,'','')"><span id="car1"><img src="../img/ecommerce/bt_comprar.gif" width="64" height="24" border="0"></span></a></td>
	</tr>
	</form>
</table>	
</body>
</html>