<%@ page contentType="text/html; charset=windows-1252" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<html>
<head>
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
	<title>Relato Informática</title>
<%
}
%> 

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="google-site-verification" content="V-yiN3lsev9v8Bp_ogIhHp0elN77x9xY9M5iDM86a20" />
<META name="robots" content="index, follow">
<META name="googlebot" content="index, follow">
<meta name="google-site-verification" content="V-yiN3lsev9v8Bp_ogIhHp0elN77x9xY9M5iDM86a20" />

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
	<META name="keywords" content="relatórios,java,microsiga,redução,custos,licenças,logix,totvs,mysql,omriwo,linux,sistema,desenvolvimento,sistemas,informatica,informática,linguagem java,linguagem delphi,ajax,hibernate">
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
	<META name="description" content="Consultoria de informática, especializada em redução de custos de licenças Totvs (Microsiga, Logix, entre outros), utilizamos o topo das tecnologias open-source, Java, Linux, Solaris, virtualização, MySQL, otimizando a relação Custo x Benefício conforme as necessidades dos nossos parceiros.">
<%
}
%> 

	<link rel="stylesheet" href="styles/layout.css" type="text/css" />
 	<link type="text/css" href="menu.css" rel="stylesheet" />
 	<link type="text/css" href="css/custom-theme/jquery-ui-1.8.14.custom.css" rel="stylesheet" />	
 	<link href="css/sub.css" type="text/css" rel="stylesheet" />
 	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
 	<script type="text/javascript" src="js/jquery-ui-1.8.14.custom.min.js"></script>
	<script type="text/javascript" src="menu.js"></script>
	<script type="text/javascript" src="scripts/jquery.jcarousel.pack.js"></script>
	<script type="text/javascript" src="scripts/jquery.jcarousel.setup.js"></script>
	<script type="text/javascript" src="js/jquery.backgroundPosition.js"></script> 
	<script type="text/javascript" src="js/main.js"></script> 
	<script src="/src/jquery.infieldlabel.min.js" type="text/javascript" charset="utf-8"></script> 
	<script type="text/javascript" charset="utf-8"> 
		$(function(){ $("label").inFieldLabels(); });
	</script>
	<script language="javascript">
	<!--
	$(document).ready(function()
	{
	    $(".defaultText").focus(function(srcc)
	    {
	        if ($(this).val() == $(this)[0].title)
	        {
	            $(this).removeClass("defaultTextActive");
	            $(this).val("");
	        }
	    });
	    
	    $(".defaultText").blur(function()
	    {
	        if ($(this).val() == "")
	        {
	            $(this).addClass("defaultTextActive");
	            $(this).val($(this)[0].title);
	        }
	    });
	    
	    $(".defaultText").blur();        
	});
	//-->
	</script>
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
		<!--	formPesquisa \/		-->
		<style type="text/css">
			.searchbox{width:120px;height:18px;padding:0px;margin:0px;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAAkCAQAAADoITbVAAAAAnNCSVQICFXsRgQAAAAJcEhZcwAACxIAAAsSAdLdfvwAAAAYdEVYdFNvZnR3YXJlAEFkb2JlIEZpcmV3b3Jrc0+zH04AAAAWdEVYdENyZWF0aW9uIFRpbWUAMDcvMDIvMDfvF4TGAAAEEXRFWHRYTUw6Y29tLmFkb2JlLnhtcAA8P3hwYWNrZXQgYmVnaW49IiAgICIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/Pgo8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA0LjEtYzAzNCA0Ni4yNzI5NzYsIFNhdCBKYW4gMjcgMjAwNyAyMjozNzozNyAgICAgICAgIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6eGFwPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIj4KICAgICAgICAgPHhhcDpDcmVhdG9yVG9vbD5BZG9iZSBGaXJld29ya3MgQ1MzPC94YXA6Q3JlYXRvclRvb2w+CiAgICAgICAgIDx4YXA6Q3JlYXRlRGF0ZT4yMDA3LTA3LTAyVDE5OjU0OjA5WjwveGFwOkNyZWF0ZURhdGU+CiAgICAgICAgIDx4YXA6TW9kaWZ5RGF0ZT4yMDA4LTA0LTA2VDE0OjA1OjQ5WjwveGFwOk1vZGlmeURhdGU+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iPgogICAgICAgICA8ZGM6Zm9ybWF0PmltYWdlL3BuZzwvZGM6Zm9ybWF0PgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICCwvYuVAAABeklEQVRo3uXYu4rCUBSF4f1GyRskb5cmTYQ0NrGwmCDYRLFQJghe0DRhQsA46gFvoEFOLMRyTRFlMo5PcPZeReqPVOcn0HOWaTUsYUGxCathmb/Kx8fW7dBFB2N8KbYxOnBhh7ZeATu6I0fIFd4IjnT0B9jVXZlD9cvhSlcHEageJuBwCeohiDyzBS7XgmdS01uzAa/R9MgXkg1YwhfUBqdrgwJW4ADUE1c23Ct6ggbekQ34iIFHQ2PGBjzD0CDQJDwy+b+TEESgSIvkTXnuDZGMtMfjIdZieVaae0YsY63yPEy1NFzigrty1DsuWCINU+3PexgEyozMy0QGxSYyLzP+BQCWxaOGD3Txqdi6+EDtXfHo41vh9V+Lh0Ch+ES1eMyV5xYoMH8WD58Ft0ABvyweCRtwUhaPHRvwriweBaO1QQErcADqiQMb7qEsHis24FVZPKZswNNn8diw4G6qxeOkPPf0Wjy2SnO374rHAnvkylFz7LHgXDx+ABQhwnyxeq9PAAAAAElFTkSuQmCC) 0 0 no-repeat}.default-search div.searchbox:hover{background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAAkCAQAAADoITbVAAAAAnNCSVQICFXsRgQAAAAJcEhZcwAACxIAAAsSAdLdfvwAAAAYdEVYdFNvZnR3YXJlAEFkb2JlIEZpcmV3b3Jrc0+zH04AAAAWdEVYdENyZWF0aW9uIFRpbWUAMDcvMDIvMDfvF4TGAAAEEXRFWHRYTUw6Y29tLmFkb2JlLnhtcAA8P3hwYWNrZXQgYmVnaW49IiAgICIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/Pgo8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA0LjEtYzAzNCA0Ni4yNzI5NzYsIFNhdCBKYW4gMjcgMjAwNyAyMjozNzozNyAgICAgICAgIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6eGFwPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIj4KICAgICAgICAgPHhhcDpDcmVhdG9yVG9vbD5BZG9iZSBGaXJld29ya3MgQ1MzPC94YXA6Q3JlYXRvclRvb2w+CiAgICAgICAgIDx4YXA6Q3JlYXRlRGF0ZT4yMDA3LTA3LTAyVDE5OjU0OjA5WjwveGFwOkNyZWF0ZURhdGU+CiAgICAgICAgIDx4YXA6TW9kaWZ5RGF0ZT4yMDA4LTA0LTA2VDE0OjA1OjQ5WjwveGFwOk1vZGlmeURhdGU+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iPgogICAgICAgICA8ZGM6Zm9ybWF0PmltYWdlL3BuZzwvZGM6Zm9ybWF0PgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICCwvYuVAAABeklEQVRo3uXYu4rCUBSF4f1GyRskb5cmTYQ0NrGwmCDYRLFQJghe0DRhQsA46gFvoEFOLMRyTRFlMo5PcPZeReqPVOcn0HOWaTUsYUGxCathmb/Kx8fW7dBFB2N8KbYxOnBhh7ZeATu6I0fIFd4IjnT0B9jVXZlD9cvhSlcHEageJuBwCeohiDyzBS7XgmdS01uzAa/R9MgXkg1YwhfUBqdrgwJW4ADUE1c23Ct6ggbekQ34iIFHQ2PGBjzD0CDQJDwy+b+TEESgSIvkTXnuDZGMtMfjIdZieVaae0YsY63yPEy1NFzigrty1DsuWCINU+3PexgEyozMy0QGxSYyLzP+BQCWxaOGD3Txqdi6+EDtXfHo41vh9V+Lh0Ch+ES1eMyV5xYoMH8WD58Ft0ABvyweCRtwUhaPHRvwriweBaO1QQErcADqiQMb7qEsHis24FVZPKZswNNn8diw4G6qxeOkPPf0Wjy2SnO374rHAnvkylFz7LHgXDx+ABQhwnyxeq9PAAAAAElFTkSuQmCC) 0 -18px no-repeat}
			.default-search div.searchbox:hover
			input{color:#000}
			.default-search div.searchbox input:focus{color:#000}
			.default-search div.searchbox
			input{width:102px;height:15px;padding:3px
			0px 0px 0px;border:none;outline:none;background:none;float:left;color:#646464;font-size:11px}.default-search div.searchbox
			button{width:18px;height:18px;padding:0px;border:none;float:left;cursor:pointer;line-height:0px}.default-search div.searchbox button.search-magnifier{background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAMAAABhEH5lAAAAA3NCSVQICAjb4U/gAAAAnFBMVEX////4+Pjy8vLx8fHv7+/u7u7m5ubk5OTi4uLY2NjX19fV1dXU1NTR0dHQ0NDPz8/Ozs7Hx8fGxsbFxcW/v7+5ubm3t7e0tLSzs7Otra2np6empqalpaWkpKSjo6OgoKCfn5+enp6dnZ2bm5uampqZmZmWlpaVlZWUlJSTk5OSkpKRkZGQkJCPj4+Ojo6MjIyDg4OCgoJ8fHz/AP8bSzo8AAAANHRSTlP///////////////////////////////////////////////////////////////////8AS1ciZQAAAAlwSFlzAAALEgAACxIB0t1+/AAAABh0RVh0U29mdHdhcmUAQWRvYmUgRmlyZXdvcmtzT7MfTgAAABZ0RVh0Q3JlYXRpb24gVGltZQAwNy8wMi8wN+8XhMYAAAQRdEVYdFhNTDpjb20uYWRvYmUueG1wADw/eHBhY2tldCBiZWdpbj0iICAgIiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+Cjx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDQuMS1jMDM0IDQ2LjI3Mjk3NiwgU2F0IEphbiAyNyAyMDA3IDIyOjM3OjM3ICAgICAgICAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczp4YXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iPgogICAgICAgICA8eGFwOkNyZWF0b3JUb29sPkFkb2JlIEZpcmV3b3JrcyBDUzM8L3hhcDpDcmVhdG9yVG9vbD4KICAgICAgICAgPHhhcDpDcmVhdGVEYXRlPjIwMDctMDctMDJUMTk6NTQ6MDlaPC94YXA6Q3JlYXRlRGF0ZT4KICAgICAgICAgPHhhcDpNb2RpZnlEYXRlPjIwMDgtMDQtMDZUMTQ6MDU6NDlaPC94YXA6TW9kaWZ5RGF0ZT4KICAgICAgPC9yZGY6RGVzY3JpcHRpb24+CiAgICAgIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiCiAgICAgICAgICAgIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyI+CiAgICAgICAgIDxkYzpmb3JtYXQ+aW1hZ2UvcG5nPC9kYzpmb3JtYXQ+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICA8L3JkZjpSREY+CjwveDp4bXBtZXRhPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgILC9i5UAAAB7SURBVBiVYzDGAAyUCTGLKKkrCjMiCTGLa+np6WhJMCOEhNUV+Nn5lDQEEUJS6rwMDAycatIIIVV1NqAQq5oKQkhekwcoxKUhixAS0lIVYOFWMBBFslFSV0td29BIhwPhLiYhGWV5MR0DfTY013PoG2qge4hNQ46SkAAABB83luuG7JEAAAAASUVORK5CYII=) 0 0 no-repeat}
		</style>
		<style type="text/css">
			/*demo page css*/
			#portal {height:auto;width:96%;border:0px solid #000;overflow:auto;font-size:0.84em;margin:auto;padding:0;}
			
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
			    margin:0 ;
			    font-family:"Lucida Grande", Tahoma, Arial, Verdana, sans-serif;
			    font-size:12px;
			    text-decoration:none;
			    cursor:pointer;
			}
			.buttons {
				border:0px solid #fff;
				vertical-align:top;
				padding-left:20px;
			}
			.buttons button{
				height: 23px;
				width: 70px;
			    display: block;
				padding: 0 0 2px 0;
				text-decoration: none;
				text-align: center;
				text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.8);
				font-weight: bold;
				color: #ffffff;
				background:	#1fbdff url(/images/button-bg.png) 0 -183px repeat-x; // 
				-moz-border-radius: 5px;  
			 	-webkit-border-radius: 5px;
			 	border: 1px solid #28537d;
				float: right;
				margin: 0;
			    }
			.buttons button[type]{
			    line-height:17px; /* Safari */
			}
			*:first-child+html button[type]{
			    padding:4px 10px 3px 7px; /* IE7 */
			}
			
			/* STANDARD */
			
			button:hover, .buttons a:hover{
			    border:1px solid #fff;
			    color:#fff;
			}
			.buttons a:active{
			  	border:1px solid #fff;
			    color:#fff;
			}
		
		</style>	
		<script type="text/javascript">

		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-25295676-2']);
		  _gaq.push(['_trackPageview']);
		
		  (function() {
		    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();

		</script>
		
</head>
<body id="top">
<!-- ####################################################################################################### -->
<div class="wrapper col1">
  <div id="header">
    <div id="logo">
      <a href="/index.jsp">
      	<img src="/images/logo_9.png">
	<!--
		<img src="/images/relatologoroxo.png">
	-->
      </a>
    </div>
<div id="topnav">
	<%
	out.println(GetMenuJquery.renderVisualizacao(mc, true ,idLingua));
	%>
</div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col2">
  <div id="featured_slide">
    <div id="featured_content">
      <ul>
        <li><img src="images/demo/img8.jpg" alt="" class="shadow"/>
          <div class="floater">
            <h2>Conheça a Relato !</h2>
            <p>Nossa proposta é oferecer uma melhor qualidade tecnológica por um investimento muito menor.
             Somos uma empresa especializada em desenvolvimento de sistemas, e utilizamos as tecnologias top do mercado.</p>
            <p class="readmore"><a href="/index.jsp?u=sobre_a_empresa" id="botaolink">Continue Lendo &raquo;</a></p>
          </div>
        </li>
        <li><img src="images/demo/java-code1.jpg" alt="" class="shadow"/>
          <div class="floater">
            <h2>Sistemas.</h2>
            <p>Desenvolvemos sistemas sob encomenda utilizando preferencialmente a linguagem Java, mas podemos utilizar também as linguagens Delphi, C++ e C# para funcionalidades específicas.Possuímos um framework próprio (conjunto de componentes escritos em Java e ferramentas) que nos proporciona alta produtividade ... </p>
            <p class="readmore"><a href="/index.jsp?u=desenvolvimento_de_sistemas" id="botaolink">Continue Lendo &raquo;</a></p>
          </div>
        </li>
        <li><img src="images/demo/img3.jpg" alt="" class="shadow"/>
          <div class="floater">
            <h2>Relatórios Gerenciais</h2>
            <p>Facilite a tomada de decisões, solicite um relatório gerencial e visualize as informações em tempo real, a Relato Informática empresa especializada em desenvolvimentos de sistemas, garante a integridade das suas informações.</p>
            <p class="readmore"><a href="/index.jsp?u=eis_e_business_intelligence" id="botaolink">Continue Lendo &raquo;</a></p>
          </div>
        </li>
        <li><img src="images/demo/img11.jpg" alt="" class="shadow"/>
          <div class="floater">
            <h2>Cloud Computing</h2>
            <p>O conceito de computação em nuvem (em inglês, cloud computing) refere-se à utilização da memória e das capacidades de armazenamento e cálculo de computadores e servidores compartilhados e interligados por meio da Internet, seguindo o princípio da computação em grade.</p>
            <p class="readmore"><a href="/index.jsp" id="botaolink">Continue Lendo &raquo;</a></p>
          </div>
        </li>
        <li><img src="images/demo/img5.jpg" alt="" class="shadow"/>
          <div class="floater">
            <h2>Storage</h2>
            <p>Na computação, uma Rede de área de armazenamento (em inglês Storage Area Network ou SAN) é uma rede projetada para agrupar dispositivos de armazenamento de computador. As SANs são mais comuns nos armazenamentos de grande porte.</p>
            <p class="readmore"><a href="/index.jsp" id="botaolink">Continue Lendo &raquo;</a></p>
          </div>
        </li>
      </ul>
    </div>
    <a href="javascript:void(0);" id="featured-item-prev"><img src="images/prev.png" alt="" /></a> <a href="javascript:void(0);" id="featured-item-next"><img src="images/next.png" alt="" /></a> </div>
</div>

<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="container">
   <div class="homepage">
<%
	if ( idConteudo != 1 ){ 
		if ( "true".equals(request.getParameter("permission")) )
			out.print(UriUtil.decodeUri(cm.getContent(idConteudo,idLingua)));
		else
			out.print(UriUtil.decodeUri(cm.getContentIndex(idConteudo,idLingua)));
	}else{
%>
		<%@include file="portal.jsp"%>
<%
	}
%> 
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="footer">
    <div class="box1">
      <h2>Sobre a Relato</h2>
     	<a href="/index.jsp?u=sobre_a_empresa" style="color:#fff;"><img class="imgl" src="images/AboutUsImage.jpg" alt="" /></a>
  		<a href="/index.jsp?u=sobre_a_empresa" style="color:#fff;"><p>&nbsp;&nbsp;&nbsp;&nbsp;A Relato atua, diretamente ou por meio de seus parceiros, em vários segmentos da informática. Juntos  desenvolvemos novos sistemas para internet, auditoria, integração e rotinas de apoio a sistemas existentes, infraestrutura, servidores, ... </p>
      	</a>
    </div>
    <div class="box contactdetails">
      <h2>Extranet</h2>
      <table border="0" bordercolor="red" align="center" style="padding-right:10px;">
		<tr>
			<td valign="top" >
				<form name="formExtraLogin" method="post" action="" target="_top">
					<fieldset> 
					<input name="context" id="context" type="hidden" value="htmleditor">
						<table width="200px" border="0" bordercolor=white cellspacing="0" cellpadding="0" align="center">
							<tr>
								<td width="30px" background="images/user-icon.png" style="background-position: center;background-repeat: no-repeat;"></td>
								<td style="padding: 0;">
						 			<div class="inputWrap">
						 				<p>
						 				<label for="username">Usuário</label>
				      					<input name="user" id="username" type="text" size="19" maxlength="40"/>
				      					</p>	
				    				</div>
   								</td>
							</tr>
							<tr>
								<td width="30px" background="images/lock-icon.png" style="background-position: center;background-repeat: no-repeat;"></td>
								<td style="padding: 0;">
									<div class="inputWrap" >
										<p>
										<label for="password">Senha</label>
				    					<input name="pass" id="password" type="password" size="19" maxlength="40"/>
				    					</p>
				    				</div>
				    				
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center" valign="top" class="estilo">
									<!-- 
								<input type="submit" style="text-indent: 3px;" name="area" value="Extranet" class="botaologin" onClick="formExtraLogin.action = '/login';" onmouseover="this.className='botaologinover'" onmouseout="this.className='botaologin'">
								<input type="reset" style="text-indent: 3px;" name="webmail" value="Limpar" class="botaologin" onmouseover="this.className='botaologinover'" onmouseout="this.className='botaologin'">
									 -->
									<div class="buttons">
										<table style="margin:auto;border:0px solid #fff;"><tr><td>
						    				<button type="submit" style="text-indent: 1px;" name="area" value="Extranet" onClick="formExtraLogin.action = '/login';" onmouseover="this.className='botaologinover'" onmouseout="this.className='botaologin'">
										        Extranet
										    </button>
										    </td><td>
											 <button type="reset" style="text-indent: 1px;" name="webmail" value="Limpar" onmouseover="this.className='botaologinover'" onmouseout="this.className='botaologin'">
										        Limpar
										    </button>
										<% if ( request.getSession().getAttribute("errologin") != null ){out.print("<br><span class='erro'><b>" + request.getSession().getAttribute("errologin") + "</span></b>"); request.getSession().setAttribute("errologin", null); }%>
										</td></tr></table>		
									</div>
								</td>
							</tr>
						</table>
					</fieldset>
				</form>
			</td>
		</tr>
	</table>	
     <!--  
      <ul>
        <li>Company Name</li>
        <li>Street Name &amp; Number</li>
        <li>Town</li>
        <li>Postcode/Zip</li>
        <li>Tel: xxxxx xxxxxxxxxx</li>
        <li>Fax: xxxxx xxxxxxxxxx</li>
        <li>Email: info@domain.com</li>
        <li class="last">LinkedIn: <a href="#">Company Profile</a></li>
      </ul>
      --> 
    </div>
    <div class="box flickrbox">
      <h2>Contato</h2>
      <div class="wrap">
        <ul>
	        <li><a href="http://www.relato.net.br/wordpress/" class="linkbottom">&raquo; Acesse aqui nosso Blog</a></li>
	        <li><a href="http://www.relato.net.br/phpBB3/" class="linkbottom">&raquo; Acesse aqui nosso Forum</a></li>
	        <li><a href="/index.jsp?u=fale_conosco" class="linkbottom">&raquo; Fale Conosco</a></li>
	        <li><a href="/trabalheconosco.jsp" class="linkbottom">&raquo; Envie seu Currículo</a></li>
	        <li><a href="/login.jsp" class="linkbottom">&raquo; Extranet</a></li>
	        <li><a href="http://webmail.relato.com.br/roundcube/" class="linkbottom">&raquo; Webmail</a></li>
	        <li><a href="http://maps.google.com.br/maps?q=Av.+Ipiranga,+1097+14%C2%BA+andar+Cj.143+Bairro:+Rep%C3%BAblica+S%C3%A3o+Paulo/SP&um=1&ie=UTF-8&hq=&hnear=0x94ce5850906ebbb5:0xec5c9b674ba19411,Av.+Ipiranga,+1097+-+Rep%C3%BAblica,+S%C3%A3o+Paulo,+01039-000&gl=br&ei=36YkTuHGKurw0gGY-riyCg&sa=X&oi=geocode_result&ct=title&resnum=1&ved=0CBcQ8gEwAA" class="linkbottom">&raquo; <u>Nosso Endereço</u> - Cep:01039-904 </a></li>
	        <li><a href="#" class="linkbottom">&raquo; Tel:(11)3229-6439</a></li>
        </ul>
      </div>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col5">
  <div id="copyright">
    <p class="fl_left">Copyright &copy; 2011 - Todos os direitos reservados - Relato informática</p>
<!--     <p class="fl_right">Template by <a href="http://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p> -->
    <br class="clear" />
  </div>
</div>
<div id="copyright" style="display:none;">Copyright &copy; 2011 <a href="http://apycom.com/">Apycom jQuery Menus</a></div>
</body>
</html>
