<%@page import="br.com.relato.EntryPoint"%>

<html>

<head>
<script>

var editor = null;
var action = null;

var ALTERA = 1;
var INCLUI = 2;
var DUPLICA = 3;

function doOpenHE(a){
	action = a;
	var url = "/he/he.jsp";
	if ( editor == null ){
		editor = window.open(url, "_black", 'fullscreen=no, status=yes, resizable=yes, scrollbars=yes');
	}else{
		editor.focusHE();
		if ( action == ALTERA )
			editor.openHE();
		else if ( action == DUPLICA )
			editor.duplicaHE();
		else
			editor.insertHE();
	}
}

window.getLocation = function(){
	if ( editor != null )
		return editor.getLocationOpener();
	else
		return null;
}

window.getIdconteudoHE = function() {
	return document.getElementById("id").value;
}

window.getlinguaHE = function() {
	return document.getElementById("linguaHE").value;
}

window.getAction = function() {
	return action;
}

window.zoom_return = function() {
	editor = null;
}

window.pageReload = function() {
	window.top.frames.body.reloadContent();
}

window.closeEditor = function() {
	if ( editor != null )
		editor.close();
}

function hasEditor() {
	if ( editor != null )
		return true;
	return false;
}

function setFileName(campo,nome){
	alert('rafa');
}

</script>
</head>


<body onUnload="closeEditor()">

<input type="hidden" name="linguaHE" id="linguaHE" value="">
<input type="hidden" name="idHE" id="idHE" value="">
<input type="hidden" value="" id="id" name="id">
</body>


</html>
