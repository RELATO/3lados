function iniciaPagina() {

	//alert("iniciando");
  	if ( document.forms[0].SYS_MSG.value != "" ) {
    	var msg = document.forms[0].SYS_MSG.value;
    	document.forms[0].SYS_MSG.value="";
    	alert(msg);
  	}
}

function doSubmit(opcao) {
   	
   	//alert("vou submeter a acao = " + opcao);
    if (opcao == "E") {
        var ok = confirm("Confirma a exclusão desse registro?");
        if (ok == true) {
            document.forms[0].SYS_ACTION.value = opcao;
            document.forms[0].submit();
        }
    } else {
        if (validaForm(document.forms[0])) {
            document.forms[0].SYS_ACTION.value = opcao;
	    	//alert('vou submeter');
            document.forms[0].submit();
        }
    }
}

function caixaAlta(obj) {
  var aux = obj.value;
  obj.value = aux.toUpperCase();
  //alert("o valor é: " + obj.value);
}

function abrePopup(theURL,winName,features) {
  //alert('vai abrir');
  window.open(theURL,winName,features);
}