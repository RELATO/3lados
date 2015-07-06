<html>
<head>
<title>Meu Carrinho</title>
<head>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="br.com.relato.ecommerce.*" %>
<%@ page import="br.com.relato.util.Cast" %>

<link rel="stylesheet" href="../css/estilo.css">

<style>
		.subTitulo3
		{
		   font-family:  Verdana;
		   FONT-SIZE: 11pt;
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
		    FONT-FAMILY: Verdana;
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
		.borda
		{
			border:1px solid #D6E3EF;
			border-width: 5px;
			
			border-color: #D6E3EF;
    	}
		
		A:link {text-decoration:none;color:black;}
	    A:visited {text-decoration:none;color:black;}
	    A:active {text-decoration:none;color:black;}
	    A:hover {text-decoration:underline;color:black;}
	     
	</style>

<jsp:useBean id="cesta" scope="session" class="br.com.relato.ecommerce.Cesta"/>

<script language="JavaScript" src="../include/ecommerce.js"></script>

</head>
<body>
<%
	boolean login = Cast.toBoolean(request.getParameter("login"));
%>
<form action="confirmarCliente.jsp" method="post" id="frmconfirmacliente" name="frmconfirmacliente">
	
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
	
	<table width="100%" border="0">
<%
	if(login){
%>
	<tr>
		<td align="center"><div class="style2">Login ou senha invalido!</div><br>
	</tr>
<%
	}
%>
	</table>
	
	
	<table width="100%" height="90%" border="0">
			<tr>
			<td>
			<table align="center" valign="middle" class="borda">
				<tr >
					<td >
						<div class="style2"><br>E-Mail: </div>
						<input type=text value="" name=user>
					</td>
					
					<td><br>
					<div class="style2">Senha: </div><input type=password value="" name=password></td>
				</tr>
				<tr>
				  	 <td style="padding-left: 0px; padding-top: 20px; padding-bottom: 5px; top: 0px;">
					  	 <form id="cadastra" name="cadastra" action="formularioCliente.jsp">
					  	 	 <input type="hidden" id="send_to_url" name="send_to_url" value="carrinho.jsp">
							 <input type="hidden" id="back_to_url" name="back_to_url" value="<%=request.getRequestURL()%>">
							 <input name=cadastrar type="button" onclick="window.location = 'formularioCliente.jsp'" value="Cadastrar-se" class="botao" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" >
						 </form>
					</td>
				    <td>
						 <input type="hidden" id="back_to_url" name="back_to_url" value="carrinho.jsp">
						 <input id="continuar" name="continuar" type="button" onclick=" document.frmconfirmacliente.submit();" value="Logar" class="botao" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" >
					</td>
					<td style="padding-left: 0px; padding-top: 20px; padding-bottom: 5px; top: 0px;">
						<form id="frmlista" name="frmlista" action="listadeprodutos.jsp">
							 	<input type="submit" id="volta" name="volta" value="Voltar" class="botao" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" >
						</form>
				    </td>
				</tr>
			</table>
			</td>
			</tr>	
		</table>
</form>	
</body>
</html>