/*
	Controler - JavaScript
	
	Baseado em tree.js e util.js da Modsoft Inform?tica
	
	11/Jun/2001 - Cria??o de menus
	12/Nov/2001 - Ajuste para mais navegadores
	03/Abr/2002 - Adapta??o de valida??o
	10/Abr/2002 - Lookup
	11/Abr/2002 - Adapta??o para mestre detalhe
	30/Abr/2002 - Colocado konqueror
	08/Mai/2002 - Ajustado lookup/select para acessar pelo opener,
	              compatibilizando com konqueror.
	08/Ago/2002	- Acrescentado ColumnNumber e FieldTarget ao doLookup
    18/Set/2002 - Colocado contangem de tela para reference
	18/Out/2002 - Ajuste filtro do masterLookupName
*/
 
/**********************************************************
 * Identifica o browser
 */
function IdentBrowser(){
	// Pega a versao do browser
	this.version = new String(navigator.appVersion);
	// Se browser tiver metodo getElementById
	this.hasGetElement    = document.getElementById ? 1 : 0;
	// Se o browser ? o IE 6
	this.ie6    = (this.version.indexOf("MSIE 6")>-1 && this.hasGetElement) ? 1 : 0;
	// Se o browser ? o IE 5
	this.ie5    = (this.version.indexOf("MSIE 5")>-1 && this.hasGetElement) ? 1 : 0;
	// Se o browser ? o IE 4
	this.ie4    = (document.all && !this.hasGetElement) ? 1 : 0;
	// Se o browser ? o Nav 5
	this.ns5    = (this.hasGetElement && parseInt(this.ver) >= 5) ? 1 : 0;
	// Se o browser ? o Nav 4
	this.ns4    = (document.layers && !this.hasGetElement) ? 1 : 0;
	// Se o browser ? o Nav 6
	this.ns6    = navigator.vendor && navigator.vendor == "Netscape6" ? 1 : 0;
	// Se o browser e o Konqueror
	this.kqr    = this.version && this.version.indexOf("Konqueror") > -1
    // Se o browser e o Mozilla
    this.mzl    = "Mozilla" == navigator.appCodeName;
	// ? um browser valido
	this.isValid = this.ie6 || this.ie5 || this.ie4 || this.ns4 || this.ns5 || this.ns6 || this.kqr;

	if (this.ie4)
		this.tipo = 'ie4';
	else if (this.ie5)
		this.tipo = 'ie5';
	else if (this.ie6)
		this.tipo = 'ie6';
	else if (this.ns4)
		this.tipo = 'ns4';
	else if (this.ns5)
		this.tipo = 'ns5';
	else if (this.ns6)
		this.tipo = 'ns6';
	else if (this.kqr)
		this.tipo = "kqr";
  else if (this.mzl)
    this.tipo = "mzl";
	else {
		alert("Este navegador nao ? valido para execucao desta rotina : \nNavegador = " + this.version);
		this.tipo = "???";
	}
	
	// Identifica qual o navegador
	this.ns = this.tipo.substring(0,2) == "ns";
	this.ie = this.tipo.substring(0,2) == "ie";
	
	// alert("tipo = " + this.tipo);
	
	// S? para compatibilidade ? retornado, versoes mais recentes nao sao necessarias
	return this;
}

/*******************************************************
 * Variaveis
 */
 
/*
 * Informa?oes do browser
 */
var brw = new IdentBrowser();
/*
 * Identifica unidade de scroll vertical
 */
var vsc = 66;

/*
 * Ultimo folder
 */
var oldFolder;
/*
 * Dias dos meses
 */
var dias = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
/*
 * Indicador de checagem
 */
var check = true;

/*
 * Retorna um objeto do navegador pelo seu nome
 */
function getObjectByName(name) {
	var obj = null;
	if (! brw)
		brw = new IdentBrowser();
	if (brw.hasGetElement)
		obj = document.getElementById(name);
	else {
		obj = document.all[name];
	}
	return obj;
}

/*
 * Construtor de um controle para o layer
 */
function LayerControl(name) {
	if (brw.ns6 || brw.ns5) {
		this.htm = document.getElementById(name);
		this.css = this.htm.style;
	} else if (brw.ns4) {
		this.css = document[name];
		this.htm = this.css.document;
	} else {
		this.htm = document.all[name];
		this.css = this.htm.style;
	}
	this.name = name;
	this.load = loadLayerHTML;
	this.show = showLayer;
	this.hide = hideLayer;
	this.scrollUp = scrollLayerUp;
	this.scrollDown = scrollLayerDown;
	this.clip = clipLayer;
	this.view = viewLayer;
	this.review = reviewLayer;
}

/*
 * Carrega um html
 */
function loadLayerHTML(page) {
	if (brw.ns4) {
		this.css.load(page, 800);
	} else if (brw.ns5 || brw.ns6) {
		var bf = document.getElementById("bfLoad");
		if (bf) {
			bf.src = page;
			this.htm.innerHTML = bf.innerHTML;
		}
	} else {
		parent.bfLoad.document.location = page;
		this.htm.innerHTML = parent.bfLoad.document.body.innerHTML;
	}
}

/*
 * Mostra um layer
 */
function showLayer() {
	this.css.visibility = "visible";
}

/*
 * Esconde um layer
 */
function hideLayer() {
	this.css.visibility = "hidden";
}

/*
 * Rola um layer para cima
 */
function scrollLayerUp() {
	this.css.top = parseInt(this.css.top) - vsc;
	this.viewTop += vsc;
	this.viewBottom += vsc;
	this.review();
}

/*
 * Rola um layar para baixo
 */
function scrollLayerDown() {
	this.css.top = parseInt(this.css.top) + vsc;
	this.viewTop -= vsc;
	this.viewBottom -= vsc;
	this.review();
}

/*
 * Reposiciona um layer
 */
function reviewLayer() {
	this.clip(this.viewLeft, this.viewTop, this.viewRight, this.viewBottom); 
}

/*
 * Mostra um layer numa posicao
 */
function viewLayer(x1, y1, x2, y2) {
	this.viewLeft = x1;
	this.viewTop = y1;
	this.viewRight = x2;
	this.viewBottom = y2;
	this.review();
}

/*
 * Corta um layer
 */
function clipLayer(x1, y1, x2, y2) {
	if (brw.ns4) {
		this.css.clip.left = x1;
		this.css.clip.top = y1;
		this.css.clip.right = x2;
		this.css.clip.bottom = y2;
	}
	else {
		this.css.clip = "rect(" + y1 + "px "+ x2 + "px " + y2 + "px " + x1 + "px)";
	}
}

/*
 * Fica por cima da barra
 */
function doBarOver(t) {
	t.style.backgroundColor='#FFFFFF';
	t.style.color='#0042A0';
}

/*
 * Sai da barra
 */
function doBarOut(t) {
	t.style.backgroundColor='#0042A0';
	t.style.color='#FFFFFF';
}

/*
 * Apaga uma tab
 */
// A tabela deve sempre ter a primeira guia ativa no inicio
// O ultima guia ative ? uma propriedade ativa no inicio da transforma??o

function changeTabOff(obj) {
	var dv = getObjectByName("p_" + obj.id.substring(2));
	if (dv) {
		dv.style.display="none";
	}	
	// Encontra a tabela
 	var tab = obj.children(0);

		// Muda a classe da tabela	
	tab.className = 'tabtabelainactive';
	tab.rows(0).children(0).children(0).src = "../images/tab_marc.gif";
	tab.rows(0).children(1).className = 'tabcelulainactive';
	tab.rows(0).children(1).children(0).className = 'tablinkinactive';
}

/*
 * Sobrepoe uma tab
 */
function changeTabOn(obj) {
	var dv = getObjectByName("p_" + obj.id.substring(2));
	if (dv) {
		dv.style.display="inline";
	}	
	// Encontra a tabela
 	var tab = obj.children(0);

		// Muda a classe da tabela
	tab.className = 'tabtabelactive';
	tab.rows(0).children(0).children(0).src = "../images/tab_marc_roll.gif";
	tab.rows(0).children(1).className = 'tabcelulaactive';
	tab.rows(0).children(1).children(0).className = 'tablinkactive';
}

/*
 * Pega o nome da tab
 */
function getTabName(name) {
	var psi = name.indexOf("_");
	if (psi < 0)
		psi = 0;
	else
		psi += 1;
	var psf = name.lastIndexOf("_");
	if (psf < 0)
		psf = name.length();
	return name.substring(psi,psf);
}

/*
 * Troca uma tab de posicao
 */
function changeTab(obj) {
	var name = getTabName(obj.id);
	var folder = getObjectByName(name);
	if (folder) {
		if (! folder.lastSelectedTab)
			folder.lastSelectedTab = getObjectByName("g_" + name + "_1");
		if (folder.lastSelectedTab)
	  	changeTabOff(folder.lastSelectedTab);
	}
	changeTabOn(obj);
	folder.lastSelectedTab = obj
}

/*
 * Rola as tabs para a esquerda
 */
function rollTabLeft(name) {
	var folder = getObjectByName(name);
	if (folder) {
		if (! folder.leftTab)
			folder.leftTab = 1;
		if (folder.leftTab <= 1)
			return;
		folder.leftTab -= 1;
		page = getObjectByName("g_" + name + "_" + folder.leftTab);
		if (page) {
			page.style.display="inline";
		}
	}
}

/*
 * Rola as tabs para direita
 */
function rollTabRight(name) {
	var folder = getObjectByName(name);
	if (folder) {
		if (! folder.leftTab)
			folder.leftTab = 1;
		var newTab = folder.leftTab + 1;
		if (getObjectByName("g_" + name + "_" + newTab)) {
			page = getObjectByName("g_" + name + "_" + folder.leftTab);
			if (page)
				page.style.display="none";
			folder.leftTab = newTab;
		}
	}
}

/*
 * Verifica se o objeto ? visivel
 */
function isVisible(obj) {
	if (!obj)
		return false;
	if (! obj.style)
		return false;
	if (obj.style.display) {
		if (obj.style.display == "none")
		  return false;
	}
	return true;
}

function changeImage(img, name) {
	var itemObj = getObjectByName(img);
	if (itemObj) {
		itemObj.src = name;
	}
}

/*
 * Troca imagem do menu
 */
function changeMenu(img, item) {
	var itemObj = getObjectByName(item);
	if (itemObj) {
		if (isVisible(itemObj)) {
			itemObj.style.display = 'none';
			getObjectByName(img).src = 'img/ico_plus.png';
		} else {
			itemObj.style.display = 'inline';
			getObjectByName(img).src = 'img/ico_minus.png';
		}
	}
}

/*
 * Abre um folder
 */
function openFolder(obj, name) {
	if (oldFolder)
		oldFolder.className = "submenu";
	obj.className = 'submenuselect';
	oldFolder = obj;
	doShow("forms/consulta.jsp?folder=" + name);
	// window.open("forms/consulta.jsp?folder="+name,"_new","scrollbars=yes,width=585,height=430")
}

/*
 * Abre um popup
 */
function openPopup(name) {
	window.open(name,"_new","scrollbars=no,width=585,height=340")
}

/*
 * Executa comando
 */
function doCommand(action, param) {
	var form = top.document.formAction;
	form.actionCommand.value = action;
	form.actionParams.value = param;
	form.submit();
}

/*
 * Efetua logout
 */
function doLogout() {
	doCommand("logout","");
}

/*
 * Mostra formul?rio
 */
function doShow(name) {
	doCommand("show",name);
}

/*
 * Abre dialogo
 */
function openDlg(name) {
	window.open(name,"_new","scrollbars=no,width=300,height=200");	
}

/*
 * Funcao nula
 */
function none() {
}

/*
 * Retira espacos em branco
 */
function trim(st) {
  if (st == null)
    return "";
  st = new String(st);
  if (! st.length || st.length == 0)
    return "";
  var psi = 0;
  // Procura a primeira ocorrencia de nao espa?o
  while (psi < st.length && st.charAt(psi) == ' ')
    psi++;
  // Procura a ultima ocorrencia de nao espa?o
  var psf = st.length;
  while (psf > psi && st.charAt(psf-1) == ' ')
    psf--;

  // Retorna string nula  
  if (psi >= psf)
    return "";
    
  // Retorna substring
  return st.substring(psi, psf);
}

/*
 * Converte para string com tamanho determinado
 */
function toStr(valor, tamanho) {
  valor = "" + valor;
  while (valor.length < tamanho) {
    valor = "0" + valor;
  }
  return valor;
}
	
/*
 * Verifica se caracter ? ponto
 */
function isDot(caracter) {
  // return caracter == '.' || caracter == ',';
  return caracter == ',';
}

/*
 * Verifica se ? sinal ou digito
 */
function isSigOrDig(caracter) {
  return caracter == '+' || caracter == '-' || isDigito(caracter);
}

/*
 * Verifica se ? digito
 */
function isDigito(caracter) {
  return caracter >= '0' && caracter <= '9';
}

/*
 * Verifica campo obrigat?rio
 */
function obrig(obj) {
	if (obj == null || obj.value == null || trim(obj.value).length == 0) {
		return invalide("Campo obrigat?rio", obj);
	}
	return true;
}

/*
 * Invalida objeto, reposicionando o foco
 */
function invalide(msg, obj) {
  check = false;
	alert(msg);
	obj.focus();
  obj.select();
  check = true;
  return false;
}

/*
 * Mostra versao do script
 */
function checkScript() {
  window.alert("Script vers?o 2.4");
}

/*
 * Mostra informa??es do navegador
 */
function showNavigatorInfo() {
  alert(
  	"appCodeName : " + navigator.appCodeName + "\r\n" +
  	"appName : " + navigator.appName + "\r\n" +
  	"appVersion : " + navigator.appVersion + "\r\n" +
  	"language : " + navigator.language + "\r\n" +
  	"platform : " + navigator.platform + "\r\n" +
  	"userAgent : " + navigator.userAgent
  	);
}

/*
 * Mostra informa??es da tela
 */
function showScreenInfo() {
  alert(
  	"availHeight : " + screen.availHeight + "\r\n" +
  	"availWidth : " + screen.availWidth + "\r\n" +
  	"colorDepth : " + screen.colorDepth + "\r\n" +
  	"height : " + screen.height + "\r\n" +
  	"width : " + screen.width + "\r\n" +
  	"pixelDepth : " + screen.pixelDepth
  	);
}

/* c?digo de valida??o de n?meros -- Fernando
function isNumber( valor ) {
return ! isNaN (parseInt(valor));

}
*/

/*
 * Valida data
 */
function valideData(obj) {
  if (! check)
    return;

  if (isEmpty(obj))
    return true;
    
	var psi, psf, dia, mes, ano, dt;
	
	valor=trim(obj.value);
	if (valor.length == 0) {
		return true;
	}
	dt = new Date();
	mes = dt.getMonth()+1;
	ano = dt.getFullYear();
	
	psi = valor.indexOf("/");

	if (psi < 0) {
	  dia = parseInt(valor,10);
	} else {
	  dia = parseInt(valor.substring(0,psi),10);
	  psi = psi+1;
	  psf = valor.indexOf("/", psi);
 
	  if (psf < 0) {
	    mes = parseInt(valor.substring(psi),10);
	  } else { 
	    mes = parseInt(valor.substring(psi,psf),10);

	    psi = psf + 1;
	    ano = parseInt(valor.substring(psi),10);
	  }
	}

	if (ano % 4 == 0) {
		dias[1] = 29;
	} else {
		dias[1] = 28;
	}
	if (mes < 1 || mes > 12) {
	  return invalide("Mes deve ser um valor entre 1 e 12", obj);
	}
	if (dia < 1 || dia > dias[mes-1]) {
	  return invalide("Dia deve ser um valor entre 1 e " + dias[mes-1],obj);
	}

// trecho -- Fernando
	if (isNaN(dia) || isNaN(mes) || isNaN(ano) ) {
	    alert("Insira a data corretamente");
	} else {
	    obj.value = toStr(dia,2) + "/" + toStr(mes,2) + "/" + toStr(ano,4);
	}
	return true;
}

/*
 * Valida campo inteiro
 */
function valideInt(obj) {
  if (! check)
    return true;

	if (isEmpty(obj)) {
		return true;
	}
	valor=trim(obj.value);
	if (! isSigOrDig(valor.charAt(0))) {
		return invalide("N?o ? um numero inteiro v?lido", obj);
	}
	var ps = 1;
	while (ps < valor.length) {
		if (! isDigito(valor.charAt(ps))) {
			return invalide("N?o ? um numero inteiro v?lido", obj);
		}
		ps++;
	}
	return true;
}

/*
 * Valida campo numerico
 */
function valideNumber(obj) {
  if (! check)
    return true;

	if (isEmpty(obj)) {
		return true;
	}
	valor=trim(obj.value);
	if (valor.length == 0) {
		return true;
	}
	var hasDot = false;
	if (isDot(valor.charAt(0))) {
	  hasDot = true;
	} else {
	  if (! isSigOrDig(valor.charAt(0))) {
		  return invalide("N?o ? um numero v?lido", obj);
	  }
	}
	var ps = 1;
	while (ps < valor.length) {
	    if (isDot(valor.charAt(ps))) {
	      if (hasDot) {
	        return invalide("N?o ? um numero v?lido", obj);
	      }
	      hasDot = true;
	    } else {
		  if (! isDigito(valor.charAt(ps))) {
			  return invalide("N?o ? um numero v?lido", obj);
		  }
		}
		ps++;
	}
	return true;
}

/*
 * Valida campo texto
 */
function valideText(obj, upper) {
  if (isEmpty(obj))
    return true;
  if (valideText.arguments.length < 2)
    upper = false;
  if (upper)
    obj.value = obj.value.toUpperCase();
  return true;
}

/*
 * Retorna descricao unica
 */
function getColumnSelect(desc, col) {
	if (! desc)
		return "";
	var separador = " \u00ad ";
	if (col == 0)
		return desc;
	var ps;
	col = col - 1;
	while (col > 0) {
		ps = desc.indexOf(separador);
		if (ps < 0) {
			desc = "";
			break;
		}
		desc = desc.substring(ps + 3);
		col = col - 1;
	}
	ps = desc.indexOf(separador);
	if (ps > 0) {
		desc = desc.substring(0, ps);
	}
	if (!desc || desc == "null")
		return "";
	return desc;
}

/*
 * Mostra sele??o do lookup
 */
function doSelect(chave, descricao) {
	if (opener.lookupCode) {
		opener.lookupCode.value = chave;
		if (opener.lookupCode.slaves) {
			for(var i=0; i < opener.lookupCode.slaves.length; i++) {
				opener.lookupCode.slaves[i].value = "";
			}
		}
	} else {
		alert("lookupCode == null");
	}
	if (opener.lookupDesc) {
		for(var ct=0; ct < opener.lookupDesc.length; ct++) {
			var obj = opener.lookupDesc[ct];
			var col = opener.lookupColumn[ct];
			var dsc = "";
			if (col == 0) {
				dsc = descricao;
			} else {
				dsc = getColumnSelect(descricao, col);
			}
			if (dsc == null || dsc == "null")
				dsc = "";
			// Carrega descritivo
			obj.value = dsc;
		}
		opener.lookupDesc.value = descricao;
	} else {
		alert("lookupDesc == null");
	}
	window.close();
}

/*
 * Fecha opener
 */  
function doClearOpener() {
	if (window.opener && window.opener.lookupWindow) {
		window.opener.lookupWindow = null;
	}
}

/*
 * Efetua lookup de um campo
 */
function doLookup(entityName, inputName, columnNumber, inputTarget) {
	if (window.lookupWindow) {
		window.lookupWindow.close();
	}

	var x = ((screen.width - 600) / 2);
	var y = ((screen.height - 450) / 2);

	var nl = 1;

	// Abre janela de reference
	if (opener && opener.windowNumber)
		window.windowNumber = opener.windowNumber + 1;
	else
		window.windowNumber = 1;

	var windowName = "Lookup"+window.windowNumber;

	// Abre janela do lookup
	window.lookupWindow = window.open("lookup.jsp?entityName="+entityName+"&inputName="+inputName,windowName,"scrollbars=yes,width=600,height=450,left="+x+",top="+y+",status=yes");

	// Campo para o Identificador do lookup
	window.lookupFieldName = inputName;
	window.lookupCode = getObjectByName(inputName);

	// Coluna que retornara o lookup
	window.lookupColumn = new Array();
	window.lookupColumn.push(columnNumber);

	// Lista de objetos para retorno
	window.lookupDesc = new Array();
	window.lookupDesc.push(getObjectByName("lck_"+inputName));
	window.lookupMode = 0; // Lookup tipo lookup

	// Posicao do texto
	var ps = 0;

	// Objeto encontrado
	var obj;

	// Faz separacao dos campos
	while (inputTarget != "") {
		ps = inputTarget.indexOf(",");
		columnNumber++;
		if (ps < 0) {
			obj = getObjectByName("lck_" + inputTarget);
			if (obj) {
				window.lookupDesc.push(obj);
				window.lookupColumn.push(columnNumber);
			}
			break;
		}
		obj = getObjectByName("lck_" + inputTarget.substring(0, ps));
		if (obj) {
			window.lookupDesc.push(obj);	
			window.lookupColumn.push(columnNumber);
		}
		inputTarget = inputTarget.substring(ps+1);
	}
}

/*
 * Efetua reference
 */
function doReference(listname, entityName, inputName, columnNumber, inputTarget) {
	if (window.lookupWindow) {
		window.lookupWindow.close();
	}
	// Centraliza na tela
	var x = ((screen.width - 750) / 2);
	var y = ((screen.height - 400) / 2);
	var nl = 1;

	// Identifica novo nome da janela
	if (opener && opener.windowNumber)
		window.windowNumber = opener.windowNumber + 1;
	else
		window.windowNumber = 1;

	var windowName = "Reference"+window.windowNumber;

	// Campo para o Identificador do lookup
	window.lookupFieldName = inputName;
	window.lookupCode = getObjectByName(inputName);

	// Coluna que retornara o lookup
	window.lookupColumn = new Array();
	window.lookupColumn.push(columnNumber);

	// Lista de objetos para retorno
	window.lookupDesc = new Array();
	var lckName = "lck_"+trim(inputName);
	window.lookupDesc.push(getObjectByName(lckName));
	window.lookupMode = 1; // Lookup tipo referencia
	
	// Posicao do texto
	var ps = 0;

	// Objeto encontrado
	var obj;

	// Faz separacao dos campos
	while (inputTarget != "") {
		ps = inputTarget.indexOf(",");
		columnNumber++;

		if (ps < 0) {
			lckName = "lck_" + trim(inputTarget);
			obj = getObjectByName(lckName);
			if (obj) {
				window.lookupDesc.push(obj);
				window.lookupColumn.push(columnNumber);
			}
			break;
		}
		lckName = "lck_" + trim(inputTarget.substring(0, ps));
		obj = getObjectByName(lckName);
		if (obj) {
			window.lookupDesc.push(obj);	
			window.lookupColumn.push(columnNumber);
		}
		inputTarget = inputTarget.substring(ps+1);
	}
	var listParam = "?action=reference";
	if (window.parameters) {
		listParam = listParam + "&" + window.parameters.join("&");
		window.parameters = null;
	}
	listParam = listParam + "&reference=true&entityName="+escape(entityName)+"&inputName="+escape(inputName);	// Avalia se possui dependencia
	if (window.lookupCode && window.lookupCode.lookupMaster) {
		listParam = listParam + "&lookupMasterName=" + escape(window.lookupCode.lookupMaster.name);
		listParam = listParam + "&lookupMasterValue=" + escape(window.lookupCode.lookupMaster.value);
		window.lookupCode = null;
	}
	window.lookupWindow = window.open(listname + listParam,windowName,"scrollbars=yes,width=750,height=400,left="+x+",top="+y+",status=yes");
}

/*
 * Identifica se o element esta vazio
 */
function isEmpty(obj) {
  if (! obj || !obj.value || obj.value == "")
    return true;
  return false;
}

/**
 * Abre quadro de detalhe
 */
function doOpenDetail(tabela, chave, valor) {
  var w = 760;
  var h = 321;
  var x = 10;
  var y = 247;

  // Identifica novo nome da janela
  if (opener && opener.windowNumber)
    window.windowNumber = opener.windowNumber + 1;
  else
    window.windowNumber = 1;

  var windowName = "Detail"+window.windowNumber;

  if (window.childTitle)
    window.childTitle = null;
  if (window.detail && ! window.detail.closed) {
    window.detail.close();
  }

  window.detail = window.open(tabela.toLowerCase() + "list.jsp?action=detail&detailKey=" + chave + "&detailValue=" + valor, windowName, "scrollbars=yes,width="+w+",height="+(h-50)+",left="+x+",top="+y+",resizable=yes,status=yes");
}

/**
 * Cria dependencia entre lookups, o primeiro representa o
 * lookup mestre e o outro o lookup escravo
 */
function addDependence(objMaster, objSlave) {
  if (! objSlave) {
    alert("Objeto slave n?o pode ser identificado");
    return;
  }
  if (! objMaster) {
    alert("Objeto master n?o pode ser identificado");
    return;
  }
  if (! objMaster.slaves) {
    objMaster.slaves = new Array();
  }
  objMaster.slaves.push(objSlave);
  objSlave.lookupMaster = objMaster;
}
