<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="br.com.relato.util.*" %>
<%@page import="com.relato.pool.PoolFilter" %>

<%
if ( session.getAttribute("enquete") == null && request.getParameter("visualizar") == null ){
	session.setAttribute("enquete", "enquete");

	Connection con = null;
	
	try{
			con = PoolFilter.getConnection();
	}catch( Exception e) {
		e.printStackTrace();
	}
	
	String sql =  "update enquetevalor, enquete set valor = valor + 1 where resposta = ? and enquetevalor.idienquete = enquete.idienquete and opsativo = 'A'";
	
	try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("result"));
			pstmt.execute();
	
	        if ( pstmt != null )
				pstmt.close();
	}catch (SQLException e) {
		e.printStackTrace();	
	}
}
%>


<%
String idienquete = request.getParameter("idienquete");

final String QUERY_PERGUNTA = "select cdspergunta from enquete where opsativo = 'A'";
final String QUERY_PERGUNTA_ENQUETE = "select cdspergunta from enquete where idienquete = "+ idienquete;
final String QUERY_RESPOSTA = "select resposta, valor from enquete, enquetevalor where enquetevalor.idienquete = enquete.idienquete and opsativo = 'A'";
final String QUERY_RESPOSTA_ENQUETE = "select resposta, valor from enquetevalor where idienquete = "+ idienquete;
final String SRC = "/imagemenquete";
final String SRC_ENQUETE = "/imagemenquete?idienquete="+idienquete;

String querypergunta = QUERY_PERGUNTA;
String srcimagem = SRC;
String queryresposta = QUERY_RESPOSTA;

if ( request.getParameter("idienquete") != null ){
	querypergunta = QUERY_PERGUNTA_ENQUETE;
	srcimagem = SRC_ENQUETE;
	queryresposta = QUERY_RESPOSTA_ENQUETE;
}


List list = SqlHelper.execute(querypergunta, null);
%>

<font face="Verdana, Arial, Helvetica, sans-serif" size="2"><center><b><%=list.get(0) %></b></center></font>
	<img src="<%=srcimagem%>">
<br>
<font face="Verdana, Arial, Helvetica, sans-serif" size="1">
<b>Votos:</b>
<% 
		list = SqlHelper.execute(queryresposta, null);
		if ( list.size() != 0 ){
			Iterator i = list.iterator();
			while( i.hasNext() ){
				List row = (List)i.next();
				out.print("<br>" + row.get(0) + ": " + row.get(1));
				if ( Cast.toInt(row.get(1)) == 1 )
					out.print(" voto");
				else out.print(" votos");
			}
		}
%>
</font>
<br>