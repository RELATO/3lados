var winHE = window.top.axs_system;

var ALTERA = 1;
var INCLUI = 2;

function doOpenHE(action){
	var url = "he/he.jsp";
	if ( winHE == null ){
		alert("nulll");
		winHE = window.open(url, "teste", 'fullscreen=no, status=yes, resizable=yes, scrollbars=yes');
	}else{
		if ( action == ALTERA ){
			winHE.focusHE();
			winHE.openHE();
		}else{
			winHE.focusHE();
			winHE.insertHE();
		}
	}
}
