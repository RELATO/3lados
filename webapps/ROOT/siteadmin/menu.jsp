<%@page import="br.com.relato.EntryPoint"%>
<%@page import="br.com.relato.Constants"%>
<%
if ( EntryPoint.isEditor() )
	response.sendRedirect(Constants.GERENCIADOR_URL);
%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>

<%
	SimpleDateFormat sdf = new SimpleDateFormat("ddMMMyyyy-HH:mm ", new Locale("pt_BR"));
	if ( EntryPoint.getSession().getAttribute("time") == null )
		EntryPoint.getSession().setAttribute("time", sdf.format(new Date()));
%>

<html>
<head>
<title>Relato Tecnologia :: HTML Editor</title>
<style type="text/css">
* { margin: 0px; }
table.principal {
	border: 1px solid #00125E; 
	padding: 0px;
	background-color: #e7e7e7;
	margin-top: 50px;
	margin-left: auto;
	margin-right: auto;
	vertical-align: middle;		
	}
td.coldir {
	border: 0px solid #e7e7e7;
	background-color: #003366;
	padding: 10px 3px 10px 3px;
	text-align: center;
	}
input {
	border: 1px solid white;
	background-color: #3163A0;
	color: white;
	font-family: Verdana, Tahoma, Arial, sans-serif;
	font-size: 10px;
	}
input.botao {
	border: 1px solid white;
	background-color: #3163A0;
	color: white;
	font-weight: bolder;
	font-family: Verdana, Tahoma, Arial, sans-serif;
	font-size: 10px;
	width: 180px;
	text-align: center;
	}
input.botaoover {
	border: 1px solid #3163A0;
	background-color: white;
	color: #3163A0;
	font-weight: bolder;
	font-family: Verdana, Tahoma, Arial, sans-serif;
	font-size: 10px;
	width: 180px;
	text-align: center;
	cursor: pointer;
}
span {
	font-weight: bolder;
	color: white;
	font-size: 10px;
	font-family: Verdana, Tahoma, Arial, sans-serif;
	text-align: left;
	margin-left: 14px;	
	}
.login {
	font-weight: bold;
	color: white;
	font-size: 10px;
	font-family: Verdana, Tahoma, Arial, sans-serif;
	}
span.produto {
	font-weight: bold;
	color: white;
	font-size: 16px;
	font-family: Verdana, Tahoma, Arial, sans-serif;
	text-align: center;
	margin-left: -8px;	
	}
p {
	padding: 1px;
	}
</style>

<script>
function openWindow(url, status){
	if ( status )
		window.open(url, "blank", "status=no,scrollbars=yes");
	else
		window.open(url, "_self");
}

function closeEditor(){
	window.top.frames.top2.closeEditor();
}

function checkTop(){
	var top2 = window.top.frames.top2;
	if ( top2 == null ){
		window.location.href = "/siteadmin/home.jsp";
		return;
	}
}

function doOpenHE(action){
	if( !window.top.frames.top2.hasEditor() ){
		var id = window.top.frames.top2.document.getElementById("id");
		id.value = "-1";
		var idHE = window.top.frames.top2.document.getElementById("idHE");
		idHE.value = "-1";
		window.top.frames.top2.doOpenHE(action);	
	}
}

</script>
</head>

<body onLoad="checkTop()">

<table class="principal" align="center" width="500" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2" style="border-bottom: 1px solid white;"><img src="../images/topolnovo.jpg" width="500" height="67" border="0" usemap="#Map"></td>
  </tr>
  <tr style="padding: 5px; background-color: #3163A0;"> 
    <td width="60%" align="center" class="login" style="border-bottom: 1px solid white;">
		&nbsp;Usuário: <%=EntryPoint.getNameUser() + " - " + EntryPoint.getNomeUsuario()%>
	</td>
    <td width="40%" align="center" class="login" style="border-bottom: 1px solid white; border-left: 1px solid white;">
		&nbsp;Login: <%=EntryPoint.getSession().getAttribute("time") %>
	</td>
  </tr>
  <tr> 

    <td colspan="2" height="220" align="center" valign="top" class="coldir">
		<span class="produto">Menu Principal</span>
      <form name="form1" method="post" action="" target="body" style="padding-top: 10px;">
<!--       	GERENCIADOR NOVO -->
	  	<p>
          <input class="botao" type="submit" name="login" value="Gerenciador de Conteúdos" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onClick="form1.action='/he/gerenciadorconteudo_new.jsp'">
        </p>
<!--       	 GERENCIADOR VELHO      	
	  	<p>
          <input class="botao" type="submit" name="login" value="Gerenciador de Conteúdos" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onClick="form1.action='/he/gerenciadorconteudo.jsp'">
        </p>
         -->
        <p>
          <input class="botao" type="submit" name="login" value="Gerenciador de Documentos" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onClick="form1.action='controldoc/gerenciadorupload.jsp'">
        </p>
        <p>  
          <input class="botao" type="submit" name="login2" value="Manutenção Portal" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onClick="form1.action='/portal/formulario.jsp'">
        </p>
		<p>
          <input class="botao" type="submit" name="login" value="Manutenção Menu" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onClick="form1.action='menu/germenu_visu.jsp'">
        </p>
		<p>
          <input class="botao" type="button" name="login" value="Manutenção Calendário" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onClick="openWindow('/calendario', false)">
        </p>
<%
		if ( EntryPoint.isAdmin() ){
%>
		<p>
          <input class="botao" type="submit" name="login" value="Manutenção do livro de visitas" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onClick="form1.action='/livrovisitas/gerenciador.jsp'">
        </p>
<%
		}
%>        
	 	<p>
          <input class="botao" type="submit" name="login" value="Importação de prospects" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onClick="form1.action='/siteadmin/importacao/importprospects.jsp'">
        </p>

		<p>
          <input class="botao" type="submit" name="login" value="Manutenção de prospects" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onClick="form1.action='/siteadmin/prospects/gerenciador.jsp'">
        </p>
        
	 	<p>
          <input class="botao" type="submit" name="login" value="Ferramenta de Email MKT" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onClick="form1.action='/siteadmin/email/enviaemail.jsp'">
        </p>
		<p>
          <input class="botao" type="submit" name="login" value="Manutenção de Usuários" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onClick="form1.action='/extranet/users/gerenciadorusers.jsp'">
        </p>
		<p>
          <input class="botao" type="submit" name="login" value="Encerrar Sessão" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onClick="closeEditor();form1.action='/logout'">
        </p>   
      </form>
	 </td>
  </tr>
</table>
<map name="Map">
  <area shape="rect" coords="1,3,100,59" href="http://www.relato.com.br" target="_blank" alt="www.relato.com.br">
</map>
</body>
</html>


