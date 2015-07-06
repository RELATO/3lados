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

	int idConteudo;
	int idLingua;
	int idLinguaX;
	
	try {
		idConteudo = (request.getParameter("conteudo") != null ? Integer.parseInt(request.getParameter("conteudo")) : 1);
	}catch ( Exception e ) {
		idConteudo = 1;
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
<title>Relato Informática</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<META name="robots" content="index, follow">
<META name="googlebot" content="index, follow">
<META name="keywords" content="relatórios,java,microsiga,redução,custos,licenças,logix,totvs,mysql,omriwo,linux,sistema,desenvolvimento,sistemas,informatica,informática,linguagem java,linguagem delphi,ajax,hibernate">
<META name="description" content="Consultoria de informática, especializada em redução de custos de licenças Totvs (Microsiga, Logix, entre outros), utilizamos o topo das tecnologias open-source, Java, Linux, Solaris, virtualização, MySQL, otimizando a relação Custo x Benefício conforme as necessidades dos nossos parceiros.">
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
</head>
<body id="top">
<!-- ####################################################################################################### -->
<div class="wrapper col1">
  <div id="header">
    <div id="logo">
      <a href="#">
      	<img src="/images/relatologo4.png">
<!-- 		<img src="/images/relatologoroxo.png"> -->
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
        <li><img src="images/demo/img2.jpg" alt="" class="shadow"/>
          <div class="floater">
            <h2>Conheça a Relato !</h2>
            <p>Nossa proposta é oferecer uma melhor qualidade tecnológica por um investimento muito menor.
             Somos uma empresa especializada em desenvolvimento de sistemas, e utilizamos as tecnologias top do mercado.</p>
            <p class="readmore"><a href="#" id="botaolink">Continue Lendo &raquo;</a></p>
          </div>
        </li>
        <li><img src="images/demo/java-code1.jpg" alt="" class="shadow"/>
          <div class="floater">
            <h2>Sistemas.</h2>
            <p>Desenvolvemos sistemas sob encomenda utilizando preferencialmente a linguagem Java, mas podemos utilizar também as linguagens Delphi, C++ e C# para funcionalidades específicas.Possuímos um framework próprio (conjunto de componentes escritos em Java e ferramentas) que nos proporciona alta produtividade ... </p>
            <p class="readmore"><a href="#" id="botaolink">Continue Lendo &raquo;</a></p>
          </div>
        </li>
        <li><img src="images/demo/img3.jpg" alt="" class="shadow"/>
          <div class="floater">
            <h2>Relatórios Gerenciais</h2>
            <p>Facilite a tomada de decisões, solicite um relatório gerencial e visualize as informações em tempo real, a Relato Informática empresa especializada em desenvolvimentos de sistemas, garante a integridade das suas informações.</p>
            <p class="readmore"><a href="#" id="botaolink">Continue Lendo &raquo;</a></p>
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

		<TABLE height="100%" cellSpacing=0 cellPadding=2 width="60%" align=center bgColor="#dbdbdb" border=0>

<TBODY>
<SCRIPT language=JavaScript>
function validateCadastro(){
if(document.frmcurriculo.nome.value == ""){
alert('Favor Preencher o campo Nome!');
document.frmcurriculo.nome.focus();
return false;
}
if(document.frmcurriculo.email.value == ""){
alert('Favor Preencher o campo E-Mail!');
document.frmcurriculo.email.focus();
return false;
}
if(document.frmcurriculo.fone.value == ""){
alert('Favor Preencher o Telefone!');
document.frmcurriculo.fone.focus();
return false;
}
if(document.frmcurriculo.uploaded.value == ""){
alert('Favor Preencher o Currículo!');
document.frmcurriculo.uploaded.focus();
return false;
}
 return true;
}
</SCRIPT>
<FORM id=frmcurriculo name=frmcurriculo onsubmit="return validateCadastro()" action=gravacurriculo.jsp method=post>
<TR>
<TD vAlign=top bgColor=#dbdbdb colSpan=2 >
<DIV align="center"><font color="#16456e" size="5"><h3>Trabalhe Conosco</h3></font></DIV></TD></TR>
<TR>
<TD vAlign=center bgColor=#dbdbdb colSpan=2>
<DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" color=#808080 size=1><STRONG>OBS: Os campos com * são de preenchimento obrigatório</STRONG></FONT></DIV></TD></TR>
<TR>
<TD vAlign=top colSpan=2 height=1>
<DIV align=right></DIV></TD></TR>
<TR>
<TD vAlign=center width=102 bgColor=#dbdbdb>
<DIV align=right><FONT face="Verdana, Arial, Helvetica, sans-serif" size=2><STRONG><FONT face="Verdana, Arial, Helvetica, sans-serif" color=#00125e size=2>*Nome:</FONT></STRONG></DIV></FONT></TD>
<TD vAlign=top width=390 bgColor=#dbdbdb>
<DIV align=left><FONT face="Verdana, Arial, Helvetica, sans-serif" size=2><STRONG><FONT face="Verdana, Arial, Helvetica, sans-serif" size=2><INPUT id=nome size=39 name=nome> </FONT></STRONG></FONT></DIV></TD></TR>
<TR>
<TD vAlign=center>
<DIV align=right><FONT size=2><STRONG><FONT face="Verdana, Arial, Helvetica, sans-serif" color=#00125e>Sexo:</FONT></STRONG></FONT></DIV></TD>
<TD vAlign=center><FONT face="Verdana, Arial, Helvetica, sans-serif" size=1><SELECT><OPTION value="" selected>-</OPTION><OPTION value="">Masculino</OPTION><OPTION value="">Feminino</OPTION></SELECT></FONT></TD></TR>
<TR>
<TD vAlign=center>
<DIV align=right><FONT size=2><STRONG><FONT face="Verdana, Arial, Helvetica, sans-serif" color=#00125e>Idade:</FONT></STRONG></FONT></DIV></TD>
<TD vAlign=top><FONT face="Verdana, Arial, Helvetica, sans-serif" size=1><INPUT id=idade size=3 name=idade> </FONT></TD></TR>
<TR>
<TD vAlign=center>
<DIV align=right><FONT size=2><STRONG><FONT face="Verdana, Arial, Helvetica, sans-serif" color=#00125e>Estado Civil:</FONT></STRONG></FONT></DIV></TD>
<TD vAlign=top><FONT face="Verdana, Arial, Helvetica, sans-serif" size=1><INPUT id=estadocivil size=42 name=estadocivil> </FONT></TD></TR>
<TR>
<TD vAlign=center bgColor=#dbdbdb>
<DIV align=right><FONT size=2><STRONG><FONT face="Verdana, Arial, Helvetica, sans-serif" color=#00125e>*E-mail:</FONT></STRONG></FONT></DIV></TD>
<TD vAlign=top bgColor=#dbdbdb><FONT face="Verdana, Arial, Helvetica, sans-serif" size=1><INPUT id=email size=42 name=email> </FONT></TD></TR>
<TR>
<TD vAlign=center bgColor=#dbdbdb>
<DIV align=right><FONT size=2><STRONG><FONT face="Verdana, Arial, Helvetica, sans-serif" color=#00125e>*Telefones:</FONT></STRONG></FONT></DIV></TD>
<TD vAlign=top bgColor=#dbdbdb><FONT face="Verdana, Arial, Helvetica, sans-serif" size=1><INPUT id=fone maxLength=30 size=12 name=fone> </FONT></TD></TR>
<TR>
<TD vAlign=center bgColor=#dbdbdb>
<DIV align=right><FONT size=2><STRONG><FONT face="Verdana, Arial, Helvetica, sans-serif" color=#00125e>Endereço:</FONT></STRONG></FONT></DIV></TD>
<TD vAlign=top bgColor=#dbdbdb>
<FONT face="Verdana, Arial, Helvetica, sans-serif" size=1><INPUT id=endereco size=27 name=endereco></FONT><FONT face=Verdana size=1></FONT></TD></TR>
<TR>
<TD vAlign=center width=102 bgColor=#dbdbdb>
<DIV align=right><FONT face="Verdana, Arial, Helvetica, sans-serif" size=2><STRONG><FONT face="Verdana, Arial, Helvetica, sans-serif" color=#00125e size=2>CEP:</FONT></STRONG></DIV></FONT></TD>
<TD vAlign=top width=390 bgColor=#dbdbdb>
<DIV align=left><FONT face="Verdana, Arial, Helvetica, sans-serif" size=2><STRONG><FONT face="Verdana, Arial, Helvetica, sans-serif" size=20><INPUT id=cep size=23 name=cep></FONT></STRONG></FONT></DIV></TD></TR>
<TR>
<TR>
<TD vAlign=center width=102 bgColor=#dbdbdb>
<DIV align=right><FONT face="Verdana, Arial, Helvetica, sans-serif" size=2><STRONG><FONT face="Verdana, Arial, Helvetica, sans-serif" color=#00125e size=2>Bairro:</FONT></STRONG></DIV></FONT></TD>
<TD vAlign=top width=390 bgColor=#dbdbdb>
<DIV align=left><FONT face="Verdana, Arial, Helvetica, sans-serif" size=2><STRONG><FONT face="Verdana, Arial, Helvetica, sans-serif" size=2><INPUT id=bairro size=39 name=bairro> </FONT></STRONG></FONT></DIV></TD></TR>
<TR>
<TR>
<TD vAlign=center bgColor=#dbdbdb>
<DIV align=right><FONT size=2><STRONG><FONT face="Verdana, Arial, Helvetica, sans-serif" color=#00125e>Cidade:</FONT></STRONG></FONT></DIV></TD>
<TD vAlign=top bgColor=#dbdbdb><FONT face="Verdana, Arial, Helvetica, sans-serif" size=1><INPUT id=cidade size=40 name=cidade> </FONT></TD></TR>
<TR>
<TD vAlign=center bgColor=#dbdbdb>
<DIV align=right><FONT size=2><STRONG><FONT face="Verdana, Arial, Helvetica, sans-serif" color=#00125e>Estado:</FONT></STRONG></FONT></DIV></TD>
<TD vAlign=top bgColor=#dbdbdb><FONT face="Verdana, Arial, Helvetica, sans-serif" size=1><INPUT id=estado size=2 name=estado> </FONT></TD></TR>
<TR>
<TD vAlign=center bgColor=#dbdbdb>
<DIV align=right><FONT size=2><STRONG><FONT face="Verdana, Arial, Helvetica, sans-serif" color=#00125e>Pais:</FONT></STRONG></FONT></DIV></TD>
<TD vAlign=top bgColor=#dbdbdb><FONT face="Verdana, Arial, Helvetica, sans-serif" size=1><INPUT id=pais size=42 name=pais> </FONT></TD></TR>
<TR>
<TR>
<TD vAlign=center bgColor=#dbdbdb>
<DIV align=right><FONT size=2><STRONG><FONT face="Verdana, Arial, Helvetica, sans-serif" color=#00125e>Cargo:</FONT></STRONG></FONT></DIV></TD>
<TD vAlign=top bgColor=#dbdbdb><FONT face="Verdana, Arial, Helvetica, sans-serif" size=1><INPUT id=cargo size=39 name=cargo> </FONT></TD></TR>
<TR>
<TD vAlign=top bgColor=#dbdbdb>
<DIV align=right><FONT face="Verdana, Arial, Helvetica, sans-serif" color=#990000 size=2><STRONG><FONT color=#00125e>*Curriculum:</FONT></STRONG></FONT></DIV></TD>
<TD vAlign=center bgColor=#dbdbdb><FONT face="Verdana, Arial, Helvetica, sans-serif" size=1><STRONG><FONT face="Verdana, Arial, Helvetica, sans-serif" size=2></FONT></STRONG><INPUT onclick='window.open("/uploadoc.jsp?nomearquivo="+document.frmcurriculo.nome.value+"")' type=button value=Upload name=nomearquivo><STRONG>&nbsp;<INPUT id=uploaded readOnly type=textfield maxLength=100 size=26 name=uploaded><FONT face="Verdana, Arial, Helvetica, sans-serif" size=2></FONT></STRONG></FONT></TD></TR>
<TR>
<TD vAlign=top bgColor=#dbdbdb colSpan=2 height=1>
<DIV align="right</DIV"></DIV></TD></TR>
<TR>
<TD vAlign=top bgColor=#dbdbdb>&nbsp;</TD>
<TD vAlign=top bgColor=#dbdbdb>
<TABLE cellSpacing=0 cellPadding=0 width=154 border=0>
<TBODY>
<TR>
<TD width="50%">
<DIV align=center><INPUT id=enviar type=submit value=Enviar name=enviar> </DIV></TD>
<TD width="50%">
<DIV align=center><INPUT id=limpar2 type=reset value=Limpar name=limpar> </DIV></TD></TR></TBODY></TABLE> </TD></TR>
<TR>
<TD vAlign=top bgColor=#dbdbdb colSpan=2 height=1>
<DIV align=right></DIV></TD></TR></TBODY></FORM></TABLE> 
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="footer">
    <div class="box1">
      <h2>Sobre a Relato</h2>
     	<a href="index.jsp?conteudo=2" style="color:#fff;"><img class="imgl" src="images/AboutUsImage.jpg" alt="" /></a>
  		<a href="index.jsp?conteudo=2" style="color:#fff;"><p>&nbsp;&nbsp;&nbsp;&nbsp;A Relato atua, diretamente ou por meio de seus parceiros, em vários segmentos da informática. Juntos  desenvolvemos novos sistemas para internet, auditoria, integração e rotinas de apoio a sistemas existentes, infraestrutura, servidores, ... </p>
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
	        <li><a href="/index.jsp?conteudo=5" class="linkbottom">&raquo; Fale Conosco</a></li>
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
