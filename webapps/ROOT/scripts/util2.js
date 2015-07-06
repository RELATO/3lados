/*
 PCLtda Functions
*/

var isIE = (navigator.appName.indexOf('Internet Explorer') != -1);

//Formatting functions


function limpa_string(S) { // Deixa so os digitos no numero
	var Digitos = "0123456789";
	var temp = "";
	var digito = "";
	for (var i=0; i<S.length; i++) {
		digito = S.charAt(i);
		if (Digitos.indexOf(digito)>=0) {
			temp=temp+digito
		}
	}
	return temp
}

function validarCampoNumerico(campo) {
	nome=campo.name
	num = limpa_string(campo.value);
	campo.value = num;
}

function formatarNumero(fld, e) {
var sep = 0;
var key = '';
var i = j = 0;
var milSep = ".";
var decSep = ",";

var len = len2 = 0;
var strCheck = '0123456789';
var aux = aux2 = '';
var whichCode = (window.Event) ? e.which : e.keyCode;
if ((whichCode == 13) || (whichCode == 0) || (whichCode == 8)) return true;
key = String.fromCharCode(whichCode);

if (strCheck.indexOf(key) == -1) return false;
len = fld.value.length;
for(i = 0; i < len; i++)
if ((fld.value.charAt(i) != '0') && (fld.value.charAt(i) != decSep)) break;
aux = '';
for(; i < len; i++)
if (strCheck.indexOf(fld.value.charAt(i))!=-1) aux += fld.value.charAt(i);
aux += key;
len = aux.length;
if (len == 0) fld.value = '';
if (len == 1) fld.value = '0'+ decSep + '0' + aux;
if (len == 2) fld.value = '0'+ decSep + aux;
if (len > 2) {
aux2 = '';
for (j = 0, i = len - 3; i >= 0; i--) {
if (j == 3) {
aux2 += milSep;
j = 0;
}
aux2 += aux.charAt(i);
j++;
}
fld.value = '';
len2 = aux2.length;
for (i = len2 - 1; i >= 0; i--)
fld.value += aux2.charAt(i);
fld.value += decSep + aux.substr(len - 2, len);
}
return false;
}

function formatarNumero_OLD(OBJ){   // coloca ponto de milhar e virgula para decimal
	var decimal,inteiro;
	var i,count;
	STR = new String(OBJ.value);
	STR = tirarZerosEsquerda(STR);
	inteiro='';
	if (STR.length == 1){
		inteiro  = '0';
		decimal = '0' + STR;
	} else { 
		if (STR.length == 2){
			inteiro  = '0';
			decimal = STR;
		} else {
			decimal = STR.substring(STR.length-2,STR.length);
			i=3;
			count=0;
			while (i<=STR.length){
				if (count==3) {
					inteiro = '.' + inteiro;
					count = 0;
				}
				inteiro = STR.charAt(STR.length-i) + inteiro;
				count++;
				i++;
			}
		}
	}
      
	if (inteiro == '') {
		inteiro = '0';
	}
	if (decimal == '') {
		decimal = '00';
	}
	OBJ.value = inteiro+','+decimal; 
}


//Date: DDMMYYYY
function formatDate(obj) {
	var vDate = getFormattedDate(obj.value);
	if (isValidDate(vDate)) {
		obj.value = vDate;
	}
}
	
//Date: MMYYYY
function getFormattedDateMY(strValue) {
	if (strValue != '') {
		if (strValue.indexOf('/') == -1) {
			var month = strValue.substring(0, 2);
			var year = strValue.substring(2, 6);
		} else {
			var month = strValue.substring(0, strValue.indexOf('/'));
			var year = strValue.substring(strValue.indexOf('/') + 1, 7);
		}
		if (month.length == 1) month = '0' + month;
		if (year.length == 1) year = '0' + year;
		if (year.length != 2 && year.length != 4) year = year.substring(year.length - 2);
		if (year.length == 2) {
			year = (('20' + year) * 1 > (new Date().getYear() + (isIE ? 30 : 1930)) ? '19' + year : '20' + year);
		}
		var fValue = month + '/' + year;
		strValue = fValue.substring(0, 7);
	}
	return strValue;
}

function formatDateMY(obj) {
	var vDate = getFormattedDateMY(obj.value);
	if (isValidDateMY(vDate)) {
		obj.value = vDate;
	}
}

//Hour: HHMM
function getFormattedTime(strValue) {
	if (strValue != '') {
		if (strValue.indexOf(':') == -1) {
			var hour = strValue.substring(0, strValue.length - 2);
			var minute = strValue.substring(strValue.length - 2, strValue.length);
		} else {
			var hour = strValue.substring(0, strValue.indexOf(':'));
			var minute = strValue.substring(strValue.indexOf(':') + 1, strValue.indexOf(':') + 3);
		}
		hour = '00' + hour;
		if (hour < 99) {
			hour = hour.substring(hour.length - 2);
		} else {
			hour = hour * 1;
		}
		minute = '00' + minute;
		minute = minute.substring(minute.length - 2);
		var fValue = hour + ':' + minute;
		strValue = fValue;
	}
	return strValue;
}

function formatTime(obj) {
	var vTime = getFormattedTime(obj.value);
	if (isValidTime(vTime)) {
		obj.value = vTime;
	}
}

//Validation functions
function isNumeric(strValue) {
	var blnValid = true;
	for (i = 0; i < strValue.length; i++) {
		var strV = strValue.substring(i, i+1);
		if (!(strV >= 0 && strV <= 9)) blnValid = false;
	}
	return blnValid;
}

//Date: DDMMYYYY
function isValidDate(strValue) {
	var oDate = getFormattedDate(strValue);
	var day = oDate.substring(0, oDate.indexOf('/'));
	var month = oDate.substring(oDate.indexOf('/') + 1, oDate.lastIndexOf('/'));
	var year = oDate.substring(oDate.lastIndexOf('/') + 1, 10);
	var testDate = new Date(month + '/' + day + '/' + year);
	cDay = testDate.getDate();
	cMonth = testDate.getMonth() + 1;
	cYear = testDate.getYear();
	var cDate = cDay + '/' + cMonth + '/' + cYear;
	cDate = getFormattedDate(cDate);
	return oDate == cDate;
}

function checkIsValidDate(obj) {
	var isValid = isValidDate(obj.value);
	if (!isValid && obj.value != '') {
		alert('Data (DD/MM/AAAA) inv?lida');
		obj.focus();
		obj.select();
	}
	return isValid;
}

//Date: MMYYYY
function isValidDateMY(strValue) {
	var oDate = getFormattedDateMY(strValue);
	var month = oDate.substring(0, oDate.indexOf('/'));
	var year = oDate.substring(oDate.indexOf('/') + 1, 7);
	var testDate = new Date(month + '/01/' + year);
	cDay = testDate.getDate();
	cMonth = testDate.getMonth() + 1;
	cYear = testDate.getYear();
	var cDate = cMonth + '/' + cYear;
	cDate = getFormattedDateMY(cDate);
	return oDate == cDate;
}

function checkIsValidDateMY(obj) {
	var isValid = isValidDateMY(obj.value);
	if (!isValid && obj.value != '') {
		alert('Data (MM/AAAA) inv?lida');
		obj.focus();
		obj.select();
	}
	return isValid;
}

//Time: HHMM
function isValidTime(strValue) {
	var oTime = getFormattedTime(strValue);
	var hour = oTime.substring(0, oTime.indexOf(':'));
	var minute = oTime.substring(oTime.indexOf(':') + 1, oTime.indexOf(':') + 3);
	var blnValid = true;
	if (!isNumeric(hour)) blnValid = false;
	if (!isNumeric(minute)) blnValid = false;
	if (minute > 59) blnValid = false;
	return blnValid;
}

function checkIsValidTime(obj) {
	var isValid = isValidTime(obj.value);
	if (!isValid && obj.value != '') {
		alert('Hora Invalida');
		obj.focus();
		
		obj.value="";
	}
	return isValid;
}

//Generic functions
//URV Convert popup
function openURVConvert(valor, enderecoCampoMoeda, enderecoCampoDataUrv) {
	var w = window.open('urv_convert.php?valor=' + valor +
									   '&enderecoCampoMoeda=' + enderecoCampoMoeda + 
									   '&enderecoCampoDataUrv=' + enderecoCampoDataUrv,
						'urv_convert',
						'toolbar=no,location=no,directories=no,status=no,scrollbars=no,resizable=no,menubar=no,width=230,height=200');
}

function onlynum() {
	if ((event.keyCode == 13) || (event.keyCode == 0) || (event.keyCode == 8)) {
		return true;
	}
	if ((event.keyCode < 48)||(event.keyCode > 57)) {
		event.keyCode = 0;
		return false;
	}
}

function checkDecimal(campo) {
	if (campo.value.length == 2)
		campo.value = '0,' + campo.value;
	if (campo.value.length == 1)
		campo.value = '0,' + campo.value + '0';
}

function checkHexagesimal(campo) {
	if (campo.value.length == 2)
		campo.value = '0:' + campo.value;
	if (campo.value.length == 1)
		campo.value = '0:' + campo.value + '0';
}

function Formatador(campo,tammax,teclapres) {
	var tecla = teclapres.keyCode;
	vr = campo.value;
	vr = vr.replace( "/", "" );
	vr = vr.replace( "/", "" );
	vr = vr.replace( ",", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	tam = vr.length;
	if (tam < tammax && tecla != 8) { 
		tam = vr.length + 1 ; 
	}
	if (tecla == 8 ) {
		tam = tam - 1 ; 
	}
	if ( tecla == 8 || tecla >= 48 && tecla <= 57 || tecla >= 96 && tecla <= 105 ) {
		if ( tam <= 2 ){
			campo.value = vr ; 
		}
		if ( (tam > 2) && (tam <= 5) ){
			campo.value = vr.substr( 0, tam - 2 ) + ',' + vr.substr( tam - 2, tam ) ; 
		}
		if ( (tam >= 6) && (tam <= 8) ){
			campo.value = vr.substr( 0, tam - 5 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ; 
		}
		if ( (tam >= 9) && (tam <= 11) ){
			campo.value = vr.substr( 0, tam - 8 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ; 
		}
		if ( (tam >= 12) && (tam <= 14) ){
			campo.value = vr.substr( 0, tam - 11 ) + '.' + vr.substr( tam - 11, 3 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ;
		}
		if ( (tam >= 15) && (tam <= 17) ){
			campo.value = vr.substr( 0, tam - 14 ) + '.' + vr.substr( tam - 14, 3 ) + '.' + vr.substr( tam - 11, 3 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ;
		}
	}
}

var isNav4, isNav, isIE;
if (parseInt(navigator.appVersion.charAt(0)) >= 4) {
  isNav = (navigator.appName=="Netscape") ? true : false;
  isIE = (navigator.appName.indexOf("Microsoft") != -1) ? true : false;
}
if (navigator.appName=="Netscape") {
	isNav4 = (parseInt(navigator.appVersion.charAt(0))==4);
}

/*
//funcao de correcao do IE 5.5
function onClickHandler(e){
	var el = null;
	var flag = true;
	el = (isNav) ? e.target.parentNode : event.srcElement;
	while (flag && el){
		if ((el.tagName.toUpperCase()=="A")||(el.tagName.toUpperCase()=="AREA")){
			flag = false;
			if (el.protocol.toUpperCase() == "JAVASCRIPT:"){
				eval(unescape(el.href));
			}
			else return true;
			return false;
		}
		else {
			el = (isNav) ? el.parentNode : el.parentElement;
		}
	}
}
document.onclick = onClickHandler;
*/

function RTrim(s) {
    return s.replace (/\s+$/,'');
}

function LTrim(s) {
    return s.replace (/^\s+/,'');
}

function Trim(s) {
    return s.replace (/\s+/g,'');
}

function MTrim(s) {
    return s.replace (/\B\s+/g,' ');
}

//checks for Enter key, then if true, initiates page processing
//put the following into the HTML <INPUT> Tag:	ONKEYDOWN="Javascript:CheckENTER(formObj, buttonName);"

function CheckENTER(formObj, buttonName)
{
	var key = event.keyCode;
	if (key == 13)		
		processPage(formObj, buttonName);
}


// Functions added to facilitate data field validation...



function nullstring(item) {
  entry = item
  if (entry == "") return true;
return false;
}

function blanks(item) {
  entry=item
  for (var i=0; i<entry.length; i++) {
   if (entry.charAt(i) != " ") return false;	
   }
	return true;
}

function checkEmpty(item) {
  entry = item
  if (nullstring(entry) || blanks(entry)) return true;
    return false;
}

function checkNumeric(item){
  var digits="0123456789"
  entry=item
  var temp
  for (var i=0; i < entry.length; i++) {
    temp = entry.substring(i,i+1)
    if (digits.indexOf(temp) == -1) {
      return false;
    } 
  }
return true;
}
		
function checkAlpha(item){
  var digits="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  entry=item
  var temp
  for (var i=0; i < entry.length; i++) {
    temp = entry.substring(i,i+1)
    if (digits.indexOf(temp) == -1) {
      return false;
    } 
  }
return true;
}

function abre2(qual,nome) {
  window.open (qual,nome, 'type=fullWindow,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no,width=300,height=300,top=60,left=110,maximized');
}

// Format money Fields (functions: formata, arredonda, range)

function formata(valor) {
    var str="";
    var j=0;
    range(valor);
    if(valor.value=="") {
        valor.value="0"
    }
    str = valor.value + ","
    arredonda(valor)
}

function arredonda(valor) {
    var j=0, str="";
    for(var i=0; (i<=valor.value.length-1)&&(valor.value.charAt(i)!=',');i++) {
        str=str+valor.value.charAt(i);
        j++
    }
    if(valor.value.charAt(0)==',')
        str=str+"0"
    str=str + ",";
    j++
    if(valor.value.charAt(j)=='')
        str=str+0
    else
        str=str+valor.value.charAt(j)
    if(valor.value.charAt(j+1)=='')
        str=str+0
    else
        str=str+valor.value.charAt(j+1)
    valor.value=str;
    str=""
    str=str+valor.value;
    valor.value=str
}

function range(campo) {
    for(var i=0; i<=(eval(campo.value.length)-1); i++)
        if(campo.value.charAt(i)!='0' && campo.value.charAt(i)!='1' && campo.value.charAt(i)!='2'
           && campo.value.charAt(i)!='3' && campo.value.charAt(i)!='4' && campo.value.charAt(i)!='5'
           && campo.value.charAt(i)!='6' && campo.value.charAt(i)!='7' && campo.value.charAt(i)!='8'
           && campo.value.charAt(i)!='9' && campo.value.charAt(i)!=',')
        {
            alert("Valor inv?lido. Favor redigitar.");
            campo.value=0
        }
}

// INICIO // funcoes para formartacao de valor 
// <INPUT name="NomeDoCampo" maxlength="17" SIZE="17" onKeyDown="formatarOnKeyDown(this)" onKeyUp="formatarOnKeyUp(this)" onSelect="refreshCampo(this)"  Onkeypress="onlynum()">
function tirarZerosEsquerda(STR){

  var sAux='';
  var i=0;
  STR=new String(STR);
  
  while (i < STR.length ){
    if ((STR.charAt(i)!='.') && (STR.charAt(i)!=',') && (STR.charAt(i)!=':')){
	  sAux += STR.charAt(i);
    }
	i++
  }
  
  
  STR = new String(sAux);
  sAux = '';
  i=0;
  
  while (i < STR.length ){
    if (STR.charAt(i) != '0'){
      sAux = STR.substring(i,STR.length)
	  i = STR.length;
	}
    i++;
  }
  
  return  sAux;
}

function formatarOnKeyUp(OBJ){
  var decimal,inteiro;
  var i,count;
  STR = new String(OBJ.value);
  STR = tirarZerosEsquerda(STR);
  inteiro='';
  if (isIE) {
		if (STR.length == 1){
			  inteiro  = '0';
			  decimal = '0' + STR;
			}
			else { 
			  if (STR.length == 2){
				  inteiro  = '0';
				  decimal = STR;
				}
				else{
				  decimal = STR.substring(STR.length-2,STR.length);
				  i=3;
				  count=0;
				  while (i<=STR.length){
			 		if (count==3) {
					  inteiro = '.' + inteiro;
					  count = 0;
					}
				    inteiro = STR.charAt(STR.length-i) + inteiro;
					count++;
					i++;
				  }
				}
			}
    
  
		if (inteiro == '') {
		  inteiro = '0';
		}
  
		if (decimal == '') {
		  decimal = '00';
		}
		OBJ.value = inteiro+','+decimal;
  }
}

function formatarOnKeyDown(OBJ){
  var decimal,inteiro;
  var i,count;
  STR = new String(OBJ.value);
  
  inteiro='';
  
  if (isIE) {	  
	if (OBJ.maxLength > STR.length){     
	  STR = tirarZerosEsquerda(STR); //ESTA FUNCAO TIRA TAMBEM PONTO E VIRGULA
	  
	  if ( ((event.keyCode > 47) && (event.keyCode < 59)) || ((event.keyCode > 95) && (event.keyCode < 106))   ){
	      
			if (STR.length == 0){
			  inteiro  = '0';
			  decimal = '0' + STR;
			}
			else { 
			  if (STR.length == 1){
			    inteiro  = '0';
			    decimal = STR;
			  }
			  else{
			    decimal = STR.substring(STR.length-1,STR.length);
			    i=2;
			    count=0;
			    while (i<=STR.length){
			 		if (count==3) {
			  	  inteiro = '.' + inteiro;
			  	  count = 0;
			  	}
			      inteiro = STR.charAt(STR.length-i) + inteiro;
			  	count++;
			  	i++;
			    }
			  }
			}   
	 
	  }
	  else{ 
	    if (event.keyCode == 8){

	      if (STR.length == 0){
			  inteiro  = '0';
			  decimal = '000';
			}
			else { 
			  if (STR.length == 1){
			    inteiro  = '0';
			    decimal = '00' + STR;
			  }
			  else { 
			    if (STR.length == 2){
		          inteiro  = '0';
			      decimal = '0' + STR;
			     }
		         else{
	 			   decimal = STR.substring(STR.length-3,STR.length);
				   i=4;
				   count=0;
				   while (i<=STR.length){
			 		 if (count==3) {
					   inteiro = '.' + inteiro;
					   count = 0;
					  }
				      inteiro = STR.charAt(STR.length-i) + inteiro;
					  count++;
					  i++;
				    }
			     }
			  } 
	      }
	    }
	    else {
	      
	      if (STR.length == 1){
		 	  inteiro  = '0';
		      decimal = '0' + STR;
			}
			else { 
			  if (STR.length == 2){
				  inteiro  = '0';
				  decimal = STR;
				}
				else{
				  decimal = STR.substring(STR.length-2,STR.length);
				  i=3;
				  count=0;
				  while (i<=STR.length){
			 		if (count==3) {
					  inteiro = '.' + inteiro;
					  count = 0;
					}
				    inteiro = STR.charAt(STR.length-i) + inteiro;
					count++;
					i++;
				  }
				}
			}        
	    }
	  }
	  
	  if (inteiro == '') {
	    inteiro = '0';
	  }
  
	  if (decimal == '') {
	    decimal = '00';
	  } 
	  OBJ.value = inteiro+','+decimal;
	}
  }
}

function formatarHoraOnKeyUp(OBJ){
	var decimal,inteiro;
	var i,count;
	STR = new String(OBJ.value);
	STR = tirarZerosEsquerda(STR);
	inteiro='';
	if(isIE) {
		if (STR.length == 1){
			inteiro  = '0';
			decimal = '0' + STR;
		} else { 
			if (STR.length == 2){
				inteiro  = '0';
				decimal = STR;
			} else {
				decimal = STR.substring(STR.length-2,STR.length);
				i=3;
				count=0;
				while (i<=STR.length){
//					if (count==3) {
//						inteiro = '.' + inteiro;
//						count = 0;
//					}
					inteiro = STR.charAt(STR.length-i) + inteiro;
					count++;
					i++;
				}
			}
		}
		if (inteiro == '') {
			inteiro = '0';
		}
	  
		if (decimal == '') {
			decimal = '00';
		}
		OBJ.value = inteiro+':'+decimal;
	}
}


function formatarHoraOnKeyDown(OBJ){
	var decimal,inteiro;
	var i,count;
	STR = new String(OBJ.value);
	inteiro='';
	if(isIE) {	  
		if(OBJ.maxLength > STR.length){     
			STR = tirarZerosEsquerda(STR); //ESTA FUNCAO TIRA TAMBEM PONTO E VIRGULA
			if ( ((event.keyCode > 47) && 
					(event.keyCode < 59)) || 
					((event.keyCode > 95) && 
					(event.keyCode < 106))   ){
	      
				if (STR.length == 0){
					inteiro  = '0';
					decimal = '0' + STR;
				} else { 
					if (STR.length == 1){
						inteiro  = '0';
						decimal = STR;
					} else {
						decimal = STR.substring(STR.length-1,STR.length);
						i=2;
						count=0;
						while (i<=STR.length){
//							if (count==3) {
//								inteiro = '.' + inteiro;
//								count = 0;
//							}
							inteiro = STR.charAt(STR.length-i) + inteiro;
							count++;
							i++;
						}
					}
				}   
			} else {
				if (event.keyCode == 8){
					if (STR.length == 0){
						inteiro  = '0';
						decimal = '000';
					} else { 
						if (STR.length == 1){
							inteiro  = '0';
							decimal = '00' + STR;
						} else { 
							if (STR.length == 2){
								inteiro  = '0';
								decimal = '0' + STR;
							} else {
								decimal = STR.substring(STR.length-3,STR.length);
								i=4;
								count=0;
								while (i<=STR.length){
//									if (count==3) {
//										inteiro = '.' + inteiro;
//										count = 0;
//									}
									inteiro = STR.charAt(STR.length-i) + inteiro;
									count++;
									i++;
								}
							}
						} 
					}
				} else {
					if (STR.length == 1){
						inteiro  = '0';
						decimal = '0' + STR;
					} else { 
						if (STR.length == 2){
							inteiro  = '0';
							decimal = STR;
						} else {
							decimal = STR.substring(STR.length-2,STR.length);
							i=3;
							count=0;
							while (i<=STR.length){
//								if (count==3) {
//									inteiro = '.' + inteiro;
//									count = 0;
//								}
								inteiro = STR.charAt(STR.length-i) + inteiro;
								count++;
								i++;
							}
						}
					}        
			    }
			}
			  
			if (inteiro == '') {
				inteiro = '0';
			}
		  
			if (decimal == '') {
				decimal = '00';
			}
			OBJ.value = inteiro+':'+decimal;
		}
	}
}

function refreshCampo(obj){
	if (isIE) {
		obj.value = obj.value;
	}
}

//  FIM   // funcoes para formartacao de valor 

function div(dividendo,divisor){
  return (dividendo-(dividendo % divisor))/divisor;
}

function AbrirRegrasAgendamento(){
  var leftPos,topPos, W, H;
  W = 320;
  H = 420;
  //leftPos = div( screen.width - W , 2 );
  //topPos  = div( screen.height - H , 2 );
  leftPos = 115;
  topPos  = 70;
  window.open("/Documentos/ajudaagenda.htm","","width="+W+",height="+H+",left="+leftPos+",top="+topPos)
}

// onFocus=UpCursor(this, indice_caixa_texto, maxLength)
function UpCursor(ctrl, indice, max) {
		ctrl.tam=max;
		ctrl.saltar=false;
		ctrl.indice=indice;
		ctrl.onkeyup=AlteraFoco;
}
function AlteraFoco() {
	this.saltar=(this.value.length==this.tam);
	if (this.saltar==true) {
		indice=this.indice;
		document.forms[this.form.name].elements[indice].focus();
	}
	return true;
}

// Bloquear caracteres nao numericos - onKeyPress=onlynum()
function onlynum(e) {
	var keyNumber = (isIE) ? event.keyCode : e.which;
	if (((keyNumber<48)||(keyNumber>57)) && (keyNumber!=13) && (keyNumber!="0") && (keyNumber!=8)) {
		if (isIE) event.keyCode=0;
		return false;
	}
}

function formatarvalor(STR){
  var decimal,inteiro;
  var i,count;
  STR = new String(STR);
  STR = tirarZerosEsquerda(STR);
  inteiro='';
  if (STR.length == 1){
	  inteiro  = '0';
	  decimal = '0' + STR;
	}
	else { 
	  if (STR.length == 2){
		  inteiro  = '0';
		  decimal = STR;
		}
		else{
		  decimal = STR.substring(STR.length-2,STR.length);
		  i=3;
		  count=0;
		  while (i<=STR.length){
		 		if (count==3) {
				  inteiro = '.' + inteiro;
				  count = 0;
				}
		    inteiro = STR.charAt(STR.length-i) + inteiro;
				count++;
				i++;
		  }
		}
	}
  if (inteiro == '') {
    inteiro = '0';
  }
  if (decimal == '') {
    decimal = '00';
  }
  return inteiro+','+decimal;
}

	//CRIA ARRAY
	function CriaArray(n){
		var i,n;
		this.length = n;
		for (i = 1; i <=n; i++) {
			this[i] = 0;
		}
		return this;
	}


// *********************** Inicio Novas Fun?oes *******************************
/*------------------------------------------------------------------
 VerificaValor
 Descricao: Efetua a valida??o de campos tipo valor (money,currency)
 Parametros: Numero
						 bVerPonto
 Retorno: boolean, sendo true se valor Ok
-------------------------------------------------------------------*/
function VerificaValor(Numero, bVerPonto)
{
	var i;
	var iQtdCharAux1 = Numero.length-1;
	var sAux         = ReplaceString(Numero, ",", "");
	var sAux1        = ReplaceListChar(Numero, ",.", "");
	var bPonto;
	
	bPonto = (bVerPonto.toUpperCase()=="TRUE") ? true : false;
	
	if (bPonto)
	{
		if (Numero.charAt(Numero.length-3) != ",")
			return false;
		if (sAux.length != Numero.length-1)
			return false;
		if (!IsNumber(sAux1))
			return false;
		if(Numero.length > 6)
		{
			i = Numero.length - 7;
			while(i >= 0)
			{
				if(Numero.charAt(i) != "." || i==0)
					return (false);
				iQtdCharAux1 = iQtdCharAux1 - 1;
				i = i - 4;
			}
		}
		else if (sAux1.length != iQtdCharAux1)
				return false;
	}
	else
	{
		if(Numero.charAt(Numero.length-3) != ",")
			return false;
		if (sAux.length != Numero.length-1)
			return false;
		if (!IsNumber(sAux))
			return false;
	}
	return true;
}

/*----------------------------------------------------------------------
 ReplaceString
 Descricao: Procura e substitui um caracter ou uma string dentro de
						uma outra string
 Parametros: sIn - string de entrada
						 sFind - string a ser procurada
						 sReplace - string a ser substituida
 Retorno: String substituida.
-----------------------------------------------------------------------*/
function ReplaceString(sIn, sFind, sReplace) {
	var converted="";
	var expr1;
	var sResult=sIn;
	for (i=0;i<sFind.length;i++) {
		converted = converted+"\\x"+hexConvert(sFind.charCodeAt(i));
	}
	expr1=new RegExp(converted,"g");
	sResult=sResult.replace(expr1,sReplace);

	return sResult;
}

/*----------------------------------------------------------------------
 ReplaceListChar
 Descricao: Procura e substitui um caracter ou uma lista de caracteres
						dentro de uma outra string
 Parametros: sIn - string de entrada
						 sFind - Lista de caracteres a serem substiutidos
						 sReplace - caracter ou string a ser substituida
 Retorno: String substituida.
-----------------------------------------------------------------------*/
function ReplaceListChar(sIn, sFind, sReplace) {
	var converted="";
	var expr1;
	var sResult=sIn;
	for (i=0;i<sFind.length;i++) {
		converted = "\\x"+hexConvert(sFind.charCodeAt(i));
		expr1=new RegExp(converted,"g");
		sResult=sResult.replace(expr1,sReplace);
	}
	return sResult;
}

function decToHex(convert) {
	var hexa;
	var firstnum;
	var lastnum;
	b = Math.floor (convert / 16);
	c = convert; c %= 16
	charx = '0123456789ABCDEF';
	firstnum = charx.substring(b,b+1);
	lastnum = charx.substring(c,c+1);
	hexa = firstnum + lastnum;
	return hexa;
}

function isNumber(numero) {
	return (numero.search(/\D/)==-1) ? true : false;
}

var isNav4 = false, isNav5 = false, isIE4 = false
var strSeperator = "/"; 
// If you are using any Java validation on the back side you will want to use the / because 
// Java date validations do not recognize the dash as a valid date separator.
var vDateType = 3; // Global value for type of date format
//                1 = mm/dd/yyyy
//                2 = yyyy/dd/mm  (Unable to do date check at this time)
//                3 = dd/mm/yyyy
var vYearType = 4; //Set to 2 or 4 for number of digits in the year for Netscape
var vYearLength = 2; // Set to 4 if you want to force the user to enter 4 digits for the year before validating.
var err = 0; // Set the error code to a default of zero

if(navigator.appName == "Netscape") {
	if (navigator.appVersion < "5") {
		isNav4 = true;
		isNav5 = false;
	} else
		if (navigator.appVersion > "4") {
			isNav4 = false;
			isNav5 = true;
	   	}
	} else {
		isIE4 = true;
	}

			
function DateFormat(campo,e) 
{
	var cod="";
	if(document.all) {
		cod=event.keyCode;
	} 
	else  {
		cod=e.which;
	}
//alert(cod);

		if (cod < 48 || cod > 57) {
			if (cod < 45 || cod > 57) { 
				//alert("Digite somente Caracteres Num?ricos!");
			}
		
				//cod=0;
				//campo.focus(); 
				if ((cod == 13) || (cod == 0) || (cod == 8)) 
					return true;
				else
					return false;
		
		}


	tam=campo.value.length; 
	
	if(tam > 9) 
		return false;



	var caract = String.fromCharCode(cod);

	// validando o dia digitado
	// se for maior que 31 n?o deixa o usu?rio prosseguir com a digita??o
	if(tam == 2) {
		if(campo.value > 31) {
			alert("O DIA digitado ? Inv?lido..!");
			return false;
		}
	}
	
	// validando o m?s digitado
	// se for maior que 12 n?o deixa o usu?rio prosseguir com a digita??o
	if(tam == 5) {
		mesDigitado = campo.value;
		mesDigitado = mesDigitado.substring(3,5);
		if(mesDigitado > 12 || mesDigitado < 1) {
			alert("O M?S digitado ? Inv?lido..!");
			return false;
		}
	}
	
	if(tam == 2 || tam == 5) {
		campo.value+="/"+caract; 
		return false;
	}
	
	campo.value+=caract; 

if (tam == 9) {
		var datePat = /^(\d{1,2})(\/|-)(\d{1,2})\2(\d{2}|\d{4})$/;

		var valor = campo.value;
		
		var matchArray = valor.match(datePat);
		if (matchArray == null) {
			alert("A data digitada ? INV?LIDA...!\n\nDigite a data no formato dd/mm/aaaa");
			return false;
		}
		
		month = matchArray[3];
		day = matchArray[1];
		year = matchArray[4];

		if (month < 01 || month > 12) { 
			alert("A data digitada ? INV?LIDA...!\n\nO m?s precisa estar entre 01 e 12");
			campo.value='';
			campo.focus();
			return false;
			
		}
	//	alert(month);

		if (day < 01 || day > 31) {
			alert("A data digitada ? INV?LIDA...!\n\nO dia deve estar entre 01 e 31");
			campo.value='';
			campo.focus();
			return false;
		}

		if ((month=="04" || month=="06" || month=="09" || month=="11") && day=="31") {
			alert("A data digitada ? INV?LIDA...!\n\nO m?s "+month+" n?o possui 31 dias!");
			campo.value='';
			campo.focus();
			return false;
		}

		if (month == "02") {
			var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
			if (day>"29" || (day=="29" && !isleap)) {
				alert("A data digitada ? INV?LIDA...!\n\nFevereiro de " + year + " n?o possui " + day + " dias!");
				campo.value='';
				campo.focus();
				return false;
			  }
		}
		
		if (year < 1904) {
			alert("O ano digitado ? n?o pode ser anterior ? 1904...!\n\nDigite a data no formato dd/mm/aaaa");
			campo.value='';
			campo.focus();
			return false;
		}
		
		return true; 
		
	}

	return false;  
}			


function DateFormat_OLD(vDateName, vDateValue, e, dateCheck, dateType) {
vDateType = dateType;
// vDateName = object name
// vDateValue = value in the field being checked
// e = event
// dateCheck 
// True  = Verify that the vDateValue is a valid date
// False = Format values being entered into vDateValue only
// vDateType
// 1 = mm/dd/yyyy
// 2 = yyyy/mm/dd
// 3 = dd/mm/yyyy
//Enter a tilde sign for the first number and you can check the variable information.
if (vDateValue == "~") {
alert("AppVersion = "+navigator.appVersion+" \nNav. 4 Version = "+isNav4+" \nNav. 5 Version = "+isNav5+" \nIE Version = "+isIE4+" \nYear Type = "+vYearType+" \nDate Type = "+vDateType+" \nSeparator = "+strSeperator);
vDateName.value = "";
vDateName.focus();
return true;
}
var whichCode = (window.Event) ? e.which : e.keyCode;
// Check to see if a seperator is already present.
// bypass the date if a seperator is present and the length greater than 8
if (vDateValue.length > 8 && isNav4) {
if ((vDateValue.indexOf("-") >= 1) || (vDateValue.indexOf("/") >= 1))
return true;
}
//Eliminate all the ASCII codes that are not valid
var alphaCheck = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/-";
if (alphaCheck.indexOf(vDateValue) >= 1) {
if (isNav4) {
vDateName.value = "";
vDateName.focus();
vDateName.select();
return false;
}
else {
vDateName.value = vDateName.value.substr(0, (vDateValue.length-1));
return false;
   }
}
if (whichCode == 8) //Ignore the Netscape value for backspace. IE has no value
return false;
else {
//Create numeric string values for 0123456789/
//The codes provided include both keyboard and keypad values
var strCheck = '47,48,49,50,51,52,53,54,55,56,57,58,59,95,96,97,98,99,100,101,102,103,104,105';
if (strCheck.indexOf(whichCode) != -1) {
if (isNav4) {
if (((vDateValue.length < 6 && dateCheck) || (vDateValue.length == 7 && dateCheck)) && (vDateValue.length >=1)) {
alert("Data Inv?lida!\nDigite novamente.");
vDateName.value = "";
vDateName.focus();
vDateName.select();
return false;
}
if (vDateValue.length == 6 && dateCheck) {
var mDay = vDateName.value.substr(2,2);
var mMonth = vDateName.value.substr(0,2);
var mYear = vDateName.value.substr(4,4)
//Turn a two digit year into a 4 digit year
if (mYear.length == 2 && vYearType == 4) {
var mToday = new Date();
//If the year is greater than 30 years from now use 19, otherwise use 20
var checkYear = mToday.getFullYear() + 30; 
var mCheckYear = '20' + mYear;
if (mCheckYear >= checkYear)
mYear = '19' + mYear;
else
mYear = '20' + mYear;
}
var vDateValueCheck = mMonth+strSeperator+mDay+strSeperator+mYear;
if (!dateValid(vDateValueCheck)) {
alert("Data Inv?lida!\nDigite novamente.");
vDateName.value = "";
vDateName.focus();
vDateName.select();
return false;
}
return true;
}
else {
// Reformat the date for validation and set date type to a 1
if (vDateValue.length >= 8  && dateCheck) {
if (vDateType == 1) // mmddyyyy
{
var mDay = vDateName.value.substr(2,2);
var mMonth = vDateName.value.substr(0,2);
var mYear = vDateName.value.substr(4,4)
vDateName.value = mMonth+strSeperator+mDay+strSeperator+mYear;
}
if (vDateType == 2) // yyyymmdd
{
var mYear = vDateName.value.substr(0,4)
var mMonth = vDateName.value.substr(4,2);
var mDay = vDateName.value.substr(6,2);
vDateName.value = mYear+strSeperator+mMonth+strSeperator+mDay;
}
if (vDateType == 3) // ddmmyyyy
{
var mMonth = vDateName.value.substr(2,2);
var mDay = vDateName.value.substr(0,2);
var mYear = vDateName.value.substr(4,4)
vDateName.value = mDay+strSeperator+mMonth+strSeperator+mYear;
}
//Create a temporary variable for storing the DateType and change
//the DateType to a 1 for validation.
var vDateTypeTemp = vDateType;
vDateType = 1;
var vDateValueCheck = mMonth+strSeperator+mDay+strSeperator+mYear;
if (!dateValid(vDateValueCheck)) {
alert("Data Inv?lida!\nDigite novamente.");
vDateType = vDateTypeTemp;
vDateName.value = "";
vDateName.focus();
vDateName.select();
return false;
}
vDateType = vDateTypeTemp;
return true;
}
else {
if (((vDateValue.length < 8 && dateCheck) || (vDateValue.length == 9 && dateCheck)) && (vDateValue.length >=1)) {
alert("Data Inv?lida!\nDigite novamente.");
vDateName.value = "";
vDateName.focus();
vDateName.select();
return false;
         }
      }
   }
}
else {
// Non isNav Check
if (((vDateValue.length < 8 && dateCheck) || (vDateValue.length == 9 && dateCheck)) && (vDateValue.length >=1)) {
alert("Data Inv?lida!\nDigite novamente.");
vDateName.value = "";
vDateName.focus();
return true;
}
// Reformat date to format that can be validated. mm/dd/yyyy
if (vDateValue.length >= 8 && dateCheck) {
// Additional date formats can be entered here and parsed out to
// a valid date format that the validation routine will recognize.
if (vDateType == 1) // mm/dd/yyyy
{
var mMonth = vDateName.value.substr(0,2);
var mDay = vDateName.value.substr(3,2);
var mYear = vDateName.value.substr(6,4)
}
if (vDateType == 2) // yyyy/mm/dd
{
var mYear = vDateName.value.substr(0,4)
var mMonth = vDateName.value.substr(5,2);
var mDay = vDateName.value.substr(8,2);
}
if (vDateType == 3) // dd/mm/yyyy
{
var mDay = vDateName.value.substr(0,2);
var mMonth = vDateName.value.substr(3,2);
var mYear = vDateName.value.substr(6,4)
}
if (vYearLength == 4) {
if (mYear.length < 4) {
alert("Data Inv?lida!\nDigite novamente.");
vDateName.value = "";
vDateName.focus();
return true;
   }
}
// Create temp. variable for storing the current vDateType
var vDateTypeTemp = vDateType;
// Change vDateType to a 1 for standard date format for validation
// Type will be changed back when validation is completed.
vDateType = 1;
// Store reformatted date to new variable for validation.
var vDateValueCheck = mMonth+strSeperator+mDay+strSeperator+mYear;
if (mYear.length == 2 && vYearType == 4 && dateCheck) {
//Turn a two digit year into a 4 digit year
var mToday = new Date();
//If the year is greater than 30 years from now use 19, otherwise use 20
var checkYear = mToday.getFullYear() + 30; 
var mCheckYear = '20' + mYear;
if (mCheckYear >= checkYear)
mYear = '19' + mYear;
else
mYear = '20' + mYear;
vDateValueCheck = mMonth+strSeperator+mDay+strSeperator+mYear;
// Store the new value back to the field.  This function will
// not work with date type of 2 since the year is entered first.
if (vDateTypeTemp == 1) // mm/dd/yyyy
vDateName.value = mMonth+strSeperator+mDay+strSeperator+mYear;
if (vDateTypeTemp == 3) // dd/mm/yyyy
vDateName.value = mDay+strSeperator+mMonth+strSeperator+mYear;
} 
if (!dateValid(vDateValueCheck)) {
alert("Data Inv?lida!\nDigite novamente.");
vDateType = vDateTypeTemp;
vDateName.value = "";
vDateName.focus();
return true;
}
vDateType = vDateTypeTemp;
return true;
}
else {
if (vDateType == 1) {
if (vDateValue.length == 2) {
vDateName.value = vDateValue+strSeperator;
}
if (vDateValue.length == 5) {
vDateName.value = vDateValue+strSeperator;
   }
}
if (vDateType == 2) {
if (vDateValue.length == 4) {
vDateName.value = vDateValue+strSeperator;
}
if (vDateValue.length == 7) {
vDateName.value = vDateValue+strSeperator;
   }
} 
if (vDateType == 3) {
if (vDateValue.length == 2) {
vDateName.value = vDateValue+strSeperator;
}
if (vDateValue.length == 5) {
vDateName.value = vDateValue+strSeperator;
   }
}
return true;
   }
}
if (vDateValue.length == 10&& dateCheck) {
if (!dateValid(vDateName)) {
// Un-comment the next line of code for debugging the dateValid() function error messages
//alert(err);  
alert("Data Inv?lida!\nDigite novamente.");
vDateName.focus();
vDateName.select();
   }
}
return false;
}
else {
// If the value is not in the string return the string minus the last
// key entered.
if (isNav4) {
vDateName.value = "";
vDateName.focus();
vDateName.select();
return false;
}
else
{
vDateName.value = vDateName.value.substr(0, (vDateValue.length-1));
return false;
         }
      }
   }
}
function dateValid(objName) {
var strDate;
var strDateArray;
var strDay;
var strMonth;
var strYear;
var intday;
var intMonth;
var intYear;
var booFound = false;
var datefield = objName;
var strSeparatorArray = new Array("-"," ","/",".");
var intElementNr;
// var err = 0;
var strMonthArray = new Array(12);
strMonthArray[0] = "Jan";
strMonthArray[1] = "Feb";
strMonthArray[2] = "Mar";
strMonthArray[3] = "Apr";
strMonthArray[4] = "May";
strMonthArray[5] = "Jun";
strMonthArray[6] = "Jul";
strMonthArray[7] = "Aug";
strMonthArray[8] = "Sep";
strMonthArray[9] = "Oct";
strMonthArray[10] = "Nov";
strMonthArray[11] = "Dec";
//strDate = datefield.value;
strDate = objName;
if (strDate.length < 1) {
return true;
}
for (intElementNr = 0; intElementNr < strSeparatorArray.length; intElementNr++) {
if (strDate.indexOf(strSeparatorArray[intElementNr]) != -1) {
strDateArray = strDate.split(strSeparatorArray[intElementNr]);
if (strDateArray.length != 3) {
err = 1;
return false;
}
else {
strDay = strDateArray[0];
strMonth = strDateArray[1];
strYear = strDateArray[2];
}
booFound = true;
   }
}
if (booFound == false) {
if (strDate.length>5) {
strDay = strDate.substr(0, 2);
strMonth = strDate.substr(2, 2);
strYear = strDate.substr(4);
   }
}
//Adjustment for short years entered
if (strYear.length == 2) {
strYear = '20' + strYear;
}
strTemp = strDay;
strDay = strMonth;
strMonth = strTemp;
intday = parseInt(strDay, 10);
if (isNaN(intday)) {
err = 2;
return false;
}
intMonth = parseInt(strMonth, 10);
if (isNaN(intMonth)) {
for (i = 0;i<12;i++) {
if (strMonth.toUpperCase() == strMonthArray[i].toUpperCase()) {
intMonth = i+1;
strMonth = strMonthArray[i];
i = 12;
   }
}
if (isNaN(intMonth)) {
err = 3;
return false;
   }
}
intYear = parseInt(strYear, 10);
if (isNaN(intYear)) {
err = 4;
return false;
}
if (intMonth>12 || intMonth<1) {
err = 5;
return false;
}
if ((intMonth == 1 || intMonth == 3 || intMonth == 5 || intMonth == 7 || intMonth == 8 || intMonth == 10 || intMonth == 12) && (intday > 31 || intday < 1)) {
err = 6;
return false;
}
if ((intMonth == 4 || intMonth == 6 || intMonth == 9 || intMonth == 11) && (intday > 30 || intday < 1)) {
err = 7;
return false;
}
if (intMonth == 2) {
if (intday < 1) {
err = 8;
return false;
}
if (LeapYear(intYear) == true) {
if (intday > 29) {
err = 9;
return false;
   }
}
else {
if (intday > 28) {
err = 10;
return false;
      }
   }
}
return true;
}
function LeapYear(intYear) {
if (intYear % 100 == 0) {
if (intYear % 400 == 0) { return true; }
}
else {
if ((intYear % 4) == 0) { return true; }
}
return false;
}


function reajustarValor(reajuste,periodo,periodoAte,verbaId) {
	tipoSalario = document.frm_verba.tipoDeSalarioDigitado.value;
	periodoOriginal = periodo;
	periodo = parseInt(periodo) - 1;
	periodo = String(periodo);
	ano = periodo.substring(0,4);
	mes = periodo.substring(4,6);
	if(mes == "00") {
		ano--;
		mes = "12";
	}
	periodo = String(ano) + String(mes);
	if(tipoSalario == '1') {
		strValorAnterior = "document.frm_verba.valor" + periodo + ".value";
	} else {
		strValorAnterior = "document.frm_verba.salarioHora" + periodo + ".value";
	}
	valorAnterior = eval(strValorAnterior);
	// alert("\nCORRIGIDO"+"\ntipo de sal?rio...: "+tipoSalario+"\nreajuste...: "+reajuste + "\nperiodo inicial...: "+periodo +"\nperiodoFinal...: "+ periodoAte +"\ntipo de sal?rio...:  "+tipoSalario+"\nperiodo "+periodo+ "\nvalor do m?s anterior...: "+valorAnterior + "\nverbaId..: "+ verbaId);
	
	while(valorAnterior.indexOf(".") >= 0) {
		tam = valorAnterior.length;
		pos = valorAnterior.indexOf(".");
		if(pos != -1) {
			valorAnterior = valorAnterior.substr(0,pos) + valorAnterior.substr(pos+1,tam);
		}
	}
	
	valorAnterior = valorAnterior.replace(",",".");

	valorAnterior = testarDivisor(periodoOriginal,valorAnterior);
	
	if(reajuste) {
		while(reajuste.indexOf(".") >= 0) {
			tam = reajuste.length;
			pos = reajuste.indexOf(".");
			if(pos != -1) {
				reajuste = reajuste.substr(0,pos) + reajuste.substr(pos+1,tam);
			}
		}
		reajuste = reajuste.replace(",",".");
		valorReajustado = valorAnterior * ((reajuste/100) + 1);
		valorReajustado = Math.round(valorReajustado * 100) / 100;
		valorReajustado = String(valorReajustado);
	} else {
		valorReajustado = valorAnterior;
	}
	
	if(valorReajustado.indexOf(".") >= 0) {
		tam = valorReajustado.length;
		pos = valorReajustado.indexOf(".");
		if(pos >= 0) {
			valorReajustado = valorReajustado.substr(0,pos) + "," + valorReajustado.substr(pos+1,tam);
		}
	}
	
	if(tipoSalario == '1') {
		strFormula = "document.frm_verba.valor" + periodoOriginal + ".value = valorReajustado";
	} else {
		strFormula = "document.frm_verba.salarioHora" + periodoOriginal + ".value = valorReajustado";
	}
	
	
	eval(strFormula);
	periodoX = periodo;
	while(parseInt(periodoX) <= parseInt(periodoAte)) {
		periodoAnterior = periodoX;
		periodoX = String(parseInt(periodoX) + 1);
		if(parseInt(periodoX.substring(4,6)) > 12) {
			periodoX = String(parseInt(periodoX.substring(0,4)) + 1) + "01";
		}

		if(parseInt(periodoX) <= parseInt(periodoAte)) {
			if(tipoSalario == '1') {
				valorDeCima = eval("document.frm_verba.valor" + periodoAnterior + ".value");
			} else {
				valorDeCima = eval("document.frm_verba.salarioHora" + periodoAnterior + ".value");
			}

			if(valorDeCima.indexOf(",") >= 0) {
				while(valorDeCima.indexOf(".") >= 0) {
					tam = valorDeCima.length;
					pos = valorDeCima.indexOf(".");
					if(pos != -1) {
						valorDeCima = valorDeCima.substr(0,pos) + valorDeCima.substr(pos+1,tam);
					}
				}
				valorDeCima = valorDeCima.replace(",",".");
			}

			percentual = eval("document.frm_verba.perc" + periodoX + ".value");
			if(!percentual) {
				novoValor = valorDeCima;
				var valorDoInput = valorDeCima;
			} else {
				while(percentual.indexOf(".") >= 0) {
					tam = percentual.length;
					pos = percentual.indexOf(".");
					if(pos != -1) {
						percentual = percentual.substr(0,pos) + percentual.substr(pos+1,tam);
					}
				}
				percentual = percentual.replace(",",".");
				novoValor = parseInt((valorDeCima * ((percentual / 100) + 1)+0.005)*100);
				novoValor = novoValor/100;
				// alert(novoValor + " = " + valorDeCima + " / " + (percentual/100+1));
				var valorDoInput = novoValor;
			}
			
			cargaHoraria = eval("document.frm_verba.hora"+periodoX+".value");
			if(verbaId == '4') {
				while(cargaHoraria.indexOf(".") >= 0) {
					tam = cargaHoraria.length;
					pos = cargaHoraria.indexOf(".");
					if(pos != -1) {
						cargaHoraria = cargaHoraria.substr(0,pos) + cargaHoraria.substr(pos+1,tam);
					}
				}
			}	
			
			valorDoInputSemFormatacao = novoValor;
			
			valorDoInputFormatadoInteiro = parseInt(valorDoInput);
			valorDoInputFormatadoDecimal = parseFloat(valorDoInput) - parseInt(valorDoInput);
			valorDoInputFormatadoDecimal = parseFloat(valorDoInputFormatadoDecimal) + 0.005;
			valorDoInputFormatadoDecimal = parseInt(valorDoInputFormatadoDecimal*100);
			valorDoInputFormatado = valorDoInputFormatadoInteiro + "," + valorDoInputFormatadoDecimal;
			
			
			if(tipoSalario == '1') {
				strFormula1 = "document.frm_verba.valor" + periodoX + ".value = '" + valorDoInputFormatado + "'";
				eval(strFormula1);
				salarioHora = parseFloat(valorDoInputSemFormatacao) / parseFloat(cargaHoraria);
				var parte_inteira = parseInt(salarioHora);
				var parte_centesimal = parseFloat(salarioHora)-(parseInt(salarioHora));
				parte_centesimal = parseFloat(parte_centesimal) + 0.005;
				parte_centesimal = parseInt(parte_centesimal*100);
				// alert(parte_inteira + " || " + parte_centesimal);
				if(parseFloat(parte_centesimal) < 10) {
					parte_centesimal = '0'+parte_centesimal;
				}
				salarioHora = parte_inteira + "," + parte_centesimal;
				strFormula2 = "document.frm_verba.salarioHora" + periodoX + ".value = '" + salarioHora + "'";	
				eval(strFormula2);
			} else {
				strFormula1 = "document.frm_verba.salarioHora" + periodoX + ".value = '" + valorDoInputFormatado + "'";
				eval(strFormula1);
				salarioMensal = parseFloat(valorDoInputSemFormatacao) * parseFloat(cargaHoraria);
				var parte_inteira = parseInt(salarioMensal);
				var parte_centesimal = parseFloat(salarioMensal)-(parseInt(salarioMensal));
				parte_centesimal = parseFloat(parte_centesimal) + 0.005;
				parte_centesimal = parseInt(parte_centesimal*100);
				if(parseFloat(parte_centesimal) < 10) {
					parte_centesimal = '0'+parte_centesimal;
				}
				salarioMensal = parte_inteira + "," + parte_centesimal;
				strFormula2 = "document.frm_verba.valor" + periodoX + ".value = '" + salarioMensal + "'";	
				eval(strFormula2);
			}
		}
	}
}


function testarDivisor(tdPeriodoX,tdValorDeCima) {
	if(tdPeriodoX == "199407") {
		tdValorDeCima = tdValorDeCima / 2750;
	} else if(tdPeriodoX == "199308") {
		tdValorDeCima = tdValorDeCima / 1000;
	} else if(tdPeriodoX == "198901") {
		tdValorDeCima = tdValorDeCima / 1000;
	} else if(tdPeriodoX == "198602") {
		tdValorDeCima = tdValorDeCima / 1000;
	} 
	return tdValorDeCima;
}

	function reflexosDsr(form,verba) {
		var verbaId = verba;
		
		if(verbaId == "6") {
			var titulo = "Adicional de Insalubridade ";
		} else if (verbaId == "7") {
			var titulo = "Adicional de Periculosidade ";
		} else if (verbaId == "8") {
			var titulo = "Adicional de Gratifica??o ";
		} else if (verbaId == "10") {
			var titulo = "Adicional de Transfer?ncia ";
		} else if (verbaId == "28") {
			var titulo = "Adicional de Tempo de Servi?o ";
		} 
		
		if(verbaId == "9") {
			var titulo = "das Comiss?es sobre Vendas ";
			var titulo1 = "as Comiss?es ";
			var texto = "Este Adicional";
		} else if (verbaId == "14") {
			var titulo = "das Horas Extras ";
			var titulo1 = "as Horas Extras ";
			var texto = "As Horas Extras";
		} else if (verbaId == "26") {
			var titulo = "as Horas de Intervalo de Descanso/Refei??o ";
			var texto = "Essas horas";
		} else if (verbaId == "27") {
			var titulo = "da Jornada In Itinere ";
			var texto = "A Jornada In Itinere";
			var titulo1 = "a Jornada In Itinere ";
		} else if (verbaId == "32") {
			var titulo = "do Adicional de Noturno ";
			var titulo1 = "o Adicional Noturno ";
			var texto = "O Adicional Noturno";
		} else if (verbaId == "34") {
			var titulo = "da Jornada de Sobreaviso ";
			var titulo1 = "a Jornada de Sobreaviso ";
			var texto = "A Jornada de Sobreaviso ";
		} 
		
		if(verbaId == "6" || verbaId == "7" || verbaId == "8" || verbaId == "10" || verbaId == "28") {
			if(titulo != " ") {
				if(verbaId == "6") {
					if(form.reflexo1.checked) {
		    			alert("Voc? est? selecionando para que seja calculado tamb?m  os  reflexos do " + titulo + " nos DESCANSOS SEMANAIS REMUNERADOS...!\n\nComo o " + titulo + " est? sendo calculado com base no valor mensal do Sal?rio M?nimo, e os descansos semanais j? est?o inclusos nesse valor mensal, N?O ? DEVIDO ESSE REFLEXO.\n\nTodavia ? livre ao usu?rio a op??o por essa apura??o para que atenda ? situa??es espec?ficas.");
					} 
				} else {
					if(form.reflexo1.checked) {
			    		alert("Voc? est? selecionando para que seja calculado tamb?m  os  reflexos do " + titulo + " nos DESCANSOS SEMANAIS REMUNERADOS...!\n\nComo o " + titulo + " est? sendo calculado com base no valor mensal do Sal?rio do Reclamante, e os descansos semanais j? est?o inclusos nesse valor mensal, N?O ? DEVIDO ESSE REFLEXO.\n\nTodavia ? livre ao usu?rio a op??o por essa apura??o para que atenda ? situa??es espec?ficas.");
					} 
				}
			}
		}
		
		if(verbaId == "9" || verbaId == "14" || verbaId == "26" || verbaId == "27" || verbaId == "32" || verbaId == "34") {
			if(titulo != " ") {
				if(form.reflexo1.checked == false) {
		    		alert("Voc? est? selecionando para que N?O SEJA CALCULADO OS REFLEXOS " + titulo + " nos Descansos Semanais Remunerados...!\n\n" + texto + " conforme ampla jurisprud?ncia deve repercutir no pagamento dos descansos semanais.\n\nTodavia ? livre ao usu?rio a op??o pela n?o apura??o desses reflexos, para que atenda ? situa??es espec?ficas.");
				} 
			}
		}
		
	}	

	
	function reflexos13Salario(form,verba) {
		var verbaId = verba;
		var titulo = " ";
		
		if(verbaId == "6") {
			var titulo = "o Adicional de Insalubridade ";
			var texto = "Este Adicional";
		} else if (verbaId == "7") {
			var titulo = "o Adicional de Periculosidade ";
			var texto = "Este Adicional";
		} else if (verbaId == "8") {
			var titulo = "o Adicional de Gratifica??o ";
			var texto = "Este Adicional";
		} else if (verbaId == "9") {
			var titulo = "as Comiss?es sobre Vendas ";
			var texto = "Este Adicional";
		} else if (verbaId == "10") {
			var titulo = "o Adicional de Transfer?ncia ";
			var texto = "Este Adicional";
		} else if (verbaId == "14") {
			var titulo = "as Horas Extras ";
			var texto = "As Horas Extras";
		} else if (verbaId == "25") {
			var titulo = "a Diferen?a Salarial ";
			var texto = "Esta diferen?a";
		} else if (verbaId == "28") {
			var titulo = "o Adicional de Tempo de Servi?o ";
			var texto = "Este Adicional";
		} else if (verbaId == "27") {
			var titulo = "a Jornada In Itinere ";
			var texto = "A Jornada In Itinere";
		} else if (verbaId == "32") {
			var titulo = "o Adicional de Noturno ";
			var texto = "O Adicional Noturno";
		/*	
		} else if (verbaId == "33") {
			var titulo = "os Sal?rios Pagos por Fora da Folha de Pagtos ";
			var texto = "Se foram pagos por fora da folha de pagamentos, subintende-se que n?o houve a correta repercuss?o nos pagamentos das f?rias, sendo devido ent?o esses reflexos.";	
		*/
		} else if (verbaId == "34") {
			var titulo = "a Jornada de Sobreaviso ";
			var texto = "A Jornada de Sobreaviso ";
		} 
		
		if(titulo != " ") {
			if(form.reflexo2.checked == false) {
				/*
				if(verbaId == "33") {
					alert("Voc? est? selecionando para que " + titulo + " N?O TENHA REFLEXOS NOS 13? SAL?RIOS...!\n\n" +texto+ " \n\nTodavia ? livre ao usu?rio a op??o pela n?o apura??o deste reflexo, atendendo assim ? situa??es espec?ficas.");
				} else { */
			  	 	alert("Voc? est? selecionando para que " + titulo + " N?O TENHA REFLEXOS NOS 13? SAL?RIOS...!\n\n" + texto + " conforme ampla jurisprud?ncia deve refletir nos pagamentos dos 13? Sal?rios.\n\nTodavia ? livre ao usu?rio a op??o pela n?o apura??o deste reflexo, atendendo assim ? situa??es espec?ficas.");
				// }
			} 
		}
	}
	
	
	function reflexosFerias(form,verba) {
		var verbaId = verba;
		var titulo = " ";

		if(verbaId == "6") {
			var titulo = "o Adicional de Insalubridade ";
			var texto = "Este Adicional";
		} else if (verbaId == "7") {
			var titulo = "o Adicional de Periculosidade ";
			var texto = "Este Adicional";
		} else if (verbaId == "8") {
			var titulo = "o Adicional de Gratifica??o ";
			var texto = "Este Adicional";
		} else if (verbaId == "9") {
			var titulo = "as Comiss?es sobre Vendas ";
			var texto = "Este Adicional";
		} else if (verbaId == "10") {
			var titulo = "o Adicional de Transfer?ncia ";
			var texto = "Este Adicional";
		} else if (verbaId == "14") {
			var titulo = "as Horas Extras ";
			var texto = "As Horas Extras";
		} else if (verbaId == "25") {
			var titulo = "a Diferen?a Salarial ";
		} else if (verbaId == "26") {
			var titulo = "as Horas de Intervalo de Descanso/Refei??o ";
			var texto = "Estas horas";
		} else if (verbaId == "28") {
			var titulo = "o Adicional de Tempo de Servi?o ";
			var texto = "Este Adicional";
		} else if (verbaId == "27") {
			var titulo = "a Jornada In Itinere ";
			var texto = "A Jornada In Itinere";
		} else if (verbaId == "32") {
			var titulo = "o Adicional de Noturno ";
			var texto = "O Adicional Noturno";
			/*
		} else if (verbaId == "33") {
			var titulo = "os Sal?rios Pagos por Fora da Folha de Pagtos ";
			var texto = "Se foram pagos por fora da folha de pagamentos, subintende-se que n?o houve a correta repercuss?o nos pagamentos das f?rias, sendo devido ent?o esses reflexos.";	
			*/
		} else if (verbaId == "34") {
			var titulo = "a Jornada de Sobreaviso ";
			var texto = "A Jornada de Sobreaviso ";
		} 
		
		if(titulo != " ") {
			if(form.reflexo3.checked == false) {
				/*
				if(verbaId == "33") {
					alert("Voc? est? selecionando para que " + titulo + " N?O TENHA REFLEXOS NAS F?RIAS...!\n\n" +texto+ " \n\nTodavia ? livre ao usu?rio a op??o pela n?o apura??o deste reflexo, atendendo assim ? situa??es espec?ficas.");
				} else { */
			   		alert("Voc? est? selecionando para que " + titulo + " N?O TENHA REFLEXOS NAS F?RIAS...!\n\n" +texto+ " conforme ampla jurisprud?ncia deve refletir nos pagamentos das F?rias.\n\nTodavia ? livre ao usu?rio a op??o pela n?o apura??o deste reflexo, atendendo assim ? situa??es espec?ficas.");
				// }
			} 
		}
	}

	function reflexosAvPrevio(form,verba) {
		var verbaId = verba;
		var titulo = " ";
		
		if(verbaId == "6") {
			var titulo = "o Adicional de Insalubridade ";
			var texto = "Este Adicional";
		} else if (verbaId == "7") {
			var titulo = "o Adicional de Periculosidade ";
			var texto = "Este Adicional";
		} else if (verbaId == "8") {
			var titulo = "o Adicional de Gratifica??o ";
			var texto = "Este Adicional";
		} else if (verbaId == "9") {
			var titulo = "as Comiss?es sobre Vendas ";
			var texto = "Este Adicional";
		} else if (verbaId == "10") {
			var titulo = "o Adicional de Transfer?ncia ";
			var texto = "Este Adicional";
		} else if (verbaId == "14") {
			var titulo = "as Horas Extras ";
			var texto = "As Horas Extras";
		} else if (verbaId == "25") {
			var titulo = "a Diferen?a Salarial ";
			var texto = "Esta diferen?a";
		} else if (verbaId == "28") {
			var titulo = "o Adicional de Tempo de Servi?o ";
			var texto = "Este Adicional";
		} else if (verbaId == "27") {
			var titulo = "a Jornada In Itinere ";
			var texto = "A Jornada In Itinere";
		} else if (verbaId == "32") {
			var titulo = "o Adicional de Noturno ";
			var texto = "O Adicional Noturno";
		/*	
		} else if (verbaId == "33") {
			var titulo = "os Sal?rios Pagos por Fora da Folha de Pagtos ";
			var texto = "Se foram pagos por fora da folha de pagamentos, subintende-se que n?o houve a correta repercuss?o nos pagamentos das f?rias, sendo devido ent?o esses reflexos.";	
		*/
		} else if (verbaId == "34") {
			var titulo = "a Jornada de Sobreaviso ";
			var texto = "A Jornada de Sobreaviso ";
		} 
		
		if(titulo != " ") {
			if(form.reflexo4.checked == false) {
		  	 	alert("Voc? est? selecionando para que " + titulo + " N?O \nTENHA REFLEXOS NO PAGAMENTO AVISO PR?VIO INDENIZADO...!\n\n" + texto + " conforme ampla jurisprud?ncia deve repercutir no pagamento \ndo aviso pr?vio.\n\nTodavia ? livre ao usu?rio a op??o pela n?o apura??o deste reflexo, \natendendo assim ? situa??es espec?ficas.");
			} 
		}
	}
	
	
	function repeteValorDigitado(campo,inicio,fim,verba) {
		var inicio, fim, valorDigitado, verba;
		var valorDigitado = campo.value;
		var mesAtual = campo.name;
				
		valor = valorDigitado.replace(".","");
		valor = valor.replace(",",".");
		
		if(mesAtual.substring(0,4) == 'hora') {
			var mes = parseFloat(mesAtual.substring(4,10));
			if(mes > 198809 && valor > 220.00) {
				alert("A partir de 05/10/1.988 a legisla??o definiu que o limite m?ximo para a \n\ncarga hor?ria mensal de trabalho ? de 220,00 horas...!");
				strFocus = "document.frm_verba."+ mesAtual +".focus()";
				eval(strFocus);
				return;
			}
			if(mes < 198810 && valor > 240.00) {
				alert("At? 04/10/1.988 a legisla??o estabelecia que o limite m?ximo para a \n\ncarga hor?ria mensal de trabalho era de 240,00 horas...!");
				strFocus = "document.frm_verba."+ mesAtual +".focus()";
				eval(strFocus);
				return;
			}
		}
				
		inicio = parseFloat(inicio);
		fim = parseFloat(fim);
		if(document.frm_verba.opcao_repetir.checked == true) {
			if(parseFloat(valor) > 0) {		
				if(inicio < fim) {
					for(i = (inicio+1); i <= fim; i++) {
						periodoX = String(parseFloat(i));
						if(periodoX.substring(4,7) == '13') {
							periodoX = String(parseInt(periodoX.substring(0,4)) + 1) + "01";
							i = periodoX;
						} 
						if(mesAtual.substring(0,5) == 'valor') {
							strFormula = "document.frm_verba.valor" + i + ".value = '" + valorDigitado + "'";
						} else if (mesAtual.substring(0,4) == 'hora') {
							// strFormula = "document.frm_verba.hora" + i + ".value = '" + valorDigitado + "'";
						}
						eval(strFormula);
					}
				}
			}
		}
		return;
	}
	
	
	
function formatandoDatasTeste(vDateName, vDateValue, e, dateCheck, dateType) {
vDateType = dateType;
/*
alert(vDateType);
alert(vDateName.name);
alert(vDateValue);
alert(e);
alert(dateCheck);
*/

// vDateName = object name
// vDateValue = value in the field being checked
// e = event
// dateCheck 
// True  = Verify that the vDateValue is a valid date
// False = Format values being entered into vDateValue only
// vDateType
// 1 = mm/dd/yyyy
// 2 = yyyy/mm/dd
// 3 = dd/mm/yyyy
//Enter a tilde sign for the first number and you can check the variable information.
if (vDateValue == "~") {
	alert("AppVersion = "+navigator.appVersion+" \nNav. 4 Version = "+isNav4+" \nNav. 5 Version = "+isNav5+" \nIE Version = "+isIE4+" \nYear Type = "+vYearType+" \nDate Type = "+vDateType+" \nSeparator = "+strSeperator);
	vDateName.value = "";
	vDateName.focus();
	return true;
}
var whichCode = (window.Event) ? e.which : e.keyCode;
// alert("whichCode...: " + whichCode);
// Check to see if a seperator is already present.
// bypass the date if a seperator is present and the length greater than 8
if (vDateValue.length > 8) {
if ((vDateValue.indexOf("-") >= 1) || (vDateValue.indexOf("/") >= 1))
return true;
}
//Eliminate all the ASCII codes that are not valid
var alphaCheck = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/-";
if (alphaCheck.indexOf(vDateValue) >= 1) {
if (isNav4) {
vDateName.value = "";
vDateName.focus();
vDateName.select();
return false;
}
else {
vDateName.value = vDateName.value.substr(0, (vDateValue.length-1));
return false;
   }
}
if (whichCode == 8) //Ignore the Netscape value for backspace. IE has no value
return false;
else {
//Create numeric string values for 0123456789/
//The codes provided include both keyboard and keypad values
var strCheck = '47,48,49,50,51,52,53,54,55,56,57,58,59,95,96,97,98,99,100,101,102,103,104,105';
if (strCheck.indexOf(whichCode) != -1) {
if (isNav4) {
if (((vDateValue.length < 6 && dateCheck) || (vDateValue.length == 7 && dateCheck)) && (vDateValue.length >=1)) {
alert("Data Inv?lida!\nDigite novamente.");
vDateName.value = "";
vDateName.focus();
vDateName.select();
return false;
}
if (vDateValue.length == 6 && dateCheck) {
var mDay = vDateName.value.substr(2,2);
var mMonth = vDateName.value.substr(0,2);
var mYear = vDateName.value.substr(4,4)
//Turn a two digit year into a 4 digit year
if (mYear.length == 2 && vYearType == 4) {
var mToday = new Date();
//If the year is greater than 30 years from now use 19, otherwise use 20
var checkYear = mToday.getFullYear() + 30; 
var mCheckYear = '20' + mYear;
if (mCheckYear >= checkYear)
mYear = '19' + mYear;
else
mYear = '20' + mYear;
}
var vDateValueCheck = mMonth+strSeperator+mDay+strSeperator+mYear;
if (!dateValid(vDateValueCheck)) {
alert("Data Inv?lida!\nDigite novamente.");
vDateName.value = "";
vDateName.focus();
vDateName.select();
return false;
}
return true;
}
else {
// Reformat the date for validation and set date type to a 1
if (vDateValue.length >= 8  && dateCheck) {
if (vDateType == 1) // mmddyyyy
{
var mDay = vDateName.value.substr(2,2);
var mMonth = vDateName.value.substr(0,2);
var mYear = vDateName.value.substr(4,4)
vDateName.value = mMonth+strSeperator+mDay+strSeperator+mYear;
}
if (vDateType == 2) // yyyymmdd
{
var mYear = vDateName.value.substr(0,4)
var mMonth = vDateName.value.substr(4,2);
var mDay = vDateName.value.substr(6,2);
vDateName.value = mYear+strSeperator+mMonth+strSeperator+mDay;
}
if (vDateType == 3) // ddmmyyyy
{
var mMonth = vDateName.value.substr(2,2);
var mDay = vDateName.value.substr(0,2);
var mYear = vDateName.value.substr(4,4)
vDateName.value = mDay+strSeperator+mMonth+strSeperator+mYear;
}
//Create a temporary variable for storing the DateType and change
//the DateType to a 1 for validation.
var vDateTypeTemp = vDateType;
vDateType = 1;
var vDateValueCheck = mMonth+strSeperator+mDay+strSeperator+mYear;
if (!dateValid(vDateValueCheck)) {
alert("Data Inv?lida!\nDigite novamente.");
vDateType = vDateTypeTemp;
vDateName.value = "";
vDateName.focus();
vDateName.select();
return false;
}
vDateType = vDateTypeTemp;
return true;
}
else {
if (((vDateValue.length < 8 && dateCheck) || (vDateValue.length == 9 && dateCheck)) && (vDateValue.length >=1)) {
alert("Data Inv?lida!\nDigite novamente.");
vDateName.value = "";
vDateName.focus();
vDateName.select();
return false;
         }
      }
   }
}
else {
// Non isNav Check
if (((vDateValue.length < 8 && dateCheck) || (vDateValue.length == 9 && dateCheck)) && (vDateValue.length >=1)) {
alert("Data Inv?lida!\nDigite novamente.");
vDateName.value = "";
vDateName.focus();
return true;
}
// Reformat date to format that can be validated. mm/dd/yyyy
if (vDateValue.length >= 8 && dateCheck) {
// Additional date formats can be entered here and parsed out to
// a valid date format that the validation routine will recognize.
if (vDateType == 1) // mm/dd/yyyy
{
var mMonth = vDateName.value.substr(0,2);
var mDay = vDateName.value.substr(3,2);
var mYear = vDateName.value.substr(6,4)
}
if (vDateType == 2) // yyyy/mm/dd
{
var mYear = vDateName.value.substr(0,4)
var mMonth = vDateName.value.substr(5,2);
var mDay = vDateName.value.substr(8,2);
}
if (vDateType == 3) // dd/mm/yyyy
{
var mDay = vDateName.value.substr(0,2);
var mMonth = vDateName.value.substr(3,2);
var mYear = vDateName.value.substr(6,4)
}
if (vYearLength == 4) {
if (mYear.length < 4) {
alert("Data Inv?lida!\nDigite novamente.");
vDateName.value = "";
vDateName.focus();
return true;
   }
}
// Create temp. variable for storing the current vDateType
var vDateTypeTemp = vDateType;
// Change vDateType to a 1 for standard date format for validation
// Type will be changed back when validation is completed.
vDateType = 1;
// Store reformatted date to new variable for validation.
var vDateValueCheck = mMonth+strSeperator+mDay+strSeperator+mYear;
if (mYear.length == 2 && vYearType == 4 && dateCheck) {
//Turn a two digit year into a 4 digit year
var mToday = new Date();
//If the year is greater than 30 years from now use 19, otherwise use 20
var checkYear = mToday.getFullYear() + 30; 
var mCheckYear = '20' + mYear;
if (mCheckYear >= checkYear)
mYear = '19' + mYear;
else
mYear = '20' + mYear;
vDateValueCheck = mMonth+strSeperator+mDay+strSeperator+mYear;
// Store the new value back to the field.  This function will
// not work with date type of 2 since the year is entered first.
if (vDateTypeTemp == 1) // mm/dd/yyyy
vDateName.value = mMonth+strSeperator+mDay+strSeperator+mYear;
if (vDateTypeTemp == 3) // dd/mm/yyyy
vDateName.value = mDay+strSeperator+mMonth+strSeperator+mYear;
} 
if (!dateValid(vDateValueCheck)) {
alert("Data Inv?lida!\nDigite novamente.");
vDateType = vDateTypeTemp;
vDateName.value = "";
vDateName.focus();
return true;
}
vDateType = vDateTypeTemp;
return true;
}
else {
if (vDateType == 1) {
if (vDateValue.length == 2) {
vDateName.value = vDateValue+strSeperator;
}
if (vDateValue.length == 5) {
vDateName.value = vDateValue+strSeperator;
   }
}
if (vDateType == 2) {
if (vDateValue.length == 4) {
vDateName.value = vDateValue+strSeperator;
}
if (vDateValue.length == 7) {
vDateName.value = vDateValue+strSeperator;
   }
} 
if (vDateType == 3) {
if (vDateValue.length == 2) {
vDateName.value = vDateValue+strSeperator;
}
if (vDateValue.length == 5) {
vDateName.value = vDateValue+strSeperator;
   }
}
return true;
   }
}
if (vDateValue.length == 10&& dateCheck) {
if (!dateValid(vDateName)) {
// Un-comment the next line of code for debugging the dateValid() function error messages
//alert(err);  
alert("Data Inv?lida!\nDigite novamente.");
vDateName.focus();
vDateName.select();
   }
}
return false;
}
else {
// If the value is not in the string return the string minus the last
// key entered.
if (isNav4) {
vDateName.value = "";
vDateName.focus();
vDateName.select();
return false;
}
else
{
vDateName.value = vDateName.value.substr(0, (vDateValue.length-1));
return false;
         }
      }
   }
}

function mostraFormulario() {
	elemento = document.getElementById("formulario");
	//alert(elemento.style.visibility);

	if(elemento.style.visibility == "hidden") {
		elemento.style.visibility='visible';
	} else {
		elemento.style.visibility = "hidden";
	}
}


/**
* Pega a referencia de um objeto do HTML
* @author Marcos Araujo Sobrinho <marcosa@catho.com.br>
* @param id Nome do Objeto
* @todo Verificar se nome eh Tabela_NomeDoCampo ou Tabela[NomeDoCampo] em navegadores que n?o suportem Id.
* @return Object
*/
    function GetObject(id) {
        if (document.getElementById) { // browser recente
            return document.getElementById(id);
        } 
		else { // browser antigo
            div = eval("document."+id);
            form = eval("document.forms[0]."+id);

            if (div) {
                return div;
            } 
			else if (form) {
                return form;
            } 
			else {
                alert("N?o consegui detectar o tipo de "+id+"!!!");
            }
        }
    }
    function sw_help(theform){
        var gambi = GetObject('formulario');
        if(gambi.style.display == ''){
                gambi.style.display ='none';
        }
        else{
            gambi.style.display ='';
        }
        
    }

/* --------------------------------------------------------------- */
/* --------------------------------------------------------------- */
/* --------------------------------------------------------------- */
/* --------------------------------------------------------------- */

function LimparNovo(valor, validos) {
	var result = "";
	var aux;
	for (var i=0; i < valor.length; i++) {
		aux = validos.indexOf(valor.substring(i, i+1));
		if (aux >=0) {
			result += aux;
		}
	}
	return result;
}

//Formata n?mero tipo moeda usando o evento onKeyDown

function FormataNovo(campo,teclapres) {
	tammax = 20;

	var tecla = (window.Event) ? teclapres.which : teclapres.keyCode;

	vr = LimparNovo(campo.value,"0123456789");
	tam = vr.length;

	if(tam < tammax && tecla != 8) { 
		tam = vr.length + 1;
	}

	if(tecla == 8 ) { 
		tam = tam - 1;
	}

	if( tecla == 8 || tecla >= 48 && tecla <= 57 || tecla >= 96 && tecla <= 105 ) {
		dec=2
		if( tam <= dec ) {
			campo.value = vr;
		}

		if((tam > dec) && (tam <= 5)) {
			campo.value = vr.substr( 0, tam - 2 ) + "," + vr.substr( tam - dec, tam ); 
		}
		if((tam >= 6) && (tam <= 8)) {
			campo.value = vr.substr( 0, tam - 5 ) + "." + vr.substr( tam - 5, 3 ) + "," + vr.substr( tam - dec, tam); 
		}
		if((tam >= 9) && (tam <= 11)) {
			campo.value = vr.substr( 0, tam  - 8 ) + "." + vr.substr( tam  - 8, 3 ) +  "." + vr.substr( tam - 5, 3 ) + "," + vr.substr( tam - dec, tam ); 
		}
		if((tam >= 12) && (tam <= 14)) {
			campo.value = vr.substr( 0, tam - 11 ) + "." + vr.substr( tam - 11, 3 ) + "." + vr.substr( tam - 8, 3 ) + "." + vr.substr( tam - 5, 3 ) + "," + vr.substr( tam - dec, tam ); 
		}
		if( (tam >= 15) && (tam <= 17) ) {
			campo.value = vr.substr( 0, tam - 14 ) + "." + vr.substr( tam - 14, 3 ) + "." + vr.substr( tam - 11, 3 ) + "." + vr.substr( tam - 8, 3 ) + "." + vr.substr( tam - 5, 3 ) + "," + vr.substr( tam - 2, tam ) ;
		}
	} 
}



// ######################### FIELD MASK ########################### //
// #### [dFilter] - A Numerical Input Mask for JavaScript      #### //
// #### Please reuse & redistribute while keeping this notice  #### //
// #### Original by Dwayne Forehand - March 27th, 2003         #### //
// #### Enhanced by Marcos Araujo Sobrinho - August 15th, 2003 #### //
// #### Refactored by Marcos Araujo Sobrinho - May 25th, 2005  #### //
// ################################################################ //

/**
 * Define m?scara de formata??o - Sentido comum
 * @author Marcos Araujo Sobrinho <marcosa@catho.com.br>
 * @todo Permitir que entrem letras minusculas
 * @todo Remover as 3 verificacoes parecidas e transforma-las em uma pequena fun??o
 * @todo Verificar o motivo de MaskGetSelSize() e MaskGetCursorPos() n?o funcionarem no Opera
 * @see MaskTab(), MaskSetCursorPos(), MaskGetSelSize()
 */
function Mask(key, textbox, Mask, reverse) {

	if (textbox.value == "0,00")
		textbox.value="";

	if (!reverse) reverse = false;
	var MaskPos;
	var NewKey;
	var MaskNum		= textbox.value.replace(/[^0-9|a-z]/gi, "");
	var MaskType	= Mask.replace(/[^a|n|x|m|#]/gi, "");

	/* ARRUMAR - pegar tamanho da sele??o, est? dando problema no Opera */
	//if (key!=9 && MaskGetSelSize(textbox) > 0) { // apaga textbox quando selecionado
	//	MaskNum = "";
	//	textbox.value="";
	//}

	if (key==9) { //tab
		return true;
	} else if (key==8 || key==46) { //del/backspace
		if(MaskNum.length != 0) {
			MaskNum = MaskNum.substring(0,MaskNum.length-1);
		}
	} else if (MaskNum.length < MaskType.length) {
		if (key > 95 && key < 106) key = (key-48); //keypad
		NewKey = String.fromCharCode(key);
		MaskPos = MaskType.charAt(MaskNum.length);
		if (((MaskPos == '#' || MaskPos == 'N' || MaskPos == 'M' || MaskPos == 'm') && '0123456789'.indexOf(NewKey) != -1) ||
			((MaskPos == 'A' || MaskPos == 'X' || MaskPos == 'M') && 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.indexOf(NewKey) != -1) ||
			((MaskPos == 'a' || MaskPos == 'x' || MaskPos == 'm') && 'abcdefghijklmnopqrstuvwxyz'.indexOf(NewKey) != -1) ||
			((MaskPos == 'A' || MaskPos == 'a') && '.,;:?!@#$%*()-_=+?`"\'\\/<>{}[]'.indexOf(NewKey) != -1)){
			MaskNum += NewKey;
		} else {
			return false; // tipo de dado inv?lido
		}
	}

	var MaskFinal='';
	var CursorPos = MaskNum.length;
	if (!reverse) {
		for (MaskStep = 0; MaskStep < Mask.length; MaskStep++) {
			MaskPos = Mask.charAt(MaskStep);
			if (MaskPos == '#' || MaskPos == 'A' || MaskPos == 'a' || MaskPos == 'N' || MaskPos == 'X' || MaskPos == 'x' || MaskPos == 'M' || MaskPos == 'm') {
				if (MaskNum.length!=0) {
					MaskFinal = MaskFinal + MaskNum.charAt(0);
					MaskNum = MaskNum.substring(1,MaskNum.length);
				} else {
					MaskFinal = MaskFinal + '  '; // espa?ador
				}
			} else if (MaskPos != '#' && MaskPos != 'A' && MaskPos != 'a' && MaskPos != 'N' && MaskPos != 'X' && MaskPos != 'x' && MaskPos != 'M' && MaskPos != 'm') {
				MaskFinal = MaskFinal + Mask.charAt(MaskStep);
				if (MaskNum.length > 0) CursorPos++;
			}
		}
		textbox.value = MaskFinal;
		MaskSetCursorPos(textbox,CursorPos);
	} else {
		for (MaskStep = Mask.length; MaskStep >= 0; MaskStep--) {
			MaskPos = Mask.charAt(MaskStep);
			if (MaskPos == '#' || MaskPos == 'A' || MaskPos == 'a' || MaskPos == 'N' || MaskPos == 'X' || MaskPos == 'x' || MaskPos == 'M' || MaskPos == 'm') {
				if (MaskNum.length!=0) {
					MaskFinal =  MaskNum.charAt((MaskNum.length-1)) + MaskFinal;
					MaskNum = MaskNum.substring(0,(MaskNum.length-1));
					if (MaskNum.length == 0) break;
				}
			} else if (MaskNum.length>0) {
				MaskFinal = Mask.charAt(MaskStep) + MaskFinal;
			}
		}
		textbox.value = MaskFinal;
		MaskSetCursorPos(textbox,0);
	}

	return false;
}

/**
 * Permite que mude de campo pressionando <TAB>
 * @author Marcos Araujo Sobrinho <marcosa@catho.com.br>
 * @see Mask()
 */
function MaskTab(key) {
	if (key==9) return true;
	return false;
}

/**
 * Posiciona cursor em posi??o desejada do TextBox
 * @author Marcos Araujo Sobrinho <marcosa@catho.com.br>
 * @see Mask()
 */
function MaskSetCursorPos(field,pos) {
	if (field.createTextRange) { // IE
		var r = field.createTextRange();
		r.moveStart('character', pos);
		r.collapse();
		r.select();
	} else { // FireFox
		field.selectionStart=pos;
		field.selectionEnd=pos;
	}
}

function MaskGetCursorPos(field) {
	if(field.selectionEnd) return field.selectionEnd;

	if(field.createTextRange) {
		var d_range = this.window.document.selection.createRange();
		var f_range = field.createTextRange();
		f_range.setEndPoint('EndToStart', d_range);
		return f_range.text.length;
	}

	return field.value.length; // sucks
}


/**
 * Calcula tamanho da sele??o de texto de um TextBox
 * @author Marcos Araujo Sobrinho <marcosa@catho.com.br>
 * @see Mask()
 */
function MaskGetSelSize(field) {
	var i=-1;

	if(document.selection && field.createTextRange) { // IE
		var sel, rng, r2;
		sel=document.selection;
		if(sel){
			r2=sel.createRange();
			rng=field.createTextRange();
			rng.setEndPoint("EndToStart", r2);
			i=rng.text.length;
		}
	} else { // Firefox
		i = field.selectionEnd-field.selectionStart;
	}
	return i;
}

function limpaCampo(OBJ) {
	if (OBJ.value=="0,00") {
		OBJ.value="";
	}
}

function formatarNumeroDigitadoOnKeyUp(OBJ){
	var decimal,inteiro;
	var i,count;

	if (OBJ.value=="0,00") {
		OBJ.value="";
	}

	STR = new String(excluiCaracteresInvalidos(OBJ.value));
	STR = tirarZerosEsquerda(STR);
	inteiro='';
	if (STR.length == 1) {
		  inteiro  = '0';
		  decimal = '0' + STR;
	} else { 
		if (STR.length == 2) {
			inteiro  = '0';
			decimal = STR;
		} else {
			decimal = STR.substring(STR.length-2,STR.length);
			i=3;
			count=0;

			while (i<=STR.length){
		 		if (count==3) {
					inteiro = '.' + inteiro;
					count = 0;
				}
			    inteiro = STR.charAt(STR.length-i) + inteiro;
				count++;
				i++;
			}
		}
	}
     
	if (inteiro == '') {
		inteiro = '0';
	}
  
	if (decimal == '') {
	  decimal = '00';
	}
	OBJ.value = inteiro+','+decimal;

}

function excluiCaracteresInvalidos(S) { // Deixa so os digitos no numero
	var Digitos = "0123456789";
	var temp = "";
	var digito = "";
	for (var i=0; i<S.length; i++) {
		digito = S.charAt(i);
		if (Digitos.indexOf(digito)>=0) {
			temp=temp+digito
		}
	}
	return temp
}


function formatarNumeroDigitadoOnKeyDown(OBJ,e) {
	var decimal,inteiro;
	var i,count;
	STR = new String(OBJ.value);
  
	inteiro='';
	if(document.all) {
  		tecla =  event.keyCode;
	} else {
		tecla = e.which;
  	}

	if (OBJ.maxLength > STR.length){     
	  	STR = tirarZerosEsquerda(STR); //ESTA FUNCAO TIRA TAMBEM PONTO E VIRGULA
	  	if (((tecla > 47) && (tecla < 59)) || ((tecla > 95) && (tecla < 106))   ){
			if (STR.length == 0){
				inteiro  = '0';
				decimal = '0' + STR;
			} else { 
				if (STR.length == 1){
				    inteiro  = '0';
			    	decimal = STR;
				} else{
				    decimal = STR.substring(STR.length-1,STR.length);
				    i=2;
				    count=0;
			    	while (i<=STR.length){
			 			if (count==3) {
				  	  		inteiro = '.' + inteiro;
					  		count = 0;
				  		}
				      	inteiro = STR.charAt(STR.length-i) + inteiro;
			  			count++;
			  			i++;
				    }
				}
			}   
		} else { 
		    if (tecla == 8){
	    		if (STR.length == 0){
					inteiro  = '0';
					decimal = '000';
				} else { 
					if (STR.length == 1){
				    	inteiro  = '0';
					    decimal = '00' + STR;
					} else { 
				    	if (STR.length == 2){
			          		inteiro  = '0';
						    decimal = '0' + STR;
			    	 	} else {
		 			   		decimal = STR.substring(STR.length-3,STR.length);
					   		i=4;
	    	 				count=0;
					   		while (i<=STR.length){
			 			 		if (count==3) {
								   inteiro = '.' + inteiro;
								   count = 0;
						    	}
					      		inteiro = STR.charAt(STR.length-i) + inteiro;
								count++;
								i++;
					   		}
			    	 	}
				  	} 
		      	}
	    	} else {
	    		if (STR.length == 1){
		 			inteiro  = '0';
			    	decimal = '0' + STR;
				} else { 
					if (STR.length == 2){
						inteiro  = '0';
						decimal = STR;
					} else {
						decimal = STR.substring(STR.length-2,STR.length);
					  	i=3;
					  	count=0;
					  	while (i<=STR.length){
			 				if (count==3) {
								inteiro = '.' + inteiro;
					  			count = 0;
							}	
					    	inteiro = STR.charAt(STR.length-i) + inteiro;
							count++;
							i++;
					  	}
					}
				}        
			}
		}
	  
		if (inteiro == '') {
			inteiro = '0';
		}
  
		if (decimal == '') {
			decimal = '00';
		}
		OBJ.value = inteiro+','+decimal;
	}
}

function formatadornovo(param){
	if(!param)
		return param;

	var adicionazero = param.split(",");
	var valor1 = adicionazero[0];
	var valor2 = adicionazero[1];
	if ( adicionazero[1] != null )	{	
		if( adicionazero[1].length == 1 )
			param = valor1 + "," + valor2 + "0";
		if( adicionazero[1].length > 2 )
			param = valor1	+ "," + valor2.substring(0,1) + valor2.substring(1,2);
	}
	if ( valor1 == 0 && valor1.length == 1 )
		return param;
	
	param = FormatCurrency(param,2);	
	return param;

	function GetDecimalDelimiter(nCountryCode){
		var sRet='';
	    switch (nCountryCode){
            case 3:   
	        	sRet = '#';
	        	break;
	        case 2:   
				sRet = ',';
	            break;
	        default:
		        sRet = '.';
	        	break;
	    }
		return sRet;
	}
	
	function GetCommaDelimiter(nCountryCode){
		var sRet='';
		switch (nCountryCode){
	    	case 3:   
	        	sRet = '*';
	            break;
	        case 2:   
	        	sRet = '.';
	            break;
	        default:
	        	sRet = ',';
	            break;
        }
       	return sRet;
	}

	function FormatClean(num){
	    var sVal='';
	    var nVal = num.length;
	    var sChar='';
		try{
	    	for(i=0;i<nVal;i++){
	       		sChar = num.charAt(i);
	        	nChar = sChar.charCodeAt(0);
	         	if ((nChar >=48) && (nChar <=57)){ 
	         		sVal += num.charAt(i);   
	         	}
	      	}
	   	}catch (exception) {
	   		AlertError("Format Clean",e); 
	   	}
	    return sVal;
	}
 
	function FormatCurrency(num,nCountryCode){       
	    var sVal='';
	    var minus='';
	    var Decimal='';
	    Decimal = GetDecimalDelimiter(nCountryCode);
	    if (num.lastIndexOf("-") == 0){
	    	minus='-'; 
	    }
	    if (num.lastIndexOf(Decimal) < 0){
	    	num = num + '00'; 
	    }
	    num = FormatClean(num);
	    sVal = minus + FormatDollar(num,GetCommaDelimiter(nCountryCode)) + GetDecimalDelimiter(nCountryCode) + 
	
		FormatCents(num); 
	    return sVal;
	}

	function FormatNumber(num,nCountryCode){       
		var sVal='';
    	var minus='';
    	var CommaDelimiter='';
    	try{
        	CommaDelimiter = GetCommaDelimiter(nCountryCode);
	        if (num.lastIndexOf("-") == 0){
	        	minus='-'; 
	        }
           	num = FormatClean(num);
           	num = parseInt(num);
           	var samount = new String(num);
           	for (var i = 0; i < Math.floor((samount.length-(1+i))/3); i++){
            	samount = samount.substring(0,samount.length-(4*i+3)) + CommaDelimiter + 
				samount.substring(samount.length-(4*i+3));
           	}
    	}catch (exception) {
    		AlertError("Format Number",e); 
    	}
        return minus + samount;
	}

	function FormatCents(amount){
		var cents = '';
    	try{
	    	amount = parseInt(amount);
	        var samount = new String(amount);
	        
	        if (samount.length == 0){ 
	        	return '00'; 
	        }
	        if (samount.length == 1) {
	        	return '0' + samount; 
	        }
	        if (samount.length == 2) {
	        	return samount; 
	        }
	        cents =  samount.substring(samount.length -2,samount.length);
		}catch (exception) {
	    	AlertError("Format Cents",e); 
		}
		return cents;
	}

	function FormatDollar(amount,CommaDelimiter){
		try{
	    	amount = parseInt(amount);
	        var samount = new String(amount);
	        if (samount.length < 3) { 
	        	return 0; 
	        }  
	        samount =  samount.substring(0,samount.length -2);
	        for (var i = 0; i < Math.floor((samount.length-(1+i))/3); i++){
				samount = samount.substring(0,samount.length-(4*i+3)) + CommaDelimiter + 
				samount.substring(samount.length-(4*i+3));
	        }
	   	}catch (exception) {
	   		AlertError("Format Comma",e); 
	   	}
	    return samount;
	}
	
	function AlertError(MethodName,e){
		if (e.description == null) { 
			alert(MethodName + " Exception: " + e.message); 
		}else{  
			alert(MethodName + " Exception: " + e.description); 
		}
	 }
}			
									

