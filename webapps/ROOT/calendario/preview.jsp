<%@page import="br.com.relato.portal.GetPensamento" %>
<HTML>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<title>Calendário - Preview</title>

<style type="text/css">
input.botao { 
border: 1px solid white; 
background-color: #003366; 
color: white; 
font-weight: bolder; 
font-family: Verdana, Tahoma, Arial, sans-serif; 
font-size: 10px; 
width: 80px; 
text-align: center; 
} 

input.botaoover { 
border: 1px solid #003366; 
background-color: white; 
color: #003366; 
font-weight: bolder; 
font-family: Verdana, Tahoma, Arial, sans-serif; 
font-size: 10px; 
width: 80px; 
text-align: center; 
cursor: pointer; 
} 

.borda{ 
padding: 3px; 
border: 1px solid #3163A0;
}

</style>

</head>
<body onLoad=window.focus() bgcolor=#003366 style="color: #FFFFFF; font-size: 12px;">
<H3>Preview</H3>
<TABLE BORDER=0 cellpadding="5" CELLSPACING=0 bgcolor=#3163A0 style="border: 1px solid #FFFFFF; border-collapse: collapse;">
    <TR>
       <TD align="right"><%=GetPensamento.getDescricao(new String[]{request.getParameter("autor"), request.getParameter("cdipadrao")}) %></TD>
  </TR>
</TABLE>
<br><br>
<center><input style="border: none; font-size: 10px; width: 65px; margin-left: 5px;" value="Fechar" onclick="self.close()" type="button"></center>
</body>
</HTML>
