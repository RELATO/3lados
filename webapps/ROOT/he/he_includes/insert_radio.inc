<script language=JavaScript>
window.onload = this.focus
window.opener.doStyles()

function printStyleList() {
	if (window.opener.document.getElementById("sStyles") != null) {
		document.write(window.opener.document.getElementById("sStyles").outerHTML);
		document.getElementById("sStyles").className = "text70";
		document.getElementById("sStyles").options[0] = null;
		document.getElementById("sStyles").options[0].text = "";
		document.getElementById("sStyles").onchange = null;  
		document.getElementById("sStyles").onmouseenter = null; 
	} else {
		document.write("<select id=sStyles class=text70><option selected></option></select>")
	}
}

var error
function InsertRadio() {
	var sel = window.opener.document.selection;
	if (sel!=null) {
		var rng = sel.createRange();
	   	if (rng!=null) {
			name = document.radioForm.radio_name.value
			value = document.radioForm.radio_value.value
			checked = document.radioForm.radio_type[radioForm.radio_type.selectedIndex].text
			styles = document.radioForm.sStyles[radioForm.sStyles.selectedIndex].text

		if (value != "") {
			value = ' value="' + value + '"'
		} else {
			value = ""
		}

		if (name != "") {
			name = ' name="' + name + '"'
		} else {
			name = ""
		}

		if (checked == "Unchecked"){
			checked = ""
		}

		if (styles != "") {
			styles = " class=" + styles
		} else {
			styles = ""
		}

		HTMLTextField = '<input type=radio ' + checked + name + value + styles + '>'
		// window.opener.foo.focus();
		rng.pasteHTML(HTMLTextField)
		
		} // End if
	} // End If

	if (error != 1) {
		self.close();
	}
} // End function

document.onkeydown = function () { 
			if (event.keyCode == 13) {	// ENTER
				InsertRadio()
			}
};

document.onkeypress = onkeyup = function () {
	if (event.keyCode == 13) {	// ENTER
	event.cancelBubble = true;
	event.returnValue = false;
	return false;			
	}
};

</script>
<title><%=sTxtInsertRadio%></title>
<link rel="stylesheet" href="he_includes/he_styles.css" type="text/css">
<body bgcolor=threedface style="border: 1px buttonhighlight;">
<form name=radioForm>
<div class="appOutside">
<div style="border: solid 1px #000000; background-color: #FFFFEE; padding:5px;">
	<img src="he_imagens/popups/bulb.gif" align=left width=16 height=17>
	<span><%=sTxtInsertRadioInst%></span>
</div>
<br>
	  
<table border="0" cellspacing="0" cellpadding="5" style="width:92%">
  <tr>
	<td class="body" width="80"><%=sTxtName%>:</td>
	<td class="body" width="190">
	  <input type="text" name="radio_name" size="10" class="Text70" maxlength="50">
  </td>
	<td class="body" width="90"><%=sTxtInitialValue%>:</td>
	<td class="body">
	  <input type="text" name="radio_value" size="10" class="Text70">
	</td>
  </tr>
  
  <tr>
	<td class="body" width="90"><%=sTxtInitialState%>:</td>
	<td class="body">
	  <select name="radio_type" class=text70>
		<option>Checked</option>
		<option selected>Unchecked</option>
	  </select>
	</td>
	<td class="body"><%=sTxtStyle%>:</td>
	<td class="body"><script>printStyleList()</script></td>
  </tr>
</table>

</div>
<div style="padding-top: 6px; float: right;">
<input type="button" name="insertRadio" value="<%=sTxtOK%>" class="Text75" onClick="javascript:InsertRadio();">
<input type="button" name="Submit" value="<%=sTxtCancel%>" class="Text75" onClick="javascript:window.close()">
</div>

</form>