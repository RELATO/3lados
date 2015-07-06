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
	
	String sql =  "update enquetevalor set valor = valor + 1 where resposta = ?";
	
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

final String QUERY_PERGUNTA = "select cdspergunta from enquete";
final String QUERY_PERGUNTA_ENQUETE = "select cdspergunta from enquete where idienquete = "+ idienquete;
final String QUERY_RESPOSTA = "select resposta, valor from enquetevalor";
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

<table align="center" style="border: 1px solid;" width="700" cellpadding="0" cellspacing="0" bgcolor="#3163A0">
    <tr style="height: 65px;"> 
      <td colspan="2" style="border-bottom: 1px solid white; height: 60px;"><center>
          <img src="/img/topo_gerenciadorconteudo.jpg" width="500" height="67" align="top"> 
        </center></td>
    </tr>
    <tr> 
      <td colspan="2" style="border-top: 1px solid white; padding: 5px;" bgcolor="#3163A0"> 
      	  <font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><center><b>Enquete Atual: </b><%=list.get(0) %></center></font>
	  </td>
    </tr>
	<tr>	
		<td bgcolor="#FFFFFF" style="padding: 5px;">
          	<!-- votacao -->
 			<font color="#000000" face="Verdana, Arial, Helvetica, sans-serif" size="1">
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
		</td>
		<td bgcolor="#FFFFFF">
			<!-- imagem -->
			<img src="<%=srcimagem%>">
        </td>
	<tr>
	
  </table>