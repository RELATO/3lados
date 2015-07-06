<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="java.util.ArrayList" %>
<%@ page import="system.MenuConstructor" %>
<%@ page import="system.GetMenu" %>

<jsp:useBean id="mc" scope="session" class="system.MenuConstructor"/>

<%
int menuId = (request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : 0);
String menuName = (request.getParameter("name") != null ? request.getParameter("name") : "");
String menuName2 = (request.getParameter("name2") != null ? request.getParameter("name2") : "");
String menuName3 = (request.getParameter("name3") != null ? request.getParameter("name3") : "");
String menuName4 = (request.getParameter("name4") != null ? request.getParameter("name4") : "");
String menuLink = (request.getParameter("link") != null ? request.getParameter("link") : "");
String menuTarget = (request.getParameter("target") != null ? request.getParameter("target") : "");
int menuOrder = (request.getParameter("order") != null ? Integer.parseInt(request.getParameter("order")) : 0);



String msg = null;

if (request.getParameter("acao") != null ){
	try{
		if ( "deleta".equals(request.getParameter("acao") )){
		    mc.removeItem(menuId);
		    //System.out.println("zzzzzzzzzzzzz"); 
		}else if ( "altera".equals(request.getParameter("acao") )){
			//System.out.println("okokokokokok =="); 
			
			mc.saveItem( menuId, menuName, menuLink, menuTarget, menuOrder,1);
			//System.out.println("okokokokokok == "+menuName); 
		    mc.saveItem( menuId, menuName2, menuLink, menuTarget, menuOrder,2);
		    //System.out.println("okokokokokok == "+menuName2); 
		    mc.saveItem( menuId, menuName3, menuLink, menuTarget, menuOrder,3);
		    //System.out.println("okokokokokok == "+menuName3); 
		    mc.saveItem( menuId, menuName4, menuLink, menuTarget, menuOrder,4);
		    //System.out.println("okokokokokok == "+menuName4); 
		}else if ( "salva".equals(request.getParameter("acao") )){
			
			if(menuId == 0){
				menuId = mc.getNextId();
				mc.addItem(menuId,menuName,menuLink,menuTarget,0,menuOrder,1);
				mc.addItem(menuId,menuName2,menuLink,menuTarget,0,menuOrder,2);
				mc.addItem(menuId,menuName3,menuLink,menuTarget,0,menuOrder,3);
				mc.addItem(menuId,menuName4,menuLink,menuTarget,0,menuOrder,4);
			}else{
				int newId = mc.getNextId();
				mc.addItem(newId,menuName,menuLink,menuTarget,menuId,menuOrder,1);
				mc.addItem(newId,menuName2,menuLink,menuTarget,menuId,menuOrder,2);
				mc.addItem(newId,menuName3,menuLink,menuTarget,menuId,menuOrder,3);
				mc.addItem(newId,menuName4,menuLink,menuTarget,menuId,menuOrder,4);
			}

		}
	}catch(Exception e){
		msg = "Algum erro aconteceu ao processar a requisição!";
		e.printStackTrace();
	}
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

</head>

<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">
<script>

<%
out.println(GetMenu.renderEdicao(mc,1));
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
      <td colspan="2" align="center" height="40" class="middleborda"> <input type="submit" onClick="document.getElementById('frmOpcoes').action = 'germenu_visu.jsp'" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" class="botao" name="acao" id="acao" value="Aceita altera&ccedil;&otilde;es"> 
        <input type="submit" onClick="document.getElementById('frmOpcoes').action = 'germenu_visu.jsp?cancela=true'" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" class="botao" name="acao" id="acao" value="Cancela altera&ccedil;&otilde;es"> 
      </td>
    </tr>
    <tr> 
      <td width="191">
        <!--menu-->
      </td>
      <td width="789" align="center" class="middlebordaesq"> 
        <%
				if ( msg != null )
					out.print(msg);
			%>
      </td>
    </tr>
  </table>
</form>
<a href=http://www.milonic.com/styleproperties.php>
<!--http://www.milonic.com/styleproperties.php-->
</a> 
</body>
</html>
