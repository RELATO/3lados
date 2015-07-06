<%@ page import="br.com.relato.upload.TestContent" %>
<%@ page import="br.com.relato.upload.MyRequestWrapper" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.IOException" %>
<%@ page import="javazoom.upload.*" %>

<%!
String fileUploaded="";
MultipartFormDataRequest mrequest;
String dir_path = "/www/3lados/webapps/ROOT/images";
%>

<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
	<jsp:setProperty name="upBean" property="folderstore" value="<%=dir_path%>" />
</jsp:useBean>
<%
String cNome= (request.getParameter("nome") != null ? request.getParameter("nome") : "");
String menuInc = "";
%>
<html>
<head>
	<title>Upload de Imagem</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<script type="text/javascript" src="../../tiny_mce_popup.js"></script>
	<script type="text/javascript" src="js/simpleuploader.js"></script>	
	
</head>
<body>
<br>
<table width="100%" align="center">
<tr>
<td>

<%
	try{
		if(MultipartFormDataRequest.isMultipartFormData(request)){
			// Uses MultipartFormDataRequest to parse the HTTP request.
			mrequest = new MultipartFormDataRequest(new MyRequestWrapper(request));
			String todo = mrequest.getParameter("todo");
			upBean.setOverwrite(true);
			String reprocessar = mrequest.getParameter("reprocessar");
			if ((todo != null) && (todo.equalsIgnoreCase("upload"))) {
				Hashtable files = mrequest.getFiles();
				if (files != null || !files.isEmpty()) {
					UploadFile file = (UploadFile) files.get("uploadfile");
					long filesize = 100000;
					String fileName = file.getFileName();
					File Imagem = new File(dir_path + "/" + fileName);
					file.setFileName(fileName);
					fileUploaded = file.getFileName();
					// Uses the bean now to store specified by jsp:setProperty at the top.
				   	upBean.store(mrequest, "uploadfile");
					out.println("<li>Imagem importada: "+file.getFileName()+" ("+file.getFileSize()+" bytes)"+
								//"<BR> Tipo : "+file.getContentType()+
								"<br>Com Sucesso!");
				}else{
				   	out.println("<li><font color=red><strong>Erro! Nenhuma Imagem foi transferido para o Servidor!</strong></font>");
				}
		 	}else{ 
		 		mrequest = null;
		 		fileUploaded = "";
		 		out.println("<BR> todo="+todo);
		 	}	
		}else{
			fileUploaded="";
		}
	}catch (Exception e){
		throw e;
	}

	if (fileUploaded.equals("")) { 
%>
		<form method="post" action="simpleuploader.jsp" name="upform" enctype="multipart/form-data" onSubmit="return verifica();">
			<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
				<tr>
			  		<td align="center">
			  			<b>Selecione a imagem a enviar:</b>
		  			</td>
				</tr>
				<tr>
				  	<td align="center">
			  			<input type="file" class="form" name="uploadfile" id="uploadfile" size="50">
					</td>
				</tr>
				<tr>
				  	<td align="center">
						<input type="hidden" name="todo" value="upload">
						<input type="submit" class="botao" name="Submit" value="Enviar">
						<input type="reset" class="botao" name="Reset" value="Apagar">
					</td>
				</tr>
		  </table>
		</form>
<%
	}else{
%>
		<form>
			<p align="center">
			<input type="button" class="botao" name="btnFechar" value="Inserir" onclick="SimpleUploaderDialog.insert('/images/<%=fileUploaded%>','imagem');"></p>
		</form>
<% 
	} 
%>
</td>
</tr>
</table>

<script language="javascript">
function verifica(){
	var obj = document.getElementById("uploadfile");
	if ( obj.value == "" ){
		alert("Nenhuma imagem encontrada!");
		return false;
	}else{
		return true;
	}
}
</script>
</body>
</html>
 
