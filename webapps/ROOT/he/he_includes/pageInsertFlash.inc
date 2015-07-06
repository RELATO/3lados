
<%
if ( "DeleteFlash".equals(toDo) ){
	File fileDelete = new File(flash_dir_path+request.getParameter("flashSrc"));
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

String flashs =  "";

File flashFolder = new File(flash_dir_path);
final Collection col = FileUtils.listFiles(flashFolder, new String[] {"swf"}, true);
for (Iterator it = col.iterator(); it.hasNext();) {
	File file = (File) it.next();
    if ( it.hasNext() )
        flashs += "'" + file.getName() + "',";
    else
	    flashs += "'" + file.getName() + "'";
}
%>
	<title>Insere Flash</title>
	<link rel="stylesheet" href="he_includes/he_styles.css" type="text/css">

	<script defer>
	if (window.opener.flashEdit) {
		selectedFlash = window.opener.selectedFlash
		previewModify()

	}
	</script>

	<script language=JavaScript>
	window.onload = this.focus

	var selectedFlash
	var selectedFlashFile
	var flashAlign
	var flashLoop

	var flashFiles = Array(<%=flashs%>)

	if (window.opener.flashEdit) {
		flashAlign = window.opener.selectedFlash.align
		flashLoop = window.opener.selectedFlash.loop
	}

	function outputFlashLibraryOptions()
	{
		document.write(opener.flashLibs);

		// Loop through all of the image libraries and find the selected one
		for(i = 0; i < selFlashLib.options.length; i++)
		{
			if(selFlashLib.options[i].value == "/flash")
			{
				selFlashLib.selectedIndex = i;
				break;
			}
		}
	}

	function switchFlashLibrary(thePath)
	{
		// Change the path of the flash library
		document.location.href = 'http://demo.relato.com.br/he_demo/he/class.he.asp?ToDo=InsertFlash&DEP=/he_demo/he&flashDir='+thePath+'&dd=0&du=0&wi=0&tn=0&dt=0&wi=0';
	}

	function printAlign() {
		if ((flashAlign != undefined) && (flashAlign != "")) {
			document.write('<option selected>' + flashAlign)
			document.write('<option>')
		} else {
			document.write('<option selected>')
		}
	}

	function printLoop() {
		if (flashLoop != undefined) {
			document.write('<option value="' + flashLoop + '" selected>' + flashLoop + '</option>')
			document.write('<option value=""></option>')
		}
	}

	var selectedFlashEmbed
	function previewModify() {

		objectTag = /(<(object|\/object)([\s\S]*?)>)/gi
		paramTag = /(<param([\s\S]*?)>)/gi

		code = selectedFlash.outerHTML.replace(objectTag,"")
		code = code.replace(paramTag,"")
		tempFrame.document.write("<html><head></head><body>" + code + "</body></html>")
		tempFrame.document.close()
		selectedFlashEmbed = tempFrame.document.embeds[0]
		selectedFlashFile = selectedFlash.movie

		document.getElementById("previewWindow").innerHTML = "<embed src='" + selectedFlash.movie + "' quality='high' pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width='236' height='176' bgcolor='#009933' WMODE=transparent></embed>"

		image_width.value = selectedFlash.width
		image_height.value = selectedFlash.height
		hspace.value = selectedFlash.hspace
		vspace.value = selectedFlash.vspace

		insertButton.value = "Modificar"
		document.title = "Modifica Propriedades do Flash"
		previewButton.disabled = false
		insertButton.disabled = false

	}

	function deleteFlash(flashSrc)
	{
		var delImg = confirm("Você realmente quer excluir esse arquivo?");

		if (delImg == true) {
			document.location.href = 'heutil.jsp?ToDo=DeleteFlash&flashSrc='+flashSrc;
		}

	}

	function viewImage(flashSrc)
	{
		var sWidth =  screen.availWidth;
		var sHeight = screen.availHeight;

		window.open(flashSrc, 'image', 'width=500, height=500,scrollbars=yes,resizable=yes,left='+(sWidth/2-250)+',top='+(sHeight/2-250));
	}

	function grey(tr) {
			tr.className = 'b4';
	}

	function ungrey(tr) {
			tr.className = '';
	}

	function insertImage(flashSrc) {

		var error = 0;

			imageWidth = image_width.value
			imageHeight = image_height.value
			imageHspace = hspace.value
			imageVspace = vspace.value

			if (isNaN(imageWidth) || imageWidth < 0) {
				alert("A largura do flash deve ser um número positivo válido")
				error = 1
				image_width.select()
				image_width.focus()
			} else if (isNaN(imageHeight) || imageHeight < 0) {
				alert("A altura do flash deve ser um número positivo válido")
				error = 1
				image_height.select()
				image_height.focus()
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

						// Are we modifying or inserting?
						if (window.opener.flashEdit) {

							if (imageWidth != "") {
								selectedFlash.width = imageWidth
								selectedFlashEmbed.width = imageWidth
							} else {
								selectedFlash.removeAttribute("width")
								selectedFlashEmbed.removeAttribute("width")
							}

							if (imageHeight != "") {
								selectedFlash.height = imageHeight
								selectedFlashEmbed.height = imageHeight
							} else {
								selectedFlash.removeAttribute("height")
								selectedFlashEmbed.removeAttribute("height")
							}


							if (vspace.value != "") {
								selectedFlash.vspace = vspace.value
								selectedFlashEmbed.vspace = vspace.value
							} else {
								selectedFlash.removeAttribute("vspace")
								selectedFlashEmbed.removeAttribute("vspace")
							}

							if (hspace .value != "") {
								selectedFlash.hspace = hspace.value
								selectedFlashEmbed.hspace = vspace.value
							} else {
								selectedFlash.removeAttribute("hspace")
								selectedFlashEmbed.removeAttribute("hspace")
							}

							if (align[align.selectedIndex].text != "") {
								selectedFlash.align = align[align.selectedIndex].text
							} else {
								selectedFlash.removeAttribute("align")
							}


							selectedFlash.movie = flashSrc

							if (loop[loop.selectedIndex].value != "") {
								selectedFlash.loop =  loop[loop.selectedIndex].value
								selectedFlashEmbed.loop =  loop[loop.selectedIndex].value
							} else {
								selectedFlash.removeAttribute("loop")
								selectedFlashEmbed.removeAttribute("loop")
							}

							embedTag = /(<embed([\s\S]*?)>)/gi
							closeEmbedTag = /(<\/embed([\s\S]*?)>)/gi

							originalFlash = selectedFlash.outerHTML

							code = originalFlash.replace(closeEmbedTag, "")
							code = code.replace(embedTag, selectedFlashEmbed.outerHTML + "</embed>")
							selectedFlash.outerHTML = code

							selectedFlash.runtimeStyle.backgroundImage = "url(/he_demo/he/he_imagens/hidden.gif)"

						} else {

							if (imageWidth != "")
								imageWidth = ' width=' + imageWidth + '" '
							else
								imageWidth = ''

							if (imageHeight != "")
								imageHeight = ' height=' + imageHeight + '" '
							else
								imageHeight = ''

							if (vspace.value != "")
								vSpace = ' vspace=' + vspace.value + '" '
							else
								vSpace = ''

							if (hspace.value != "")
								hSpace = ' hspace=' + hspace.value + '" '
							else
								hSpace = ''

							if (align[align.selectedIndex].text != "")
								falign = ' align="' + align[align.selectedIndex].text + '" '
							else
								falign = ''

							HTMLTextField =
							'<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0"' + imageHeight + imageWidth + vSpace + hSpace + falign + '>' +
							'<param name=movie value="' + flashSrc + '">' +
							'<param name="LOOP" value="' + loop[loop.selectedIndex].value + '">' +
							'<embed src="' + flashSrc +
							'" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash"'
							+ imageWidth + imageHeight + vSpace + hSpace + falign + ' loop="' + loop[loop.selectedIndex].value + '"></embed></object>'

							rng.pasteHTML(HTMLTextField)
						}


						// window.opener.foo.focus();
						self.close();

						// oFlash.removeAttribute("id")


					} // End if
				} // End If
			}
	} // End function

	function insertExtFlash() {
		selectedFlashFile = document.getElementById("externalFlash").value

		if (previousFlash != null) {
			previousFlash.style.border = "3px solid #FFFFFF"
		}

		document.getElementById("previewWindow").innerHTML = "<embed src='" + selectedFlashFile + "' quality='high' pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width='236' height='176' bgcolor='#009933' WMODE=transparent></embed>"

		if (document.getElementById("deleteButton") != null) {
			deleteButton.disabled = true
		}

		previewButton.disabled = false
		insertButton.disabled = false

	} // End function

	var flashFolder = "/flash/"
	var previousFlash
	var selectedFlashEncoded
	function doSelect(oFlash) {
		selectedFlashFile = flashFolder + oFlash.childNodes(0).name
		selectedFlashEncoded = oFlash.childNodes(0).name2

		oFlash.style.border = "3px solid #08246B"
		currentFlash = oFlash
		if (previousFlash != null) {
			if (previousFlash != currentFlash) {
				previousFlash.style.border = "3px solid #FFFFFF"
			}
		}
		previousFlash = currentFlash

		document.getElementById("previewWindow").innerHTML = "<embed src='" + selectedFlashFile + "' quality='high' pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width='236' height='176' bgcolor='#009933' WMODE=transparent></embed>"

		previewButton.disabled = false
		insertButton.disabled = false

		if (document.getElementById("deleteButton") != null) {
			deleteButton.disabled = false
		}
	}

	function CheckFlashForm()
	{
		//upload, upload1, upload2, upload3, upload4
		var flashDir = '/flash';
		var f1 = document.getElementById("upload");

		// Extract just the filename from the paths of the files being uploaded
		f1_file = f1.value;
		last = f1_file.lastIndexOf ("\\", f1_file.length-1);
		f1_file = f1_file.substring (last + 1);

		if(f1_file == "")
		{
			alert('Por favor, primeiro escolha um arquivo flash para enviar!');
			return false;
		}

		// Loop through the imageDir array
		if(f1_file != "")
		{
			for(i = 0; i < flashFiles.length; i++)
			{
				if(f1_file == flashFiles[i])
				{
					if(!confirm(f1_file + ' já existe. Você confirma a substituição do mesmo?'))
					{
						return false;
					}
				}
			}
		}

		return true;
	}

	</script>
	<title>Insere Flash</title>

	<body bgcolor=threedface style="border: 1px buttonhighlight;">
	<iframe id=tempFrame style="display:none"></iframe>
	<div class="appOutside">
	<div style="border: solid 1px #000000; background-color: #FFFFEE; padding:5px;">
		<img src="he_imagens/popups/bulb.gif" align=left width=16 height=17>
		<span>Informe o endereço do flash a ser inserido ou selecione um flash na lista abaixo. Clique 'Insere' para inserir o flash.</span>
	</div>
	<br>

	<form enctype="multipart/form-data" action="#" method="post" onSubmit="return CheckFlashForm()">
	<span class="appInside1" style="width:350px">
		<div class="appInside2">
		
			<div class="appInside3" style="padding:11px"><span class="appTitle">Upload Flash</span>
				<br>
					<input type="file" name="upload" class="Text240"> <input type="submit" value="Upload" class="Text75">
					<span class="err" style="position:absolute; left:40; top:86;"></span>
		
			</div>
		</div>
	</span>
	&nbsp;
	 
	<span class="appInside1" style="width:350px">
		<div class="appInside2">
			<div class="appInside3" style="padding:11px"><span class="appTitle">Flash Externo</span>
				<br>
				<input type="text" name="externalFlash" id="externalFlash" class="Text240" value="http://">&nbsp;<input type=button value=Carregar class="Text75" onClick="insertExtFlash()">
			</div>
		</div>
	</span>
	
	</form>

	<span class="appInside1" style="width:350px">
		<div class="appInside2">
			<div class="appInside3" style="padding:11px"><span class="appTitle">Flash Interno </span>
				<table border=0 cellspacing=0 cellpadding=0 style="padding-bottom:5px">
				<tr><td>&nbsp;<!-- select style="width:242px; font-size:11px; font-family:Arial;" name="selFlashLib">
					<script>outputFlashLibraryOptions();</script>
				</select-->
				</td><td>&nbsp;<!--input type=button value="Trocar" class=text75 onClick="switchFlashLibrary(selFlashLib.value)"--></td></tr>
				</table>
		<div style="height:325px; width:325px; overflow: auto; border: 2px inset; background-color: #FFFFFF">
		
			<table border="0" cellspacing="0" cellpadding="3" style="width:100%">
<%
				for (Iterator i = col.iterator(); i.hasNext();) {
					final File file = (File) i.next();
%>		
					<tr style="cursor:hand">
						<td width="40%" class="body" >
							<div onClick=doSelect(this) style="border: solid 3px #FFFFFF">
							<img src="he_imagens/popups/flash_icon.gif" width=16 height=16 align=absmiddle name="<%=file.getName()%>" name2="<%=file.getName()%>">&nbsp;<%=file.getName()%>
							<span style="position:absolute; left=200"><%=file.length()%> Bytes</span>
							</div>
						</td>
					</tr>
<%
				}
%>						
			</table>
			</div>
			</div>
		</div>
	</span>
	&nbsp;
	<span class="appInside1" style="width:350px; position:absolute">
		<div class="appInside2">
			<div class="appInside3" style="padding:11px"><span class="appTitle">Pré-Visualização</span><br>
				<span id="previewWindow" style="height:180px; width:240px; overflow: auto; border: 2px inset; background-color: #FFFFFF">
				</span><input type="button" name="previewButton" value="Pré-Visualização" class="Text75" onClick="javascript:viewImage(selectedFlashFile)" disabled=true style="position:absolute; left:257px;">
			</div>
		</div>
	</span>

	<span class="appInside1" style="width:350px; padding-top:5px;">
		<div class="appInside2">
			<div class="appInside3" style="padding:11px"><span class="appTitle">Propriedades do Flash</span>
			<table border="0" cellspacing="0" cellpadding="5">
			  <tr>
				<td class="body" width="70">Loop:</td>
				<td class="body" width="88">
					<select class="Text70" name=loop>
						<script>printLoop()</script>
						<option value="true">True</option>
						<option value="false">False</option>
					</select>
				</td>
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
			  </tr>
			  <tr>
				<td class="body">Largura Flash :</td>
				<td class="body">
				  <input type="text" name="image_width" size="3" class="Text70" maxlength="3">
			  </td>
				<td class="body">Altura Flash :</td>
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
			</table>
			</div>
		</div>
	</span>

	<div style="padding-top: 6px;">
	<input type="button" name="deleteButton" value="Excluir" class="Text75" onClick="javascript:deleteFlash(selectedFlashEncoded)"  disabled>
	</div>

	</div>
	<div style="padding-top: 6px; float: right;">
	<input type="button" name="insertButton" value="Inserir" class="Text75" onClick="javascript:insertImage(selectedFlashFile)" disabled=true>
	<input type="button" name="Submit" value="Cancelar" class="Text75" onClick="javascript:window.close()">
	</div>

	</table>
	