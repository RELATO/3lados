<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="br.com.relato.EntryPoint"%>
<%@page import="br.com.relato.Constants" %>
<%@page import="br.com.relato.util.Cast" %>
<%@page import="java.text.*, java.util.*"%>
<html>
<head>
<title>Extranet</title>
<%
	if ( br.com.relato.EntryPoint.getUsuario() == null )
		response.sendRedirect(br.com.relato.Constants.ACCESS_DENIED);

	String banner = "";
	String username = EntryPoint.getUsuario().getLogin();
	if(username != null) {
		SimpleDateFormat sdf = new SimpleDateFormat("ddMMMyyyy - HH:mm ", new Locale("pt", "BR"));
		banner = "&nbsp;"+username + " - "+sdf.format(new Date()).toUpperCase();
	}
	java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z");
	String text = sdf.format(date);
%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" content="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="<%=text%>">
<META HTTP-EQUIV="Date" CONTENT="<%=text%>">

<script>
window.getUsername = function(){
	return "<%=username%>";
}

function m_over(obj, img) {
	obj.src = "img/"+img+"_on.gif";
}

function m_out(obj, img) {
	obj.src = "img/"+img+"_off.gif";
}

</script>

<style type="text/css">
* { margin: 0px; }
a {	text-decoration: none; }
a:hover { text-decoration: underline;}

.menu {
	vertical-align: middle;
	font-family: verdana;
	font-size: 12px;
	color: black;
	padding-left: 20px;	
	cursor: pointer;
}

.botao {
	vertical-align: middle;
	background-color: #D8D9DB;
	font-family: verdana;
	font-size: 11px;
	font-weight: bold;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #000000;
	border-right-color: #000000;
	border-bottom-color: #000000;
	border-left-color: #000000;
	text-indent : 3px;
}

.out {
	font-size: 12px;
	font-family: verdana, Arial;
	color: black;
}
.over {
	font-size: 12px;
	font-family: verdana, Arial;
	color: black;
	font-weight: bold;
}
</style>

</head>

<body leftmargin="0" rightmargin="0" topmargin="0">
<table border="0" width="780" id="table_top" cellspacing="0" cellpadding="0">
<!-- *************** TOPO *************** -->
	<tr>
		<td bgcolor="#31396B" valign="top" width="776"><img src="/img/logokananovo.jpg" width="120" height="70"></td>
	</tr>
	<tr>
		<td colspan="3" height="12" background="/img/fio_topo.jpg"></td>
	</tr>
</table>
<table width="780" valign="top" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="500" align="right">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
				
	<tr>
		<td>&nbsp;
<%
	if ( Cast.toBoolean(EntryPoint.getUsuario().getAdmin()) ){
%>
		<a target="body" class="menu" href="/extranet/gerenciadorupload.jsp">Documentos</a>
		<a target="body" class="menu" href="/extranet/download/gerenciadordownload.jsp">Controle de Downloads</a>
		<a target="body" class="menu" href="/extranet/users/gerenciadorusers.jsp">Usuários</a>
		<a target="body" class="menu" href="/extranet/prospects/gerenciador.jsp">Prospects</a>
		<!--  a target="_blank" class="menu" href="/siteadmin/enviaemail.jsp">Email</a-->
<%
	}
%>

<%
	if ( !Cast.toBoolean(EntryPoint.getUsuario().getAdmin()) ){
%>
		<a target="body" class="menu" href="/extranet/gerenciadorupload.jsp">Documentos</a>
		<!--  a target="_blank" class="menu" href="/siteadmin/enviaemail.jsp">Email</a-->
<%
	}
%>

		</td>
	</tr>
    	</table>
	</td>
    <td width="280">
		<table width="100%" valign="middle" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td>
					<span id="campo_user" title="<%=banner%>" class="botao" ><%=banner%></span>
				</td>
				<td align="right">
					<a href="/logout" target="_top" class="out" onMouseOver="this.className='over'" 
						onMouseOut="this.className='out'">Logout</a>&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
		</table>
	</td>
  </tr>
</table>
<table border="0" width="780" id="table_bottom" cellspacing="0" cellpadding="0">
	<tr>
		<td height="12" background="/img/fio_topo_1.jpg"></td>
	</tr>
</table>
<%
	if ( !Cast.toBoolean(EntryPoint.getUsuario().getAdmin()) ){
%>
<script>
	setTimeout(function()
		{window.open("/extranet/gerenciadorupload.jsp", "body")}, 
		4000);
</script>
<%
	}
%>

<script>
	   var height = window.screen.height;
	   var width = window.screen.width;

	   if ( width >= 1024 && height >= 768 ){
			document.getElementById("top_td_1").width= "112";
			document.getElementById("top_td_2").width= "112";
			document.getElementById("table_bottom").width= "1000";
			document.getElementById("table_top").width= "1000";
	   }

</script>
</body>
</html>
