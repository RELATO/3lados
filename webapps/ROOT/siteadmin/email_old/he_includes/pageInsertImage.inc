
<%
if ( "DeleteImage".equals(toDo) ){
	File fileDelete = new File(imagens_dir_path+request.getParameter("imgSrc"));
	try{
		fileDelete.delete();
	}catch(Exception e){
		e.printStackTrace();
	}
}

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
       	Hashtable files = mrequest.getFiles();
        if ((files != null) || (!files.isEmpty())) {
                UploadFile file = (UploadFile) files.get("upload");
               	upBean.store(mrequest, "upload");
     	}	
    }
    
String imagens =  "";
String imagenspath =  "";

File imagesFolder = new File(imagens_dir_path);
final List list = (List)FileUtils.listFiles(imagesFolder, new String[] {"bmp", "jpg", "jpeg", "gif", "png", "JPG"}, true);
List listpath = new ArrayList();

for (Iterator it = list.iterator(); it.hasNext();) {
	final File file = (File) it.next();
	String path = file.getPath().replaceAll("'", "");

    if ( it.hasNext() ){
        imagens += "'" + file.getName() + "',";
        imagenspath += "'" + ((String)path).substring(((String)path).indexOf("/imagens/"))+ "',";
    }else{
	    imagens += "'" + file.getName() + "'";
	    imagenspath += "'" + ((String)path).substring(((String)path).indexOf("/imagens/"))+ "'";
	}

	List row = new ArrayList();
	row.add(path.substring(0,path.lastIndexOf("/")+1) + " " + path.substring(path.lastIndexOf("/")+1));
	row.add(file.length() + " " + "Bytes");	
	listpath.add(row);    
}
%>

<%
if ( EntryPoint.getSession().getAttribute(Constants.MENU_IMG_KEY) == null ){
	MenuService menu = new MenuService(listpath);
	EntryPoint.getSession().setAttribute(Constants.MENU_IMG_KEY, menu.getMenu());
}

if ("DeleteImage".equals(toDo) || MultipartFormDataRequest.isMultipartFormData(request) ) {
	MenuService menu = new MenuService(listpath);
	EntryPoint.getSession().setAttribute(Constants.MENU_IMG_KEY, menu.getMenu());
}
%>								
	<script language=JavaScript>

	window.onload = function()
	{
		document.getElementById("DEP").value = window.opener.deveditPath;
	}

	window.opener.doStyles()
	window.onerror = function() { return true; }
	var myPage = window.opener;
	var imageAlign;

	var imageDir = Array(<%=imagenspath%>);

	if (window.opener.imageEdit) {
		imageAlign = window.opener.selectedImage.align
	}

	function toggleUploadDiv()
	{
		if(uploadDiv.style.display == "none")
		{
			document.getElementById("toggleButton").value = "«";
			document.getElementById("upload").focus();
			document.getElementById("upload").select();
			uploadDiv.style.display = "inline";
			dummyDiv.style.display = "inline";
			divList.style.height = 225;
			previewWindow.style.height = 50;
		}
		else
		{
			document.getElementById("toggleButton").value = "»";
			document.getElementById("upload").focus();
			document.getElementById("upload").select();
			uploadDiv.style.display = "none";
			dummyDiv.style.display = "none";
			divList.style.height = 325;
			previewWindow.style.height = 150;
		}
	}

	function outputImageLibraryOptions()
	{
		document.write(opener.imageLibs);

		// Loop through all of the image libraries and find the selected one
		for(i = 0; i < selImageLib.options.length; i++)
		{
			if(selImageLib.options[i].value == "/imgdir")
			{
				selImageLib.selectedIndex = i;
				break;
			}
		}
	}

	function switchImageLibrary(thePath)
	{
		// Change the path of the image library
		DEP = document.getElementById("DEP").value;
		document.location.href = 'http://demo.relato.com.br/he_demo/he/class.he.asp?ToDo=InsertImage&DEP='+DEP+'&imgDir='+thePath+'&dd=0&du=0&wi=&tn=0&dt=0&wi=0';
	}

	function previewModify() {

		var imageWidth = myPage.selectedImage.width;
		var imageHeight = myPage.selectedImage.height;
		var imageBorder = myPage.selectedImage.border;
		var imageAltTag = myPage.selectedImage.alt;
		var imageHspace = myPage.selectedImage.hspace;
		var imageVspace = myPage.selectedImage.vspace;

		document.getElementById("previewWindow").innerHTML = "<img src=" + selectedImage.replace(/ /g, "%20") + ">"

		insertButton.value = "Modificar"
		document.title = "Modificar Propriedades da Imagem"
		if (document.getElementById("deleteButton") != null) {
			deleteButton.disabled = true
		}

		previewButton.disabled = false
		insertButton.disabled = false

		if (document.getElementById("backgdButton") != null) {
			backgdButton.disabled = false
		}

		image_width.value = imageWidth;
		image_height.value = imageHeight;

		if (imageBorder == "") {
			imageBorder = "0"
		}

		border.value = imageBorder;
		alt_tag.value = imageAltTag;
		hspace.value = imageHspace;
		vspace.value = imageVspace;
		// tableForm.cell_width.value = cellWidth;
		this.focus();
	}

	function deleteImage(imgSrc)
	{
		var delImg = confirm("Você realmente quer excluir esse arquivo?");
		DEP = document.getElementById("DEP").value;

		if (delImg == true) {
			document.location.href = 'heutil.jsp?ToDo=DeleteImage&imgSrc='+imgSrc;
		}

	}

	function setBackground(imgSrc)
	{
		var setBg = confirm("Você tem certeza que deseja definir esta imagem como a imagem de fundo da página??");

		if (setBg == true) {
			window.opener.setBackgd(imgSrc);
			self.close();
		}
	}

	function viewImage(imgSrc)
	{
		var sWidth =  screen.availWidth;
		var sHeight = screen.availHeight;

		window.open(imgSrc, 'image', 'width=500, height=500,scrollbars=yes,resizable=yes,left='+(sWidth/2-250)+',top='+(sHeight/2-250));
	}

	function grey(tr) {
			tr.className = 'b4';
	}

	function ungrey(tr) {
			tr.className = '';
	}

	function insertImage(imgSrc) {

		var error = 0;

			imageWidth = image_width.value
			imageHeight = image_height.value
			imageBorder = border.value
			imageHspace = hspace.value
			imageVspace = vspace.value

			if (isNaN(imageWidth) || imageWidth < 0) {
				alert("Largura da Imagem deve conter um número positivo e válido")
				error = 1
				image_width.select()
				image_width.focus()
			} else if (isNaN(imageHeight) || imageHeight < 0) {
				alert("Altura da Imagem deve conter um número positivo e válido")
				error = 1
				image_height.select()
				image_height.focus()
			} else if (isNaN(imageBorder) || imageBorder < 0 || imageBorder == "") {
				alert("Borda da Imagem deve conter um número positivo e válido")
				error = 1
				border.select()
				border.focus()
			} else if (isNaN(imageHspace) || imageHspace < 0) {
				alert("Espaçamento Horizontal deve conter um número positivo e válido")
				error = 1
				hspace.select()
				hspace.focus()
			} else if (isNaN(vspace.value) || vspace.value < 0) {
				alert("Espaçamento Vertical deve conter um número positivo e válido")
				error = 1
				vspace.select()
				vspace.focus()
			}

			if (error != 1) {

				var sel = window.opener.foo.document.selection;
				if (sel!=null) {
					var rng = sel.createRange();
					if (rng!=null) {

						if (window.opener.imageEdit) {
							oImage = window.opener.selectedImage
							oImage.src = imgSrc
						} else {
							HTMLTextField = '<img id="de_element_image" src="' + imgSrc + '">';
							rng.pasteHTML(HTMLTextField)

							oImage = window.opener.foo.document.getElementById("de_element_image")
						}

						if (imageWidth != "")
							oImage.width = imageWidth

						if (imageHeight != "")
							oImage.height = imageHeight

						oImage.alt = alt_tag.value
						oImage.border = border.value

						if (hspace.value != "") {
							oImage.hspace = hspace.value
						}

						if (vspace.value != "") {
							oImage.vspace = vspace.value
						} else {
							oImage.removeAttribute('vspace',0)
						}

						if (align[align.selectedIndex].text != "None") {
							oImage.align = align[align.selectedIndex].text
						} else {
							oImage.removeAttribute('align',0)
						}

						styles = sStyles[sStyles.selectedIndex].text

						if (styles != "") {
							oImage.className = styles
						} else {
							oImage.removeAttribute('className',0)
						}

						// window.opener.doToolbar()
						// window.opener.foo.focus();
						self.close();

						if (window.opener.imageEdit) {
							// do nothing
						} else {
							oImage.removeAttribute("id")
						}


					} // End if
				} // End If
			}
	} // End function

	function insertExtImage() {
		selectedImage = document.getElementById("externalImage").value

		if (previousImage != null) {
			previousImage.style.border = "3px solid #FFFFFF"
		}

		document.getElementById("previewWindow").innerHTML = "<img src=" + selectedImage.replace(/ /g, "%20") + ">"

		if (document.getElementById("deleteButton") != null) {
			deleteButton.disabled = true
		}

		previewButton.disabled = false
		insertButton.disabled = false

		if (document.getElementById("backgdButton") != null) {
			backgdButton.disabled = false
		}

	} // End function

	var imageFolder = "/imagens/"
	var previousImage
	var selectedImage
	var selectedImageEncoded
	function doSelect(oImage) {
		selectedImage = imageFolder + oImage.name;
		selectedImageEncoded = oImage.name2;
		oImage.style.border = "1px solid #08246B"
		currentImage = oImage;
		if (previousImage != null) {
			if (previousImage != currentImage) {
				previousImage.style.border = "1px solid #FFFFFF"
			}
		}
		previousImage = currentImage

		document.getElementById("previewWindow").innerHTML = "<img src=" + selectedImage.replace(/ /g, "%20") + ">"
		previewButton.disabled = false
		insertButton.disabled = false

		if (document.getElementById("backgdButton") != null) {
			backgdButton.disabled = false
		}

		if (document.getElementById("deleteButton") != null) {
			deleteButton.disabled = false
		}
	}

	var previousFolder;
	var selectedFolder;
	var currentFolder;
	function clickFolder(folderSelect) {
		selectedFolder = folderSelect.name;
		document.getElementById("pasta").value = folderSelect.name;
		folderSelect.className = "select";
		currentFolder = folderSelect;
		if (previousFolder != null) {
			if (previousFolder != currentFolder) {
				previousFolder.className = "unselect";
			}
		}
		
		previousFolder = folderSelect;
	}
	
	function printStyleList() {
		if (window.opener.document.getElementById("sStyles") != null) {
			document.write(window.opener.document.getElementById("sStyles").outerHTML);
			document.getElementById("sStyles").className = "text70";
				if (document.getElementById("sStyles").options[0].text == "Style") {
					document.getElementById("sStyles").options[0] = null;
					document.getElementById("sStyles").options[0].text = "";
				} else {
					document.getElementById("sStyles").options[1].text = "";
				}

			document.getElementById("sStyles").onchange = null;
			document.getElementById("sStyles").onmouseenter = null;
		} else {
			document.write("<select id=sStyles class=text70><option selected></option></select>")
		}
	}

	function printAlign() {
		if ((imageAlign != undefined) && (imageAlign != "")) {
			document.write('<option selected>' + imageAlign)
			document.write('<option>')
		} else {
			document.write('<option selected>')
		}
	}

	var folderdefault = "/imagens/";
	function CheckImageForm()
	{
		//upload, upload1, upload2, upload3, upload4
		var imgDir = '/imgdir';
		var u1 = document.getElementById("upload");
		var folderimage = document.getElementById("pasta").value;

		if ( folderimage == "" ){
			folderimage = folderdefault;
			document.getElementById("pasta").value = folderdefault;
		}

		// Extract just the filename from the paths of the files being uploaded
		u1_file = u1.value;
		last = u1_file.lastIndexOf ("\\", u1_file.length-1);
		u1_file = u1_file.substring (last + 1);

		if(u1_file == ""){
			alert('Por favor, escolha uma imagem antes!');
			return false;
		}

		if ( !confirm("Deseja enviar o arquivo: " + u1_file + " para a pasta "+folderimage+"?") )
			return false;

		u1_file = folderimage + u1_file;
		// Loop through the imageDir array
		if(u1_file != "")
		{
			for(i = 0; i < imageDir.length; i++)
			{
				if(u1_file == imageDir[i])
				{
					if(!confirm(u1_file + ' já existe. Você realmente quer sobrescrever?'))
					{
						return false;
					}
				}
			}
		}

		return true;
	}
	</script>

	<title>Inserir Imagem</title>
	<link rel="stylesheet" href="he_includes/he_styles.css" type="text/css">
	<body bgcolor=threedface style="border: 1px buttonhighlight;">
	<div class="appOutside">
	<div style="border: solid 1px #000000; background-color: #FFFFEE; padding:5px;">
		<img src="he_imagens/popups/bulb.gif" align=left width=16 height=17>
		<span>Digite a URL da imagem a inserir ou Escolha uma das imagens mostradas abaixo e clique em seu link de inserção para adicioná-la.</span>
	</div>
	<br>

	<form enctype="multipart/form-data" action="#&pasta=/images/casas/" method="post" onSubmit="return CheckImageForm()">
	<!-- Hidden DEP tag is used to persist the path via JS and window.opener -->
		<input type="hidden" name="DEP" value="">
	<!-- End DEP tag -->
	<span class="appInside1" style="width:350px">
		<div class="appInside2">
			<div class="appInside3" style="padding:11px"><span class="appTitle">Upload (Enviar Imagem)</span>
				<span class="appTitle1">Arquivo</span>
				<input type="file" name="upload" class="Text231">
				<br>&nbsp;Pasta Atual<br>
				<input type="text" id="pasta" name="pasta" class="Text230" readonly> <input type="submit" value="Upload" class="Text75">
				<span class="err" style="position:absolute; left:40; top:86;"></span>
			</div>
		</div>
	</span>
	&nbsp;
	 
		<span class="appInside1" style="width:350px">
			<div class="appInside2">
				<div class="appInside3" style="padding:11px"><span class="appTitle">Imagem Externa</span>
					<br><br>
					<input type="text" name="externalImage" id="externalImage" class="Text240" value="http://">&nbsp;<input type=button value=Carregar class="Text75" onClick="insertExtImage()"><br>
					<div style="height:25; " id="dummyDiv">
						&nbsp;
					</div>
				</div>
			</div>
		</span>
	
	</form>

	<span class="appInside1" style="width:350px">
		<div class="appInside2">
			<div class="appInside3" style="padding:11px"><span class="appTitle">Imagem Interna</span>
			<div style="height:300px; width:325px; overflow: auto; border: 2px inset; background-color: #FFFFFF" id="divList">
<%

				Menu m = (Menu)EntryPoint.getSession().getAttribute(Constants.MENU_IMG_KEY);
				try {
					MenuRender.render(m, out);
				} catch (Exception e) {
					e.printStackTrace();
				}
%>
			</div>
			</div>
		</div>
	</span>
	&nbsp;
	<span class="appInside1" style="width:350px; position:absolute">
		<div class="appInside2">
			<div class="appInside3" style="padding:11px"><span class="appTitle">Pré-Visualização</span><br>
				<span id="previewWindow" style="padding:10px; height:120px; width:240px; overflow: auto; border: 2px inset; background-color: #FFFFFF">
				</span><input type="button" name="previewButton" value="Pré-Visualização" class="Text75" onClick="javascript:viewImage(selectedImage)" disabled=true style="position:absolute; left:257px;">
			</div>
		</div>
	</span>

	<span class="appInside1" style="width:350px; padding-top:5px;">
		<div class="appInside2">
			<div class="appInside3" style="padding:11px"><span class="appTitle">Propriedades da Imagem</span>
			<table border="0" cellspacing="0" cellpadding="3">
			  <tr>
				<td class="body" width="70">Texto Alternativo:</td>
				<td class="body" width="88">
				  <input type="text" name="alt_tag" size="50" class="Text70">
				</td>
				<td class="body" width="80">Borda:</td>
				<td class="body" width="80">
				<input type="text" name="border" size="3" class="Text70" maxlength="3" value="0">
				</td>
			  </tr>
			  <tr>
				<td class="body">Largura da Imagem:</td>
				<td class="body">
				  <input type="text" name="image_width" size="3" class="Text70" maxlength="3">
			  </td>
				<td class="body">Altura da Imagem:</td>
				<td class="body">
				  <input type="text" name="image_height" size="3" class="Text70" maxlength="3">
				</td>
			  </tr>
			  <tr>
				<td class="body">Espaçamento Horizontal:</td>
				<td class="body">
				  <input type="text" name="hspace" size="3" class="Text70" maxlength="3">
				</td>
				<td class="body">Espaçamento Vertical:</td>
				<td class="body">
				  <input type="text" name="vspace" size="3" class="Text70" maxlength="3">
				</td>
			  </tr>
				<tr>
					<td class="body">Alinhamento:</td>
					<td class="body">
					  <SELECT class=text70 name=align>
						<script>printAlign()</script>
						<option>Baseline
						<option>Top
						<option>Middle
						<option>Bottom
						<option>TextTop
						<option>ABSMiddle
						<option>ABSBottom
						<option>Left
						<option>Right</option>
					  </select>
					</td>
					<td class="body">Estilo:</td>
					<td class="body"><script>printStyleList()</script></td>
				</tr>
			</table>
			</div>
		</div>
	</span>

	<div style="padding-top: 6px;">
	
	<input type="button" name="deleteButton" value="Excluir" class="Text75" onClick="javascript:deleteImage(selectedImageEncoded)" disabled>
	
	</div>

	</div>
	<div style="padding-top: 6px; float: right;">
	<input type="button" name="insertButton" value="Inserir" class="Text75" onClick="javascript:insertImage(selectedImage)" disabled=true>
	<input type="button" name="Submit" value="Cancelar" class="Text75" onClick="javascript:window.close()">
	</div>

	</table>

	<script defer>

	if (window.opener.imageEdit)
	{
		selectedImage = window.opener.selectedImage.src;
		previewModify();
	}

	</script>