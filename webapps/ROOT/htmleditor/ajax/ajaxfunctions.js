var this_page = window;
this_page.frameXXX;
this_page.state;

var ALTERA = 1;
var INCLUI = 2;

this_page.intermediateGetData = function(){
	return frameXXX.getDataIframe();
}

this_page.intermediateSetData = function(value){
	frameXXX.setDataIframe(value);
}

function getLocationOpener(){
	return getValueHE("idHE");
}

function getOpenerHE(){
    var opener;
    if(window.opener)
            opener = window.opener;
    else {
             opener = window.dialogArguments;
    }
	return opener;
}

function reloadPage(){
	var opener = getOpenerHE();
	opener.reloadPage();
}

function openHE(){
	var opener = getOpenerHE();
	var id = opener.getIdconteudoHE();
	var act = opener.getAction();
	if ( act == INCLUI ){
		insertHE();
	}else{
		setValueHE("idHE", id);
		submeteXmlHE(COMMAND_FIND);
	}
}

function insertHE(){
	setValueHE("idHE", "-1");
	submeteXmlHE(COMMAND_FIND);
}

function buscaHE(){
	var busca = open_zoom("buscaconteudo.jsp", 800, 600);
}

this_page.zoom_page_return = function(id) {
	setValueHE("idHE", id);
	submeteXmlHE(COMMAND_FIND);	
}

function open_zoom(url, w, h) {
	var width = w;
	if(width == "")
		width = 800;

	var height = h;
	if(height == "")
		height = 600;

	var x = 10;
	var y = 10;

	var janela = null;
	if(window.showModalDialog) {
		janela = window.showModalDialog(url, window, 'status=no;resizable=yes;dialogWidth='
			+width+'px;dialogHeight='+height+'px;dialogLeft='+x+'px;dialogTop='+y+'px');
	}else
		janela = window.open(url, "_blank", 'toolbar=no,menubar=no,status=no,resizable=yes,modal=1,width='
			+width+',height='+height+',left='+x+',top='+y);
	return janela;
}


function focusHE(){
	var obj = findComponent("idHE");
	if ( obj != null )
		obj.focus();
}

function fechaHE(){
	var opener = getOpenerHE();
	opener.zoom_return();
}

function getValueHE(id){
	return document.getElementById(id).value;
}

function findComponent(id){
	return document.getElementById(id);
}

function setValueHE(id, value){
	document.getElementById(id).value = value;
}

function getConteudoValue(){
	return escape(intermediateGetData());
}

function setConteudoValue(value){
	intermediateSetData(unescape(value));
}

var COMMAND_ATUALIZA = 1;
var COMMAND_DELETE = 2;
var COMMAND_FIND = 3;

function on_commandHE(cmd){
	submeteXmlHE(cmd);
}

function submeteXmlHE(cmd) {
	this_page.state = cmd;
	
	processBeforePost();

	var xml = create_request(cmd);
	xml.documentElement.setAttribute("id", getValueHE("idHE"));
	xml.documentElement.setAttribute("titulo", getValueHE("tituloHE"));
	xml.documentElement.setAttribute("tipo", getValueHE("tipoHE"));
	xml.documentElement.setAttribute("ativo", getValueHE("ativoHE"));
	var content = xml.createTextNode(getConteudoValue());
	xml.documentElement.appendChild(content);	
	
	//alert("submeteXmlHE aki: " + xml.xml);
	var res = xmlQuery("/xmlServlet", xml);
	//alert("submeteXmlHE aki 1: " + res.xml);
	res = res.documentElement;
	foreach_node(res, function(node) {
		if ( node.nodeName == "msg")
			process_msg(node);
		else{
			get_actions(node);
			updateNode(node);
			process_actions();
		}
	});
	
	processAfterPost();
	
}

function get_actions(node){
	var state = node.getAttribute("state");
	this_page.state = state;
}

function process_actions(node){
	if ( this_page.state != null )
		if( this_page.state == COMMAND_DELETE )
			setValueHE("idHE", "-1");
}

function process_msg(node){
	if ( this_page.state == COMMAND_DELETE  )
		showAlert(node.getAttribute("msg1"));
	else if ( this_page.state == COMMAND_ATUALIZA  )
		showAlert(node.getAttribute("msg"));
}

function showAlert(msg){
	alert(msg);
}

function updateNode(node){
	if("-99" != node.getAttribute("id")){
		setValueHE("idHE", node.getAttribute("id"));
	}
	setValueHE("tituloHE", node.getAttribute("titulo"));
	setValueHE("tipoHE", node.getAttribute("tipo"));
	setValueHE("ativoHE", node.getAttribute("ativo"));
	if ( checkState() ){
		setConteudoValue(node.getAttribute("conteudo"));
	}
}

function checkState(){
	if ( this_page.state == COMMAND_ATUALIZA ){
		return false;
	}else
		return true;
}

function processBeforePost(){

}

function processAfterPost(){
	if ( this_page.state != COMMAND_FIND ){
		//reloadPage();
	}
	
}

////////////////////////////////////////////////////////////////////////
/**
 * Função para salvar conteúdo editado por gerenciador de conteúdos na página (he.jsp)
 */
function salvaConteudo(cmd) {
	this_page.state = cmd;

	var xml = create_request(cmd);
	xml.documentElement.setAttribute("id", getValueHE("idHE"));
	xml.documentElement.setAttribute("titulo", getValueHE("tituloHE"));
	xml.documentElement.setAttribute("tipo", getValueHE("tipoHE"));
	xml.documentElement.setAttribute("ativo", getValueHE("ativoHE"));
	xml.documentElement.setAttribute("keywords", getValueHE("keywords"));
	xml.documentElement.setAttribute("descricao", getValueHE("descricao"));
	var content = xml.createTextNode(getNewConteudoValue());
	xml.documentElement.appendChild(content);	
	
	//alert("salvaConteudo aki: " + xml.xml);
	var res = xmlQuery("/xmlServlet", xml);
	//alert("salvaConteudo aki 1: " + res.xml);
	res = res.documentElement;
	foreach_node(res, function(node) {
		if ( node.nodeName == "msg")
			process_msg(node);
		else{
			get_actions(node);
			updateNode(node);
			process_actions();
		}
	});
}
/**
 * Função utilizada para carregar conteúdo e campos para editor de conteúdos. (he.jsp) 
 */
function carregaConteudo(cmd, id) {
	this_page.state = cmd;

	var xml = create_request(cmd);
	xml.documentElement.setAttribute("id", id);
	var content = xml.createTextNode(getNewConteudoValue());
	xml.documentElement.appendChild(content);
	
	//alert("carregaConteudo aki: " + xml.xml);
	var res = xmlQuery("/xmlServlet", xml);
	//alert("carregaConteudo xxx aki 1: " + res.xml);
	res = res.documentElement;
	var conteudonew = '';
	foreach_node(res, function(node) {
		if ( node.nodeName == "msg")
			process_msg(node);
		else{
			conteudonew = unescape(node.getAttribute("conteudo"));
			setValueHE("idHE", id);
			setValueHE("tituloHE", node.getAttribute("titulo"));
			setValueHE("tipoHE", node.getAttribute("tipo"));
			setValueHE("ativoHE", node.getAttribute("ativo"));
			setValueHE("keywords", node.getAttribute("keywords"));
			setValueHE("descricao", node.getAttribute("descricao"));
		}
	});
	return conteudonew;
}

function getNewConteudoValue(){
	return escape(document.getElementById("htmleditor").value);
}