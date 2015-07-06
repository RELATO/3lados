<%@page import="com.relato.pool.PoolFilter" %>
<%@page import="java.sql.*" %>
<html>

<body>
<center>
<h2>
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

final String queryDelete = 	" delete from portal ";
final String queryValor =  	" insert into portal set " +
							" field = ?, " +
							" valor = ?, " +
							" language = ?, "+
							" id = ? ";
int id = 1;

try{
	PreparedStatement pstmt = PoolFilter.getConnection().prepareStatement(queryDelete);
	pstmt.execute();

	pstmt = PoolFilter.getConnection().prepareStatement(queryValor);
	for(int L=1; L<=4; L++){
		for ( int i = 1; i <= 12; i++ ){
			
			pstmt.setString(1, "titulo"+i);
			pstmt.setString(2, checkNull(request.getParameter("titulo" + i +"x"+L )));
			pstmt.setInt(3,L);
			pstmt.setInt(4,id);
			id++;
			pstmt.execute();
			
			pstmt.setString(1, "texto"+i);
			pstmt.setString(2, checkNull(request.getParameter("texto" + i +"x"+L)));
			pstmt.setInt(3,L);
			pstmt.setInt(4,id);
			id++;

			pstmt.execute();
			
			pstmt.setString(1, "noticia"+i);
			pstmt.setString(2, checkNull(request.getParameter("noticia" + i +"x"+L)));
			pstmt.setInt(3,L);
			pstmt.setInt(4,id);
			id++;

			pstmt.execute();
			if(L==1){
				pstmt.setString(1, "link"+i);
				pstmt.setString(2, checkNull(request.getParameter("link" + i )));
				pstmt.setInt(3,L);
				pstmt.setInt(4,id);
				id++;

				pstmt.execute();
				pstmt.setString(1, "foto"+i);
				pstmt.setString(2, checkNull(request.getParameter("foto" + i )));
				pstmt.setInt(3,L);
				pstmt.setInt(4,id);
				id++;

				pstmt.execute();
				
				pstmt.setString(1, "linknoticia"+i);
				pstmt.setString(2, checkNull(request.getParameter("linknoticia" + i )));
				pstmt.setInt(3,L);
				pstmt.setInt(4,id);
				id++;

				pstmt.execute();

			}
			
		}
	}
    if ( pstmt != null )
		pstmt.close();
}catch(Exception e){
	e.printStackTrace();
	gerou = false;
}

	if( gerou ){
		response.sendRedirect("formulario.jsp?msg=Portal atualizado com sucesso!!");
%>
Portal atualizado com sucesso!!
<%
	}else{
%>
Algum erro aconteceu ao atualizar o portal!!

<%
	}
%>
</h2>
<br><br>
<a href="formulario.jsp">Voltar</a>
</center>
</body>

</html>