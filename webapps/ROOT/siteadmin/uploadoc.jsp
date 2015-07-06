<html>
<%@ page import="br.com.relato.upload.TestContent" %>
<%@ page import="br.com.relato.upload.MyRequestWrapper" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.IOException" %>
<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<%@ page errorPage="ExceptionHandler.jsp" %>


<%
String dir_path = "/www/norber/webapps/ROOT/documentos";
%>



<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value="<%=dir_path%>" property="overwrite" value="true"/>
</jsp:useBean>
<head>
<title>Envia Arquivo para o Provedor</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="styles.css" type="text/css">

<script language="javascript">

</script>

</head>
<body bgcolor="#FFFFFF" text="#000000">

<%!

String fileUploaded="";
String cCampoRetorno="";
MultipartFormDataRequest mrequest;

%>

<ul><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">

<%

	if (MultipartFormDataRequest.isMultipartFormData(request)) {
         
         // Uses MultipartFormDataRequest to parse the HTTP request.
         mrequest = new MultipartFormDataRequest(new MyRequestWrapper(request));
         String todo = mrequest.getParameter("todo");

		String overwrite = mrequest.getParameter("overwrite");
		boolean c = false;
		if ( overwrite != null && overwrite.length() != 0 )
			c = true;

		upBean.setOverwrite(c);
         
     	 if ((todo != null) && (todo.equalsIgnoreCase("upload"))) {
            
        	Hashtable files = mrequest.getFiles();
            if ((files != null) || (!files.isEmpty())) {

                UploadFile file = (UploadFile) files.get("uploadfile");
                long filesize = 100000;

		String fileName = file.getFileName();

		File arquivo = new File(dir_path + "/" + fileName);
		if ( !c && arquivo.exists())
			throw new IOException("O arquivo já existe no servidor!");

            	file.setFileName( fileName );
                out.println("<li>Arquivo enviado: "+file.getFileName()+" ("+file.getFileSize()+" bytes)"+"<BR> Tipo : "+file.getContentType());
                fileUploaded=file.getFileName();

                // Uses the bean now to store specified by jsp:setProperty at the top.
               	upBean.store(mrequest, "uploadfile");

	    } else {
               	out.println("<li>Nenhum arquivo foi transferido.");
            }
     	} else { 
     	
     		mrequest = null;
     		fileUploaded = "";
     		out.println("<BR> todo="+todo);
     	}	
     	
    } else  {
    	fileUploaded="";
      	cCampoRetorno = (request.getParameter("retorno") != null ? request.getParameter("retorno") : "");
    }
%>

</font></ul>

<% if (fileUploaded.equals("")) { %>

<form method="post" action="uploadoc.jsp" name="upform" enctype="multipart/form-data" onSubmit="return verifica();">
  <table width="60%" border="0" cellspacing="1" cellpadding="1" align="center">
    <tr>
      <td align="left"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">
      <b>Selecione o arquivo a enviar:</b></font></td>
    </tr>
    <tr>
      <td align="left"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">
        <input type="file" class="form" name="uploadfile" id="uploadfile" size="50">
        </font></td>
    </tr>
    <tr>
      <td align="left"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">
        <input type="hidden" name="todo" value="upload">
        <input type="submit" class="botao" name="Submit" value="Envia">
        <input type="reset" class="botao" name="Reset" value="Apaga">
        <input type="checkbox" name="overwrite" value="true"> Reescreve arquivo?
        </font></td>
    </tr>
  </table>
  <br>
  <br>
</form>

<% } else {
	
	//fileUploaded="";
	
%>

<form>

  <p>&nbsp;</p>
  <p align="center">&nbsp;<input type="button" class="botao" name="btnFechar" value="Voltar" onclick="history.go(-1)"></p>

</form>

<% } %>

<script language="javascript">

function verifica(){
	var obj = document.getElementById("uploadfile");
	if ( obj.value == "" ){
		alert("Nenhuma imagem encontrada!!");
		return false;
	}else
		return true;
}

</script>

</body>
</html>
