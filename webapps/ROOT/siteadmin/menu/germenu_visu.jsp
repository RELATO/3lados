<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=windows-1252" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="system.MenuConstructor" %>
<%@ page import="system.GetMenu" %>

<jsp:useBean id="mc" scope="session" class="system.MenuConstructor"/>

<%
if (request.getParameter("cancela") != null && "true".equals(request.getParameter("cancela"))){
	System.out.println("ok leeendo");
	mc.leItens();
}

if (request.getParameter("atualiza") != null && "true".equals(request.getParameter("atualiza"))){
    System.out.println("salvando itensss");
	mc.salvaItens();
    System.out.println("ok salveii");
    
}
%>

<html>
<head>
<title>Gerenciador de Menus</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="styles.css" />

<script language=JavaScript src="/milonic_src.js" type=text/javascript></script>
<script language=JavaScript src="menuinit.js" type=text/javascript></script>
<script	language=JavaScript>
if(ns4)_d.write("<scr"+"ipt language=JavaScript src=/mmenuns4.js><\/scr"+"ipt>");
  else _d.write("<scr"+"ipt language=JavaScript src=/mmenudom.js><\/scr"+"ipt>");
</script>
<script>
function gotoMenu(){
	window.location.href = "/siteadmin/home.jsp";
}
</script>

</head>

<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">
<script>
var __top = 142;
var __left = 30;
var __item = 149;

<%
	out.println(GetMenu.renderVisualizacaoEditor(mc,false,1));
%>	
	drawMenus();
</script>
<form name="frmOpcoes" id="frmOpcoes" action="" method="post">
  <table align="left" cellpadding="0" cellspacing="0" width="980" height="710" 
	class="visutable">
    <tr> 
      <td colspan="2" align="center" class="borda" height="67" valign="top"><img src="/images/topolnovomenu.jpg"></td>
    </tr>
    <tr> 
      <td colspan="2" align="center" height="40" class="middleborda"> 
      	<input type="button" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" class="botao" name="acao" id="acao" onClick="window.location.href = 'germenu_visu.jsp'" value="Recarrega Menu"> 
        <input type="submit" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" class="botao" name="acao" id="acao" onClick="frmOpcoes.action = 'germenu_edic.jsp'" value="Modo Edição"> 
        <input type="submit" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" class="botao" name="acao" id="acao" onClick="frmOpcoes.action = 'germenu_visu.jsp?atualiza=true'" value="Atualiza Menu"> 
        <input type="button" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onclick='gotoMenu()' class="botao" name="acao" id="acao"  value="Voltar"> 
      </td>
    </tr>
    <tr> 
      <td width="183">
        <!--menu-->
      </td>
      <td width="797" class="borda">
        <!--acoes-->
      </td>
    </tr>
  </table>
</form>
<a href=http://www.milonic.com/styleproperties.php>
<!--http://www.milonic.com/styleproperties.php-->
</a> 
</body>
</html>
