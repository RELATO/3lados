<%@page import="br.com.relato.portal.ControlPortal" %>
<%@page import="java.util.Map" %>

<%!
	String checkNull(Object valor){
		if ( "".equals(valor) || valor == null || "null".equals(valor) )
			return "";
		return String.valueOf(valor);
	}
%>

<% 
	Map map = ControlPortal.getPortal();
%>

 <table width="600" border=0 align="center" cellpadding=0 cellspacing=0 style="FONT-SIZE: 10px; FONT-FAMILY: tahoma;">
  <tbody>
    <tr> 
      <td width=195 bgcolor=#FFFFFF valign="top"> <table width=290 height="115" border=0 align=left cellpadding=0 cellspacing=0>
          <tbody>
            <tr> 
              <td width=90 height=75 style="PADDING-LEFT: 6px" valign=top><img height=96 src="<%=checkNull(map.get("foto1"))%>" width=85 border=0></td>
              <td width="200" height=75 valign=top style="PADDING-LEFT: 6px"><a href="<%=checkNull(map.get("link1"))%>" class="sw"><font face="tahoma, verdana, arial" size="0"><b><%=checkNull(map.get("titulo1"))%></b><br>
                <%=checkNull(map.get("texto1"))%></font></a></td>
            </tr>
          </tbody>
        </table></td>
      <td width=90 height=75 style="PADDING-LEFT: 6px" valign=top><img height=96 src="<%=checkNull(map.get("foto2"))%>" width=85 border=0></td>
      <td width="200" height=75 valign=top style="PADDING-LEFT: 6px"><a href="<%=checkNull(map.get("link2"))%>" class="sw"><font face="tahoma, verdana, arial" size="0"><b><%=checkNull(map.get("titulo2"))%></b><br>
        <%=checkNull(map.get("texto2"))%></font></a></td>
    </tr>
    <tr> 
      <td width=195 bgcolor=#FFFFFF valign="top"> <table width=290 height="115" border=0 align=left cellpadding=0 cellspacing=0>
          <tbody>
            <tr> 
              <td width=90 height=75 style="PADDING-LEFT: 6px" valign=top><img height=96 src="<%=checkNull(map.get("foto3"))%>" width=85 border=0></td>
              <td width="200" height=75 valign=top style="PADDING-LEFT: 6px"><a href="<%=checkNull(map.get("link3"))%>" class="sw"><font face="tahoma, verdana, arial" size="0"><b><%=checkNull(map.get("titulo3"))%></b><br>
                <%=checkNull(map.get("texto3"))%></font></a></td>
            </tr>
          </tbody>
        </table></td>
      <td width=90 height=75 style="PADDING-LEFT: 6px" valign=top><img height=96 src="<%=checkNull(map.get("foto4"))%>" width=85 border=0></td>
      <td width="200" height=75 valign=top style="PADDING-LEFT: 6px"><a href="<%=checkNull(map.get("link4"))%>" class="sw"><font face="tahoma, verdana, arial" size="0"><b><%=checkNull(map.get("titulo4"))%></b><br>
        <%=checkNull(map.get("texto4"))%></font></a></td>
     
    </tr>
	<tr> 
      <td width=195 bgcolor=#FFFFFF valign="top"> <table width=290 height="115" border=0 align=left cellpadding=0 cellspacing=0>
          <tbody>
            <tr> 
              <td width=90 height=75 style="PADDING-LEFT: 6px" valign=top><img height=96 src="<%=checkNull(map.get("foto5"))%>" width=85 border=0></td>
              <td width="200" height=75 valign=top style="PADDING-LEFT: 6px"><a href="<%=checkNull(map.get("link5"))%>" class="sw"><font face="tahoma, verdana, arial" size="0"><b><%=checkNull(map.get("titulo5"))%></b><br>
                <%=checkNull(map.get("texto5"))%></font></a></td>
            </tr>
          </tbody>
        </table></td>
      <td width=90 height=75 style="PADDING-LEFT: 6px" valign=top><img height=96 src="<%=checkNull(map.get("foto6"))%>" width=85 border=0></td>
      <td width="200" height=75 valign=top style="PADDING-LEFT: 6px"><a href="<%=checkNull(map.get("link6"))%>" class="sw"><font face="tahoma, verdana, arial" size="0"><b><%=checkNull(map.get("titulo6"))%></b><br>
        <%=checkNull(map.get("texto6"))%></font></a></td>  
    </tr>
 </tbody>
</table>
