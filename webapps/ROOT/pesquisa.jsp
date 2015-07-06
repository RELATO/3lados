<%@ page contentType="text/html; charset=windows-1252" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="system.UriUtil" %>
<%@ page import="system.GetMenuJquery" %>
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
	
  <link rel="shortcut icon" type="image/x-icon" href="http://www.relato.com.br/favicon.ico" />
  <link rel="icon" type="image/x-icon" href="http://www.relato.com.br/favico.png" />
  
	<title>..::Relato Informática Consultoria e Desenvolvimento de Sistemas::..</title>
	<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	<META HTTP-EQUIV="Cache-Control" content="no-cache">
	<META HTTP-EQUIV="Expires" CONTENT="<%=text%>">
	<META HTTP-EQUIV="Date" CONTENT="<%=text%>">
	<META name="robots" content="index, follow">
	<META name="googlebot" content="index, follow">
	<META name="keywords" content="relatórios,java,microsiga,redução,custos,licenças,logix,totvs,mysql,omriwo,linux,sistema,desenvolvimento,sistemas,informatica,informática,linguagem java,linguagem delphi,ajax,hibernate">
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<META name="description" content="Consultoria de informática, especializada em redução de custos de licenças Totvs (Microsiga, Logix, entre outros), utilizamos o topo das tecnologias open-source, Java, Linux, Solaris, virtualização, MySQL, otimizando a relação Custo x Benefício conforme as necessidades dos nossos parceiros.">
	
	<!-- Imports para menu novo para funcionar o menu é necessário copiar uma pasta chamada menublack para dentro do projeto -->
	    <link type="text/css" href="/menublack/menu.css" rel="stylesheet" />
	    <script type="text/javascript" src="/menublack/jquery.js"></script>
	    <script type="text/javascript" src="/menublack/menu.js"></script>
		<!-- Fim dos Imports para menu novo -->
		
		<jsp:include page="jqueryportal.jsp" />
	
	<script language="JavaScript">
		var msgarray=new Array(<%=cm.getHtmlMarqueeArtigos(lingua)%>);
	</script>
	<script type="text/javascript" src="/scripts/scriptindex.js"></script>	
	<script language="JavaScript" src="/include/ecommerce.js"></script>
	
<link href="css/sub.css" type="text/css" rel="stylesheet" />
<script src="js/inputmask.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	$(".inputWrap").inputmask();
});
</script>
	
	<script language="JavaScript">
		var linguaatual = (<%=lingua%>);
		function atualizaData() {
	        c = document.getElementById("hoje");
	        if (c != null) {
                c.innerHTML = '<table border="0" id=table_hora heigth=20><tr><td style="font-family:verdana;font-weight: bold;font-size: 10px;"><font color="8e8e8e">' + hoje(linguaatual) + '</font></td></tr></table>';
	        }
		}

	</script>
	<link href="searchfield/searchfield.css" rel="stylesheet" type="text/css" media="screen" />
	<script type="text/javascript" src="searchfield/searchfield.js"></script>
	
	<script type="text/javascript">

			$(function(){



				// Accordion

				$("#accordion").accordion({ header: "h3" });

	

				// Tabs

				$('#tabs').tabs();

	



				// Dialog			

				$('#dialog').dialog({

					autoOpen: false,

					width: 600,

					buttons: {

						"Ok": function() { 

							$(this).dialog("close"); 

						}, 

						"Cancel": function() { 

							$(this).dialog("close"); 

						} 

					}

				});

				

				// Dialog Link

				$('#dialog_link').click(function(){

					$('#dialog').dialog('open');

					return false;

				});



				// Datepicker

				$('#datepicker').datepicker({

					inline: true

				});

				

				// Slider

				$('#slider').slider({

					range: true,

					values: [17, 67]

				});

				

				// Progressbar

				$("#progressbar").progressbar({

					value: 20 

				});

				

				//hover states on the static widgets

				$('#dialog_link, ul#icons li').hover(

					function() { $(this).addClass('ui-state-hover'); }, 

					function() { $(this).removeClass('ui-state-hover'); }

				);

				

			});

		</script>
	
	 <style type="text/css">
	 
.body{
	margin: 0;
	padding: 0;
	
}   
A:link {text-decoration: none ;color:#000000}
A:visited {text-decoration: none ;color:#000000}
A:active {text-decoration: none ;color:#000000}
A:hover {text-decoration: none ;color:#000000;}  
fieldset.search {
	border: none;
	width: 156px;
	margin: 0;
	
}
.search input, .search button {
	border: none;
}
.search input.box {
	color: #757575;
	font-family: "Lucida Grande", Tahoma, Arial, Verdana, sans-serif;
	font-size: 13px;
	width: 156px;
	height: 22px;
	background: url(imgzz/pesquisabg.jpg) no-repeat center top ;
	margin-left: 32px;
	
}
.search input.box:focus {
	background: url(imgzz/pesquisabg.jpg) no-repeat center ;
	outline: none;
	
}
.search button.btn:hover {
	background: url(imgzz/lupa.jpg) no-repeat;	
}
/* BUTTONS */

.buttons a, .buttons button{
    display:block;
    float:center;
    margin:0 0px 0 0;
    background-color:#f5f5f5;
    border:1px solid #dedede;
    border-top:1px solid #eee;
    border-left:1px solid #eee;

    font-family:"Lucida Grande", Tahoma, Arial, Verdana, sans-serif;
    font-size:12px;
    text-decoration:none;
    color:#565656;
    cursor:pointer;
}
.buttons button{
	height: 23px;
    width:64px;
    }
.buttons button[type]{
    line-height:17px; /* Safari */
}
*:first-child+html button[type]{
    padding:4px 10px 3px 7px; /* IE7 */
}

/* STANDARD */

button:hover, .buttons a:hover{
    background-color:#dff4ff;
    border:1px solid #c2e1ef;
    color:#336699;
}
.buttons a:active{
    background-color:#6299c5;
    border:1px solid #6299c5;
    color:#fff;
}

h3 {
    font: bold 15px "Lucida Grande", Tahoma, Arial, Verdana, sans-serif;
    color: #000;
    }

/*input
{

	background: #fff;
	border: 1px solid #737373;
	font-family: Verdana, Arial, Helvetica, sans-serif;  
    font-size: 11px;  
	text-align: left;  
}*/
    </style>
    
    
</head>

<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" style="position:relative;overflow:auto;overflow-x: hidden;" onLoad=on_load(linguaatual)>
<div id="copyright" style="display:none;">Copyright &copy; 2010 <a href="http://apycom.com/">Apycom jQuery Menus</a></div>

<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" onLoad=on_load(linguaatual)>
<table width="100%" height="100%"  bgcolor="#f2f2f2" border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td background="imgzz/bodybg.gif" style="background-position: center top;background-repeat: repeat-x;">
			<table width="100%" height="100%" border="0" bordercolor="red" cellspacing="0" cellpadding="0">
				<tr><td>	
						<table align="center" width="977px" border="0" bordercolor="yellow" cellspacing="0" cellpadding="0">
							<tr><td height="56px" width="977px">
								<table border="0" bordercolor="green" cellspacing="0" cellpadding="0" width="977px" >
									<tr height="13px">
									<td align="center" height="13px" valign="bottom" >
									<img src="imgzz/menubgtop.gif" height="13px" align="bottom" style="display: block;">
									</td></tr>
									<tr><td height="70px" width="977px" colspan="0" align="center" >
									<table align="center" bgcolor="white"  height="100%" width="960px" border="0" background="imgzz/topbg.jpg" style="background-repeat: no-repeat;background-position: right bottom;" cellspacing="0" cellpadding="0">
										<tr><td align="center" width="30%">
										<a href="http://www.relato.com.br/">
										<img alt="Home" src="/imgzz/logoneo.jpg" border="0"></a>
										</td><td width="70%" valign="bottom" align="right" style="padding-right:50px;">
										<!-- inicio da pesquisa -->
											
										<!--		<td background="imgzz/pesquisabg.jpg" height="22px" width="156px" style="background-position: center top;background-repeat:no-repeat;">-->
										<!--			<form align="center" name="formpesquisa" method="post" action="pesquisadgs.jsp">-->
										<!--				<img src="imgold/imgrelato/lupawilson.jpg" border="0" style="cursor: pointer;" onClick="formpesquisa.submit();">-->
										<!--				<input type="text" name="tosearch" value="Pesquise aqui" class="pesquisa" >-->
										<!--			</form>  -->
												
												<form name="formpesquisa" method="post" id="searchform" action="pesquisa.jsp">
													<fieldset class="search">
														<input type="text" id="searchfield" name="tosearch" class="box" value="&nbsp; Pesquise aqui"/>
														
													</fieldset>
												</form>
										
										<!-- Fim da pesquisa -->
										
									</td></tr></table>
									</td></tr>
									<tr>
										<td height="43px" width="977px">
											<%
											out.println(GetMenuJquery.renderVisualizacao(mc, true ,idLingua));
											%>
										</td>
									</tr>
								</table>
							</td></tr>
							<tr>
								<td>
									<table align="center" border="0" bgcolor="white" bordercolor="green" height="573px" width="960px" cellspacing="0" cellpadding="0" >
										

										

										<tr>
<!--											<td valign="top" align="left" width="5%">&nbsp&nbsp</td>-->
										<td height="573px" width="23px" background="imgzz/colesq2.jpg" style="background-position: center bottom;background-repeat:no-repeat;">
										    
										</td>
										<td width="668px" height="573px">
								<!-- *************** MEIO *************** -->
												
	<table cellspacing="0" cellpadding="0" border="0" height="100%" width="668px">
	<tr><td height="38px"></td></tr>
	<Tr><TD width="653px" height="533px" background="imgzz/portalbot.jpg" style="background-position: center bottom;background-repeat:repeat-x;padding-bottom:22px;padding-top:0px;" valign="top">
												
												<div style="position:relative;overflow:auto;padding-left:10px ;padding-right:10px;height:600px;width:886px;">
								<!-- *************** MEIO *************** -->
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

	if ("".equals(toSearch.trim()))
		toSearch = "Quer procurar algo ? digite aqui...";

%>

<center>
	<span style="font-family: verdana; font-size: 18px; font-weight: bolder">Pesquisa</span>
</center>
<br>
	<form name="frmSearch" method="post" action="/pesquisa.jsp">
		<table border="0" cellspacing="0" cellpadding="0" align="center">
			<tr> 
		  		<td height="25" align="center"><input class="search" type="text" size="50" name="tosearch" value="<%=toSearch%>">&nbsp;&nbsp;<input class="search" type="submit" name="searchnow" value="pesquisar"></td>
			</tr>
		</table>
	</form>
<%
	if (toSearch.trim().length() <= 0) return;		
	System.out.println(UriUtil.encodeUri(toSearch.trim()));
	String cExpSql = "SELECT id FROM conteudo WHERE (titulo like  '%" + UriUtil.encodeUri(toSearch.trim()) + "%')" +
	" or (texto like '%" + UriUtil.encodeUri(toSearch.trim()) + "%')";

	List list = SqlHelper.execute( cExpSql, null );
	
	if (list.size() == 0) {
%>
<!-- ATÉ AQUI EM CIMA FUNCIONOU -->
		<table border="0" cellspacing="0" cellpadding="0" align="center">
			<tr> 
			  <td height="10" align="center">&nbsp;</td>
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
				<table border="0" cellspacing="0" cellpadding="0" align="center">
					<tr height="10"> 
					  <td valign="middle"><span style="font-family: verdana; font-size: 11px;"><strong> <%=count%> - <%=mytitle%></strong></span></td>
					</tr>
					<tr height="40"> 
					  <td valign="middle" align="justify"><span style="font-family: verdana; font-size: 10px;">
					  <a href="index.jsp?conteudo=<%=idConteudo%>"><%=mystr%></span></a>
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
												
											</TD></Tr>
											
											</table>	
											</td>
											<td width="15px" height="573px" background="imgzz/coldir2.jpg" style="background-position: center bottom;background-repeat:no-repeat;">
											</td>									
<!--											        Lateral Esquerda-->
											<td hvalign="bottom" align="center">
											<table border="0" height="100%" cellspacing="0" cellpadding="0">
											<tr>
											<td background="imgzz/coldirlat.jpg" style="background-position: right bottom;" width="15px" height="100%"></td>
											</tr>
											<tr><td background="imgzz/latbot.jpg" style="background-position: right bottom;" height="17px" width="253px" colspan="2"></td></tr>
											</table>
								            </td>
<!--								                          -->
										</tr>
	 								</table>
								</td>
							</tr>
										<tr>	
											<td height="29px" witdh="100%" background="imgzz/bottom.jpg" align="center" style="background-repeat:no-repeat;background-position:center;">
												<table border="0" height="29px" width="100%" cellspacing="0" cellpadding="0" style="font-size: 13px;font-color:#464543;font-weight:bold;font-family:verdana;">
												<tr height="29px"><Td align="center" width="25%">
												<a href="http://www.relato.com.br/index.jsp?conteudo=5">Fale Conosco
												</a>
												</Td><Td align="center" width="25%" >
												<a href="http://www.relato.com.br/index.jsp?conteudo=47">Envie seu Currículo
												</a>
												</Td><Td align="center" width="25%" >
												<a href="http://www.relato.com.br/login.jsp">Extranet
												</a>
												</Td><Td align="center" width="25%" >
												<a href="http://webmail.relato.com.br/">
												Webmail
												</a>
												</Td></tr>
												
												</table>
											</td>
										</tr>		
							
		 				</table>
					</td>
					
				</tr>
			</table>
		</td> 
		
	</tr>
	
</table>
<div id="copyright" style="display:none;">Copyright &copy; 2010 <a href="http://apycom.com/">Apycom jQuery Menus</a></div>

</body>
</html>
