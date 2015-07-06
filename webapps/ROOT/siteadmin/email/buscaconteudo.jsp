<%@page import="br.com.relato.util.SqlHelper"%>
<%@page import="java.util.*"%>
<html>

<head>

<script>

function visualiza(){
	var iframe = document.getElementById("visualizacao");
	iframe.src = "/index.jsp?conteudo="+conteudo.value;
}

function retorna(){
    var opener;
    if(window.opener)
	opener = window.opener;
    else 
	opener = window.dialogArguments;

	opener.zoom_page_return(conteudo.value);

	self.close();
}

</script>

</head>

<body>

<table border="0" width="100%" height="100%">
	<tr>
		<td width="20%">
			<select name="conteudo" style="width:190px;" size="20" onChange="visualiza()">
<%
				List list = SqlHelper.execute("select id, titulo from conteudo order by id", null);
				Iterator i = list.iterator();
				while ( i.hasNext() ){
					List row = (List)i.next();
%>
				<option value="<%=row.get(0)%>"><%=row.get(0)%> - <%=row.get(1)%></option>
<%
				}
%>
			</select>
			<br><br>
			<input type="button" value="Retorna" onClick="retorna()">
		</td>
		<td>
			<iFrame id="visualizacao" src='' style="width:100%; height:100%; border: 1px solid #D4D0C8"></iFrame>
		</td>
	</tr>
</table>

</body>

</html>