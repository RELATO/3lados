<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="br.com.relato.criteria.SearchCriteria" %>
<%@page import="br.com.relato.criteria.SQLExpression" %>


<%
	SearchCriteria criteria = new SearchCriteria();
	criteria.addField(new String[]{"cdspergunta", "idienquete", "opsativo"}); 
	criteria.addTable("enquete");
	criteria.addExpression(SQLExpression.SQL_DIFIRENTE, "enquete.opsativo", "A");
	criteria.addOrder("opsativo");

	Iterator i2 = criteria.iterate();
%>

<html>
<head>
<title>Relato Tecnologia :: HTML Editor</title>

<style type="text/css">
	* {margin: 0px; font-family: Verdana, Tahoma, Arial;}
	body {margin: 5px;}
	a, a:hover, a:link, a:visited {color: white;}
	li {color: white; margin-left: 20px;}
	table {border: 1px solid white; border-collapse: collapse;}
	td {border: 1px solid white;}
	td.pad {padding-top: 5px; padding-bottom: 5px;}
	input.botao {
		border: 1px solid white;
		background-color: #003366;
		color: white;
		font-weight: bolder;
		font-family: Verdana, Tahoma, Arial, sans-serif;
		font-size: 10px;
		width: 120px;
		height: 20px;
		text-align: center;
		}
	input.botaoover {
		border: 1px solid #003366;
		background-color: white;
		color: #003366;
		font-weight: bolder;
		font-family: Verdana, Tahoma, Arial, sans-serif;
		font-size: 10px;
		width: 120px;
		height: 20px;
		text-align: center;
		cursor: pointer;
	}

</style>

<script>
function renderEnquete(idienquete){
   var width = 520;
   var height = 450;
   
   var left = 99;
   var top = 99;   

   var url = "/enquete/resultadoenquete.jsp?idienquete="+ idienquete;
   window.open(url, 'Enquete', 'width='+width+', height='+height+', top='+top+', left='+left+', scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no');
}

<%
if ( request.getParameter("msg") != null ){
%>
	alert("<%=request.getParameter("msg")%>");
<%
}else if ( request.getParameter("erro") != null ){
%>
	alert("<%=request.getParameter("erro")%>");
<%
}
%>
</script>

</head>

<body bgcolor="#003366" style="color: #FFFFFF">

	<%@include file="result2.jsp"%>

<table width="700" border="0" bgcolor="#3163A0" cellpadding="0" cellspacing="0" align="center" style="margin: 0px; border-collapse: collapse;">
  <tr>
    <td align="center" class="pad">
        <input type="button" onClick="window.location.href='/'" class="botao" name="menu" value="Portal" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';">
    </td>
  </tr>
  <tr>
    <td align="center" class="pad">
		<b>Resultados das enquetes antigas:</b>
    </td>
  </tr>

<%
		while( i2.hasNext() ){
			List row = (List)i2.next();
%>
		<tr>
		    <td class="pad">
	        	&nbsp;&nbsp;<span style="cursor: pointer" onClick="renderEnquete(<%=row.get(1)%>)">Ver estatística - <span style="text-decoration: underline;"><%=row.get(0)%></span></span>
			</td>
		</tr>
<%
		}
%>
</table>

</body>
</html>