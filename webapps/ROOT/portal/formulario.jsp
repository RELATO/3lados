<%@page import="br.com.relato.portal.ControlPortal" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>

<%!
	String checkNull(Object valor){
		if ( "".equals(valor) || valor == null || "null".equals(valor) )
			return "";
		return String.valueOf(valor);
	}

	String checkNull(Map mapa, Object valor, int lingua){
		String retorno = "";
		List key = new ArrayList();
		key.add(valor);
		key.add(new Integer(lingua));
		if(mapa.containsKey(key)){
			retorno = String.valueOf(mapa.get(key));
		}
		return retorno;
	}


%>

<% 
	Map map = ControlPortal.getPortalLingua(); 

%>

<html>
<head>
<title>Formulário</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="STYLESHEET" type="text/css" href="portal.css">
<script>
var field;
var selecionado;
var destaque;
var link;

function openImage(field){
	this.field = field;

	var leftPos = (screen.availWidth-770) / 2
	var topPos = 5
	var heightW = screen.availHeight;
	var widthW = screen.availWidth;

//	if ( heightW == 572 ){
//		heightW  = 400;
//		widthW = 770;
//	}else{
		heightW  = 610;
		widthW = 765;
//	}

	var imageWindow = window.open('insertImage.jsp?campo='+field, 'image', 'width='+widthW+',height='+heightW+',scrollbars=yes,resizable=no,titlebar=0,top=' + topPos + ',left=' + leftPos);
}

window.insertImagem = function(valor){
	//alert("cheguei");
	document.getElementById(field).value = "portal/" + valor;
}

function doSubmit(action, target){
	document.forms[0].action = action;
	document.forms[0].target = target;
}

var destaqueanterior;
var destaqueatual;
var noticiaanterior;
var noticiaatual;

function show(yes, id){
	destaqueatual = id;
	var objid = document.getElementById(id);
	var objant = document.getElementById(destaqueanterior);
	
	if ( yes == "true" ){
		if ( destaqueatual != destaqueanterior )
			if ( objant != null )
				objant.className = "naover";

		if ( objid != null )
			objid.className = "ver";
			
		destaqueanterior = destaqueatual;
	}else{
		if ( objid != null )
			objid.className = "naover";
	}
}

function abreEditor(selecionad){
	selecionado = selecionad;
	destaque = selecionado.value;
	//alert("destaque"+destaque);
	
	document.getElementById('passaDestaque').value = destaque;
	
	//alert(destaque);
	window.open('/he/hetest.jsp','page','toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=930,height=600');
}

function atualiza(){
	
	//alert("entrou no atualiza");
	var destaqueAtual = destaque;
	//alert("destaqueAtual "+destaqueAtual);
	//alert("Passa Destaque "+document.getElementById('passaDestaque').value);
	//alert("selecionado.innerHTML "+selecionado.innerHTML);
	
	if (document.getElementById('passaDestaque').value != destaqueAtual){
		
		//alert("entrou no if!");
		selecionado.value = document.getElementById('passaDestaque').value;
		//alert("fez a atualizaçao!");
		
	}
}

function abreLista(linksel){
	link = linksel;
	//document.getElementById('passaLink').value = link.value;
	//alert("passaLink = "+document.getElementById('passaLink').value);
	
	window.open('listapaginaportal.jsp','page','toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=930,height=600');
	
} 

function atualizaLink(){
	
	if(document.getElementById('passaLink').value != link.value){
		
		link.value = document.getElementById('passaLink').value;
		
	}
	
}

</script>

</head>

<body>
<center>
<form name="form1" method="post" action="">
<input type="hidden" value="" id="passaLink" value="passaLink">
<input type="hidden" value="" id="passaDestaque" value="passaDestaque">
  <table id="tabela" align="center" valign="middle" width="663" border="0" cellpadding="0" cellspacing="0" >
  	<tr valign="middle" class="bordatopo" height="29"> 
      <td height="67" colspan="2" align="center" ><img src="/images/topolnovoportal.jpg"></td>
    </tr>
    <tr align="left"> 
      <td height="29" colspan="2" class="bordatopo" style="padding-left: 20px;">
      		<br>
      		<span>Destaques</span>		
      		<span style="float:right;">
				Selecione o destaque:  
			<select id="destaques" style="margin-right:20px;width: 100px;" onChange="show('true', this.value)" valign="top">
				<option value=""></option>
				<option value="destaque1">Destaque 1</option>
				<option value="destaque2">Destaque 2</option>
				<option value="destaque3">Destaque 3</option>
			</select>
			</span>
      </td>
    </tr>
    <tr align="center"> 
    	<td colspan="2" style="padding: 10px;">
	<!-- *** DESTAQUES *** -->
	<div id="destaque1" class="naover">
	  <table align="center" width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#3163A0">
	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Título:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">
	        <textarea style="border: 1px solid black" name="titulo1x1" cols="70" rows="4"><%=checkNull(map,"titulo1",1)%></textarea>
	        </font></td>
	    </tr>
	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Texto:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif" > 
	        <textarea style="border: 1px solid black" name="texto1x1" id="texto1x1" cols="70" rows="4"><%=checkNull(map,"texto1",1)%></textarea>
	        <input type="button" class="botao" value=" Editor HTML " onClick="abreEditor(texto1x1);">
	        </font></td>
	    </tr>
		<tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Link:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <input type="text" style="border: 1px solid black;" name="link1" id="link1" size="60" maxlength="120" value="<%=checkNull(map,"link1",1)%>">
	        <input type="button" value="..." onClick="abreLista(link1)" size="10">
	        </font></td>
	    </tr>	    
	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Foto:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <input type="text" style="border: 1px solid black" name="foto1" id="foto1" size="55" maxlength="120" value="<%=checkNull(map,"foto1",1)%>"> 
	        <input type="button" class="botao" value="Imagem"   name="foto1b" onClick="openImage('foto1')">
	        </font></td>
	    </tr>
	  </table>  
	</div>
	<div id="destaque2" class="naover">
	  <table align="center" width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#3163A0">
	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Título:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <textarea style="border: 1px solid black" name="titulo2x1" cols="70" rows="4"><%=checkNull(map,"titulo2",1)%></textarea>
	        </font></td>
	    </tr>
	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Texto:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <textarea style="border: 1px solid black" name="texto2x1" id="texto2x1" cols="70" rows="4"><%=checkNull(map,"texto2",1)%></textarea>
	        <input type="button" class="botao" value=" Editor HTML " onClick="abreEditor(texto2x1);">
	        </font></td>
	    </tr>
	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Link:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <input type="text" style="border: 1px solid black;" name="link2" id="link2" size="60" maxlength="120" value="<%=checkNull(map,"link2",1)%>">
	        <input type="button" value="..." onClick="abreLista(link2)" size="10">
	        </font></td>
	    </tr>	    
	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Foto:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <input type="text" style="border: 1px solid black" name="foto2" id="foto2" size="55" maxlength="120" value="<%=checkNull(map,"foto2",1)%>"> 
	        <input type="button" class="botao" value="Imagem"   name="foto2b" onClick="openImage('foto2')">
	        </font></td>
	    </tr>
	  </table>  
	</div>
	<div id="destaque3" class="naover">
	  <table align="center" width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#3163A0">

	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Título:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <textarea style="border: 1px solid black" name="titulo3x1" cols="70" rows="4"><%=checkNull(map,"titulo3",1)%></textarea>
	        </font></td>
	    </tr>
	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Texto:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <textarea style="border: 1px solid black" name="texto3x1" id="texto3x1" cols="70" rows="4"><%=checkNull(map,"texto3",1)%></textarea>
	        <input type="button" class="botao" value=" Editor HTML " onClick="abreEditor(texto3x1);">
	        </font></td>
	    </tr>
	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Link:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <input type="text" style="border: 1px solid black;" name="link3" id="link3" size="60" maxlength="120" value="<%=checkNull(map,"link3",1)%>">
	        <input type="button" value="..." onClick="abreLista(link3)" size="10">
	        </font></td>
	    </tr>	   
	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Foto:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <input type="text" style="border: 1px solid black" name="foto3" id="foto3" size="55" maxlength="120" value="<%=checkNull(map,"foto3",1)%>"/> 
	        <input type="button" class="botao" value="Imagem"   name="foto3b" onClick="openImage('foto3')">
	        </font></td>
	    </tr>
	  </table>  
	</div>
	<div id="destaque4" class="naover">
	  <table align="center" width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#3163A0">
	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Título:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <textarea style="border: 1px solid black" name="titulo4x1" cols="70" rows="4"><%=checkNull(map,"titulo4",1)%></textarea>
	        </font></td>
	    </tr>
	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Texto:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <textarea style="border: 1px solid black" name="texto4x1" id="texto4x1" cols="70" rows="4"><%=checkNull(map,"texto4",1)%></textarea>
	        <input type="button" class="botao" value=" Editor HTML " onClick="abreEditor(texto4x1);">
	        </font></td>
	    </tr>
	  	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Link:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <input type="text" style="border: 1px solid black;" name="link4" id="link4" size="60" maxlength="120" value="<%=checkNull(map,"link4",1)%>">
	        <input type="button" value="..." onClick="abreLista(link4)" size="10">
	        </font></td>
	    </tr>	    
	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Foto:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <input type="text" style="border: 1px solid black" name="foto4" name="foto4" size="55" maxlength="120" value="<%=checkNull(map,"foto4",1)%>"> 
	        <input type="button" class="botao" value="Imagem"   name="foto4b" onClick="openImage('foto4')">
	        </font></td>
	    </tr>
	  </table>  
	</div>
	
	<div id="destaque5" class="naover">
	  <table align="center" width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#3163A0">
		<tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Título:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <textarea style="border: 1px solid black" name="titulo5x1" cols="70" rows="4"><%=checkNull(map,"titulo5",1)%></textarea>
	        </font></td>
	    </tr>
	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Texto:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <textarea style="border: 1px solid black" name="texto5x1" id="texto5x1" cols="70" rows="4"><%=checkNull(map,"texto5",1)%></textarea>
	        <input type="button" class="botao" value=" Editor HTML " onClick="abreEditor(texto5x1);">
	        </font></td>
	    </tr>
	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Link:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <input type="text" style="border: 1px solid black;" name="link5" id="link5" size="60" maxlength="120" value="<%=checkNull(map,"link5",1)%>">
	        <input type="button" value="..." onClick="abreLista(link5)" size="10">
	        </font></td>
	    </tr>	    
	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Foto:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <input type="text" style="border: 1px solid black" name="foto5" id="foto5" size="55" maxlength="120" value="<%=checkNull(map,"foto5",1)%>"> 
	        <input type="button" class="botao" value="Imagem"   name="foto5b" onClick="openImage('foto5')">
	        </font></td>
	    </tr>
	  </table>  
	</div>
	<div id="destaque6" class="naover">
	  <table align="center" width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#3163A0">
		<tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Título:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <textarea style="border: 1px solid black" name="titulo6x1" cols="70" rows="4"><%=checkNull(map,"titulo6",1)%></textarea>
	        </font></td>
	    </tr>
	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Texto:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <textarea style="border: 1px solid black" name="texto6x1" id="texto6x1" cols="70" rows="4"><%=checkNull(map,"texto6",1)%></textarea>
	        <input type="button" class="botao" value=" Editor HTML " onClick="abreEditor(texto6x1);">
	        </font></td>
	    </tr>
	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Link:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <input type="text" style="border: 1px solid black;" name="link6" id="link6" size="60" maxlength="120" value="<%=checkNull(map,"link6",1)%>">
	        <input type="button" value="..." onClick="abreLista(link6)" size="10">
	        </font></td>
	    </tr>	    
	    <tr valign="top"> 
	      <td class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Foto:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
	        <input type="text" style="border: 1px solid black" name="foto6" id="foto6" size="55" maxlength="120" value="<%=checkNull(map,"foto6",1)%>"> 
	        <input type="button" class="botao" value="Imagem"   name="foto6b" onClick="openImage('foto6')">
	        </font></td>
	    </tr>
	  </table>  
	</div>
	   </td>
     </tr>
    <!-- Noticias  -->
    <tr valign="top"> 
      <td colspan="2" height="20">&nbsp;</td>
    </tr>
    <tr align="left"> 
      <td height="29" colspan="2" bgcolor="#3163A0" class="bordatopo" style="padding-left: 20px;padding-top: 20px;padding-bottom: 20px;">
      			<span>
      				Links Redes Sociais
      			</span>
      	  		<span style="float:right;">
					Secione o Link:
				<select id="noticias" style="margin-right:20px;width: 100px;" onChange="show('true', this.value)" valign="top">
					<option value=""></option>
					<option value="noticia1">Link 1</option>
					<option value="noticia2">Link 2</option>
					<option value="noticia3">Link 3</option>
				</select>
				</span>
	  </td>
    </tr>
    <tr>
    	<td colspan="2" style="padding-top: 10px; padding-left: 20px;">
    <!-- ESPACO  -->
	<div id="noticia1" class="naover">
   	  <table align="center" width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#3163A0">		
	    
	    <tr valign="top"> 
	      <td height="28" class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Título:</font></td>
		    <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
				<textarea style="border: 1px solid black" name="noticia1x1" cols="70" rows="1" ><%=checkNull(map,"noticia1",1)%></textarea>
				</font>
			</td>
	    </tr>
	   <tr valign="top"> 
	      <td height="28" class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Link:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
		<input type="text" style="border: 1px solid black" name="linknoticia1"  size="70" value="<%=checkNull(map,"linknoticia1",1)%>">
		</font></td>
	    </tr>
	  </table>	    
	</div>	
	<div id="noticia2" class="naover">
   	  <table align="center" width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#3163A0">		
	    <tr valign="top"> 
	      <td height="28" class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Título:</font></td>
		    <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
				<textarea style="border: 1px solid black" name="noticia2x1" cols="70" rows="1"><%=checkNull(map,"noticia2",1)%></textarea>
				</font>
			</td>
	    </tr>
	   <tr valign="top"> 
	      <td height="28" class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Link:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
		<input type="text" style="border: 1px solid black" name="linknoticia2"  size="70" value="<%=checkNull(map,"linknoticia2",1)%>">
		</font></td>
	    </tr>
	  </table>	
	</div>
	<div id="noticia3" class="naover">
   	  <table align="center" width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#3163A0">		
	    <tr valign="top"> 
	      <td height="28" class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Título:</font></td>
		    <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
				<textarea style="border: 1px solid black" name="noticia3x1" cols="70" rows="1"><%=checkNull(map,"noticia3",1)%></textarea>
				</font>
			</td>
	    </tr>
	  	<tr valign="top"> 
	      <td height="28" class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Link:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
		<input type="text" style="border: 1px solid black" name="linknoticia3"  size="70" value="<%=checkNull(map,"linknoticia3",1)%>">
		</font></td>
	    </tr>
	  </table>			    
	</div>
	<div id="noticia4" class="naover">
   	  <table align="center" width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#3163A0">		

	    <tr valign="top"> 
	      <td height="28" class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Título1:</font></td>
		    <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
				<textarea style="border: 1px solid black" name="noticia4x1" cols="70" rows="4"><%=checkNull(map,"noticia4",1)%></textarea>
				</font>
			</td>
	    </tr>

	    <tr valign="top"> 
	      <td height="28" class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Título2:</font></td>
		    <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
				<textarea style="border: 1px solid black" name="noticia4x2" cols="70" rows="4"><%=checkNull(map,"noticia4",2)%></textarea>
				</font>
			</td>
	    </tr>

	    <tr valign="top"> 
	      <td height="28" class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Título3:</font></td>
		    <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
				<textarea style="border: 1px solid black" name="noticia4x3" cols="70" rows="4"><%=checkNull(map,"noticia4",3)%></textarea>
				</font>
			</td>
	    </tr>

	    <tr valign="top"> 
	      <td height="28" class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Título4:</font></td>
		    <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
				<textarea style="border: 1px solid black" name="noticia4x4" cols="70" rows="4"><%=checkNull(map,"noticia4",4)%></textarea>
				</font>
			</td>
	    </tr>

	    <tr valign="top"> 
	      <td height="28" class="seila"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Link:</font></td>
	      <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
		<input type="text" style="border: 1px solid black" name="linknoticia4"  size="70" value="<%=checkNull(map,"linknoticia4",1)%>">
		</font></td>
	    </tr>
	  </table>	
	</div>
       </td>
     </tr>
    <!-- BOTAO DE ENVIAR imagens/destaque1.jpg -->
    <tr> 
      <td colspan="2" height="50" style="border-top: 1px dotted #003366; border-bottom: 1px solid #003366;" valign="middle" align="center"> 
	       <br>
	        <input type="submit" name="Submit" value="Atualizar o portal" class="botao" onClick="doSubmit('geraform.jsp', '');">
	        &nbsp; 
			<!-- <input type="submit" name="Submit" value="Visualizar o portal" class="botao1" onMouseOver="this.className='botaoover1'" onMouseOut="this.className='botao1'" onClick="doSubmit('/preview.jsp?gerenciador=true', '_blank');"> -->
	        &nbsp; 
	        <input type="button" class="botao" value=" Menu " onClick="window.location.href='/siteadmin/home.jsp'">
	        <br>
       </td>
    </tr>
  </table>
</form>

<%
	if ( request.getParameter("msg") != null ){
%>
<script>
		alert("<%=request.getParameter("msg")%>");
</script>
<%
	}
%>
</center>
</body>
</html>