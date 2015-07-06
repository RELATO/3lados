<%@page import="br.com.relato.EntryPoint" %>
<%@page import="br.com.relato.Constants" %>
<%@page import="br.com.relato.ConstantsApp" %>
<%@page import="br.com.relato.extranet.users.SearchUsers" %>
<%@page import="br.com.relato.extranet.Permission"%>
<%@page import="br.com.relato.upload.MyRequestWrapper" %>
<%@page language="java" import="javazoom.upload.*,java.util.*" %>
<%@page import="br.com.relato.extranet.web.DeleteUpload"%>
<%
	java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z");
	String text = sdf.format(date);
%>

<%
String dir_path = ConstantsApp.getParametro("internet.documentos");
MultipartFormDataRequest mrequest = null;
    if (MultipartFormDataRequest.isMultipartFormData(request))
		mrequest = new MultipartFormDataRequest(new MyRequestWrapper(request));  
%>

<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value="<%=dir_path%>" property="overwrite" value="true"/>
</jsp:useBean>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Upload de documentos</title>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" content="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="<%=text%>">
<META HTTP-EQUIV="Date" CONTENT="<%=text%>">

<style type="text/css">
	* { margin: 0px; }
	a {	text-decoration: none; }
	a:hover { text-decoration: underline; }
	body { 
		background-color: #EBEADB; 
		font-size: 12px;
		font-family: Tahoma, Verdana, Arial;
		color: black;
	}
	div {
		position: relative;
		top: 10px;
		left: 10px;
	}
	input.botao {
		border: 1px solid white;
		background-color: #005281;
		color: white;
		font-weight: bolder;
		font-family: Tahoma, Verdana, Arial, sans-serif;
		font-size: 10px;
		height: 20px;
		width: 100px;
		text-align: center;
	}
	input.botaoover {
		border: 1px solid #005281;
		background-color: white;
		color: #005281;
		font-weight: bolder;
		font-family: Tahoma, Verdana, Arial, sans-serif;
		font-size: 10px;
		height: 20px;
		width: 100px;
		text-align: center;
		cursor: pointer;
	}
	.menu {
		padding-left: 10px;
		font-size: 12px;
		font-family: Tahoma, Verdana, Arial;
		color: black;
		text-align: center;
		horizontal-align: center;
	}
	.arq {
		font-size: 12px;
		font-family: Tahoma, Verdana, Arial;
		width: 360px;
	}	
</style>

<script>
function writeName(){
	var name = document.getElementById("arquivo").value;
	document.getElementById("nomearquivo").value = name;
	return true;
}

function reload(){
	var opener;
    if(window.opener)
      opener = window.opener;
    else
      opener = window.dialogArguments;
	opener.reloadPage();
}
</script>

</head>

<body>
<br><br><br>
<span class="menu">Upload de documentos</span>
<br><br>
<div> 
  <%
    if (MultipartFormDataRequest.isMultipartFormData(request)) {
		Hashtable files = mrequest.getFiles();
        if ((files != null) || (!files.isEmpty())) {
                UploadFile file = (UploadFile) files.get("arquivo");
               	upBean.store(mrequest, "arquivo");
				String msg = DeleteUpload.add(mrequest);
				out.print(msg);
				out.print("<br><br>");
				out.print("<center><input class=\"botao\" onClick=\"reload();self.close()\" type=\"button\" onMouseOver=\"this.className='botaoover';\" onMouseOut=\"this.className='botao';\" value=\"Fechar\"></center>");
     	}	
    }else{
%>
  <form enctype="multipart/form-data" action="upload.jsp" method="post" name="form" onSubmit="return writeName()">
	<input type="hidden" name="nomearquivo" id="nomearquivo">    
	<input type="hidden" name="opsarquivopublico" id="opsarquivopublico" value="S">    
	<input type="hidden" name="type" id="type" value="<%=request.getParameter("type")%>">
    Arquivo:&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="file" name="arquivo" id="arquivo" class="arq">
    <br>
    <br>
    <span style="vertical-align: top">Descrição:</span>&nbsp;
    <textarea rows="10" cols="60" name="descricao" id="descricao"></textarea>
    <br>
    <br>
    Assunto:&nbsp;&nbsp;&nbsp;
    <input type="text" size="50" name="assunto" id="assunto"/>
    <br>
    <br>
    Usuário:&nbsp;&nbsp;&nbsp;
    <select name="usuarioprop">
    	<option value=""></option>
    	<%
    		List list = SearchUsers.execute();
    		if ( list.size() != 0 ){
				Iterator i = list.iterator();
				while(i.hasNext()){
	    			List row = (List)i.next();
	    			out.print("<option value=\""+row.get(0)+"\">"+row.get(1)+"</option>");
	    		}
    		}
    	%>
    </select>
    <br>
    <br>
    <input class="botao" type="submit" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" value="Enviar">
    &nbsp;&nbsp; 
    <input class="botao" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" type="reset" value="Limpar">
  </form>
  <%
	}
%>
</div>
</body>
</html>
