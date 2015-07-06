<%@page import="br.com.relato.htmledit.util.SearchConteudo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.com.relato.util.Cast"%>
<%@page import="br.com.relato.htmledit.service.DeleteConteudo"%>

<html>
<head>
	<title>ActiveWidgets Grid :: Examples</title>
	<link rel="stylesheet" href="styles/grid.css" type="text/css"></link>
	<style> 
		body, html {margin:0px; padding: 0px; overflow: hidden;} 
		.botao {
			border: 1px solid white;
			background-color: #003366;
			color: white;
			font-weight: bolder;
			font-family: Verdana, Tahoma, Arial, sans-serif;
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
			font-family: Verdana, Tahoma, Arial, sans-serif;
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
			font-family: Verdana, Tahoma, Arial, sans-serif;
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
			font-family: Verdana, Tahoma, Arial, sans-serif;
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
			font-family: Verdana, Tahoma, Arial, sans-serif;
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
			font-family: Verdana, Tahoma, Arial, sans-serif;
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
			font-family: Verdana, Tahoma, Arial, sans-serif;
			font-size: 11px;
			height: 20px;
			width: 100px;
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
		.active-column-1 {width: 290px;}
		.active-column-2 {width:  70px;}
		.active-column-3 {width: 100px;}
		.active-column-4 {width: 110px;}
		.active-column-5 {width: 130px;}
		.active-column-6 {width: 140px;}
		.active-column-7 {width: 60px;}

		.active-grid-column {border-right: 1px solid threedlightshadow;}
		.active-grid-row {border-bottom: 1px solid threedlightshadow;}
	</style>
<script>
<%
if ( request.getParameter("delete") != null ){
	String msg = DeleteConteudo.delete(request.getParameter("id"));
%>
	alert("<%=msg%>");
<%
}
%>
</script>
<%!
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

String changeTipo(String tipo){
	if ( "C".equals(tipo) )
		return "Conteúdo";
	else if ( "N".equals(tipo) )
		return "Notícia";
	else if ( "A".equals(tipo) )
		return "Agenda";
	return "";
}

String changeReplicacao(String r){
	if ( "S".equals(r) )
		return "Sim";
	return "Não";
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

String changeDate(String d){
	if ( d != null )
		return sdf.format(Cast.toDate(d));
	
	return "";
}
%>

	<!-- grid data -->
	<script>

		var myData = [
<%
			int count = 0;
			List list = SearchConteudo.execute(request.getParameter("action"),
							request.getParameter("field"),
							request.getParameter("value"));

			Iterator i = list.iterator();
			while ( i.hasNext() ){
				List row = (List)i.next();
				if ( i.hasNext() ){
%>
					["<%=changeValue(row.get(0))%>","<%=changeValue(row.get(1))%>", "<%=changeTipo((String)row.get(2))%>", "<%=changeValue(row.get(3))%>", "<%=changeDate((String)row.get(4))%>", "<%=changeValue(row.get(5))%>", "<%=changeDate((String)row.get(6))%>", "<%=changeReplicacao((String)row.get(7))%>"],
<%
				}else{
%>
					["<%=changeValue(row.get(0))%>","<%=changeValue(row.get(1))%>", "<%=changeTipo((String)row.get(2))%>", "<%=changeValue(row.get(3))%>", "<%=changeDate((String)row.get(4))%>", "<%=changeValue(row.get(5))%>", "<%=changeDate((String)row.get(6))%>", "<%=changeReplicacao((String)row.get(7))%>"]
<%
				}
				count++;
			}
%>
		];

		var myColumns = [
			"ID", "Título", "Tipo", "Usuário Criação", "Data/hora Criação", "Usuário Última Alteração", "Data/hora Última Alteração", "Replicação"
		];
	</script>

<script>
var idfilho;

function openFather(id){
	this.idfilho = id;
	parent.openFrame(id);
}

function openHE(){
	parent.doOpenHE(1);
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
	obj.setProperty("column/count", 8);
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

	<!-- bottom page control buttons >
	<div align="left" style="padding-top: 5px; padding-bottom: 3px; padding-left: 5px; background-color: #3163A0; border-top: 1px solid white;">
		<button class="botao" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onclick='goToPage(-Infinity)'>&lt;&lt;</button>
		<button class="botao1" onMouseOver="this.className='botaoover1';" onMouseOut="this.className='botao1';" onclick='goToPage(-1)'>&lt;</button>
		<span class="botao" id='pageLabel'></span>
		<button class="botao" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onclick='goToPage(1)'>&gt;</button>
		<button class="botao1" onMouseOver="this.className='botaoover1';" onMouseOut="this.className='botao1';"  onclick='goToPage(Infinity)'>&gt;&gt;</button>
		<button class="botao2" onMouseOver="this.className='botaoover2';" onMouseOut="this.className='botao2';" onclick='openHE()'>Editar</button>
		<button class="botao2" onMouseOver="this.className='botaoover2';" onMouseOut="this.className='botao2';" onclick='parent.gotoMenu()'>Menu</button>
	</div-->
	
	<table width="980" cellpadding="0" cellspacing="0" align="left" style="padding-top: 5px; padding-bottom: 3px; padding-left: 5px; background-color: #3163A0; border-top: 1px solid white;">
	  <tr>
		<td height="40">
			<input class="caixa" readonly="yes" style="width: 200px; margin-left: 8px; margin-right: 120px; vertical-align: bottom; border-right: 1px solid white;" type="text" value="<%=list.size() %> <%=list.size() == 1 ? "registro encontrado" : "registros encontrados"%>" name="total">
			<button class="botao" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onclick='goToPage(-Infinity)'>&lt;&lt;</button>
			<button class="botao1" onMouseOver="this.className='botaoover1';" onMouseOut="this.className='botao1';" onclick='goToPage(-1)'>&lt;</button>
			<span class="caixa" id='pageLabel'></span>
			<button class="botao" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" onclick='goToPage(1)'>&gt;</button>
			<button class="botao1" onMouseOver="this.className='botaoover1';" onMouseOut="this.className='botao1';"  onclick='goToPage(Infinity)'>&gt;&gt;</button>
		</td>
		<td width="259" style="border-left: 1px solid white;" align="center">
			<button class="botao2" onMouseOver="this.className='botaoover2';" onMouseOut="this.className='botao2';" onclick='openHE()'>Editar</button>
			<span style="padding-left: 7px;">&nbsp;</span>
			<button class="botao2" onMouseOver="this.className='botaoover2';" onMouseOut="this.className='botao2';" onclick='parent.gotoMenu()'>Menu</button>
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