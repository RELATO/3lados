var this_page = window;
this_page.frameXXX;
this_page.state;
var url_xml = "/xmlServlet";

var ALTERA = 1;
var INCLUI = 2;
var DUPLICA = 3;

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

function reloadIFrame(){
	var opener = getOpenerHE();
	if ( opener != null ){
		if ( opener.pageReload )
			opener.pageReload();
		else
			alert("Página desconectada!! Por favor, recarregue o editor!");	
	}else
		alert("Página desconectada!! Por favor, recarregue o editor!");
}

function openHE(){
	var opener = getOpenerHE();
	var id = opener.getIdconteudoHE();
	var act = opener.getAction();
    
    var lang = opener.getlinguaHE();

	if ( act == INCLUI ){
		insertHE();
	}else if ( act == DUPLICA ){
		duplicaHE();
	}else{
		setValueHE("idHE", id);
		
		//RAFAEL LINGUA
		setValueHE("linguaHE", lang);
		
		submeteXmlHE(COMMAND_FIND);
	}
}

function insertHE(){
	setValueHE("idHE", "-1");
	submeteXmlHE(COMMAND_FIND);
}

window.getTemplate = function(idimodelo){
	getTemplateHE(COMMAND_TEMPLATE, idimodelo);
}

function duplicaHE(){
	var opener = getOpenerHE();
	var id = opener.getIdconteudoHE();
	
	setValueHE("idHE", id);
	submeteXmlHE(COMMAND_FIND);
	
	setValueHE("tituloHE", "");
	setValueHE("tipoHE", "C");
	setValueHE("replicaHE", "N");
	setValueHE("ativoHE", "S");
	setValueHE("idHE", "-1");
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
	if ( opener != null )
		opener.zoom_return();
	else
		alert("P?gina desconectada!! Por favor, recarregue o editor!");	
}

function getValueHE(id){
	var obj = document.getElementById(id);
	if ( obj != null )
		return obj.value;
	return "";
}

function findComponent(id){
	return document.getElementById(id);
}

function setValueHE(id, value){
	var obj = document.getElementById(id);
	if ( obj != null && value != null)
		obj.value = value;
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
var COMMAND_TEMPLATE = 4;

function on_commandHE(cmd){
	submeteXmlHE(cmd);
}

function getTemplateHE(cmd, idi){
	this_page.state = cmd;
	
	var xml = create_request(cmd);
	xml.documentElement.setAttribute("id", idi);

	var res = xmlQuery(url_xml, xml).documentElement;

	foreach_node(res, function(node) {
			setConteudoValue(node.getAttribute("conteudo"));
	});
}

function submeteXmlHE(cmd) {
	this_page.state = cmd;
	
	processBeforePost();

	var xml = create_request(cmd);
	xml.documentElement.setAttribute("id", getValueHE("idHE"));
	xml.documentElement.setAttribute("titulo", getValueHE("tituloHE"));
	xml.documentElement.setAttribute("tipo", getValueHE("tipoHE"));
	xml.documentElement.setAttribute("replica", getValueHE("replicaHE"));
	xml.documentElement.setAttribute("ativo", getValueHE("ativoHE"));
	//RAFAEL LINGUA
	xml.documentElement.setAttribute("lingua", getValueHE("linguaHE"));
	var content = xml.createTextNode(getConteudoValue());
	xml.documentElement.appendChild(content);	
	var res = xmlQuery(url_xml, xml).documentElement;
	foreach_node(res, function(node) {
		if ( node.nodeName == "msg"){
			process_msg(node);
		}else{
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
	if ( this_page.state != null ){
		if( this_page.state == COMMAND_DELETE ){
			setValueHE("idHE", "-1");
		}
	}
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
	setValueHE("idHE", node.getAttribute("id"));
	setValueHE("tituloHE", node.getAttribute("titulo"));
	setValueHE("tipoHE", node.getAttribute("tipo"));
	setValueHE("replicaHE", node.getAttribute("replica"));
	setValueHE("ativoHE", node.getAttribute("ativo"));
	
	//RAFAEL LINGUA
	setValueHE("linguaHE", node.getAttribute("lingua"));
	
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
		reloadIFrame();
	}
	
}

function deletaConteudo(idconteudo){
	this_page.state = COMMAND_DELETE;
	var xml = create_request(COMMAND_DELETE);
	xml.documentElement.setAttribute("id", idconteudo);
	var content = xml.createTextNode('Deletando conteudo');
	xml.documentElement.appendChild(content);
	//alert("Ajax delete == "+xml.xml);
	var res = xmlQuery(url_xml, xml);
	//alert("Return Ajax delete == "+res.xml);
	res = res.documentElement;
	foreach_node(res, function(node) {
		if ( node.nodeName == "msg"){
			process_msg(node);
		}
	});
}
////////////////////////////////////////////////////////////////////////