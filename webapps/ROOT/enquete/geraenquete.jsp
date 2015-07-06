<%@page import="com.relato.pool.PoolFilter" %>
<%@page import="br.com.relato.util.SqlHelper" %>
<%@page import="java.sql.*" %>
<html>

<body>

<%!
	String checkNull(String valor){
		if ( valor == null || "".equals(valor) || "null".equals(valor) )
			return "";
		return valor;
	}
%>
<br><br>
<%
boolean gerou = true;

String pergunta = request.getParameter("pergunta");
int respostas = Integer.parseInt(request.getParameter("respostas"));
String idiresp[] = request.getParameter("idresposta").split("/");


try{
	PreparedStatement pstmt = PoolFilter.getConnection().prepareStatement(queryInativo);
	pstmt.execute();
	if ( "2".equals(request.getParameter("action")) ){
		pstmt = PoolFilter.getConnection().prepareStatement(queryU);
		pstmt.setString(1, pergunta);
		pstmt.setInt(2, respostas);
		pstmt.setString(3, "A");
		pstmt.setString(4, request.getParameter("id"));
		pstmt.execute();

		pstmt = PoolFilter.getConnection().prepareStatement(queryValorU);
		for ( int i = 0; i < idiresp.length; i++ ){
			pstmt.setString(1, request.getParameter("id"));
			pstmt.setString(2, checkNull(request.getParameter("r" + (i + 1))));
			pstmt.setString(3, idiresp[i]);
			pstmt.execute();
		}
	}else{
		pstmt = PoolFilter.getConnection().prepareStatement(queryI);
		pstmt.setString(1, pergunta);
		pstmt.setInt(2, respostas);
		pstmt.setString(3, "A");
		pstmt.execute();

		pstmt = PoolFilter.getConnection().prepareStatement(queryValorI);
		for ( int i = 1; i <= respostas; i++ ){
			pstmt.setString(1, (String)SqlHelper.execute("select idienquete from enquete where opsativo = 'A'", null).get(0));
			pstmt.setString(2, checkNull(request.getParameter("r" + i)));
			pstmt.execute();
		}
	}

    if ( pstmt != null )
		pstmt.close();
}catch(Exception e){
	e.printStackTrace();
	gerou = false;
}

	if( gerou ){
%>
Enquete gerado com sucesso!!
<%
	}else{
%>
Algum erro aconteceu ao gerar as enquetes!!
<%
	}
%>
</body>

</html>