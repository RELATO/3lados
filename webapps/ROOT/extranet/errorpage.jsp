<html>

<head>
<style type="text/css">
	body { 
		font-family: Tahoma;
	}
</style>
</head>

<body leftmargin="0">
<br>
  <table width="780" border="0" cellpadding="0" cellspacing="0">
    <tr> 
		<td align="center">
		<span style="font-size: 18px; font-weight: bold;">
			Algum erro aconteceu ao processar a requisição!!
			<br><br>
			<%
			if ( request.getAttribute("erro") != null )
				out.print(request.getAttribute("erro"));
			%>
		</span>
		</td>
    </tr>
  </table>
</body>

</html>