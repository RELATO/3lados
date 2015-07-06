<%@ page contentType="text/html; charset=iso-8859-1" %>
<%@page import="java.io.File"%>
<%@page import="br.com.relato.EntryPoint"%>
<%@page import="br.com.relato.Constants"%>
<%@page import="br.com.relato.htmledit.menu.Menu"%>
<%@page import="br.com.relato.htmledit.menu.MenuService"%>
<%@page import="br.com.relato.htmledit.menu.MenuRender"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="br.com.relato.upload.MyRequestWrapper" %>
<%@page language="java" import="javazoom.upload.*,java.util.*" %>
<%@page errorPage="/exceptionhandler.jsp" %>

<%
String imagens_dir_path = "/www/hexagon/webapps/ROOT/imagens/";
String imagens_dir_path_default = "/www/hexagon/webapps/ROOT";
String flash_dir_path = "/www/hexagon/webapps/ROOT/flash/";
String dir_path = "";
%>

<%!
String fileUploaded="";
String cCampoRetorno="";
MultipartFormDataRequest mrequest;
%>
<%

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
		mrequest = new MultipartFormDataRequest(new MyRequestWrapper(request));
    }
    
String toDo = (request.getParameter("ToDo") != null ? request.getParameter("ToDo") : "" );
if ("InsertImage".equals(toDo) || "DeleteImage".equals(toDo) || "UploadImage".equals(toDo) ) {
	if (mrequest != null && mrequest.getParameter("pasta")!= null){
		dir_path =imagens_dir_path_default + mrequest.getParameter("pasta");
	}else
		dir_path = imagens_dir_path;
}else 
	dir_path = flash_dir_path;

%>

	<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
	  <jsp:setProperty name="upBean" property="folderstore" value="<%=dir_path%>" property="overwrite" value="true"/>
	</jsp:useBean>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script src="scripts/menu.js"></script>
<%
	java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z");
	String text = sdf.format(date);
%>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" content="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="<%=text%>">
<META HTTP-EQUIV="Date" CONTENT="<%=text%>">
<title>HTML Editor</title>
<style>
.select{
background-color: #08246B;
color: #FFFFFF;
}	
.unselect{
background-color: #FFFFFF;
}
body{
	overflow: auto;
}
</style>
</head>
<body>

<%
String pathToIncFiles = getServletContext().getInitParameter("pathToIncFiles");;
%>

<jsp:useBean id="heu" scope="session" class="system.HEUtil">
  <jsp:setProperty name="heu" property="pathToIncFiles" value="<%=pathToIncFiles%>"/>
</jsp:useBean>

<%  
if ("InsertImage".equals(toDo) || "DeleteImage".equals(toDo) || "UploadImage".equals(toDo) ) {
%>
	<%@include file="he_includes/pageInsertImage.inc"%>
<%
}else if ("InsertFlash".equals(toDo) || "DeleteFlash".equals(toDo) || "UploadFlash".equals(toDo) ) {
%>
	<%@include file="he_includes/pageInsertFlash.inc"%>
<%
} else if ("FindReplace".equals(toDo)) {
	out.print(heu.getTextoInc("find_replace.inc"));
} else if ("SpellCheck".equals(toDo)) {
	out.print(heu.getTextoInc("spell_check.inc"));
} else if ("DoSpell".equals(toDo)) {
	out.print(heu.getTextoInc("do_spell.inc"));
} else if ("InsertTable".equals(toDo)) {
	out.print(heu.getTextoInc("insert_table.inc"));
} else if ("ModifyTable".equals(toDo)) {
	out.print(heu.getTextoInc("modify_table.inc"));
} else if ("ModifyCell".equals(toDo)) {
	out.print(heu.getTextoInc("modify_cell.inc"));
} else if ("InsertForm".equals(toDo)) {
	out.print(heu.getTextoInc("insert_form.inc"));
} else if ("ModifyForm".equals(toDo)) {
	out.print(heu.getTextoInc("modify_form.inc"));
} else if ("InsertTextField".equals(toDo)) {
	out.print(heu.getTextoInc("insert_textfield.inc"));
} else if ("ModifyTextField".equals(toDo)) {
	out.print(heu.getTextoInc("modify_textfield.inc"));
} else if ("InsertTextArea".equals(toDo)) {
	out.print(heu.getTextoInc("insert_textarea.inc"));
} else if ("ModifyTextArea".equals(toDo)) {
	out.print(heu.getTextoInc("modify_textarea.inc"));
} else if ("InsertHidden".equals(toDo)) {
	out.print(heu.getTextoInc("insert_hidden.inc"));
} else if ("ModifyHidden".equals(toDo)) {
	out.print(heu.getTextoInc("modify_hidden.inc"));
} else if ("InsertButton".equals(toDo)) {
	out.print(heu.getTextoInc("insert_button.inc"));
} else if ("ModifyButton".equals(toDo)) {
	out.print(heu.getTextoInc("modify_button.inc"));
} else if ("InsertCheckbox".equals(toDo)) {
	out.print(heu.getTextoInc("insert_checkbox.inc"));
} else if ("ModifyCheckbox".equals(toDo)) {
	out.print(heu.getTextoInc("modify_checkbox.inc"));
} else if ("InsertSelect".equals(toDo)) {
	out.print(heu.getTextoInc("insert_select.inc"));
} else if ("ModifySelect".equals(toDo)) {
	out.print(heu.getTextoInc("modify_select.inc"));
} else if ("InsertRadio".equals(toDo)) {
	out.print(heu.getTextoInc("insert_radio.inc"));
} else if ("InsertRadio".equals(toDo)) {
	out.print(heu.getTextoInc("insert_radio.inc"));
} else if ("ModifyRadio".equals(toDo)) {
	out.print(heu.getTextoInc("modify_radio.inc"));
} else if ("PageProperties".equals(toDo)) {
	out.print(heu.getTextoInc("page_properties.inc"));
} else if ("Chars".equals(toDo)) {
	out.print(heu.getTextoInc("insert_chars.inc"));
} else if ("InsertLink".equals(toDo)) {
	out.print(heu.getTextoInc("insert_link.inc"));
} else if ("InsertEmail".equals(toDo)) {
	out.print(heu.getTextoInc("insert_email.inc"));
} else if ("InsertAnchor".equals(toDo)) {
	out.print(heu.getTextoInc("insert_anchor.inc"));
} else if ("ModifyAnchor".equals(toDo)) {
	out.print(heu.getTextoInc("modify_anchor.inc"));
} else if ("MoreColors".equals(toDo)) {
	out.print(heu.getTextoInc("more_colors.inc"));
} else if ("CustomInsert".equals(toDo)) {
	out.print(heu.getTextoInc("custom_insert.inc"));
} else if ("ShowHelp".equals(toDo)) {
	out.print(heu.getTextoInc("help.inc"));
}
%>

</body>
</html>