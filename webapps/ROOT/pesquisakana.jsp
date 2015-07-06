<%@ page contentType="text/html; charset=windows-1252" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="system.UriUtil" %>
<%@ page import="system.GetMenuHorizontal" %>
<%@ page import="br.com.relato.util.SqlHelper" %>
<%@ page import="br.com.relato.EntryPoint" %>
<%@ page import="br.com.relato.portal.Novidade" %>
<%@ page import="br.com.relato.portal.ControlPortal" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>

<jsp:useBean id="mc" scope="request" class="system.MenuConstructor"/>
<jsp:useBean id="cm" scope="request" class="system.ContentManager"/>


<%!
	String checkNull(Object valor){
		if ( "".equals(valor) || valor == null || "null".equals(valor) )
			return "";
		return String.valueOf(valor);
	}

	String checkNull(Map mapa, Object valor, int lingua){
		String retorno = "";
		List key = new ArrayList();
		key.add(valor);
		key.add(new Integer(lingua));
		if(mapa.containsKey(key)){
			retorno = String.valueOf(mapa.get(key));
		}
		
		else{
			key = new ArrayList();
			key.add(valor);
			key.add(new Integer(1));
			if(mapa.containsKey(key)){
				retorno = String.valueOf(mapa.get(key));
			}
		}
		
		return retorno;
	}
 
%>

<% 
	
	Map map = ControlPortal.getPortalLingua();

	int idConteudo;
	int idLingua;
	int idLinguaX;
	
	try {
		idConteudo = (request.getParameter("conteudo") != null ? Integer.parseInt(request.getParameter("conteudo")) : 1);
	}catch ( Exception e ) {
		idConteudo = 1;
	}
	
	System.out.println("\n\n\n");
//	System.out.println("idLingua: '"+idLingua+"'");
	//System.out.println("idLinguaX: '"+idLinguaX+"'");
	System.out.println("\n\n\n");
	
	try {
		idLinguaX = (request.getParameter("lingua") != null ? Integer.parseInt(request.getParameter("lingua")) : 0);
	}catch ( Exception e ) {
		idLinguaX = 0;
	}
	
	System.out.println("\n\n\n");
//	System.out.println("idLingua: '"+idLingua+"'");
	System.out.println("idLinguaX: '"+idLinguaX+"'");
	System.out.println("\n\n\n");
	
	
	if(idLinguaX != 0){
		request.getSession().setAttribute("lingua",new Integer(idLinguaX));
	}
	

	try {
		idLingua = (request.getSession().getAttribute("lingua") != null ? Integer.parseInt(String.valueOf(request.getSession().getAttribute("lingua"))) : 1);
	}catch ( Exception e ) {
		idLingua = 1;
	}	
	
	int lingua;
	try {
		lingua = (request.getSession().getAttribute("lingua") != null ? Integer.parseInt(String.valueOf(request.getSession().getAttribute("lingua"))) : 1);
	}catch ( Exception e ) {
		lingua = 1;
	}	

	System.out.println("\n\n\n");
	System.out.println("idLingua: '"+idLingua+"'");
	System.out.println("idLinguaX: '"+idLinguaX+"'");
	System.out.println("\n\n\n");
	
	java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z");
	String text = sdf.format(date);
	
%>
<html>

<head>

	<title>..::Kanaflex S./A.::..</title>
	<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	<META HTTP-EQUIV="Cache-Control" content="no-cache">
	<META HTTP-EQUIV="Expires" CONTENT="<%=text%>">
	<META HTTP-EQUIV="Date" CONTENT="<%=text%>">
	<link rel="stylesheet" href="/styles/stylesindex.css" media="screen">
	<link rel="stylesheet" href="/styles/menu.css" media="screen">
	<link rel="stylesheet" href="/styles/menuprint.css" media="print">
	<script language="JavaScript">
		var msgarray=new Array(<%=cm.getHtmlMarqueeArtigos()%>);
	</script>
	<script type="text/javascript" src="/scripts/scriptindex.js"></script>	
	<script type="text/javascript" src="/scripts/marquee.js"></script> 
	<link rel="stylesheet" type="text/css" href="/styles/marqueestyle.css">	
	<SCRIPT language=JavaScript src="milonic_src.js" type=text/javascript></SCRIPT>
	<script	language=JavaScript>
	if(ns4)_d.write("<scr"+"ipt language=JavaScript src=mmenuns4.js><\/scr"+"ipt>");
	  else _d.write("<scr"+"ipt language=JavaScript src=mmenudom.js><\/scr"+"ipt>");
	</script>
	
	<script language="JavaScript">
		var linguaatual = (<%=lingua%>);
		function atualizaData() {
	        c = document.getElementById("hoje");
	        if (c != null) {
                c.innerHTML = '<table border=0 id=table_hora heigth=20><tr><td align="right"><font face="tahoma, verdana, arial" size="1" color="#888888">' + hoje(linguaatual) + '</font></td></tr></table>';
	        }
		}

	</script>
	
	
</head>


<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" style="overflow-x: hidden; overflow-y: hidden;" onLoad=on_load(linguaatual)>
<!--<div id="hoje" name="hoje" style="position:relative; left:80px; top:170px; z-index:1;">&nbsp;</div> -->
<a href=http://www.milonic.com/styleproperties.php><!--http://www.milonic.com/styleproperties.php--></a>
<table width="100%" height="100%" background="imgkana/bggeral.jpg" border="0" id="table_tudo">
	<tr>
		<td width="20%">
		</td>
		<td>
			<table border="0" height="100%" width="100%" id="table_principal" cellspacing="0" cellpadding="0" align="center" bgcolor="#FFFFFF" background="imgkana/bg1.jpg" style="background-repeat: no-repeat;">
				<tr valign="top">
					<td valign="top" align="left" width="5%">&nbsp&nbsp</td>
					<td valign="top" width="100%">
			<!-- *************** TOPO *************** -->
						<%@include file="topokana2.jsp"%>
					</td>
				</tr>
				<tr valign="top">
					<td valign="top" align="left" width="5%">&nbsp&nbsp</td>
					<td valign="top" align="left" width="100%">
						<%@include file="menukana.jsp"%>
					</td>
				</tr>
				<tr>
					<td valign="top" align="left" width="5%">&nbsp&nbsp</td>
					<td width="100%">
		<!-- *************** MEIO *************** -->

					<div id="div_meio" style="height:190px;position:relative;overflow:auto;border:0px dashed #000000">
<%!

	private String decodeUri(String parseString) {
		if (parseString == null)
		    return null;
		StringBuffer out = new StringBuffer();
		char c;
		
		for(int i = 0; i < parseString.trim().length(); ++i){
			try {
				c = parseString.charAt(i);

				if(c == '%') {
					++i;
					c = parseString.charAt(i);
					if(c == 'u') {
						String sub = parseString.substring(i + 1, i + 5);
						out.append((char)Integer.parseInt(sub, 16));
						i += 4;
					} else {
						String sub = parseString.substring(i, i + 2);
						out.append((char)Integer.parseInt(sub, 16));
						++i;			
					}
				} else {
					out.append(c);
				}
	
			} catch (java.lang.StringIndexOutOfBoundsException e) {break;}
				
		}
		return out.toString();
	}
	private String limpaHtmlcode(String text) {
	
		if (text == null) {
			return null;
		}
		if (text.length() == 0) {
			return text;
		}
		boolean inTag = false;
		boolean inHead = false;	// tudo que estiver dentro das tags head e /head nao interessa	
		String tagName = "";
		StringBuffer bf = new StringBuffer(text.trim().length());
		StringBuffer bfTag = new StringBuffer();
		
		for (int i = 0; i < text.length(); i++) {
			char cc = text.charAt(i);
			if (cc == '<') {
				inTag = true;
			} else if (cc == '>') {
				if (!inTag) {
					bf.setLength(0);
				} else {
					tagName = bfTag.toString().toLowerCase();
					bfTag.setLength(0);
					if (tagName.startsWith("head")) {
						inHead = true;
					} else if (tagName.startsWith("/head")) {
						inHead = false;
					}	
					inTag = false;
				}	
			} else {
				if (!inTag) {
					if (!inHead) bf.append(cc); 
				} else {
					bfTag.append(cc);
				}	
			}
		}

		return bf.toString();
	}
	
	private String pegaParteHtml(String text, String toSearch) {
		
		String part = "";
		int foundAt = 0;
		int tmpSize = 0;
		int remainSize = 0;
		String tmpvar = limpaHtmlcode(decodeUri(text));
		
		try {
	
			foundAt = tmpvar.indexOf(toSearch);
			tmpSize = tmpvar.length();
			remainSize = 0;
			final int partSize = 400;
	
			//return tmpvar;
				
			if (tmpSize <= partSize) {
				part = tmpvar;
			} else {	
				if (foundAt >= 0) {
					if (foundAt < tmpSize) {
						remainSize = (tmpSize - foundAt);
						if (remainSize >= partSize) {
							part = tmpvar.substring(foundAt,foundAt+partSize) + " ...";
						} else {
							foundAt = foundAt - (partSize - remainSize);
							if (foundAt < 0) foundAt = 0;
							if ( remainSize < 0) remainSize = 0;
							part = "... " + tmpvar.substring(foundAt) + " ...";	
						}				
					} // else improvavel de acontecer
				} else {
					part = tmpvar.substring(0,partSize) + " ...";
				}
			}	
			//part = part + "foundAt = " + foundAt + "<br>" + 
			//	"remainSize = " + remainSize + "<br>" + 
			//	"tmpSize = " + tmpSize + "<br>";
		
		
		} catch (java.lang.StringIndexOutOfBoundsException e) {
			
			part = tmpvar;
			part = part +  "foundAt = " + foundAt + "<br>" + 
				"remainSize = " + remainSize + "<br>" + 
				"tmpSize = " + tmpSize + "<br>";
			
		}
		
		return part;
	} 
%>	

<%
String mystr;
String mytitle = "";
String toSearch = (request.getParameter("tosearch") != null ? request.getParameter("tosearch") : "");

%>
	<center>
	<span style="font-family: verdana; font-size: 18px; font-weight: bolder">Pesquisar</span>
	<br>
	<center>
	<form name="frmSearch" method="post" action="/pesquisakana.jsp" align="center">
	<table border="0" width="90%" cellspacing="0" cellpadding="0" align="center">
		<tr height="25" align="center"> 
		  <td valign="middle" align="center"><input class="search" type="text" size="50" name="tosearch" value="<%=toSearch%>">&nbsp;&nbsp;<input class="search" type="submit" name="searchnow" value="pesquisar"></td>
		</tr>
	</table>
	</form>
	</center>
	<%
	if (toSearch.trim().length() <= 0) return;		
	System.out.println(UriUtil.encodeUri(toSearch.trim()));
	String cExpSql = "SELECT id FROM conteudo WHERE (titulo like  '%" + UriUtil.encodeUri(toSearch.trim()) + "%')" +
	" or (texto like '%" + UriUtil.encodeUri(toSearch.trim()) + "%')";

	List list = SqlHelper.execute( cExpSql, null );
	
	if (list.size() == 0) {
%>
		<table border="0" width="90%" cellspacing="0" cellpadding="0" align="center">
			<tr height="10"> 
			  <td valign="middle">&nbsp;</td>
			</tr>
			<tr height="10"> 
			  <td align="center" valign="middle" ><span style="font-family: verdana; font-size: 14px; font-weight: bolder">Nenhum registro foi encontrado.</span></td>
			</tr>
		</table>
<%
	} else {	
		Iterator i = list.iterator();
		int count =0;
		while (i.hasNext()) {
			idConteudo = Integer.parseInt(String.valueOf(i.next()));
				
			cExpSql = "select titulo, texto from conteudo where id = " + idConteudo;
			List conteudo = SqlHelper.execute(cExpSql, null);
			Iterator iConteudo = conteudo.iterator();
			if (iConteudo.hasNext()) {
				List row = (List)iConteudo.next();
				mytitle = String.valueOf(row.get(0));
				mystr = pegaParteHtml(String.valueOf(row.get(1)), toSearch );
				count++;
				%>
				<table border="0" width="600" cellspacing="0" cellpadding="0" align="center">
					<tr height="10"> 
					  <td valign="middle"><span style="font-family: verdana; font-size: 11px;"><strong> <%=count%> - <%=mytitle%></strong></span></td>
					</tr>
					<tr height="40"> 
					  <td valign="middle" align="justify"><span style="font-family: verdana; font-size: 10px;">
					  <a href="index.jsp?conteudo=<%=idConteudo%>"><%=mystr%></a></span>
					  </td>
					</tr>
					<tr height="10"> 
					  <td valign="middle">&nbsp;</td>
					</tr>
				</table>
				<%		
			}	
		}	
	} 
%>
					</div>
					</td>
				</tr>
				
				<tr id="table_spacer1" height="0"><td colspan=5></td></tr>
			<!-- *************** BANDEIRAS *************** -->
				<tr>
					<td valign="top" align="left" width="5%">&nbsp&nbsp</td>
					<td colspan=5>
						<table>
							<tr>
						   		<td valign="bottom" style="vertical-align: center; padding-bottom: 0px;" align="left" width="50"><form name="portugues" method="post" action="index.jsp?lingua=1"><img src="img/brasil.jpg" border="1" style="cursor: pointer;" onClick="portugues.submit();" align="middle"></form></td>
						   		<td valign="bottom" style="vertical-align: center; padding-bottom: 0px;" align="center" width="50"><form name="ingles" method="post" action="index.jsp?lingua=2"><img src="img/inglaterra.jpg" border="1" style="cursor: pointer;" onClick="ingles.submit();" align="middle"></form></td>
						   		<td valign="bottom" style="vertical-align: center; padding-bottom: 0px;" align="right" width="50"><form name="espanha" method="post" action="index.jsp?lingua=3"><img src="img/espanha.jpg" border="1" style="cursor: pointer;" onClick="espanha.submit();" align="middle"></form></td>
				 				<td id=table_hora colspan=5 align="right" style="padding-right: 5px"><div id="hoje" name="hoje">&nbsp</div></td>
				 			</tr>
				 		</table>
				 	</td>
				</tr>
				<tr>
					<td colspan=5>
						<table bgcolor=#E0E0E0 width="100%" border="0">
							<tr>
								<td width="25%" height="1%" valign="top" style="PADDING-LEFT: 5px; PADDING-RIGHT: 5px" align="center">
									<a href="<%=checkNull(map,"link2",2)%>" class="sw">
										<font face="tahoma, verdana, arial" size="2" color="#888888">
											<b><%=checkNull(map,"titulo2",lingua)%></b>
										</font>
									</a>
								</td>
								<td style="PADDING-RIGHT: 0px" bgcolor="B5E7FF"></td>
								<td width="25%" height="1%" valign="top" style="PADDING-LEFT: 5px; PADDING-RIGHT: 5px" align="center">
									<a href="<%=checkNull(map,"link3",3)%>" class="sw">
										<font face="tahoma, verdana, arial" size="2" color="#888888">
										<b>	<%=checkNull(map,"titulo3",lingua)%> </b>
										</font>
									</a>
								</td>
								<td style="PADDING-RIGHT: 0px" bgcolor="B5E7FF"></td>
								<td width="25%" height="1%" valign="top" style="PADDING-LEFT: 5px; PADDING-RIGHT: 5px" align="center">
									<a href="<%=checkNull(map,"link4",4)%>" class="sw">
										<font face="tahoma, verdana, arial" size="2" color="#888888">
											<b><%=checkNull(map,"titulo4",lingua)%></b>
										</font>
									</a>
								</td>
								<td style="PADDING-RIGHT: 0px" bgcolor="B5E7FF"></td>
								<td width="25%" height="1%" valign="top" style="PADDING-LEFT: 5px; PADDING-RIGHT: 5px" align="center">
									<a href="<%=checkNull(map,"link5",5)%>" class="sw">
										<font face="tahoma, verdana, arial" size="2" color="#888888">
											<b><%=checkNull(map,"titulo5",lingua)%></b>
										</font>
									</a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				
			</table>
		</td>
		<td cellspacing="0" cellpadding="0" height="100%"></td>
		<td>
			<table height="100%" id=table_lateral background="imgkana/bg1.jpg" cellspacing="0" cellpadding="0" style="background-repeat: no-repeat;" bgcolor="#FFFFFF">
				<tr>
					<td>
						<%@include file="lateraldirkana2.jsp"%>
					</td>
				</tr>
			</table>
		</td>
		<td width="20%">
		</td>
	</tr>
</table>
</body>

<script>
	var height = window.screen.height;
	var width = window.screen.width;

	if ( width < 1024 && height < 768 ){
		document.getElementById("table_principal").width= "776";   
//		document.getElementById("img_top").width= "80";   
//		document.getElementById("img_top").height= "80";   
		document.getElementById("table_principal").style.height= "95%";
		document.getElementById("table_lateral").style.visibility = "hidden";
		document.getElementById("div_meio").style.height = "210";
		document.getElementById("table_lateral2").style.visibility = "hidden";
		document.getElementById("table_tudo").height= "500";
		document.getElementById("table_top").width= "776";
//		document.getElementById("table_top").height= "100";
		document.getElementById("table_hora").width= "776";
		//document.getElementById("meio").width= "776";
	}

	if ( width >= 1024 && height >= 768 ){
		document.getElementById("table_principal").width= "776";
		document.getElementById("table_principal").style.height = "100%";
		document.getElementById("table_lateral").width= "174";
		document.getElementById("table_top").width= "776";
		document.getElementById("table_hora").width= "776";
		document.getElementById("div_meio").style.height = (height-420);
		//document.getElementById("table_spacer0").style.height = "0";
		//document.getElementById("table_spacer1").style.height = "0";
<%
		if ( idConteudo == 1 ){
%>
			document.getElementById("table_spacer2").style.height = (height/10);
<%
		}
%>
		//document.getElementById("meio").width= "776";
	}
</script>

<script type="text/javascript"><!--
insertdivs();
//--></script>
</html>