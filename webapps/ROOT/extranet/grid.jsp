<%@page import="br.com.relato.extranet.web.SearchUpload"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.com.relato.EntryPoint"%>
<%@page import="br.com.relato.util.Cast"%>
<%@page import="br.com.relato.extranet.web.DeleteUpload"%>

<html>
<head>
	<link rel="stylesheet" href="styles/grid.css" type="text/css"></link>
	<style> 
		body, html {margin:0px; padding: 0px; overflow: hidden;} 
		.botao {
			border: 1px solid white;
			background-color: #000000;
			color: white;
			font-weight: bolder;
			font-family: verdana, Verdana, Arial, sans-serif;
			font-size: 10px;
			height: 20px;
			width: 30px;
			text-align: center;
			padding: 0px;
			}
		.botaoover {
			border: 1px solid #000000;
			background-color: white;
			color: #000000;
			font-weight: bolder;
			font-family: verdana, Verdana, Arial, sans-serif;
			font-size: 10px;
			height: 20px;
			width: 30px;
			text-align: center;
			padding: 0px;
			cursor: pointer;
			}
		.botao1 {
			border: 1px solid white;
			border-left: none;
			background-color: #000000;
			color: white;
			font-weight: bolder;
			font-family: verdana, Verdana, Arial, sans-serif;
			font-size: 10px;
			height: 20px;
			width: 30px;
			text-align: center;
			padding: 0px;
			}
		.botaoover1 {
			border: 1px solid #000000;
			border-left: none;
			background-color: white;
			color: #000000;
			font-weight: bolder;
			font-family: verdana, Verdana, Arial, sans-serif;
			font-size: 10px;
			height: 20px;
			width: 30px;
			text-align: center;
			padding: 0px;
			cursor: pointer;
			}
		.caixa {
			border: 1px solid white;
			border-right: none;
			background-color: #000000;
			color: white;
			font-weight: bolder;
			font-family: verdana, Verdana,Arial, sans-serif;
			font-size: 10px;
			height: 20px;
			width: 150px;
			padding-top: 2px;
			text-align: center;
			vertical-align: top;
			margin-left: -5px;
			}
		.botao2 {
			border: 1px solid white;
			background-color: #000000;
			color: white;
			font-weight: bolder;
			font-family: verdana, Verdana, Arial, sans-serif;
			font-size: 11px;
			height: 20px;
			width: 100px;
			text-align: center;
			}
		.botaoover2 {
			border: 1px solid #000000;
			background-color: white;
			color: #000000;
			font-weight: bolder;
			font-family: verdana, Verdana, Arial, sans-serif;
			font-size: 11px;
			height: 20px;
			width: 100px;
			text-align: center;
			padding: 0px;
			cursor: pointer;
			}
		.botaopeq {
			border: 1px solid white;
			background-color: #000000;
			color: white;
			font-weight: bolder;
			font-family: verdana, verdana, Arial, sans-serif;
			font-size: 10px;
			height: 20px;
			width: 80px;
			text-align: center;
			padding: 0px;
			}
		.botaooverpeq {
			border: 1px solid #000000;
			background-color: white;
			color: #000000;
			font-weight: bolder;
			font-family: verdana, verdana, Arial, sans-serif;
			font-size: 10px;
			height: 20px;
			width: 80px;
			text-align: center;
			padding: 0px;
			cursor: pointer;
		}
		.campotexto {
			border: 1px solid #000000;
			font-size: 10px;
			font-family: verdana, Verdana, Arial;
			width: 150px;
		}
	</style>

	<!-- ActiveWidgets stylesheet and scripts -->
	<script src="/extranet/scripts/grid.js"></script>

	<!-- Include patches here -->
	<script src="/extranet/scripts/paging.js"></script>	

	<!-- grid format -->
	<style>
		.active-controls-grid {height: 200px; font: menu;}

		.active-column-0 {width:  40px;}
		.active-column-1 {width: 200px;}
		.active-column-2 {width: 305px;}
		.active-column-3 {width:  80px;}
		.active-column-4 {width: 115px;}

		.active-grid-column {border-right: 1px solid threedlightshadow;}
		.active-grid-row {border-bottom: 1px solid threedlightshadow;}
	</style>
<script>
<%
if ( request.getParameter("delete") != null ){
	String msg = DeleteUpload.delete(request.getParameter("id"), request.getParameter("type"));
%>
	alert("<%=msg%>");
<%
}
%>
</script>
<%!
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

String changeDate(String d){
	if ( d != null )
		return sdf.format(Cast.toDate(d));
	
	return "";
}

String changeValue(Object d){
	if ( d != null ){
		String value = (String)d;
		value = value.replaceAll("'", "");
		value = value.replaceAll("\"", "");
		return value;
	}
	
	return "";
}

String checkNull(Object o){
	o = changeValue(o);
	if ( o != null )
		return (String)o;
	
	return "";
}
%>

	<!-- grid data -->
	<script>

		var myData = [
<%
			int count = 0;
			List list = SearchUpload.execute(request.getParameter("action"),
							request.getParameter("field"),
							request.getParameter("value"),
							request.getParameter("type"),"N");

			Iterator i = list.iterator();
			while ( i.hasNext() ){
				List row = (List)i.next();
				if ( i.hasNext() ){
%>
					["<%=checkNull(row.get(0))%>","<%=checkNull(row.get(1))%>", "<%=checkNull(row.get(2))%>", "<%=checkNull(row.get(3))%>", "<%=changeDate((String)row.get(4))%>"],
<%
				}else{
%>
					["<%=checkNull(row.get(0))%>","<%=checkNull(row.get(1))%>", "<%=checkNull(row.get(2))%>", "<%=checkNull(row.get(3))%>", "<%=changeDate((String)row.get(4))%>"]
<%
				}
				count++;
			}
%>
		];

		var myColumns = [
			"ID", "Nome", "Descrição", "Usuário Upload", "Data/hora Upload"
		];
	</script>

<script>
var idfilho;

function openFather(id){
	this.idfilho = id;
	parent.setId(id);
}

</script>
</head>
<body>

	<script>

	//	create ActiveWidgets Grid javascript object
	var obj = new Active.Controls.Grid;

	//	replace the built-in row model with the new one (defined in the patch)
	obj.setModel("row", new Active.Rows.Page);

	obj.setProperty("row/count", <%=count%>);
	obj.setProperty("column/count", 5);
	obj.setProperty("data/text", function(i, j){return myData[i][j]});
	obj.setProperty("column/texts", myColumns);
	
	

	//	set click action handler
	obj.setAction("click", function(src){window.status = src.getItemProperty("text")});
	obj.setAction("click", function(src){openFather(src.getIndexProperty("text"));});

	//	set headers width/height
	obj.setRowHeaderWidth("28px");
	obj.setColumnHeaderHeight("20px");
	
	//	set page size
	obj.setProperty("row/pageSize", 10);

	//	write grid html to the page
	document.write(obj);

	</script>

	<table width="770" cellpadding="0" cellspacing="0" align="left" style="padding-top: 5px; padding-bottom: 3px; padding-left: 5px; background-color: #EBEADB; border-top: 1px solid #000000;">
	  <tr>
		<td height="40">
			<input class="caixa" readonly="yes" style="width: 170px; margin-left: 8px; margin-right: 10px; vertical-align: bottom; border-right: 1px solid white;" type="text" value="<%=list.size() %> <%=list.size() == 1 ? "registro encontrado" : "registros encontrados"%>" name="total">
			<span style="padding-left: 3px;"></span>
			<button class="botao" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onclick='goToPage(-Infinity)'>&lt;&lt;</button>
			<button class="botao1" onMouseOver="this.className='botaoover1';" onMouseOut="this.className='botao1';" onclick='goToPage(-1)'>&lt;</button>
			<span class="caixa" id='pageLabel'></span>
			<button class="botao" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onclick='goToPage(1)'>&gt;</button>
			<button class="botao1" onMouseOver="this.className='botaoover1';" onMouseOut="this.className='botao1';"  onclick='goToPage(Infinity)'>&gt;&gt;</button>
		</td>
		<td width="280" style="border-left: 1px solid #000000;" align="center">
<%
boolean mostra = false;
	if ( Cast.toBoolean(EntryPoint.getUsuario().getAdmin()) )
		mostra = true;

	if ( mostra ){
%>
			<input type="button" class="botaopeq" name="upload" value="Upload" onMouseOver="this.className='botaooverpeq';" onMouseOut="this.className='botaopeq';" onClick="parent.openUpload()"> 
<%
	}
%>
			<span style="padding-left: 6px;"></span>
			<input type="button" class="botaopeq" name="download" value="Download" onMouseOver="this.className='botaooverpeq';" onMouseOut="this.className='botaopeq';" onClick="parent.down()"> 
			<span style="padding-left: 6px;"></span>
<%
	if ( mostra ){
%>
        	<input type="button" class="botaopeq" name="excluir" value="Excluir" onMouseOver="this.className='botaooverpeq';" onMouseOut="this.className='botaopeq';" onClick="parent.deleta()">	
<%
	}
%>
		</td>
	  </tr>
	</table>
	

	

	<!-- button click handler -->
	<script>
	function goToPage(delta){
		var count = obj.getProperty("row/pageCount");
		var number = obj.getProperty("row/pageNumber");
		number += delta;
		if (number < 0) {number = 0}
		if (number > count-1) {number = count-1}
		document.getElementById('pageLabel').innerHTML = "Página " + (number + 1) + " de " + count + " ";

		obj.setProperty("row/pageNumber", number);
		obj.refresh();
	}

	goToPage(0);
	</script>
</body>
</html>