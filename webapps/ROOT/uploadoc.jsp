<html>
<%@ page import="br.com.relato.upload.TestContent" %>
<%@ page import="br.com.relato.upload.MyRequestWrapper" %>
<%@ page import="br.com.relato.util.Cast" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.IOException" %>
<%@ page import="br.com.relato.ConstantsApp" %>
<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<%@ page errorPage="ExceptionHandler.jsp" %>


<%
String dir_path = ConstantsApp.getParametro("internet.curriculos");
%>



<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value="<%=dir_path%>" property="overwrite" value="true"/>
</jsp:useBean>
<head>
<title>Envia Arquivo</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="styles.css" type="text/css">

</head>
<body bgcolor="#FFFFFF" text="#000000">

<%!

String fileUploaded=""; 
String cCampoRetorno="";
MultipartFormDataRequest mrequest;

%>

<ul><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">

<%
 
String nomearquivo = (null !=  (request.getParameter("nomearquivo")) ? request.getParameter("nomearquivo"):"");

	if (MultipartFormDataRequest.isMultipartFormData(request)) {
         // Uses MultipartFormDataRequest to parse the HTTP request.
         mrequest = new MultipartFormDataRequest(new MyRequestWrapper(request));
         String todo = mrequest.getParameter("todo");

         nomearquivo= (null !=  (mrequest.getParameter("nomearquivo")) ? mrequest.getParameter("nomearquivo"):"");
         
		String overwrite = mrequest.getParameter("overwrite");
		boolean c = true;
		if ( overwrite != null && overwrite.length() != 0 )
			c = true;
 
		upBean.setOverwrite(c);
         
     	if ((todo != null) && (todo.equalsIgnoreCase("upload"))) {
            
        	Hashtable files = mrequest.getFiles();
            if ((files != null) || (!files.isEmpty())) {

                UploadFile file = (UploadFile) files.get("uploadfile");
                long filesize = 100000;
				String fileName = "";
				String extensao = "";
				fileName = file.getFileName();
				if(fileName.lastIndexOf(".") > -1){
					extensao = fileName.substring(fileName.lastIndexOf("."),fileName.length());
					System.out.println(extensao);
				}
				if (!nomearquivo.equals(""))
					fileName = nomearquivo+extensao;
				File arquivo = new File(dir_path + "/" + fileName);
				if ( !c && arquivo.exists())
					throw new IOException("O arquivo já existe no servidor!");
	            	file.setFileName( fileName );
	                out.println("<li>Arquivo enviado: "+file.getFileName()+" ("+file.getFileSize()+" bytes)"+"<BR> Tipo : "+file.getContentType());
	                fileUploaded = file.getFileName();
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

<form method="post" action="/uploadoc.jsp" name="upform" enctype="multipart/form-data" onSubmit="return verifica();">
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
	        <input type="hidden" name="nomearquivo" value="<%=nomearquivo%>">
	        <input type="submit" class="botao" name="Submit" value="Envia">
	        <input type="reset" class="botao" name="Reset" value="Apaga">
        </font>
     </td>
    </tr>
  </table>
  <br>
  <br>
</form>

<% 
} else {
	
	//fileUploaded="";
	if(!"".equals(fileUploaded)){
//		GravaUploadArquivo grava = new GravaUploadArquivo(fileUploaded,"S",new Integer(Cast.toInt(IdMovimentoProcesso)));
	}else{
//		GravaUploadArquivo grava = new GravaUploadArquivo("","N",new Integer(Cast.toInt(IdMovimentoProcesso)));
	}
%>

  <p>&nbsp;</p>
  <p align="center">&nbsp;
  <input type="button" class="botao" name="Submit" value="Fechar" onclick="JavaScript: retornaValor()"></p>

<% } %>

<script language="javascript">

function verifica(){
	var obj = document.getElementById("uploadfile");
	if ( obj.value == "" ){
		alert("Nenhum arquivo encontrado!!");
		return false;
	}else
		return true;
}

function retornaValor() {

	var xarq = window.opener.document.getElementById("uploaded")
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
