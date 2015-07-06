<html>
<%@ page language="java" import="javazoom.upload.*,java.util.*,java.io.*,system.UriUtil" %>
<%@ page errorPage="/exceptionhandler.jsp" %>

<%@page import="br.com.relato.ConstantsApp" %> 

<%
String dir_path = (ConstantsApp.getParametro("email.documentos")).trim(); 
%>

<jsp:useBean id="uploadb" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="uploadb" property="folderstore" value="<%=dir_path%>" property="overwrite" value="true"/>
</jsp:useBean>
<head>
<title>Envia Arquivo para o Provedor</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="styles.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" text="#000000">

<%!
	String cCampoRetorno="";
	int idjob= 0;
	String opcao= "";   
%>


<ul><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">

<%

	idjob = (null != session.getAttribute("idjobX") ? ((Integer)(session.getAttribute("idjobX"))).intValue() : 0); 
	opcao = (null != session.getAttribute("opcaoX") ? ((String)session.getAttribute("opcaoX")).trim() : ""); 
	//System.out.println("RAFAEL id=== "+idjob+" - opcao =="+opcao);
	
	MultipartFormDataRequest mrequest;
	InputStream input;
	StringBuffer bufferAux = new StringBuffer();
	String mensagemEscapada = "";
	String fileUploaded="";
	//UploadUtils uputil = new UploadUtils();
	uploadb.setOverwrite(true);
	
	if (MultipartFormDataRequest.isMultipartFormData(request)) {
         
         // Uses MultipartFormDataRequest to parse the HTTP request.
         mrequest = new MultipartFormDataRequest(request);
         String todo = mrequest.getParameter("todo");
     	 if ((todo != null) && (todo.equalsIgnoreCase("upload"))) {
        	Hashtable files = mrequest.getFiles();
            if ((files != null) || (!files.isEmpty())) {
                UploadFile file = (UploadFile) files.get("uploadfile");
                out.println("<li>Arquivo enviado: "+file.getFileName()+" ("+file.getFileSize()+" bytes)"+"<BR> Tipo : "+file.getContentType());
                fileUploaded=file.getFileName();
				//isto é um arquivo de dados
                // Uses the bean now to store specified by jsp:setProperty at the top.
                uploadb.store(mrequest, "uploadfile");
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
      	//idjob = (null != request.getParameter("idjob") ? Integer.parseInt(request.getParameter("idjob")) : 0);
		opcao = (null != request.getParameter("opcao") ? request.getParameter("opcao") : ""); 
      	session.setAttribute( "campoRetorno", cCampoRetorno );
      	//session.setAttribute( "idjobX", idjob );
      	session.setAttribute( "opcaoX", opcao );
      	 
    }
%>

</font></ul>

<% if (fileUploaded.equals("")) { %>
 
<form method="post" action="arquivo_email.jsp" name="upform" enctype="multipart/form-data">
  <table width="60%" border="0" cellspacing="1" cellpadding="1" align="center">
    <tr>
      <td align="left"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">
      <b>Selecione o arquivo a enviar:</b></font></td>
    </tr>
    <tr>
      <td align="left"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">
        <input type="file" class="form" name="uploadfile" size="50">
        </font></td>
    </tr>
    <tr>
      <td align="left"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">
        <input type="hidden" name="todo" value="upload">
        <input type="submit" class="botao" name="Submit" value="Envia">
        <input type="reset" class="botao" name="Reset" value="Apaga">
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
  <p align="center">&nbsp;<input type="button" class="botao" name="btnFechar" value="Fechar" onclick="JavaScript: retornaValor()"></p>

</form>

<% } %>

<script language="javascript">

function retornaValor() {

	var xarq = window.opener.document.getElementById("filename")
	if (null!=xarq) {
		var arquivo_enviado = "<%=fileUploaded%>";
		xarq.value = arquivo_enviado;	
	} else {
		alert('xarq = null')
	}	
	self.close();

}

</script>

</body>
</html>