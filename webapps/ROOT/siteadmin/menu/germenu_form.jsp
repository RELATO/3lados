<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="java.util.Map" %>
<%@ page import="system.MenuConstructor" %>
<%@ page import="system.GetMenu" %>
<%@ page import="system.ParseTarget" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@page import="br.com.relato.EntryPoint"%>
<%@page import="br.com.relato.Constants"%>
<%@page import="br.com.relato.xls.util.FormatUtils"%>
<%@page import="br.com.neorelato.util.Cast"%>
<%@page import="java.util.*" %>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.math.BigDecimal"%>

<jsp:useBean id="mc" scope="session" class="system.MenuConstructor"/>

<%
int menuId = (request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : 0);
mc.setTableName("menu",1);
MenuConstructor.MenuItem mi = null;
String[] valores = null;
String nome2 = "";
String nome3 = "";
String nome4 = "";
if ( "altera".equals(request.getParameter("acao")) ){
    mi = (MenuConstructor.MenuItem) mc.getItem(menuId);
    valores = new String[]{String.valueOf(mi.menuId), mi.name, mi.link, String.valueOf(mi.order), mi.target};

    mc.setTableName("menu",2);
    mi = (MenuConstructor.MenuItem) mc.getItem(menuId);
    nome2 = mi.name;
    
    mc.setTableName("menu",3);
    mi = (MenuConstructor.MenuItem) mc.getItem(menuId);
    nome3 = mi.name;
    
    mc.setTableName("menu",4);
    mi = (MenuConstructor.MenuItem) mc.getItem(menuId);
    nome4 = mi.name;
    
    mc.setTableName("menu",1);
    
}else{
    valores = new String[]{"", "Novo Item", "Escolha a URL", "0", "false", "N"};
}

%>

<html>
<head>
	<title>Gerenciador de Menus</title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel="stylesheet" type="text/css" href="styles.css" />
	<script language=JavaScript src="/milonic_src.js" type=text/javascript></script>
	<script language=JavaScript src="menuinit.js" type=text/javascript></script>
	<script language=JavaScript>
	if(ns4)_d.write("<scr"+"ipt language=JavaScript src=/mmenuns4.js><\/scr"+"ipt>");
	  else _d.write("<scr"+"ipt language=JavaScript src=/mmenudom.js><\/scr"+"ipt>");
	</script>
			
</head>

<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" onload="checkPopup()">

<script>

function abreLista(){
	
	window.open('/listapagina.jsp','page','toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=930,height=600');
} 

function GetValueFromChild(myVal)

{

     myVal = document.getElementById(link).value;

}

function show(yes){
    if ( yes == "true" ){
        document.getElementById("LayerPopup").className = "ver";
    }else{
        document.getElementById("LayerPopup").className = "naover";
    }
}

function buildPopup(){
    var targetop = getValue("targetoption");
    if ( targetop == "false" )
        setValue("target", "");
    else{
        setValue("target", "true");
        /*
        var pop = "popup;targetfeatures=top="+getValue("top")+" left="+getValue("left")
            +" width="+getValue("width")+" height="+getValue("height")
            +" resizable="+getValue("resizable")+" menubar="+getValue("menubar")
            +" status="+getValue("status")+" toolbar="+getValue("toolbar")
            +" directories="+getValue("directories")+" location="+getValue("location")
            +" scrollbars="+getValue("scrollbar")+" copyhistory="+getValue("copyhistory");
        setValue("target", pop);
        */
    }
    
}

function getValue(field){
    return document.getElementById(field).value;
}

function setValue(field, value){
    document.getElementById(field).value = value;
}

function checkPopup(){
<%
Map map = new HashMap();
String[] popup = new String[]{"", "", "", ""};
    if ( !"false".equals(valores[4]) ){
        if ( !StringUtils.isEmpty(valores[4]) ){
            //map = ParseTarget.parse(valores[4]);
            //popup = new String[]{(String)map.get("left"), (String)map.get("top"), (String)map.get("width"), (String)map.get("height")};
            out.println("document.getElementById('targetoption').value = 'true';");
            //out.println("show('true')");
        }
    }
%>
}

<%
out.println(GetMenu.renderEdicao(mc,1)); 
%>
    
drawMenus();
</script>

<form name="frmOpcoes" id="frmOpcoes" action="germenu_edic.jsp" method="post">
  <input type="hidden" name="id" id="id" value="<%=menuId%>">
  <input type="hidden" name="acao" id="acao" value="">
  <input type="hidden" name="target" id="target" value="">
  <table align="left" cellpadding="0" cellspacing="0" width="980" height="620" class="visutable">
    <tr> 
      <td colspan="2" align="center" class="borda" height="67" valign="top"><img src="/img/topo_gerenciadormenu2.jpg"></td>
    </tr>
    <tr> 
      <td colspan="2" align="center" height="40" class="middleborda">
		<input type="submit" onClick="document.getElementById('frmOpcoes').action = 'germenu_visu.jsp'" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" class="botao" name="acao" id="acao" value="Aceita altera&ccedil;&otilde;es"> 
        <input type="submit" onClick="document.getElementById('frmOpcoes').action = 'germenu_visu.jsp?cancela=true'" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" class="botao" name="acao" id="acao" value="Cancela altera&ccedil;&otilde;es"> 
        <!-- input type="submit" onClick="document.getElementById('frmOpcoes').action = 'germenu_visu.jsp'" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" class="botao" name="acao"  value="Modo visualização"-->
      </td>
    </tr>
    <tr> 
      <td width="191">
        <!--menu-->
      </td>
      <td align="center" valign="top" width="789" class="paddingborda"> <table width="614" cellpadding=0  cellspacing="0" bgcolor="#3163A0" class="borda">
          <tr class="linha"> 
            <td width="608" valign=top> <table border=0 cellspacing=0 width="617">
                <tr class="titulotable" height=40> 
                  <th width=100% class="bordabottom">Item de Menu</th>
                </tr>
                <tr> 
                  <td align="center"> <table align="left" width="100%" cellpadding="0" cellspacing="0">
                      <tr class="linha"> 
                        <td width="24%" class="labellefttopo">Id:</td>
                        <td width="76%" class="padtopo"><input value="<%=valores[0] %>" readonly type="text" name="idshow" id="idshow" class="textfieldpadrao" size="6" maxlength="120"></td>
                      </tr>
                      <tr class="linha"> 
                        <td width="24%" class="labelleft">Nome:</td>
                        <td width="76%"><input value="<%=valores[1] %>" type="text" id="name" name="name" class="textfieldgrande" maxlength="120"></td>
                      </tr>
                      
                      <tr class="linha"> 
                        <td width="24%" class="labelleft">Nome2:</td>
                        <td width="76%"><input value="<%=nome2 %>" type="text" id="name2" name="name2" class="textfieldgrande" maxlength="120"></td>
                      </tr>

                      <tr class="linha"> 
                        <td width="24%" class="labelleft">Nome3:</td>
                        <td width="76%"><input value="<%=nome3 %>" type="text" id="name3" name="name3" class="textfieldgrande" maxlength="120"></td>
                      </tr>

                      <tr class="linha"> 
                        <td width="24%" class="labelleft">Nome4:</td>
                        <td width="76%"><input value="<%=nome4 %>" type="text" id="name4" name="name4" class="textfieldgrande" maxlength="120"></td>
                      </tr>
                      
                      <tr class="linha"> 
                        <td width="24%" class="labelleft">Url (link):</td>
                        <td width="76%">
                        	<input value="<%=valores[2]%>" type="text" class="textfieldpadrao" name="link" id="link" size="50" maxlength="120" >
                        	<input type="button" value="..." onClick="abreLista()" size="10">
                        </td>
                      </tr>
                      <tr class="linha"> 
                        <td width="24%" class="labelleft">Ordem:</td>
                        <td width="76%"><input value="<%=valores[3] %>" type="text" class="textfieldpadrao" name="order" size="6" maxlength="6"></td>
                      </tr>
                      <tr class="linha"> 
                        <td width="24%" class="labelleftbottom">Pop-up:</td>
                        <td width="76%" class="padbottom"> <select id="targetoption" class="combopadrao" name="targetoption">
                            <option value="false">Não</option>
                            <option value="true">Sim</option>
                           </select> </td>
                      </tr>
                      <tr height="40" class="linha"> 
                        <%
                                if ( "novo".equals(request.getParameter("acao")) ){
                            %>
                        <td colspan="4" align="center" class="cellescura"> <input type="submit" onClick="document.getElementById('acao').value = 'salva';buildPopup();" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" class="botao" name="bEnvia" value="Inclui Item"> 
                        </td>
                        <%
                                }else if( "altera".equals(request.getParameter("acao")) ){
                            %>
                        <td colspan="4" align="center" class="cellescura"> <input type="submit" onClick="document.getElementById('acao').value = 'altera';buildPopup();" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" class="botao" name="bEnvia" value="Altera Item"> 
                          <span class="espaco">&nbsp;</span> <input type="submit" onClick="document.getElementById('acao').value = 'deleta'" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" class="botao" name="bEnvia" value="Exclui Item"> 
                        </td>
                        <%
                                }
                            %>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
<a href=http://www.milonic.com/styleproperties.php>
<!--http://www.milonic.com/styleproperties.php-->
</a> 
</body>
</html>