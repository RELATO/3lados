<%@page import="br.com.relato.EntryPoint"%>

<html>

<style>
.naover {
	display: none; 
	}
.ver {
	display: inline; 
	}	
</style>

<head>
<%
	java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z");
	String text = sdf.format(date);
%>
	<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	<META HTTP-EQUIV="Cache-Control" content="no-cache">
	<META HTTP-EQUIV="Expires" CONTENT="<%=text%>">
	<META HTTP-EQUIV="Date" CONTENT="<%=text%>">
	<script src="scripts/script.js"></script>
	<script src="scripts/script-htmleditor.js"></script>
	<script src="/scripts/jquery/jquery-1.6.0.min.js"></script>
	<script type="text/javascript" src="/htmleditor/ajax/ajaxfunctions.js"></script>
	<script type="text/javascript" src="/htmleditor/ajax/ajaxutils.js"></script>
	<script type="text/javascript" src="/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
	<script type="text/javascript" src="tinymce/jscripts/tiny_mce/plugins/tinybrowser/tb_tinymce.js.php"></script>
	<title>Html Editor </title>

	<script language="javascript">

		window.moveTo(0,0);
		window.resizeTo(screen.availWidth,screen.availHeight);
		
		var iframeLoaded = false;
		var checkLoaded;
		
		this_page.loadIFrame = function(obj){
			frameXXX = obj;
			checkLoaded = setInterval("checkLoad()", 5);
		}
	
		function checkOpen(){
			return true;
		}
		
		function volta(){
			//var opener = getOpenerHE();
			//opener.focus();
			//opener.novapesquisa();
			window.close();
		}
		
		function checkLoad(){
			if ( !iframeLoaded )
				return;
			else{
				clearInterval(checkLoaded);
				this_page.openHE();		
			}
		}
		
		this_page.loadedIFrame = function(){ 
			iframeLoaded = true;
		}
		
		this_page.intermediateSetData2 = function(){
			frameXXX.setDataIframe("<b>teste</b><br><br><i>teste2</i>");
		}
		
		var opcaomostra = "false";
		
		function show(){
			var objid = document.getElementById('camposemail');
			if ( opcaomostra == "true" ){
				objid.className = "naover";
				opcaomostra = "false";
			}else{
				objid.className = "ver";
				opcaomostra = "true";
			}
		}
		
		function getData(){
			document.getElementById("content").value = intermediateGetData();	
			return true;
		}
		
		
		function emailSubmit(action){
		
			f = document.formemail;
			var demail = document.getElementById("fromX").value;
			var paramail = document.getElementById("toX").value;
			var titmail = document.getElementById("subjectX").value;
			if('test' == action){
				if("" == demail){
					alert('Favor preencher campo de remetente de email');
					return false;
				}
				if("" == paramail){
					alert('Favor preencher campo de destinatários de email');
					return false;
				}	
				
				if("" == titmail){
					alert('Favor preencher campo de assunto do email');
					return false;
				}
			}
			
			f.from.value = demail;
			f.to.value = paramail;
			f.subject.value = titmail;
			f.action.value = action;
			getData();
			document.formemail.submit();	
		}
	
		function salvarConteudo(cmd){
			document.getElementById('htmleditor').value = tinyMCE.get('htmleditor').getContent();
			salvaConteudo(1);
			//window.opener.novapesquisa();
		}

		function preencheUrl(){
			var tit = document.getElementById("tituloHE").value;
			$.getJSON("/scripts/json/json.jsp",{titulo:tit,opcao:'google_url'},
				function(data){
					var arrayLength = data.length;
					for(var i=0;i<arrayLength;i++){
						document.getElementById("url").value = data[i].url;
					}
				}
			);
		}
		
		$(document).ready(
			function()
			{
				preencheUrl();
			}
		);
		
	</script>
	
	<style type="text/css">
		input, select { font-size: 11px; font-family: Tahoma, Verdana, Arial }
		input.botaoesp {
			border: 1px solid white;
			background-color: #003366;
			color: white;
			font-weight: bolder;
			font-family: Verdana, Tahoma, Arial, sans-serif;
			font-size: 10px;
			height: 20px;
			width: 70px;
			text-align: center;
		}
		input.botaoespover {
			border: 1px solid #003366;
			background-color: white;
			color: #003366;
			font-weight: bolder;
			font-family: Verdana, Tahoma, Arial, sans-serif;
			font-size: 10px;
			height: 20px;
			width: 70px;
			text-align: center;
			cursor: pointer;
		}
	</style>
<link rel="stylesheet" href="he_includes/he_styles.css" type="text/css">
</head>
<body bgcolor="#003366" onUnLoad="fechaHE()" style="font-family: Verdana, Tahoma, Arial">
	<form action="he.jsp" method="post">
		<input type="hidden" name="linguaHE" id="linguaHE">
		<input type="hidden" name="HEControl_html">
		<input type="hidden" name="id" value="">
		<table align="center" height="100%" width="800" cellpadding="0" cellspacing="0" style="border: 1px solid white; border-collapse: collapse; vertical-align: middle;">
			<tr>
				<td colspan="5" align="center" style="border: 1px solid white;"><img src="../images/topolnovoeditor.jpg" width="500" height="67"></td>
			</tr>
			<tr bgcolor="#3163A0">
				<td width="50" style="padding-left: 10px;"><strong><font size="-2" color="white">Id</font></strong> </td>
				<td width="200" style="padding-left: 10px; "><font size="-2" color="white"><strong>Título</strong> - digite apenas caracteres alfanuméricos (0-9 / A-Z)</font></td>
				<td width="82" style="padding-left: 10px; "><strong><font size="-2" color="white">Tipo</font></strong></td>
				<td width="80" style="padding-left: 10px; ">
<%
					if ( !EntryPoint.isEditor() ){
%>
						<strong><font size="-2" color="white">Ativo</font></strong>
<%
					}
%>
				</td>
				<td width="336" style="padding-left: 10px; border-left: 1px solid white;"><strong><font size="-2" color="white">&nbsp;</font></strong></td>
			</tr>
			<tr style="padding-bottom: 5px; border-bottom: 1px solid white;" bgcolor="#3163A0">		
				<td width="50" style="padding-left: 10px; border-bottom: 1px solid white;"><input style="text-align: right;" type="text" name="idHE" id="idHE" size="5" value="" readonly></td>
				<td width="200" style="padding-left: 10px; border-bottom: 1px solid white;"><input type="text" maxlength="255" size="50" name="tituloHE" id="tituloHE" value="" onkeyup="preencheUrl()" ></td>
				<td width="82" style="padding-left: 10px; border-bottom: 1px solid white;"> 
					<select name="tipoHE" id="tipoHE">
						<option value="C">Conteúdo</option>
						<option value="N">Notícia</option>
						<option value="A">Agenda</option>
					</select>
				</td>
				<td width="80" style="padding-left: 10px; padding-right: 10px; border-bottom: 1px solid white;">  
<%
					if ( !EntryPoint.isEditor() ){
%>
						<select name="ativoHE" id="ativoHE" style="width: 70px;">
							<option value="S">Sim</option>
							<option value="N">Não</option>
						</select>
<%
					}
%>		
				</td>
	    		<td align="center" bgcolor="3163A0" style="padding-left: 10px; border: 1px solid white; border-top: none; color: white; padding: 5px;"> 
					<input style="margin-right:5px;" type="button" name="atualizaConteudo" id="atualizaConteudo" class="botaoesp" value="Atualiza" onMouseOver="this.className='botaoespover';" onMouseOut="this.className='botaoesp';" onClick=" salvarConteudo(1);"/>	
					<input type="button" name="voltar" id="voltar" class="botaoesp" value="Voltar" onMouseOver="this.className='botaoespover';" onMouseOut="this.className='botaoesp';" onClick="volta();"/>
				</td>
			</tr>
			<!-- Campos novos para keywords e descrição e url -->

			<tr bgcolor="#3163A0" style="vertical-align: middle">	
				<td style="padding-left: 10px;" colspan="10" width="100%" align="left"><strong><font size="-2" color="white">Keywords (Palavras-chave: utilizar separando-as por vírgula)</font></strong></td>
			</tr>
			
			<tr bgcolor="#3163A0" style="vertical-align: middle">	
				<td style="padding-left: 10px;" colspan="10" width="100%" align="left">
				<input type="text" maxlength="255" size="150" name="keywords" id="keywords" value="">
				</td>
			</tr>			

			<tr bgcolor="#3163A0" style="vertical-align: middle">	
				<td style="padding-left: 10px;" colspan="10" width="100%" align="left"><strong><font size="-2" color="white">Descrição</font></strong></td>
			</tr>
			
			<tr bgcolor="#3163A0" style="vertical-align: middle">	
				<td style="padding-left: 10px;" colspan="10" width="100%" align="left">
				<input type="text" maxlength="150" size="150" name="descricao" id="descricao" value="">
				</td>
			</tr>			

			<tr bgcolor="#3163A0" style="vertical-align: middle">	
				<td style="padding-left: 10px;" colspan="10" width="100%" align="left"><strong><font size="-2" color="white">URL</font></strong></td>
			</tr>
			
			<tr bgcolor="#3163A0" style="vertical-align: middle">	
				<td style="padding-left: 10px;" colspan="10" width="100%" align="left">
				<input type="text" maxlength="150" size="150" name="url" id="url" value="" readonly>
				</td>
			</tr>			

			<!-- Fim de Campos novos para keywords e descrição e url-->
						
			<tr style="vertical-align: middle">	
				<td colspan="10" height="100%" width="100%" align="center" style="vertical-align: middle; padding-top: 10px; padding-bottom: 10px; padding-right: 10px; padding-left: 10px;" bgcolor="#3163A0">
					<textarea id="htmleditor" name="htmleditor" style="width:100%;height:100%">
					</textarea>
				</td>
			</tr>
		</table>
	</form>
	
	<script type="text/javascript" src="/js/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
	<script type="text/javascript">
	tinyMCE.init({

		// add these two lines for absolute urls
        remove_script_host : false,
        convert_urls : false,
        //resize: false,
        width : 920,
        height : 600,		
				

		// General options
		language : "pt", // change language here
		mode : "textareas",
		theme : "advanced",
		plugins : "autolink,lists,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,simpleuploader,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,style",

		// Theme options
		theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
		theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,simpleuploader,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
		theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
		theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : true,

		   // Skin options
        skin : "o2k7",
        skin_variant : "black",
		
		// Example content CSS (should be your site CSS)
		content_css : "css/content.css",

		// Drop lists for link/image/media/template dialogs
		template_external_list_url : "lists/template_list.js",
		external_link_list_url : "lists/link_list.js",
		external_image_list_url : "lists/image_list.js",
		media_external_list_url : "lists/media_list.js",

		// Style formats
		style_formats : [
			{title : 'Bold text', inline : 'b'},
			{title : 'Red text', inline : 'span', styles : {color : '#ff0000'}},
			{title : 'Red header', block : 'h1', styles : {color : '#ff0000'}},
			{title : 'Example 1', inline : 'span', classes : 'example1'},
			{title : 'Example 2', inline : 'span', classes : 'example2'},
			{title : 'Table styles'},
			{title : 'Table row 1', selector : 'tr', classes : 'tablerow1'}
		],

		// Replace values for the template plugin
		template_replace_values : {
			username : "Some User",
			staffid : "991234"
		}
	});
	var idHE = window.opener.document.getElementById("idHE").value;
	document.getElementById('htmleditor').value = carregaConteudo(3, idHE);
</script>

</body>

</html>
