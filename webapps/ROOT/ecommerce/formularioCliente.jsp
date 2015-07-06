<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>	
    <title>..::Relato Informática::..</title>
    <link href="/styles/estilo.css" rel="stylesheet" type="text/css"/>
    <script language="JavaScript" src="/scripts/formularioecommerce.js"></script>
    
	<meta name="description" content="Relato Informática.">
	
	<!-- SCRIPTS DE DATA E CALENDARIO -->
	
	<link rel="STYLESHEET" type="text/css" href="/dhtmlxcalendar/dhtmlxcalendar.css"> 
	<script language="JavaScript" src="/dhtmlxcalendar/dhtmlxcalendar.js"></script>
	<script language="JavaScript" src="/dhtmlxcalendar/dhtmlxcommon.js"></script>
	<script language="JavaScript" src="/scripts/date.js"></script>
	<script>
	      window.dhx_globalImgPath="/dhtmlxcalendar/imgs/";
	</script>
	
	<style>
		.subTitulo3
		{
		   font-family: Verdana;
		   FONT-SIZE: 11pt;
		   FONT-WEIGHT: bold;
		}

		.campotipoproduto
		{
		   font-family: Verdana, "MS Sans Serif";
		   FONT-SIZE: 11pt;
		   FONT-WEIGHT: bold;
		   COLOR: #444444; 
		}
		
		input.botao {
			border: 1px solid white;
			background-color: #CE0000;
			color: white;
			font-weight: bolder;
			font-family: Verdana, Tahoma, Arial, sans-serif;
			font-size: 10px;
		}
		
		input.botaoover {
			border: 1px solid #CE0000;
			background-color: white;
			color: #CE0000;
			font-weight: bolder;
			font-family: Verdana, Tahoma, Arial, sans-serif;
			font-size: 10px;
		}
		
		.campotexto{
		    FONT-FAMILY: Tahoma;
		    FONT-SIZE: 8pt;
		}
		
		.campocombo{
		    FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif;
		    FONT-SIZE: 8pt;
		    font-weight: bolder;
		}
		
		.campoopcao{
		    FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif;
		    FONT-SIZE: 8pt;
		    font-weight: bolder;
		}
		
		
		.textdescricao
		{
		    FONT-FAMILY: Verdana;
		    FONT-SIZE: 8pt;
		    TEXT-TRANSFORM:capitalize;
		}
		
		.textproduto
		{
		    FONT-FAMILY: Verdana;
		    FONT-SIZE: 10pt;
		    FONT-WEIGHT: bolder;
		    TEXT-TRANSFORM:uppercase;
		}
		
		.numberproduto
		{
		    FONT-FAMILY: Verdana;
		    FONT-SIZE: 10pt;
		    FONT-WEIGHT: bolder;
		    TEXT-ALIGN:right;
		}
		
		A:link {text-decoration:none;color:black;}
	    A:visited {text-decoration:none;color:black;}
	    A:active {text-decoration:none;color:black;}
	    A:hover {text-decoration:underline;color:black;}
	     
	</style>
	
</head>

<script>
	
	function strip_chars(s, chars) { 
    	var returnString = "";
    	for(var i = 0; i < s.length; i++) {
	     	var c = s.charAt(i);
	        if(chars.indexOf(c) == -1)
	        	returnString += c;
	    }
	    return returnString;
	}

	function formataCpfCnpj(param){
		if(!param)
			return param;
		if (param.length == 11)
		{
			param = param.substring(0,3)+"."+param.substring(3,6)+"."+param.substring(6,9)+"-"+param.substring(9,11);
			return param;
		}
		if (param.length == 14 && param.substring(3,4)!=".")
		{
			param = param.substring(0,2)+"."+param.substring(2,5)+"."+param.substring(5,8)+"/"+param.substring(8,12)+"-"+param.substring(12,14);
			return param;	
		}
	}

	function validaCpf(){
		var tipo = document.frmcadastro.cdstipocliente.value;
		var verifica = document.frmcadastro.cdscpfcnpj.value;
		
		if("" != verifica){
			verifica=strip_chars(verifica, "/.- ");
			if ( tipo == "F" ){
				var cpf1 = strip_chars(verifica, "/.- ");
				var soma1 = 0;
				if (cpf1.length != 11){
					document.frmcadastro.cdscpfcnpj.value="";
					document.frmcadastro.cdscpfcnpj.focus();
					alert('CPF Invalido!');
					
					return "CPF inválido";
				}	
				soma1 = soma1 + (cpf1.substring(0,1) * 10);
				soma1 = soma1 + (cpf1.substring(1,2) * 9);
				soma1 = soma1 + (cpf1.substring(2,3) * 8);
				soma1 = soma1 + (cpf1.substring(3,4) * 7);
				soma1 = soma1 + (cpf1.substring(4,5) * 6);
				soma1 = soma1 + (cpf1.substring(5,6) * 5);
				soma1 = soma1 + (cpf1.substring(6,7) * 4);
				soma1 = soma1 + (cpf1.substring(7,8) * 3);
				soma1 = soma1 + (cpf1.substring(8,9) * 2);
		
				var resto = soma1 % 11;
				var digito1 = 0;
				if(resto >= 2)
					digito1 = 11 - resto;
		
				var soma2=0;
				soma2 = soma2 + (cpf1.substring(0,1) * 11);
				soma2 = soma2 + (cpf1.substring(1,2) * 10);
				soma2 = soma2 + (cpf1.substring(2,3) * 9);
				soma2 = soma2 + (cpf1.substring(3,4) * 8);
				soma2 = soma2 + (cpf1.substring(4,5) * 7);
				soma2 = soma2 + (cpf1.substring(5,6) * 6);
				soma2 = soma2 + (cpf1.substring(6,7) * 5);
				soma2 = soma2 + (cpf1.substring(7,8) * 4);
				soma2 = soma2 + (cpf1.substring(8,9) * 3);
				soma2 = soma2 + (cpf1.substring(9,10) * 2);
		
				var resto = soma2 % 11;
				var digito2 = 0;
				if (resto >= 2)
					digito2 = 11 - resto;
		
				if(cpf1.substring(9,10) != digito1 || cpf1.substring(10,11) != digito2){
					//return "campo "+node.id+" não é um CPF válido";
					document.frmcadastro.cdscpfcnpj.value;
					alert('CPF Invalido!');
					return "CPF inválido";
				}
			}else if ( tipo == "J" ){ 
					var cgc1 = strip_chars(verifica, "/.- ");
				   	var soma1=0;
				   	if (!(cgc1.length==14)){
				   		document.frmcadastro.cdscpfcnpj.value;
				   		alert('CNPJ Invalido!');
				   		return "CNPJ inválido";
				   		//return "campo "+node.id+" não é um cgc válido";
				   	}
				   
				   soma1 = soma1+(cgc1.substring(0,1)*5);
				   soma1 = soma1+(cgc1.substring(1,2)*4);
				   soma1 = soma1+(cgc1.substring(2,3)*3);
				   soma1 = soma1+(cgc1.substring(3,4)*2);
				   soma1 = soma1+(cgc1.substring(4,5)*9);
				   soma1 = soma1+(cgc1.substring(5,6)*8);
				   soma1 = soma1+(cgc1.substring(6,7)*7);
				   soma1 = soma1+(cgc1.substring(7,8)*6);
				   soma1 = soma1+(cgc1.substring(8,9)*5);
				   soma1 = soma1+(cgc1.substring(9,10)*4);
				   soma1 = soma1+(cgc1.substring(10,11)*3);
				   soma1 = soma1+(cgc1.substring(11,12)*2);
				
				   var resto = soma1 % 11;
				   var digito1 = 0;
				   if (resto>=2) digito1 = 11 - resto;
				
				   var soma2=0;
				   soma2 = soma2+(cgc1.substring(0,1)*6);
				   soma2 = soma2+(cgc1.substring(1,2)*5);
				   soma2 = soma2+(cgc1.substring(2,3)*4);
				   soma2 = soma2+(cgc1.substring(3,4)*3);
				   soma2 = soma2+(cgc1.substring(4,5)*2);
				   soma2 = soma2+(cgc1.substring(5,6)*9);
				   soma2 = soma2+(cgc1.substring(6,7)*8);
				   soma2 = soma2+(cgc1.substring(7,8)*7);
				   soma2 = soma2+(cgc1.substring(8,9)*6);
				   soma2 = soma2+(cgc1.substring(9,10)*5);
				   soma2 = soma2+(cgc1.substring(10,11)*4);
				   soma2 = soma2+(cgc1.substring(11,12)*3);
				   soma2 = soma2+(cgc1.substring(12,13)*2);
				
				   var resto = soma2 % 11;
				   var digito2=0;
				   if (resto>=2) digito2=11-resto;
				
				   if ((cgc1.substring(12,13) == digito1) && (cgc1.substring(13,14) == digito2))
				   {}   
				   else{
				    document.frmcadastro.cdscpfcnpj.value;
				    return "CNPJ inválido";	
				    //return "campo "+node.id+" não é um cgc válido";	
				    }
				}
			}else{
				var variavel = "";
				var variavel1 = "";
				if ( tipo == "J" ){
					variavel  = "Pessoa Jurídica";
					variavel1  = "CNPJ";
				}else if ( tipo == "F" ){
					variavel = "Pessoa Física";
					variavel1  = "CPF";
				}
				document.frmcadastro.cdscpfcnpj.focus();
				//return"Favor adicionar o "+variavel1+" da "+ variavel;
			
			}
		
		verifica = formataCpfCnpj(verifica);
		document.frmcadastro.cdscpfcnpj.value=verifica;
		return true;
	}




	function validateCadastro(){
		if(document.frmcadastro.nmsemail.value == ""){
			alert('Favor preecha campo de e-mail!');
			document.frmcadastro.nmsemail.focus();
			return false;
		}
		
		if(document.frmcadastro.nmssenha.value == ""){
			alert('Favor preecha campo de senha!');
			document.frmcadastro.nmssenha.focus();
			return false;
		}
		
		if(document.frmcadastro.nmssenha2.value == ""){
			alert('Favor preecha campo de confirmação de senha!');
			document.frmcadastro.nmssenha2.focus();
			return false;
		}
		
		if(document.frmcadastro.nmssenha.value != document.frmcadastro.nmssenha2.value){
			alert('O valor inserido no campo Senha deve ser igual ao valor inserido no campo Confirmar Senha');
			document.frmcadastro.nmssenha.focus();
			return false;
		}
		
		if(document.frmcadastro.nmscompleto.value == ""){
			alert('Favor preecha campo de Nome!');
			document.frmcadastro.nmscompleto.focus();
			return false;
		}
		
		if(document.frmcadastro.dtdaniversario.value == ""){
			alert('Favor preecha campo de Data de Nascimento!');
			document.frmcadastro.dtdaniversario.focus();
			return false;
		}
		
		if(document.frmcadastro.cdscpfcnpj.value == ""){
			alert('Favor preecha campo de CPF!');
			document.frmcadastro.cdscpfcnpj.focus();
			return false;
		}
		
		if(document.frmcadastro.cdsrgie.value == ""){
			alert('Favor preecha campo de RG!');
			document.frmcadastro.cdsrgie.focus();
			return false;
		}
		
		if(document.frmcadastro.nmsendereco.value == ""){
			alert('Favor preecha campo de Logradouro!');
			document.frmcadastro.nmsendereco.focus();
			return false;
		}
		
		if(document.frmcadastro.cdsnumero.value == ""){
			alert('Favor preecha campo de Nº!');
			document.frmcadastro.cdsnumero.focus();
			return false;
		}
		
		if(document.frmcadastro.nmsbairro.value == ""){
			alert('Favor preecha campo de Bairro!');
			document.frmcadastro.nmsbairro.focus();
			return false;
		}
		
		if(document.frmcadastro.nmscidade.value == ""){
			alert('Favor preecha campo de Cidade!');
			document.frmcadastro.nmscidade.focus();
			return false;
		}
		
		if(document.frmcadastro.cdscep.value == ""){
			alert('Favor preecha campo de CEP!');
			document.frmcadastro.cdscep.focus();
			return false;
		}
		return true;
	}
	
	
	function abreCalendario(obj,data){
	   	if(data.value != ""){
	   		obj.setDate(data.value);
	   	}
	   	obj.show();
	}

	function clickCalendar(date){
		mCal.setDate(date);
		//document.nomedoform.nomedocampo.value
		document.frmcadastro.dtdaniversario.value = mCal.getFormatedDate(); 
		mCal.hide();
		return true;
	}
</script>

<body>
<% 

String mensagem = (null != request.getParameter("mensagem")?request.getParameter("mensagem"):"");

if(!mensagem.equals("")){
%>


	<table width="100%" border="0" cellpadding="2" cellspacing="0">		
		<tr>
			<td><font color=red><%=mensagem%></font></td>
		</tr>
	</table>
<%
}

%>
<table valign="top" width="100%" id="table_top" background="../imgkana/bgrelato.jpg" cellspacing="0" cellpadding="0" border="0" bordercolor="#000000" style="background-repeat: no-repeat;">
			<tr>
				<td valign="middle" align="left" width="50%" style="padding-left: 0px; padding-top: 15px; padding-bottom: 5px; top: 0px;">
				<a href="http://www.safetyeyes.com.br/"TARGET="_blanck"><img src="../img/se.gif" align="left" border="0"></a>
				</td>
				<td valign="middle" align="left" width="50%" style="padding-left: 0px; padding-right: 20px; top: 0px;">
					<A href="/index.jsp?conteudo=1"><img src="../img/logogif.gif" align="right" border="0"></a>
				</td>
			</tr>	
</table> 
	<form name="frmcadastro" id="frmcadastro" method="post" onsubmit="return validateCadastro()" action="inserirCliente.jsp">
<!-- LOGIN -->
		<br>
		<div style="display:none" id="login_area">
		<h1 class="h1_cad">LOGIN</h1>
			<table width="100%" border="0" cellpadding="2" cellspacing="0" bgcolor="#F6F6F6" style="margin-bottom:50px; ">		
				<tr> 
					<td width="20%" align="right" class="cadastrotitulo">E-mail<span style="color:#FF0000">*</span></td>
					<td class="cadastroinput">
					<input type="text" name="nmsemail" id="nmsemail" class="form1" size="50" value=""><br>
										
					</td>
				</tr>
				<tr> 
					<td width="20%" align="right" class="cadastrotitulo">Senha<span style="color:#FF0000">*</span></td>
					<td class="cadastroinput">
						<input  type="password" id="nmssenha" name="nmssenha" class="form1" maxlength="16" size="16" value="">
						 <span style="color:#FF0000">A senha deve possuir entre 5 e 16 acaracteres!</span>
					</td>
				</tr>
				<tr> 
					<td width="20%" align="right" class="cadastrotitulo">Confirmar senha <span style="color:#FF0000">*</span></td>
					<td class="cadastroinput">
						<input  type="password" name="nmssenha2" id="nmssenha2" class="form1" maxlength="16" size="16" value="">
					</td>
				</tr>
			</table>
		</div>
<!-- LOGIN FIM-->
		
<!-- BASICO -->
		<div style="margin-top:-30px;display:none" id="basico">
		<h1 class="h1_cad">BÁSICO</h1>
		<table width="100%" border="0" cellpadding="2" cellspacing="0" bgcolor="#F6F6F6" style="margin-bottom:50px; ">
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo"><span id="nom_r">Nome</span><span style="color:#FF0000">*</span></td>
				<td class="cadastroinput" colspan="2">
					<input type="text" name="nmscompleto" id="nmscompleto"  class="form1" size="50" value="">
				</td>
			</tr>
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo">Data de nascimento </td>
				<td width="20%" class="cadastroinput">
					<input type="text" name="dtdaniversario" id="dtdaniversario"  class="form1" size="20" maxlength="10" value="" 
						onBlur="DateFormat(this,this.value,event,true,'3');"
						onFocus="javascript:vDateType='3';"
						onKeyUp="DateFormat(this,this.value,event,false,'3');">
					
					<img name="b" id="b" src="/dhtmlxcalendar/imgs/calendar.gif" border="0" onclick="abreCalendario(mCal,document.frmcadastro.dtdaniversario);" ></td>
						
				</td>	
				<td width="60%" class="cadastroinput">
					<input type="hidden" name="t" id="t">
					<script>  
						var mCal = new dhtmlxCalendarObject('t', true, {isYearEditable: true}); 
						mCal.loadUserLanguage('pt-br');
						mCal.setOnClickHandler(clickCalendar);
						mCal.hide();
					</script>
			   </td>
			</tr>
		</table>
		</div>
<!-- BASICO -->
		
		<!-- COMPLETO -->
		<div style="margin-top:-50px;display:none" id="completo">
	
		<table width="100%" border="0" cellpadding="2" cellspacing="0" bgcolor="#F6F6F6" style="margin-bottom:50px; ">
			
			<tr id="sexo_tr"> 
				<td width="20%" align="right" class="cadastrotitulo">Pessoa<span style="color:#FF0000">*</span></td>
				<td class="cadastroinput">
				<select name="cdstipocliente" id="cdstipocliente">
					<option selected value='F'>Física
					<option  value='J'>Jurídica
				</select>
				</td>
			</tr>
			
			<tr id="cpf_tr"> 
				<td align="right" width="20%" class="cadastrotitulo">CPF<span style="color:#FF0000">*</span></td>
				<td class="cadastroinput">
					<input  name="cdscpfcnpj" id="cdscpfcnpj" class="form1" size="25" value="" onblur="validaCpf();">
					<span style="color:#FF0000">(informe o CPF sem ponto nem traço)</span>
				</td>				
			</tr>
			<tr id="cpf_tr"> 
				<td align="right" width="20%" class="cadastrotitulo">RG<span style="color:#FF0000">*</span></td>
				<td class="cadastroinput">
					<input type="text" id="cdsrgie" name="cdsrgie" class="form1" size="25" value="">
					<span style="color:#FF0000">(informe o RG sem ponto)</span>
				</td>				
			</tr>
		</table>
		</div>
		<!-- COMPLETO -->	
		
		<!-- ENDEREÇO BÁSICO -->
		<div style="margin-top:-30px;display:none" id="endereco">
		<!-- input type="hidden" id="identificador" name="identificador" class="form1" size="25" value="Casa"-->
		<!-- input type="hidden" value="RES" name="end_tipo" id="end_tipo" class="form1" size="25"-->	
		<input type="hidden" value="-1" name="idicliente" id="idicliente" class="form1" size="25">
		<input type="hidden" value="-1" name="cdipadrao" id="cdipadrao" class="form1" size="25">
		<h1 class="h1_cad">ENDEREÇO</h1>
			<table width="100%" border="0" cellpadding="2" cellspacing="0" bgcolor="#F6F6F6" style="margin-bottom:50px; ">
	
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo">Logradouro <span style="color:#FF0000">*</span></td>
				<td class="cadastroinput">
					<input type="text" id="nmsendereco" name="nmsendereco" class="form1" size="70" value="">
					<span style="color:#FF0000">(Rua, Avenida, etc)</span>
					
				</td>
			</tr>
			<tr>
				<td width="20%" align="right" class="cadastrotitulo">N&ordm; <span style="color:#FF0000">*</span></td>
				
				
				<td class="cadastroinput">
					<input type="text" id="cdsnumero" name="cdsnumero" class="form1" size="5" value="">
					Complemento&nbsp;<input type="text" id="nmscomplemento" name="nmscomplemento" class="form1" maxlength="11" size="15" value="">
					<span style="color:#FF0000">(casa, apartamento, etc)</span>
				</td>			
			</tr>
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo">Bairro <span style="color:#FF0000">*</span></td>
				<td class="cadastroinput">
					<input type="text" id="nmsbairro" name="nmsbairro" class="form1" size="25" value="">
				</td>
			</tr>
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo">Cidade <span style="color:#FF0000">*</span></td>
				<td class="cadastroinput">
					<input type="text" name="nmscidade" id="nmscidade" class="form1" size="25" value="">
				</td>
			</tr>	
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo">CEP <span style="color:#FF0000">*</span></td>
				<td class="cadastroinput">
					<input type="text" name="cdscep" id="cdscep" class="form1" size="8" value=""><span style="color:#FF0000">(informe o CEP sem traço)</span>
				</td>
			</tr>
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo">UF <span style="color:#FF0000">*</span></td>
				<td class="cadastroinput">
					<select id="cdsestado" name="cdsestado">
					<option  value='AC'>AC
					<option  value='AL'>AL
					<option  value='AP'>AP
					<option  value='AM'>AM
					<option  value='BA'>BA
					<option  value='CE'>CE
					<option  value='DF'>DF
					<option  value='GO'>GO
					<option  value='ES'>ES
					<option  value='MA'>MA
					<option  value='MT'>MT
					<option  value='MS'>MS
					<option  value='MG'>MG
					<option  value='PA'>PA
					<option  value='PB'>PB
					<option  value='PR'>PR
					<option  value='PE'>PE
					<option  value='PI'>PI
					<option  value='RJ'>RJ
					<option  value='RN'>RN
					<option  value='RS'>RS
					<option  value='RO'>RO
					<option  value='RR'>RR
					<option  value='SC'>SC
					<option  value='SE'>SE
					<option selected value='SP'>SP
					<option  value='TO'>TO
					</select>
				</td>
			</tr>
			
			<tr id="tel_res_tr"> 
				<td align="right" width="20%" class="cadastrotitulo">Telefone</td>
				<td class="cadastroinput">				
					<input type="text" id="cdstelefone" name="cdstelefone" class="form1" maxlength="16" size="16" value="">
				</td>
			</tr>
			<tr> 
				<td align="right" width="20%" class="cadastrotitulo">Telefone Fax</td>
				<td class="cadastroinput">				
					
					<input type="text" id="cdsfax" name="cdsfax"  maxlength="16" size="16" value="">
				</td>
			</tr>
			<tr> 
				<td align="right" width="20%" class="cadastrotitulo">Telefone Celular </td>
				<td class="cadastroinput">				
					
					<input type="text" id="cdscelular" name="cdscelular" maxlength="16" size="16" value="">
				</td>
			</tr>
			
			<tr id="sexo_tr"> 
				<td width="20%" align="right" class="cadastrotitulo">Envia E-mail?<span style="color:#FF0000">*</span></td>
				<td class="cadastroinput">
				<select name="opsenviaemail" id="opsenviaemail">
					<option  selected value='S'>Sim
					<option  value='N'>Não
				</td>
			</tr>
			
		</table>
		</div>
		<!-- ENDEREÇO BÁSICO-->
		
		<!-- NO JAVASCRIPT -->
		<!-- div id="no_javascript">
		
			<h1>Caro usuário,</h1><br><br>
			
			Para visualizar o formulário de cadastro de nosso site é necessário que a execução de JavaScript esteja habilitada em seu navegador. 
			Por favor altere as configurações de seu navegador para permitir Javascript.<br><br>
			
			<h2>No Internet Explorer:</h2>
			
			Acesse <b>"Ferramentas->Opções da Internet"</b> e clique na aba <b>"Segurança"</b>. Na parte de baixo da janela, clique em <b>"Nível personalizado"</b> para acessar as configurações avançadas de segurança. Desça a barra de rolagem até o final, localize a opção <strong>"Sripts Ativos"</strong> e selecione "Ativar".
			<br><br>
			
			<h2>No Mozilla Firefox:</h2>
			
			Acesse <strong>"Ferramentas->Opções"</strong>, clique na aba <strong>"Conteúdo"</strong> e selecione a opção <strong>"Permitir Javascript"</strong>.
			<br><br>
			
			Agradeçemos a sua compreensão.
				
		</div-->
		<!-- NO JAVASCRIPT -->

		<input id="confirmar" name="confirmar" type="submit" value="Enviar" class="botao" onMouseOver="this.className='botaoover';" onMouseOut="this.className='botao';" >
		<input type="hidden" name="send_to_url" value="carrinho.jsp">
		<input type="hidden" name="back_to_url" value="<%=request.getRequestURL()%>">
		
	</form>
	</div>
	
	<!--CONFIGURAÇÂO DO FORMULÁRIO-->
	
	
	<script>
	
	var areas = new Array();
	var loaded  = false;
	var force_adress = true;
	
	changeObjStyle('login_area', 'display', '');
	areas['login_area'] = 1;
	changeObjStyle('basico', 'display', '');
	areas['basico'] = 1;
	changeObjStyle('completo', 'display', '');
	areas['completo'] = 1;
	changeObjStyle('endereco', 'display', '');
	areas['endereco'] = 1;
	/*
	changeObjStyle('autorizacao', 'display', '');
	areas['autorizacao'] = 1;
	*/
	//changeObjStyle('botoes', 'display', '');
	//changeObjStyle('no_javascript', 'display', 'none');
	
	//saveAreas();
	var areas_int_total = 7;
	
	</script>
	
	                                    </div>	</div>	
	        </div><!-- conteudo -->	
		
	 	 	<!--img src="images/foot.gif"/>		
			<div id="footer" align="center">
					
				<br /><img src="images/rue.gif" /><br />
				
		  		Copyright 2006 Editora Contexto - Todos direitos reservados<br />
		  			  	</div> footer -->
	
	  	
</div><!-- wrap --> 
		</body>
</html>
