<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<%@page import="java.util.*"%>
<%@page import="util.Teste1"%>
<%
/*
final String filename = "/www/area-outros/teste.swf";
try{
	URL url = new URL("http://www.cavalomangalarga.com.br/flash/banner_pampa.swf");
	System.out.println("Connectando em:: " + url);

	URLConnection urlcon = url.openConnection();
	urlcon.setUseCaches(false);
	urlcon.connect();
            InputStream in = urlcon.getInputStream();
            FileOutputStream out1 = new FileOutputStream(filename);
            
            BufferedInputStream bufIn = new BufferedInputStream(in, 1000);
            
            int data;
            for (;;){
                data = bufIn.read();

                if (data == -1)
                    break;
                else{
                	out1.write((byte)data);
                	//System.out.print ( (char) data);
                }
            }
}catch(Exception e){
	e.printStackTrace();
	out.print("PAU<br>");
}
*/

out.print(request.getParameter("msg")+"<br>");
Map map = request.getParameterMap();
map.put("msg", "12/12/1222");
out.print(request.getParameter("msg")+"<br>");
%>
<br>
Ok!!

<br>

<%=request.getRequestURI()%>
<br>
<%=request.getRequestURL()%>