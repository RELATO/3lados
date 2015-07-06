<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<title>Extranet Kanaflex S/A</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<%
	java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z");
	String text = sdf.format(date);
	if ( br.com.relato.EntryPoint.getUsuario() == null )
		response.sendRedirect(br.com.relato.Constants.ACCESS_DENIED);
%>

<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" content="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="<%=text%>">
<META HTTP-EQUIV="Date" CONTENT="<%=text%>">
</head>

<frameset rows="220,*" cols="*" framespacing="0" frameborder="NO" border="0">
  <frame src="topo.jsp" name="top2" scrolling="NO" noresize >
  <frame src="empty.jsp" name="body">
</frameset>
<noframes><body>

</body></noframes>
</html>
