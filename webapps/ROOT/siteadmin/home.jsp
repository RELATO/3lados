<html>
<%
	java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z");
	String text = sdf.format(date);
%>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" content="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="<%=text%>">
<META HTTP-EQUIV="Date" CONTENT="<%=text%>">
</head>

<frameset rows="0,*" frameborder="no" border="0" framespacing="0">
  <frame name="top2" id="top2" scrolling="no" noresize src="controlhe.jsp">
  <frame name="body" id="body" src="menu.jsp">
  <noframes>
  <body>

  <p>Esta página usa quadros mas seu navegador não aceita quadros.</p>

  </body>
  </noframes>
</frameset>

</html>