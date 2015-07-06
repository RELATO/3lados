<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Email</title>
</head>

<body>
<br><br><br>
<center>
<%
if ( request.getAttribute("erro") != null )
	out.print(request.getAttribute("erro"));
else
	out.print("Emails enviados com sucesso!!");
%>
</center>
</body>
</html>