/*este ? o arquivo .js para o formu?rio do site da relato obs. este conte?do foi estraido 
do site www.editoracontexto.com.br ? necess?rio os arquivos js do site para que sejam 
reconhecido java script no formulario 25/02/2008 wilson arquivos common.js,menu.js,simple_menu.jsp exite o nome do formul?rio
? formul?rioecommerce.jsp */

//chama o popup de imagens
function popupWin(URL,name,features,steal_focus) 
{
	if(!steal_focus)steal_focus = true;
  	var win = window.open(URL,name,features);
  	if(steal_focus)win.focus();
}//popuWin

//janela de confirma??????o
function confirmSubmit(msg)
{
   var agree = confirm(msg);
   if(agree)return true ;
	else return false ;
}

//muda o html de um objeto
function changeObjHTML(id, html)
{
	document.getElementById(id)['innerHTML'] = html;
}//changeObjHTML

//muda o estilo de um objeto
function changeObjStyle(id, atrb, style)
{
	document.getElementById(id).style[atrb] = style;
}//ShowText          

function changeValue(input_id, value)
{                                    
	document.getElementById(input_id).value = value;	
}//changeValue

function copyValue(source_id, target_id)
{
	document.getElementById(target_id).value = document.getElementById(source_id).value;
}//changeValue

function addToValue(input_id, value)
{                                    
	document.getElementById(input_id).value += value;	
}//changeValue

function hide(id)
{
	changeObjStyle(id, 'display', 'none');
}//hide

function un_hide(id)
{
	changeObjStyle(id, 'display', '');
}//un_hide

function changeSRC(id, src)
{
	document.getElementById(id).src = src;
}//changeSRC

function btnOn(id)
{
	src = document.getElementById(id).src;
	if(src.indexOf('_off') > 0)src = src.replace('_off','_on');
	changeSRC(id, src);
}//btnOn

function btnOff(id)
{
	src = document.getElementById(id).src;
	if(src.indexOf('_on') > 0)src = src.replace('_on','_off');
	
	changeSRC(id, src);
}//btnOff

//tira um elemento de um array
function delFromAssoc(arr, element)
{
	var new_arr = new Array();
	for(key in arr)if(key != element)new_arr[key] = arr[key];
	return new_arr;
}//delFromAssoc

//pega s? o nome do arquivo de uma URL
function getFileName(URL)
{
    if(URL.indexOf('/' != -1)) 
    {
        var url_arr = URL.split('/');
        return url_arr[url_arr.length - 1];
    }//if /
}//getFileName

function checkPopupBlocker(alert_msg)
{
	var popup = window.open('','p','width=1,height=1,left=0,top=0,scrollbars=no');
	if(popup)
	{
		var blocker = false;
		popup.close();
	}
	else var blocker = true;
	if(alert_msg)alert(alert_msg);
	return blocker;
}//checkPopupBlocker

function targetOpener(link, close)
{
	if(!(window.focus && window.opener))return true;
	window.opener.focus();
	window.opener.location.href = link.href;
	if(close)window.close();
	return false;
}//targetopener

function windowResize(width, height)
{
	window.resizeTo(width, height);
}//windowResize

function windowMaximize()
{
	window.moveTo(0,0);
	window.resizeTo(screen.width, screen.height);	
}//windowMaximize

//define html de um fckeditor
function setFCKHTML(value, ins_name)
{
	var editor = FCKeditorAPI.GetInstance(ins_name);
  	return editor.SetHTML(value);
}//setFCKHTML
//fim do common.js

startList = function() {
	if (document.all&&document.getElementById) {
		navRoot = document.getElementById("nav");
		for (i=0; i<navRoot.childNodes.length; i++) {
			node = navRoot.childNodes[i];
			if (node.nodeName=="LI") {
				node.onmouseover=function() {
					this.className+=" over";
				}
				node.onmouseout=function() {
					this.className=this.className.replace(" over", "");
				}
			}
		}
	}
}
window.onload=startList;
//fim do menu.js


function setActiveLink(menu_id)
{
	var menu = document.getElementById(menu_id);
	var cur_file = getFileName(document.URL);	
	var menu_itens = menu.childNodes;
	for(var li = 0; li < menu_itens.length; li++)
	{
		var itens = menu_itens[li].childNodes;
		for(var i = 0; i < itens.length; i++)
		{
			if(itens[i].tagName == 'A' && getFileName(itens[i].href) == cur_file)
			{
				var active_text = itens[i].innerHTML;
				menu_itens[li].innerHTML = active_text;
				menu_itens[li].className = active_class;
			}//if
		}//for i
		if(active_text)break;
	}//for li	
}//setActiveLink
//fim do simple menu.js



