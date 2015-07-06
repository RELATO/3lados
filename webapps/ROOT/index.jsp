<!DOCTYPE html>
<%@ page contentType="text/html; charset=windows-1252" %>
<%@ page import="system.*" %>
<%@ page import="br.com.relato.util.SqlHelper" %>
<%@ page import="br.com.relato.EntryPoint" %>
<%@ page import="br.com.relato.portal.Novidade" %>
<%@ page import="br.com.relato.portal.ControlPortal" %>
<%@ page import="java.util.*" %>

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
	String urlConteudo;
	int idConteudo;
	int idLingua;
	int idLinguaX;

	try {
		urlConteudo = (request.getParameter("u") != null ? request.getParameter("u") : "");
	}catch ( Exception e ) {
		urlConteudo = "";
	}
	
	try {
		idConteudo = (request.getParameter("conteudo") != null ? Integer.parseInt(request.getParameter("conteudo")) : 1);
	}catch ( Exception e ) {
		idConteudo = 1;
	}
	
	if(!"".equals(urlConteudo)){
		int idFind = cm.getConteudoUrl(urlConteudo);
		if(idFind != -1){
			idConteudo = idFind;
		}
	}
	
	try {
		idLinguaX = (request.getParameter("lingua") != null ? Integer.parseInt(request.getParameter("lingua")) : 0);
	}catch ( Exception e ) {
		idLinguaX = 0;
	}
	
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
	
	java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z");
	String text = sdf.format(date);
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br" dir="ltr" >
<head profile="http://gmpg.org/xfn/11">
<link rel="icon" type="image/x-icon" href="/favicon.png" />
<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" />

<%
if ( idConteudo != 1 ){ 
	if ( "true".equals(request.getParameter("permission")) ){
%>
	<title><%=UriUtil.decodeUri(cm.getTitulo(idConteudo,idLingua))%></title>
<%	
	}else{
%>
	<title><%=UriUtil.decodeUri(cm.getTituloIndex(idConteudo))%></title>
<%
	}
}else{
%>
	<title>3 Lados - Soluções Empresariais Integradas</title>
<%
}
%> 

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
<META NAME="TITLE" CONTENT="3 Lados - Soluções Empresariais Integradas">
<meta http-equiv="imagetoolbar" content="no" />
<META name="robots" content="index, follow">
<META name="googlebot" content="index, follow">
<META NAME="DC.title" CONTENT="3 Lados - Soluções Empresariais Integradas">
<META NAME="Unknownrobot"   CONTENT="index,follow,all">

<%
if ( idConteudo != 1 ){ 
	if ( "true".equals(request.getParameter("permission")) ){
%>
	<META name="keywords" content="<%=UriUtil.decodeUri(cm.getKeywords(idConteudo,idLingua))%>">
<%	
	}else{
%>
	
	<META name="keywords" content="<%=UriUtil.decodeUri(cm.getKeywords(idConteudo))%>">
<%
	}
}else{
%>
	<META name="keywords" content="">
<%
}
%> 

<%
if ( idConteudo != 1 ){ 
	if ( "true".equals(request.getParameter("permission")) ){
%>
	<META name="description" content="<%=UriUtil.decodeUri(cm.getDescricao(idConteudo,idLingua))%>">
<%	
	}else{
%>
	
	<META name="description" content="<%=UriUtil.decodeUri(cm.getDescricao(idConteudo))%>">
	
<%
	}
}else{
%>
	<META name="description" content="">
<%
}
%>

		<link rel="stylesheet" href="styles/layout.css" type="text/css" />
		<link type="text/css" href="menu.css" rel="stylesheet" />
	    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
		<script type="text/javascript" src="scripts/jquery.defaultvalue.js"></script>
		<script type="text/javascript" src="scripts/jquery-ui-1.8.13.custom.min.js"></script>
		<script type="text/javascript" src="scripts/jquery.scrollTo-min.js"></script>
		<script type="text/javascript">
		$(document).ready(function () {
		    $("#fullname, #validemail, #message").defaultvalue("Nome", "Email", "Messagem");
		    $('#shout a').click(function () {
		        var to = $(this).attr('href');
		        $.scrollTo(to, 1200);
		        return false;
		    });
		    $('a.topOfPage').click(function () {
		        $.scrollTo(0, 1200);
		        return false;
		    });
		    $("#tabcontainer").tabs({
		        event: "click"
		    });
		});
		</script>
		<!-- Homepage Only Scripts -->
		<script type="text/javascript" src="scripts/jquery.cycle.min.js"></script>
		<script type="text/javascript" src="scripts/jquery.cycle.setup.js"></script>
		<script type="text/javascript" src="scripts/piecemaker/swfobject/swfobject.js"></script>
		<script type="text/javascript">
		var flashvars = {};
		flashvars.cssSource = "scripts/piecemaker/piecemaker.css";
		flashvars.xmlSource = "scripts/piecemaker/piecemaker.xml";
		var params = {};
		params.play = "false";
		params.menu = "false";
		params.scale = "showall";
		params.wmode = "transparent";
		params.allowfullscreen = "true";
		params.allowscriptaccess = "sameDomain";
		params.allownetworking = "all";
		swfobject.embedSWF('scripts/piecemaker/piecemaker.swf', 'piecemaker', '690', '200', '10', null, flashvars, params, null);
		</script>
		<script type="text/javascript" src="menu.js"></script>
		
		<script type="text/javascript">
			 setInterval(
						
					 function() {
					     $('#ticker div').each(function() {
					         $(this).animate({
					             'top': '-=1px'
					         }, 50, function() {
					             var top = parseInt($(this).css('top').replace('px', '')) +
					                         parseInt($(this).css('height').replace('px', ''));
					             if (top < 0) {
					                 //console.log('removing', this)
					                 var clone = $(this).clone();
					                 var parent = $(this).parent();
					                 clone.css('top', '0px');
					                 $(this).remove();
					                 parent.append(clone);
					             }
					         })
					     })
					 }, 40)
		 </script>
		 <style type="text/css">
		 	#ticker {
			    height: 250px;
			    width:268px;
			    overflow: hidden;
			    margin:auto;
			}
			
			#ticker div {
			    position: relative;
			    padding: 10px;
			    top: 0px;
			}
			
			#ticker div img {
			    display: block;
			    margin:70px auto;
			    
			}
		 </style>
		


</head>
<body id="top" >
		<div class="wrapper col1">
		</div>
		<!-- ####################################################################################################### -->
		<div class="wrapper col2">
		  <div id="header" class="clear">
		    <div class="fl_left">
		      <img id="logo" src="img/3lados.png">
		    </div>
		    
		    <div id="piecemaker">
<!-- 		    	<img src="images/demo/piecemaker/960x360.gif" alt="" /> -->
		    </div>
		    
		  </div>
		</div>
		<!-- ####################################################################################################### -->
		<div class="wrapper col25">
		     	<%
				out.println(GetMenuJquery.renderVisualizacao(mc, true ,idLingua));
				%>
		</div>
		<!-- ####################################################################################################### -->
		<div class="wrapper col3">
		 
		</div>
		<!-- ####################################################################################################### -->
		<div class="wrapper col4">
		  <div id="container" class="clear">
		    <!-- ####################################################################################################### -->
		    <h2 style="font-style:normal;margin-left:auto;margin-right:auto;margin-top:-24px;text-align:center;padding-left:430px;"><%=checkNull(map, "titulo3", lingua)%></h2>
				<div id="homepage" class="clear">
					<div class="fl_left" >
						<div id="txportal">
						 	<%
						         if ( idConteudo != 1 ){ 
						             if ( "true".equals(request.getParameter("permission")) )
						                 out.print(UriUtil.decodeUri(cm.getContent(idConteudo,idLingua)));
						             else
						                 out.print(UriUtil.decodeUri(cm.getContentIndex(idConteudo,idLingua)));
						         }else{
						         
						          out.print(UriUtil.decodeUri(cm.getContent(idConteudo,idLingua)));
						         }
						     %>
						</div>
					</div>
					<div class="fl_right">
					<div  id="pdireita">
						
						<%=checkNull(map, "texto3", lingua)%>
						<div id="logoptable" valign="bottom"><img src="img/logop.png" alt="" id="logop" border="0" /></div>
						
					</div>
				</div>
			</div>	
		    <!-- ####################################################################################################### -->
		  </div>
		</div>
		<!-- ####################################################################################################### -->
		<div class="wrapper">
		  <div id="footer" class="clear">
		    <div class="fl_left">
		    <!-- 
		      <div class="about_us border">
		        <h2>About Us</h2>
		        <p>Sednulla nam nibh a nibh eu urna facinia mauristibulus sit urna. Vitaerisus lobortis proin elit et curabituris elit estibulum cursus iacus orci. Dignissimmorbi rhoncus sed netus ligula conseque netus nulla aliquat id dui. Ipsumintesque venean hendiment enim nis maecenas justo justo vitae purus sed. Rutrumcondimentumsan elit.</p>
		      </div>
		    --> 
		      <div id="contact" class="clear">
		        <h2>Fale Conosco</h2>
		        <div class="fl_left">
		          <form method="post" action="/enviaemail.jsp">
		            <label for="fullname">Nome:</label>
		            <input type="text" name="fullname" id="fullname" value="" />
		            <label for="validemail">Email:</label>
		            <input type="text" name="validemail" id="validemail" value="" />
		            <label for="message">Menssagem:</label>
		            <textarea name="message" id="message" cols="45" rows="10"></textarea>
		            <button type="submit" value="submit"><span>Enviar</span></button>
		            <input name="destform" type=HIDDEN NAME=Escondido value="gabriellontra@gmail.com" />
		          </form>
		        </div>
		        <div class="fl_right">
		          <!-- 
		          <address>
		          <strong class="title">Company Name</strong><br />
		          Street Name &amp; Number<br />
		          Town<br />
		          Postcode/Zip
		          </address>
		           -->
		          <ul>
		            <li><strong class="title">Tel:</strong><br />
		              55 (61) 8228-8808</li>
		            <li><strong class="title">Email:</strong><br />
		              <a href="mailto:contato@3lados.com.br">contato@3lados.com.br</a></li>
		          </ul>
		        </div>
		      </div>
		    </div>
		    <!-- ####################################################################################################### -->
		    <div class="fl_right">
		      <h2>Redes Sociais</h2>
		      <ul class="socialize">
		        <li><span><%=checkNull(map,"noticia1",1)%></span> <a href="http://<%=checkNull(map,"linknoticia1",1)%>"><%=checkNull(map,"linknoticia1",1)%></a></li>
		        <li><span><%=checkNull(map,"noticia2",1)%></span> <a href="http://<%=checkNull(map,"linknoticia2",1)%>"><%=checkNull(map,"linknoticia2",1)%></a></li>
		        <li class="last"><span><%=checkNull(map,"noticia3",1)%></span> <a href="http://<%=checkNull(map,"linknoticia3",1)%>"><%=checkNull(map,"linknoticia3",1)%></a></li>
		      </ul>
		  	  <div><a href="/login.jsp" id="botaolink">Login Extranet</a></div>
		    </div>
		  </div>
<!-- 		  <div id="backtotop"><a href="#top" class="topOfPage">To The Top</a></div> -->
		</div>
		<!-- ####################################################################################################### -->
		<div class="wrapper">
		  <div id="copyright" class="clear">
		    <p class="fl_left">Copyright &copy; 2012 - Todos os direitos reservados - <a href="#">3 Lados</a></p>
<!-- 		    <p class="fl_right">Template by <a href="http://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p> -->
		  </div>
		</div>
		<!--[if lt IE 8]>
		  <script src="http://ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
		  <script>window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
		<![endif]-->
	</body>
</html>



