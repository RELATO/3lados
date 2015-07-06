<html>
<%
	java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z");
	String text = sdf.format(date);
%>
<head>

	<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	<META HTTP-EQUIV="Cache-Control" content="no-cache">
	<META HTTP-EQUIV="Expires" CONTENT="<%=text%>">
	<META HTTP-EQUIV="Date" CONTENT="<%=text%>">
	
	<style>

		table.principal {
			border: 1px solid #00125E; 
			padding: 0px;
			background-color: #e7e7e7;
			margin-top: 50px;
			vertical-align: middle;		
		}

		input.botao {
			border: 1px solid white;
			background-color: #3163A0;
			color: white;
			font-weight: bolder;
			font-family: Verdana, Tahoma, Arial, sans-serif;
			font-size: 10px;
			width: 80px;
			text-align: center;
		}
		
		input.botaoover {
			border: 1px solid #3163A0;
			background-color: white;
			color: #3163A0;
			font-weight: bolder;
			font-family: Verdana, Tahoma, Arial, sans-serif;
			font-size: 10px;
			width: 80px;
			text-align: center;
			cursor: pointer;
		}

		span.produto {
			font-weight: bold;
			color: #3163A0;
			font-size: 16px;
			font-family: Verdana, Tahoma, Arial, sans-serif;
			text-align: center;
		}

	
	</style>

	<script>
	
		function chamaUpload(){
			//alert('lalala');
			window.open('upload_arquivo.jsp?retorno=arquivoMensagem&idjob=1&opcao=M','upload','top=20, left=20, width=526, height=250');
			
		}
		
	 
		function chamaProcessa(){
		
			var arquivo = document.getElementById("arquivoMensagem").value;
			if("" != arquivo){
				document.getElementById("path").value = "uploads/"+arquivo; 
				var confere = arquivo.toString();
				if(confere.lastIndexOf(".") > 0){
					confere = confere.substring(confere.lastIndexOf(".")+1,confere.length);
					if(confere != "xls" && confere != "xlsx"){
						alert('Tipo de arquivo inválido!\nFavor incluir apenas arquivos .xls');
						return (false);
					}
				}
				document.getElementById("enviaMensagem").disabled = true;
				document.getElementById("processa").disabled = true; 
				return (true);
			}else{
				alert('Favor fazer upload do arquivo');
				return (false);
			}
			
		}
	</script>

</head>


<body>
	<form action="/xlsServlet" method="post" onSubmit="return chamaProcessa();">
		<table class="principal" align="center" width="500" cellpadding="0" cellspacing="0">
			<tr>
				<td><span class="produto">Importação de Prospects</span></td>
			</tr>
			<tr>
				<td align="left">
					<input type="text"
						name="arquivoMensagem"
						id="arquivoMensagem"
						title="Arquivo com emails a serem atualizados"
						size="40"
						class="textfield"
						style="text-transform:none;"
						readonly
					/>
				</td>
				
				<td align="left">
					<input id="enviaMensagem"
						type="button" 
						class="botao"
						style=""
						value="Selecionar"
						title=""
						onclick="chamaUpload();"
						onMouseOver="this.className='botaoover';" 
						onMouseOut="this.className='botao';"
						/>	
				</td>
			</tr>
			
			<tr>
				<td align="left">
					<input id="processa"
						type="submit" 
						class="botao"
						style=""
						value="Processar"
						title="Incluir prospects de arquivo excel na base de dados"
						onMouseOver="this.className='botaoover';" 
						onMouseOut="this.className='botao';"
					/>	
				</td>
			</tr>
			
		</table>

		<input type="hidden" name="resposta" id="resposta" value="http://www.relato.com.br/siteadmin/home.jsp">
		<input type="hidden" name="opcao" id="opcao" value="1">
		<input type="hidden" name="path" id="path" value="">

	</form>
</body>

</html>