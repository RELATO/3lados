<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="br.com.relato.util.*"%>
<%@page import="br.com.neorelato.sql.Table"%>
<%@page import="org.json.simple.JSONArray"%>

<%
String qry = null != request.getParameter("query")?request.getParameter("query"):"";
String opc = null != request.getParameter("opcao")?request.getParameter("opcao"):"1";
if("google_url".equals(opc)){
	String titulo = null != request.getParameter("titulo")?request.getParameter("titulo"):"";
	String urlatual = request.getRequestURL().toString();
	int tamurl = urlatual.length();
	
	String resto = urlatual;
	String nomesite = "";
	if(tamurl > 0){
		for(int x = 1;x<=3;x++){
			//System.out.println("resto.length() : "+resto.length()+" -- "+resto.indexOf("/")+" ==="+resto);
			if(resto.length() > 0 && resto.indexOf("/") > -1){
				nomesite+=resto.substring(0,resto.indexOf("/")+1);
				resto = resto.substring(resto.indexOf("/")+1,resto.length());
			}
		}
		
	}
	 
	
	String novaurl = StringUtils.toSiteUrl(titulo);
	JSONArray ja = new JSONArray();
	Map<String,Object> jo = new LinkedHashMap<String,Object>();
	if(!"".equals(novaurl)){
		jo.put("url",nomesite+"index.jsp?u="+novaurl);
	}else{
		jo.put("url",novaurl);	
	}
	
	ja.add(jo);
	out.print(ja);
}
/*
if("1".equals(opc)){
	JSONArray ja = new JSONArray();
	if(!"".equals(qry)){
		try{
			System.out.println("DO query:: "+qry);
			Table tbQuery = SqlHelper.execTable(qry,null);
			if(tbQuery.rowCount() > 0){
				String[] fields = tbQuery.getColumnNames();
				while(!tbQuery.eof()){
					//JSONObject jo = new JSONObject();
					Map<String,Object> jo = new LinkedHashMap<String,Object>();
					for(int col=1, cname=0;cname < fields.length; col++,cname++){
						jo.put(fields[cname],tbQuery.getObject(col));
						System.out.println("fields[cname]::"+fields[cname]+" -- tbQuery.getObject(col)::"+tbQuery.getObject(col));
					}
					ja.add(jo);
					//System.out.println("RET query:: "+ja.toString());
					tbQuery.next();
				}
				
			}
		}catch(SQLException s){
			System.out.println("Erro query:: "+qry);
			s.printStackTrace();
		}
	}
	out.print(ja);
}
*/
%>