<%@ page contentType="text/html; charset=windows-1252" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Envio de E-mail</title>
</head>
<body>

<%@page import="br.com.relato.*" %>
<%@ page import="java.util.*" %>
<%

StringBuffer buff = new StringBuffer();
TreeMap params = new TreeMap();
String campo;
String valor;


if (request.getMethod().equalsIgnoreCase("post")) {
	Enumeration en = request.getParameterNames();
	while (en.hasMoreElements()) {

		campo = (String)en.nextElement();
		valor = (request.getParameter(campo) != null ? request.getParameter(campo) : "");
		params.put(campo, valor);
		//buff.append(campo).append(": ").append(valor).append('\n');
	}
}

/*
if (params.size() > 0) {

	valor = request.getParameter("formname");
	if (valor!=null && valor.equalsIgnoreCase("oportunidades")) {

		buff.append("Nome:               ").append(params.get("nome")).append('\n');
		buff.append("Estado Civil:       ").append(params.get("estadocivil")).append('\n');
		buff.append("Data de Nascimento: ").append(params.get("datanascimento")).append('\n');
		buff.append("Endereço:           ").append(params.get("endereco")).append('\n');
		buff.append("Complemento:        ").append(params.get("complemento")).append('\n');
		buff.append("Município:          ").append(params.get("cidade")).append('\n');
		buff.append("Estado:             ").append(params.get("estado")).append('\n');
		buff.append("Cep:                ").append(params.get("cep")).append('\n');
		buff.append("Telefone:           ").append(params.get("telefone")).append('\n');

		buff.append("Pós-venda:          ").append(params.get("objetivo1") != null ? "Sim": "").append('\n');
		buff.append("Pré-venda:          ").append(params.get("objetivo2") != null ? "Sim": "").append('\n');
		buff.append("Comercial:          ").append(params.get("objetivo3") != null ? "Sim": "").append('\n');
		buff.append("Administrativa:     ").append(params.get("objetivo4") != null ? "Sim": "").append('\n');
		buff.append("Outras:             ").append(params.get("objetivo5") != null ? "Sim": "").append('\n');

		buff.append("Empresa 1:          ").append(params.get("empresa1")).append('\n');
		buff.append("Período:            ").append(params.get("periodo1")).append('\n');
		buff.append("Função:             ").append(params.get("funcao1")).append('\n');
		buff.append("Empresa 2:          ").append(params.get("empresa2")).append('\n');
		buff.append("Período 2:          ").append(params.get("periodo2")).append('\n');
		buff.append("Função 2:           ").append(params.get("funcao2")).append('\n');
		buff.append("Empresa 3:          ").append(params.get("empresa3")).append('\n');
		buff.append("Período 3:          ").append(params.get("periodo3")).append('\n');
		buff.append("Função 3:           ").append(params.get("funcao3")).append('\n');

		buff.append("Conhecimento 1:     ").append(params.get("conhecimento1")).append('\n');
		buff.append("Conhecimento 2:     ").append(params.get("conhecimento2")).append('\n');
		buff.append("Idioma 1:           ").append(params.get("idioma1")).append('\n');
		buff.append("Leitura 1:          ").append(params.get("leitura1") != null ? "Sim": "").append('\n');
		buff.append("Escrita 1:          ").append(params.get("escrita1") != null ? "Sim": "").append('\n');
		buff.append("Conversação 1:      ").append(params.get("conversacao1") != null ? "Sim": "").append('\n');

		buff.append("Idioma 2:           ").append(params.get("idioma2")).append('\n');
		buff.append("Leitura 2:          ").append(params.get("leitura2") != null ? "Sim": "").append('\n');
		buff.append("Escrita 2:          ").append(params.get("escrita2") != null ? "Sim": "").append('\n');
		buff.append("Conversação 2:      ").append(params.get("conversacao2") != null ? "Sim": "").append('\n');

		buff.append("Idioma 3:           ").append(params.get("idioma3")).append('\n');
		buff.append("Leitura 3:          ").append(params.get("leitura3") != null ? "Sim": "").append('\n');
		buff.append("Escrita 3:          ").append(params.get("escrita3") != null ? "Sim": "").append('\n');
		buff.append("Conversação 3:      ").append(params.get("conversacao3") != null ? "Sim": "").append('\n');
	}

	if (valor!=null && valor.equalsIgnoreCase("faleconosco")) {
		buff.append("Nome:               ").append(params.get("NOME")).append('\n');
		buff.append("Empresa:            ").append(params.get("empresa")).append('\n');
		buff.append("E-mail:             ").append(params.get("EMAIL")).append('\n');
		buff.append("Telefone:           ").append(params.get("TELEFONE")).append('\n');
		buff.append("Assunto:            ").append(params.get("ASSUNTO")).append('\n');
		buff.append("Outro:              ").append(params.get("OUTRO_ASSUNTO")).append('\n');
		buff.append("Comentários:        ").append(params.get("comentario")).append('\n');
	}	
}
*/


if (params.size() > 0) {
	Iterator i = params.keySet().iterator();
	while (i.hasNext()) {
		campo = (String) i.next();
		valor = (String) params.get(campo);
		buff.append(campo).append(": ").append(valor).append('\n');
	}
}



//buff.append(campo).append(": ").append(valor).append('\n');


if (buff.length() > 0) {
	
	EmailHelper em = new EmailHelper("internet@yamadori.org.br");

	//emails para quem vamos envias a mensagem
	em.addDest("contato@yamadori.org.br");
	//em.addDest("daniel@relato.com.br");
	//em.addDest("haroldo@relato.com.br");

	em.envia("Formulário de Cadastro da Internet", buff.toString());
}	
%>

<table width="770" border="0" align="left" cellpadding="0" cellspacing="0">
  <tr valign="top">
    <td>
		<div align="left"><img src="imagens/top01.jpg" border="0"></div>
	</td>
  </tr>
  <tr valign="middle">
    <td height="144">
		<div align="center">
			Obrigado!<br><br>
			Em breve entraremos em contato com você.
			<br><br><a href="/index.jsp">Voltar</a>
		</div>
	</td>
  </tr>
</table>
</body>
</html>