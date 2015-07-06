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
	<title>Html Editor</title>

	 <script>
		 
	 	function volta(){
	 		
	 		window.close();
	 		
	 	}
	 
		function doSelect() {
			 
			//alert("clicou");
			document.getElementById('htmleditor').value = tinyMCE.get('htmleditor').getContent();
		 	var html = document.getElementById('htmleditor').value;
		 	
		 	window.opener.document.form1.passaDestaque.value = html;
		 	
			//alert("htmleditor = "+html);
			
			window.opener.atualiza();
	 		//alert("vai fechar");
		    
	        window.close();
	        return false;
		 }
		 
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
<body bgcolor="#003366">
	
		<table align="center" height="80%" width="80%" cellpadding="0" cellspacing="0" style="border: 1px solid white; border-collapse: collapse; vertical-align: middle;">
			<tr style="vertical-align: middle">	
				<td colspan="10" height="100%" width="100%" align="center" style="vertical-align: middle; padding-top: 10px; padding-bottom: 10px; padding-right: 10px; padding-left: 10px;" bgcolor="#3163A0">
					<textarea id="htmleditor" name="htmleditor" style="width:100%;height:100%"></textarea>
				</td>
			</tr>
			<tr>
				<td align="center" valign="center" style="padding-left: 10px; border: 1px solid white; border-top: none; color: white; padding: 5px;"> 
					<input style="margin-right:5px;" type="button" name="atualizaConteudo" id="atualizaConteudo" class="botaoesp" value="Atualiza" onMouseOver="this.className='botaoespover';" onMouseOut="this.className='botaoesp';" onClick=" doSelect();"/>	
					<input type="button" name="voltar" id="voltar" class="botaoesp" value="Voltar" onMouseOver="this.className='botaoespover';" onMouseOut="this.className='botaoesp';" onClick="volta();"/>
				</td>
			</tr>
		</table>
	
	
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
	var getText = window.opener.document.getElementById("passaDestaque").value;
	document.getElementById('htmleditor').value = getText;
	
</script>

</body>

</html>
