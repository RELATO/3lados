<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>HTML Editor</title>

<script>

var idTemplate
var previousImage
var selectedImage
var currentImage

function doSelect(obj, id) {
	idTemplate = id;
	selectedImage = obj.name;

	obj.style.border = "1px solid #08246B"
	currentImage = obj
	if (previousImage != null) {
		if (previousImage != currentImage) {
			previousImage.style.border = "1px solid #FFFFFF"
		}
	}
	previousImage = currentImage
}

function preview(){
	if ( idTemplate == null ){
		alert("Selecione um modelo antes!!");
		return;
	}

   var width = 520;
   var height = 450;

   var left = 99;
   var top = 99;

   var url = "preview.jsp?idimodelo="+idTemplate;

   window.open(url, 'Preview', 'width='+width+', height='+height+', top='+top+', left='+left+', scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no');
}

function insert(){
	if(confirm("Todo o conteúdo vai ser zerado. Deseja continuar??")){
	    var opener;
	    if(window.opener)
	            opener = window.opener;
	    else {
	             opener = window.dialogArguments;
	    }

		opener.template(idTemplate);
		self.close();
	}
}

</script>

</head>
<body leftmargin=0 topmargin=0 style="overflow: auto">

	<title>Modelos de páginas</title>
	<link rel="stylesheet" href="he_includes/he_styles.css" type="text/css">
	<body bgcolor=threedface style="border: 1px buttonhighlight;">
	<div class="appOutside" style="height: 560px; width:700px;">
	<br>

	<span class="appInside1" style="width:650px;">
		<div class="appInside2">
			<div class="appInside3" style="padding:11px"><span class="appTitle">Modelos de páginas</span><br>
				<span id="previewWindow" style="height:480px; width:640px; overflow: auto; border: 2px inset; background-color: #FFFFFF">
					<div style="padding: 6px;">
						<span style="margin-left: 15px;" name="template1" onClick="doSelect(this, 1)">
							<img src="img/modelos/template1p.gif">
						</span>
						<span style="margin-left: 15px;" name="template2" onClick="doSelect(this, 2)">
							<img src="img/modelos/template2p.jpg">
						</span>
						<span style="margin-left: 15px;" name="template3" onClick="doSelect(this, 3)">
							<img src="img/modelos/template3p.jpg">
						</span>
					</div>
					<!-- div style="padding: 6px;">
						<span style="margin-left: 15px;" name="template4" onClick="doSelect(this, 4)">
							<img src="img/modelos/template4p.jpg">
						</span>
						<span style="margin-left: 15px;" name="template5" onClick="doSelect(this, 5)">
							<img src="img/modelos/template6p.jpg">
						</span>
						<span style="margin-left: 15px;" name="template6" onClick="doSelect(this, 6)">
							<img src="img/modelos/template7p.jpg">
						</span>
					</div>
					<div style="padding: 6px;">
						<span style="margin-left: 15px;" name="template7" onClick="doSelect(this, 7)">
							<img src="img/modelos/template8p.jpg">
						</span>
						<span style="margin-left: 15px;" name="template8" onClick="doSelect(this, 8)">
							<img src="img/modelos/template2p.jpg">
						</span>
						<span style="margin-left: 15px;" name="template9" onClick="doSelect(this, 9)">
							<img src="img/modelos/template2p.jpg">
						</span>
					</div>
					<div style="padding: 6px;">
						<span style="margin-left: 15px;" name="template10" onClick="doSelect(this, 10)">
							<img src="img/modelos/template2p.jpg">
						</span>
						<span style="margin-left: 15px;" name="template11" onClick="doSelect(this, 11)">
							<img src="img/modelos/template2p.jpg">
						</span>
					</div-->
				</span>
			</div>
		</div>
	</span>

	<div style="padding-top: 6px;">
		<input type="button" name="previewButton" value="Preview" class="Text75" onClick="preview()">
		<input type="button" name="insertButton" value="Inserir" class="Text75" onClick="insert()">
		<input type="button" name="Submit" value="Cancelar" class="Text75" onClick="javascript:window.close()">
	</div>

	</div>

	</table>

</body>
</html>