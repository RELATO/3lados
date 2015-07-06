function alteraQuantidade(form_escolha, tipo){

	//alert(form_escolha.qtde_carrinho.value);
	//alert(tipo);
	//alert(form_escolha);
	
	var qtde
	
	qtde = form_escolha.qtde_carrinho.value;
	//qtde = document.getElementById(id).value
	
	//validando se eh numerico
	if (qtde != (qtde/1) ) {
		qtde = 0;
	}

	if 	(tipo == 0){	  //Aumentando quantidade do carrinho
		qtde++;
	}else if( tipo == 1){ //Diminunido quantidade do carrinho
		qtde--;
	}	
	

	if (qtde > 99){
		qtde--;
	}else if(qtde <= 0){
		qtde = 1;
	}
	form_escolha.qtde_carrinho.value = qtde;
	//document.getElementById(id).value = qtde;
}
function calcularValorTotal(id){
	//alert('entrou')
	//alert('xx ='+document.getElementById("vldtotal"+id));
	//alert('yy ='+document.getElementById("qtde_carrinho"+id));
	//alert('zz ='+document.getElementById("vldunitario"+id));
	//alert(document.getElementById(<%=ip.getIdiproduto()%>).value)
	//alert(<%=produto.getVldvenda()%>)
	document.getElementById("vldtotal"+id).value = (parseFloat(document.getElementById("qtde_carrinho"+id).value)*parseFloat(document.getElementById("vldunitario"+id).value))
	//alert('aquixxx ==='+id);
	//alert('obj =='+document.getElementById("vldtotal"+id));
	//document.getElementById("vldtotal"+id).value = 2222
}

function validaQuantidade_onBlur(campo_qtd){
	if (campo_qtd.value > 99)
		campo_qtd.value = 99
	//alert('here');	
	//alert('calculando - '+document.getElementById("vldtotal"+campo_qtd.id) );
    //alert('qtd - '+document.getElementById(campo_qtd.id).value  );		
    //alert('valor - '+document.getElementById("vldunitario"+campo_qtd.id).value  );
    
	document.getElementById("vldtotal"+campo_qtd.id).value = (parseFloat(document.getElementById(campo_qtd.id).value)*parseFloat(document.getElementById("vldunitario"+campo_qtd.id).value))
	
	
		
}
function alteraQuantidade(form_escolha, tipo, id){

	//alert(form_escolha.qtde_carrinho.value);
	//alert(tipo);
	
	//alert(form_escolha);
	//alert('zoia - '+document.getElementById("qtde_carrinho"+id));
	var qtde
	
	//qtde = form_escolha.qtde_carrinho.value;
	qtde = document.getElementById("qtde_carrinho"+id).value
	
	//validando se eh numerico
	if (qtde != (qtde/1) ) {
		qtde = 0;
	}

	if 	(tipo == 0){	  //Aumentando quantidade do carrinho
		qtde++;
	}else if( tipo == 1){ //Diminunido quantidade do carrinho
		qtde--;
	}	
	

	if (qtde > 99){
		qtde--;
	}else if(qtde <= 0){
		qtde = 1;
	}
	document.getElementById("qtde_carrinho"+id).value = qtde
	calcularValorTotal(id)
}

function alteraQtdeObj(obj,tipo){
	var qtde;
	qtde = obj.value;
	if (qtde != (qtde/1) ) {
		qtde = 0;
	}
	if 	(tipo == 0){	  //Aumentando quantidade do carrinho
		qtde++;
	}else if(tipo == 1){ //Diminunido quantidade do carrinho
		qtde--;
	}	
	if (qtde > 99){
		qtde--;
	}else if(qtde < 0){
		qtde = 0;
	}
	obj.value = qtde
}


function excluirItem(id){
	document.getElementById("qtde_carrinho"+id).value = 0;
	document.getElementById("vldtotal"+id).value = 0;
	document.getElementById(id).style.visibility = "hidden";
}

function excluirItemForm(id,form){
	
	alert('id='+id);
	
	document.getElementById("qtde_carrinho"+id).value = 0;
	document.getElementById("vldtotal"+id).value = 0;
	form.send_to_url.value="carrinho.jsp";
	form.submit();
}

function itemInserido(){
	alert("Produto Inserido no Carrinho!"+window.location); 
	//window.opener.location.reload();
	
	//alert("lalal!");
	
	
}