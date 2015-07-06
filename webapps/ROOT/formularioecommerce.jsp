<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>	
    <title>..::Relato Informática::..</title>
    <link href="/styles/estilo.css" rel="stylesheet" type="text/css"/>
    <script language="JavaScript" src="/scripts/formularioecommerce.js"></script>
    
<meta name="description" content="Relato Informática.">
</head>
<body>
	<form enctype="multipart/form-data" name="Cadastro" method="POST" onsubmit="return validateCadastro()" action="/caixa_01.php?cesta_id=9643">
<!-- LOGIN -->
		<br>
		<div style="display:none" id="login_area">
		<h1 class="h1_cad">LOGIN</h1>
			<table width="100%" border="0" cellpadding="2" cellspacing="0" bgcolor="#F6F6F6" style="margin-bottom:50px; ">		
				<tr> 
					<td width="20%" align="right" class="cadastrotitulo">E-mail<span style="color:#FF0000">*</span></td>
					<td class="cadastroinput">
					<input onblur="validateEmailField(this.id, 'E-mail inválido!');if(!loaded)checkEmail(this.id, 'caixa_02.php');changeValue('login_field', this.value);" type="text" name="nmsemail" id="email" class="form1" size="50" value=""><br>
					<input type="hidden" name="login" id="login_field" class="form1" size="25" value="">
						<div style="color:#FF0000;display:none;" id="email_err"></div>
						<span style="color:#FF0000;" id="email_resp"></span>				
					</td>
				</tr>
				<tr> 
					<td width="20%" align="right" class="cadastrotitulo">Senha<span style="color:#FF0000">*</span></td>
					<td class="cadastroinput">
						<input onblur="if(!loaded)validateSize(this.id, 5, 16, 'A senha deve possuir entre 5 e 16 acaracteres!')" type="password" id="senha_field" name="nmssenha" class="form1" size="15">
						 <span style="color:#FF0000">A senha deve possuir entre 5 e 16 acaracteres!</span>
							
						<div style="color:#FF0000;display:none;" id="senha_field_err"></div>
					</td>
				</tr>
				<tr> 
					<td width="20%" align="right" class="cadastrotitulo">Confirmar senha <span style="color:#FF0000">*</span></td>
					<td class="cadastroinput">
						<input onblur="validadeEqualFields(this.id, 'senha_field', 'Senhas informadas diferem!')" type="password" name="senha_confirma" id="senha_confirma_field" class="form1" size="15">
						<div style="color:#FF0000;display:none;" id="senha_confirma_field_err"></div>
					</td>
				</tr>
			</table>
		</div>
<!-- LOGIN FIM-->
		
		<!-- BASICO -->
		<div style="margin-top:-30px;display:none" id="basico">
		<h1 class="h1_cad">BÁSICO</h1>
		<table width="100%" border="0" cellpadding="2" cellspacing="0" bgcolor="#F6F6F6" style="margin-bottom:50px; ">
			<tr style="display:none"> 
				<td width="20%" align="right" class="cadastrotitulo">Tipo de pessoa<span style="color:#FF0000">*</span></td>
				<td class="cadastroinput">
					F&iacute;sica<input checked type="radio" name="tipo" value="PF" id="PF" onfocus="changePessoaTipo(this.value)">
					Jur&iacute;dica<input  type="radio" name="tipo" value="PJ" id="PJ" onfocus="changePessoaTipo(this.value)">
				</td>
			</tr>	
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo"><span id="nom_r">Nome</span><span style="color:#FF0000">*</span></td>
				<td class="cadastroinput">
					<input type="text" name="nome" id="nome" onblur="validateSize(this.id, 1, 255, 'Campo não pode ser nulo!')" class="form1" size="50" value="">
					<div style="color:#FF0000;display:none;" id="nome_err"></div>
				</td>
			</tr>
			<tr id="contato_tr" style="display:none"> 
				<td width="20%" align="right" class="cadastrotitulo">Contato<span style="color:#FF0000">*</span></td>
				<td class="cadastroinput">
					<input type="text" name="contato" id="contato" onblur="validateSize(this.id, 1, 255, 'Campo não pode ser nulo!')" class="form1" size="50" value="">
					<div style="color:#FF0000;display:none;" id="contato_err"></div>
				</td>
			</tr>				
			<tr id="sexo_tr"> 
				<td width="20%" align="right" class="cadastrotitulo">Sexo <span style="color:#FF0000">*</span></td>
				<td class="cadastroinput">
					Masculino<input  type="radio" name="sexo" value="M" id="sexo1">
					Feminino<input  type="radio" name="sexo" value="F" id="sexo2">
				</td>
			</tr>
			<tr id="data_nasc_tr">
				<td width="20%" align="right" class="cadastrotitulo">Data de nascimento </td>
				<td class="cadastroinput">
					Dia:&nbsp;<select name="data_nasc[dia]"><option value="">Escolha<option  value='1'>1
	<option  value='2'>2
	<option  value='3'>3
	<option  value='4'>4
	<option  value='5'>5
	<option  value='6'>6
	<option  value='7'>7
	<option  value='8'>8
	<option  value='9'>9
	<option  value='10'>10
	<option  value='11'>11
	<option  value='12'>12
	<option  value='13'>13
	<option  value='14'>14
	<option  value='15'>15
	<option  value='16'>16
	<option  value='17'>17
	<option  value='18'>18
	<option  value='19'>19
	<option  value='20'>20
	<option  value='21'>21
	<option  value='22'>22
	<option  value='23'>23
	<option  value='24'>24
	<option  value='25'>25
	<option  value='26'>26
	<option  value='27'>27
	<option  value='28'>28
	<option  value='29'>29
	<option  value='30'>30
	<option  value='31'>31
	</select>
					M&ecirc;s:&nbsp;<select name="data_nasc[mes]"><option value="">Escolha<option  value='1'>1
	<option  value='2'>2
	<option  value='3'>3
	<option  value='4'>4
	<option  value='5'>5
	<option  value='6'>6
	<option  value='7'>7
	<option  value='8'>8
	<option  value='9'>9
	<option  value='10'>10
	<option  value='11'>11
	<option  value='12'>12
	</select>				
				</td>
			</tr>
				
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo">Observa&ccedil;&otilde;es</td>
				<td class="cadastroinput">
					<textarea class="form1" rows="5" cols="50" name="obs"></textarea><br>
					<span style="color:#FF0000">(se quiser deixar algum comentário para nós, coloque-o aqui)</span>
				</td>
			</tr>	
		</table>
		</div><!-- BASICO -->
		
		<!-- COMPLETO -->
		<div style="margin-top:-50px;display:none" id="completo">
	
		<table width="100%" border="0" cellpadding="2" cellspacing="0" bgcolor="#F6F6F6" style="margin-bottom:50px; ">
		<tr id="cpf_tr"> 
			<td align="right" width="20%" class="cadastrotitulo">CPF<span style="color:#FF0000">*</span></td>
			<td class="cadastroinput">
				<input onblur="validateCPF_CNPJ(this.id)" type="text" id="cpf_cnpj" name="cpf_cnpj" onkeypress="return fieldCPF(event, this.id)" class="form1" size="25" value="">
				<span style="color:#FF0000">(informe o CPF sem ponto nem traço)</span>
				<div style="color:#FF0000" id="cpf_cnpj_err"></div>
				<div style="color:#FF0000;" id="cc_resp"></div>						
			</td>				
		</tr>
		<tr id="cnpj_tr" style="display:none"> 
			<td align="right" width="20%" class="cadastrotitulo">CNPJ<span style="color:#FF0000">*</span></td>
			<td class="cadastroinput">
				<input onblur="validateSize(this.id, 15, 15, 'CNPJ deve ter 15 dígitos!')" type="text" id="cnpj" name="cnpj" onkeypress="return fieldCNPJ(event, this.id)" class="form1" size="25" value="">
				<span style="color:#FF0000">(informe o CNPJ sem pontos, traços ou barras)</span>
				<div style="color:#FF0000" id="cnpj_err"></div>
			</td>				
		</tr>
		</table>
		</div><!-- COMPLETO -->	
		
		<!-- PROFESSOR -->
		<div style="margin-top:-30px;display:none" id="professor">
		<h1 class="h1_cad">PROFESSOR</h1>
		<table width="100%" border="0" cellpadding="2" cellspacing="0" bgcolor="#F6F6F6" style="margin-bottom:50px; ">
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo">Institui&ccedil;&atilde;o <span style="color:#FF0000">*</span></td>
				<td class="cadastroinput">
					<input type="text" id="instituicao" name="instituicao" class="form1" size="25" value="">
					<div style="color:#FF0000" id="instituicao_err"></div>
				</td>
			</tr>
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo">Disciplina</td>
				<td class="cadastroinput">
					<input type="text" name="disciplina" id="disciplina" class="form1" size="25" value="">
				</td>
			</tr>
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo">Grau: </td>
				<td class="cadastroinput">
					<input type="hidden" name="pri" value="N">
					<input type="hidden"" name="seg" value="N">
					<input type="hidden"" name="ter" value="N">
					<input type="hidden"" name="pos" value="N">			
					<input type="checkbox"  name="pri" value="S">&nbsp;Ensino Fundamental<br>
					<input type="checkbox"  name="seg" value="S">&nbsp;Ensino Médio<br>
					<input type="checkbox"  name="ter" value="S">&nbsp;Ensino Superior<br>
					<input type="checkbox"  name="pos" value="S">&nbsp;Pós Graduação
				</td>
			</tr>				
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo">N&ordm; de alunos</td>
				<td class="cadastroinput">
					<input type="text" id="no_alunos" name="no_alunos" onkeypress="return checkKey(event, 'num', true)" class="form1" maxlength="8" size="8" value="">
				</td>
			</tr>
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo">Já adotou algum livro da contexto?</td>
				<td class="cadastroinput">
					Não<input checked type="radio" name="adotou" value="N" onchange="hide('adotados_div')">
					Sim<input  type="radio" name="adotou" value="S" onchange="un_hide('adotados_div')">
					<div id="adotados_div" style="display:none">
						Quais?<br>
						<textarea name="adotados" rows="5" cols="20"></textarea>
					</div>
				</td>
			</tr>			
		</table>	
		</div><!-- PROFESSOR -->		
		
		<!-- JORNALISTA -->
		<div style="margin-top:-30px;display:none" id="jornalista">
		<h1 class="h1_cad">JORNALISTA</h1>
		<table width="100%" border="0" cellpadding="2" cellspacing="0" bgcolor="#F6F6F6" style="margin-bottom:50px; ">
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo">Ve&iacute;culo </td>
				<td class="cadastroinput">
					<input type="text" id="veiculo" name="veiculo" class="form1" size="25" value="">
					<div style="color:#FF0000" id="veiculo_err"></div>
				</td>
			</tr>
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo">Tipo </td>
				<td class="cadastroinput">
					<select name="veiculo_tipo">
						<option value="">Escolha<option  value='JORNAL'>JORNAL
	<option  value='REVISTA'>REVISTA
	<option  value='TV'>TV
	<option  value='RADIO'>RADIO
	<option  value='INTERNET'>INTERNET
	<option  value='OUTROS'>OUTROS
					</select>
				</td>
			</tr>	
		</table>
		</div><!-- JORNALISTA -->	
		
		<!-- DISTRIBUIDOR -->
		<div style="margin-top:-30px;display:none" id="distribuidor">
		</div><!-- DISTRIBUIDOR -->
		
		<!-- ENDEREÇO BÁSICO -->
		<div style="margin-top:-30px;display:none" id="endereco">
		<input type="hidden" id="identificador" name="identificador" class="form1" size="25" value="Casa">
		<input type="hidden" value="RES" name="end_tipo" id="end_tipo" class="form1" size="25">	
		<h1 class="h1_cad">ENDEREÇO</h1>
			<table width="100%" border="0" cellpadding="2" cellspacing="0" bgcolor="#F6F6F6" style="margin-bottom:50px; ">
	
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo">Logradouro <span style="color:#FF0000">*</span></td>
				<td class="cadastroinput">
					<input type="text" id="logradouro" name="logradouro" class="form1" size="70" value="">
					<span style="color:#FF0000">(Rua, Avenida, etc)</span>
					<div style="color:#FF0000" id="logradouro_err"></div>
				</td>
			</tr>
			<tr>
				<td width="20%" align="right" class="cadastrotitulo">N&ordm; <span style="color:#FF0000">*</span></td>
				
				</td>
				<td class="cadastroinput">
					<input type="text" id="numero" name="numero" onkeypress="return checkKey(event, 'num', true)" class="form1" size="5" value="">
					Complemento&nbsp;<input type="text" id="complemento" name="complemento" class="form1" maxlength="11" size="15" value="">
					<span style="color:#FF0000">(casa, apartamento, etc)</span>
					<div style="color:#FF0000" id="numero_err"></div>
				</td>			
			</tr>
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo">Bairro <span style="color:#FF0000">*</span></td>
				<td class="cadastroinput">
					<input type="text" id="bairro" name="bairro" class="form1" size="25" value="">
					<div style="color:#FF0000" id="bairro_err"></div>
				</td>
			</tr>
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo">Cidade <span style="color:#FF0000">*</span></td>
				<td class="cadastroinput">
					<input type="text" name="cidade" id="cidade" class="form1" size="25" value="">
					<div style="color:#FF0000" id="cidade_err"></div>
				</td>
			</tr>	
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo">CEP <span style="color:#FF0000">*</span></td>
				<td class="cadastroinput">
					<input onkeypress="return fieldCEP(event, this.id)" type="text" name="CEP" id="CEP" class="form1" size="8" value=""><span style="color:#FF0000">(informe o CEP sem traço)</span>
					<div style="color:#FF0000" id="CEP_err"></div>
				</td>
			</tr>			
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo">UF <span style="color:#FF0000">*</span></td>
				<td class="cadastroinput">
					<select name="uf"><option  value='AC'>AC
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
			<tr> 
				<td width="20%" align="right" class="cadastrotitulo">Pa&iacute;s <span style="color:#FF0000">*</span></td>
				<td class="cadastroinput">
					<input type="text" name="pais" id="pais" class="form1" size="25" value="Brasil">
					<div style="color:#FF0000" id="pais_err"></div>
				</td>
			</tr>
			<tr id="tel_res_tr"> 
				<td align="right" width="20%" class="cadastrotitulo">Telefone residencial </td>
				<td class="cadastroinput">				
					<input style="width:15px" type="text" id="ddd_res" name="ddd_res" onkeypress="return fieldDDD(event, this.id)" class="form1" maxlength="2" value="">
					<input type="text" id="tel_res" name="tel_res" onkeypress="return fieldTel(event, this.id)" class="form1" maxlength="8" size="8" value="">
				</td>
			</tr>
			<tr> 
				<td align="right" width="20%" class="cadastrotitulo">Telefone comercial </td>
				<td class="cadastroinput">				
					<input style="width:15px" type="text" id="ddd_com" name="ddd_com" onkeypress="return fieldDDD(event, this.id)" maxlength="2" value="">
					<input type="text" id="tel_com" name="tel_com" onkeypress="return fieldTel(event, this.id)" maxlength="8" size="8" value="">
				</td>
			</tr>		
			</table>
		</div><!-- ENDEREÇO BÁSICO-->
		
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
		<input type="hidden" name="log" value="1">
		<input type="hidden" name="return_page" value="caixa_02.php">
		<input type="hidden" name="cadastro_id" value="">
		<input type="hidden" id="loaded_areas" name="loaded_areas" value="">
	</form>
	</div>
	
	<!--CONFIGURAÇÂO DO FORMULÁRIO-->
	<script>var areas = new Array();var loaded  = false;var force_adress = true;changeObjStyle('login_area', 'display', '');areas['login_area'] = 1;changeObjStyle('basico', 'display', '');areas['basico'] = 1;changeObjStyle('completo', 'display', '');areas['completo'] = 1;changeObjStyle('endereco', 'display', '');areas['endereco'] = 1;changeObjStyle('autorizacao', 'display', '');areas['autorizacao'] = 1;changeObjStyle('botoes', 'display', '');changeObjStyle('no_javascript', 'display', 'none');saveAreas();var areas_int_total = 7;</script>
	
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
