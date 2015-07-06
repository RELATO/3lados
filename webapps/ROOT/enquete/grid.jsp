<%@page import="br.com.relato.enquete.SearchEnquete"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.com.relato.EntryPoint"%>
<%@page import="br.com.relato.util.Cast"%>
<%@page import="br.com.relato.enquete.DeleteEnquete"%>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="br.com.relato.criteria.SearchCriteria" %>
<%@page import="br.com.relato.criteria.SQLExpression" %>


<html>
<head>
	<link rel="stylesheet" href="styles/grid.css" type="text/css"></link>
	<style> 
		body, html {margin:0px; padding: 0px; overflow: hidden;} 
		.botao {
			border: 1px solid white;
			background-color: #003366;
			color: white;
			font-weight: bolder;
			font-family: Tahoma, Verdana, Arial, sans-serif;
			font-size: 10px;
			height: 20px;
			width: 30px;
			text-align: center;
			padding: 0px;
			}
		.botaoover {
			border: 1px solid #003366;
			background-color: white;
			color: #003366;
			font-weight: bolder;
			font-family: Tahoma, Verdana, Arial, sans-serif;
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
			background-color: #003366;
			color: white;
			font-weight: bolder;
			font-family: Tahoma, Verdana, Arial, sans-serif;
			font-size: 10px;
			height: 20px;
			width: 30px;
			text-align: center;
			padding: 0px;
			}
		.botaoover1 {
			border: 1px solid #003366;
			border-left: none;
			background-color: white;
			color: #003366;
			font-weight: bolder;
			font-family: Tahoma, Verdana, Arial, sans-serif;
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
			background-color: #003366;
			color: white;
			font-weight: bolder;
			font-family: Tahoma, Verdana,Arial, sans-serif;
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
			background-color: #003366;
			color: white;
			font-weight: bolder;
			font-family: Tahoma, Verdana, Arial, sans-serif;
			font-size: 11px;
			height: 20px;
			width: 100px;
			text-align: center;
			}
		.botaoover2 {
			border: 1px solid #003366;
			background-color: white;
			color: #003366;
			font-weight: bolder;
			font-family: Tahoma, Verdana, Arial, sans-serif;
			font-size: 11px;
			height: 20px;
			width: 100px;
			text-align: center;
			padding: 0px;
			cursor: pointer;
			}
		.botaopeq {
			border: 1px solid white;
			background-color: #003366;
			color: white;
			font-weight: bolder;
			font-family: Tahoma, tahoma, Arial, sans-serif;
			font-size: 10px;
			height: 20px;
			width: 80px;
			text-align: center;
			padding: 0px;
			}
		.botaooverpeq {
			border: 1px solid #003366;
			background-color: white;
			color: #EA0437;
			font-weight: bolder;
			font-family: Tahoma, tahoma, Arial, sans-serif;
			font-size: 10px;
			height: 20px;
			width: 80px;
			text-align: center;
			padding: 0px;
			cursor: pointer;
		}
		.campotexto {
			border: 1px solid #003366;
			font-size: 10px;
			font-family: Tahoma, Verdana, Arial;
			width: 150px;
		}
	</style>

	<!-- ActiveWidgets stylesheet and scripts -->
	<script src="scripts/grid.js"></script>

	<!-- Include patches here -->
	<script src="scripts/paging.js"></script>	

	<!-- grid format -->
	<style>
		.active-controls-grid {height: 200px; font: menu;}

		.active-column-0 {width:  50px;}
		.active-column-1 {width: 782px;}
		.active-column-2 {width: 120px;}

		.active-grid-column {border-right: 1px solid threedlightshadow;}
		.active-grid-row {border-bottom: 1px solid threedlightshadow;}
	</style>
<script>
<%
if ( request.getParameter("delete") != null ){
	String msg = DeleteEnquete.delete(request.getParameter("id"));
%>
	alert("<%=msg%>");
<%
}
%>
</script>
<%!
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

String changeStatus(Object d){
	if ( d != null ){
		String value = (String)	d;
		if ( "A".equals(value) )
			return "Ativo";
		else if ( "I".equals(value) )
			return "Inativo";
	}
	
	return "";
}

String changeDate(String d){
	if ( d != null )
		return sdf.format(Cast.toDate(d));
	
	return "";
}

String checkNull(Object o){
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
			List list = SearchEnquete.execute(request.getParameter("action"),
							request.getParameter("field"),
							request.getParameter("value"));

			Iterator i = list.iterator();
			while ( i.hasNext() ){
				List row = (List)i.next();
				if ( i.hasNext() ){
%>
					["<%=row.get(0)%>","<%=row.get(1)%>", "<%=changeStatus(row.get(2))%>"],
<%
				}else{
%>
					["<%=row.get(0)%>","<%=row.get(1)%>", "<%=changeStatus(row.get(2))%>"]
<%
				}
				count++;
			}
%>
		];

		var myColumns = [
			"ID", "Pergunta", "Status" 
		];
	</script>

<script>
var idfilho;

function setId(id){
	this.idfilho = id;
	parent.setId(id);
}

function openEnquete(url){
	window.open( url + idfilho, "blank", "status=no,scrollbars=yes");
}

function renderEnquete(){
   var width = 520;
   var height = 450;
   
   var left = 99;
   var top = 99;   
	
   var url = "/enquete/resultadoenquete.jsp?idienquete="+ idfilho;
   
   if (idfilho == "" || idfilho == null) {
   		alert ("Selecione um registro primeiro!");
		return;
	}
   window.open(url, 'Enquete', 'width='+width+', height='+height+', top='+top+', left='+left+', scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no');
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
	obj.setProperty("column/count", 3);
	obj.setProperty("data/text", function(i, j){return myData[i][j]});
	obj.setProperty("column/texts", myColumns);
	
	

	//	set click action handler
	obj.setAction("click", function(src){window.status = src.getItemProperty("text")});
	obj.setAction("click", function(src){setId(src.getIndexProperty("text"));});
	//obj.setAction("click", function(src){openEnquete(src.getIndexProperty("text"));});

	//	set headers width/height
	obj.setRowHeaderWidth("28px");
	obj.setColumnHeaderHeight("20px");
	
	//	set page size
	obj.setProperty("row/pageSize", 10);

	//	write grid html to the page
	document.write(obj);

	</script>

	<table width="980" cellpadding="0" cellspacing="0" align="left" style="padding-top: 5px; padding-bottom: 3px; padding-left: 5px; background-color: #3163A0; border-top: 1px solid #white;">
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
		<td width="440" style="border-left: 1px solid white;" align="center">
			<input type="button" onClick="parent.doOpen(2);" class="botao2" name="novo" value="Nova Enquete" onMouseOver="this.className='botaoover2';" onMouseOut="this.className='botao2';">
			<span style="padding-left: 8px;"></span>
			<input type="button" onClick="parent.doOpen(1);" class="botao2" name="edicao" value="Edição" onMouseOver="this.className='botaoover2';" onMouseOut="this.className='botao2';">
        	<span style="padding-left: 8px;"></span>	
			<input type="button" onClick="renderEnquete();" class="botao2" name="visualiza" value="Visualiza" onMouseOver="this.className='botaoover2';" onMouseOut="this.className='botao2';">	
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