<%@ page contentType="text/html; charset=windows-1252" %>
<%@page import="java.io.File"%>
<%@page import="br.com.relato.ConstantsApp"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="br.com.relato.upload.MyRequestWrapper" %>
<%@page language="java" import="javazoom.upload.*,java.util.*" %>
<%@page errorPage="/exceptionhandler.jsp" %>


<html>
<head>
<link rel="stylesheet" href="/he/he_includes/he_styles.css" type="text/css">
<script type="text/javascript" src="/scripts/browser.js"></script>
<%
String imagens_dir_path = ConstantsApp.getParametro("portalimgpath");
String toDo = request.getParameter("ToDo");
String cCampoRetorno=request.getParameter("campo");
%>

<%!
String fileUploaded="";

MultipartFormDataRequest mrequest;
%>

	<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
	<jsp:setProperty name="upBean" property="folderstore" value="<%=imagens_dir_path%>"/>
	</jsp:useBean>

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
		mrequest = new MultipartFormDataRequest(new MyRequestWrapper(request));
       	Hashtable files = mrequest.getFiles();
        if ((files != null) || (!files.isEmpty())) {
                UploadFile file = (UploadFile) files.get("upload");
               	upBean.store(mrequest, "upload");
     	} else { 
     		mrequest = null;
     	}	
    }

String imagens =  "";

File imagesFolder = new File(imagens_dir_path);
final List col = (List)FileUtils.listFiles(imagesFolder, new String[] {"bmp", "jpg", "jpeg", "gif", "png"}, true);
Collections.sort(col);
for (Iterator it = col.iterator(); it.hasNext();) {
	final File file = (File) it.next();
    if ( it.hasNext() )
        imagens += "'" + file.getName() + "',";
    else
	    imagens += "'" + file.getName() + "'";
}
%>
	<script language=JavaScript>
	
	var notWhitespace = /\S/;
	function cleanWhitespace(node) {
	  for (var x = 0; x < node.childNodes.length; x++) {
	    var childNode = node.childNodes[x]
	    if ((childNode.nodeType == 3)&&(!notWhitespace.test(childNode.nodeValue))) {
			// that is, if it's a whitespace text node
	      node.removeChild(node.childNodes[x])
	      x--
	    }
	    if (childNode.nodeType == 1) {
	// elements can have text child nodes of their own
	      cleanWhitespace(childNode)
	    }
	  }
	  alert("ASFDASDFASFSAFD");
	}
	window.onload = function()
	{
		document.getElementById("DEP").value = "/portal/imagens";
	}

	//window.opener.doStyles()
	window.onerror = function() { return true; }
	var myPage = window.opener;
	var imageAlign;

	var imageDir = Array(<%=imagens%>);

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
			document.location.href = 'insertImage.jsp?ToDo=DeleteImage&imgSrc='+imgSrc;
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
		
		
			window.opener.insertImagem(imgSrc);
			
		self.close();
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

	var imageFolder = "imagens/";
	var previousImage
	var selectedImage
	var selectedImageEncoded
	
	function doSelect(oImage) {
		//alert('Image = '+oImage);
		//alert('Image name = '+oImage.name);
		//alert('Image name 2 = '+oImage.name2);
		//alert('Image name 2 = '+oImage.id);
		
		selectedImage = "imagens/" + oImage.id
		selectedImageEncoded = oImage.name2
		
		oImage.style.border = "3px solid #08246B"
		currentImage = oImage
		if (previousImage != null) {
			if (previousImage != currentImage) {
				previousImage.style.border = "3px solid #FFFFFF"
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

	function CheckImageForm()
	{
		//upload, upload1, upload2, upload3, upload4
		var imgDir = '/imgdir';
		var u1 = document.getElementById("upload");
		var u2 = document.getElementById("upload1");
		var u3 = document.getElementById("upload2");
		var u4 = document.getElementById("upload3")
		var u5 = document.getElementById("upload4");

		// Extract just the filename from the paths of the files being uploaded
		u1_file = u1.value;
		last = u1_file.lastIndexOf ("\\", u1_file.length-1);
		u1_file = u1_file.substring (last + 1);

		u2_file = u2.value;
		last = u2_file.lastIndexOf ("\\", u2_file.length-1);
		u2_file = u2_file.substring (last + 1);

		u3_file = u3.value;
		last = u3_file.lastIndexOf ("\\", u3_file.length-1);
		u3_file = u3_file.substring (last + 1);

		u4_file = u4.value;
		last = u4_file.lastIndexOf ("\\", u4_file.length-1);
		u4_file = u4_file.substring (last + 1);

		u5_file = u5.value;
		last = u5_file.lastIndexOf ("\\", u5_file.length-1);
		u5_file = u5_file.substring (last + 1);

		if(u1_file == "" && u2_file == "" && u3_file == "" && u4_file == "" && u5_file == "")
		{
			alert('Por favor, escolha uma imagem antes!');
			return false;
		}

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

		if(u2_file != "")
		{
			for(i = 0; i < imageDir.length; i++)
			{
				if(u2_file == imageDir[i])
				{
					if(!confirm(u2_file + ' já existe. Você realmente quer sobrescrever?'))
					{
						return false;
					}
				}
			}
		}

		if(u3_file != "")
		{
			for(i = 0; i < imageDir.length; i++)
			{
				if(u3_file == imageDir[i])
				{
					if(!confirm(u3_file + ' já existe. Você realmente quer sobrescrever?'))
					{
						return false;
					}
				}
			}
		}

		if(u4_file != "")
		{
			for(i = 0; i < imageDir.length; i++)
			{
				if(u4_file == imageDir[i])
				{
					if(!confirm(u4_file + ' já existe. Você realmente quer sobrescrever?'))
					{
						return false;
					}
				}
			}
		}

		if(u5_file != "")
		{
			for(i = 0; i < imageDir.length; i++)
			{
				if(u5_file == imageDir[i])
				{
					if(!confirm(u5_file + ' já existe. Você realmente quer sobrescrever?'))
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
	</head>
	
	<body bgcolor="f0f0f0" style="border: 1px buttonhighlight; " onload="cleanWhitespace(node)" >
	<div class="appOutside">
	<table cellpadding="4" cellspacing="0" border="0"><tr><td colspan="2" width="100%" style="padding-bottom:10px;"' >
	<div style="border: solid 1px #000000; background-color: #FFFFEE; padding:5px;">
		<img src="/he/he_imagens/popups/bulb.gif" align=left width=16 height=17>
		<span>Digite a URL da imagem a inserir ou Escolha uma das imagens mostradas abaixo e clique em seu link de inserção para adicioná-la.</span>
	</div>
	</td></tr>
	<tr><td height="60px" width="50%" >
	<form enctype="multipart/form-data" action="#" method="post" onSubmit="return CheckImageForm()">
	<!-- Hidden DEP tag is used to persist the path via JS and window.opener -->
		<input type="hidden" name="DEP" id="DEP" value=""/>
	<!-- End DEP tag -->
	<div class="appInside1" style="width:100%;height:60px;float:left;">
		<div class="appInside2" style="width:100%;">
			<div class="appInside3" style="padding:11px;width:100%;"><span class="appTitle">Upload (Enviar Imagem)</span>
				<br>
				<input type="file" name="upload" id="upload" class="Text230"> <input type="submit" value="Upload" class="Text75"> <!-- input type="button" value="»" class="Text15" onClick="toggleUploadDiv()" id="toggleButton"-->
				<span class="err" style="position:absolute; left:40; top:86;"></span>
				<div id="uploadDiv" style="display:none">
					<input type="file" name="upload1" class="Text230"><br>
					<input type="file" name="upload2" class="Text230"><br>
					<input type="file" name="upload3" class="Text230"><br>
					<input type="file" name="upload4" class="Text230">
				</div>
			</div>
		</div>
	</div>

	</td><td  height="60px" width="50%">
	<div class="appInside1"  style="width:100%; height:60px;float:right;">
		<div class="appInside2" style="width:100%;">
			<div class="appInside3" style="padding:11px;width:100%;"><span class="appTitle">Imagem Externa</span>
				<br>
				<input type="text" name="externalImage" id="externalImage" class="Text240" value="http://">&nbsp;<input type=button value=Carregar class="Text75" onClick="insertExtImage()"><br>
				<!-- div style="height:100; display:none" id="dummyDiv">
					&nbsp;
				</div-->
			</div>
		</div>
	</div>
	</form>
	</td></tr>
	<tr><td height="340px" valign="top" width="50%">
	<div>
		<div class="appInside1" style="width:100%;margin-top:10px;">
			<div class="appInside2" style="width:100%;">
				<div class="appInside3" style="padding:11px;width:100%;"><span class="appTitle">Imagem Interna</span>
					<div style="height:325px; width:318px; overflow: auto; border: 1px inset; background-color: #FFFFFF;" id="divList">
			
				<table border="0" cellspacing="0" cellpadding="0" style="width:100%">
	<%
					for (Iterator i = col.iterator(); i.hasNext();) {
						final File file = (File) i.next();
						
						
	%>		
						<tr style="cursor:hand">
							<td width="40%" class="body" >
								<div onClick="doSelect(this)" class="linha" name="<%=file.getName()%>" name2="<%=file.getName()%>" id="<%=file.getName()%>" >
								<img src="/he/he_imagens/popups/image.gif" width=16 height=16 align=absmiddle />&nbsp;<%=file.getName()%>
								<span ><%=file.length()%> Bytes</span>
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
		</div>
	</div>
		</td><td  height="340px" valign="top" width="50%">
		<div class="appInside1" style="width:100%; float:right;height:340px;margin-top:10px; " >
			<div class="appInside2">
				<div class="appInside3" style="padding:11px;"><span class="appTitle">Pré-Visualização</span><br>
					<div id="previewWindow" name="previewWindow" style="margin:10px; height:150px; width:300px; overflow: auto; border: 2px inset; background-color: #FFFFFF">
					</div><input type="button" name="previewButton" id="previewButton" value="Pré-Visualização" class="Text75" onClick="javascript:viewImage(selectedImage)" disabled=true style="width:inherit;">
				</div>
			</div>
		</div>
	</div>
	</td></tr><tr><td>
	<!-- span class="appInside1" style="width:350px; padding-top:5px;">
		<div class="appInside2">
			<div class="appInside3" style="padding:11px"><span class="appTitle">Propriedades da Imagem</span>
			<table border="0" cellspacing="0" cellpadding="5">
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
	</span-->

	<div style="padding-top: 6px;">
		<input type="button" name="deleteButton" id="deleteButton" value="Excluir" class="Text75" onClick="javascript:deleteImage(selectedImageEncoded)" >
	</div>
	</td><td>
	</div>
	<div style="padding-top: 6px; float: right;">
		<input type="button" name="insertButton" id="insertButton" value="Inserir" class="Text75" onClick="javascript:insertImage(selectedImage)" disabled=true>
		<input type="button" name="Submit" id="Submit" value="Cancelar" class="Text75" onClick="javascript:window.close()">
	</div>
	</td></tr>
	</table>

	<script>

	if (window.opener.imageEdit)
	{
		selectedImage = window.opener.selectedImage.src;
		previewModify();
	}

	</script>

	</body>
</html>
