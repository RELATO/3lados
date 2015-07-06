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
	
	<style>

		table.principal {
			border: 1px solid #00125E; 
			padding: 0px;
			background-color: #e7e7e7;
			margin-top: 50px;
			vertical-align: middle;		
		}

		input.botao {
			border: 1px solid white;
			background-color: #3163A0;
			color: white;
			font-weight: bolder;
			font-family: Verdana, Tahoma, Arial, sans-serif;
			font-size: 10px;
			width: 80px;
			text-align: center;
		}
		
		input.botaoover {
			border: 1px solid #3163A0;
			background-color: white;
			color: #3163A0;
			font-weight: bolder;
			font-family: Verdana, Tahoma, Arial, sans-serif;
			font-size: 10px;
			width: 80px;
			text-align: center;
			cursor: pointer;
		}

		span.produto {
			font-weight: bold;
			color: #3163A0;
			font-size: 16px;
			font-family: Verdana, Tahoma, Arial, sans-serif;
			text-align: center;
		}

	
	</style>

	<script>
	
	</script>

</head>


<body>
	
		<table class="principal" align="center" width="500" cellpadding="0" cellspacing="0">
			<tr>
				<td><span class="produto">OK Prospects</span></td>
			</tr>
			
			<tr>
				<td align="left">
					OK OK 
				</td>
			</tr>
		</table>

	</form>
</body>

</html>