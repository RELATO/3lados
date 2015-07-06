<html>

<head>

<script>
function gerar(){
	var obj = document.getElementById("resp");
	var r = "";
	if ( enquete.respostas.value != "" ){
		var count = parseInt(enquete.respostas.value);
		r += "<span id=\"resp\">"
		for ( var i = 1; i <= count; i ++ ){
			r += "Resposta " + i + ": <input type=\"text\" name=\"r"+i+"\" size=\"10\" maxlength=\"10\"><br>"
		}
		r += "</span>"
		obj.innerHTML = r;
	}else{
		alert("Digite um número de respostas!!");
	}
}
</script>

</head>

<body>

<br><br>
<form name="enquete" action="geraenquete.jsp" method="GET">
Pergunta: <input type="text" name="pergunta" size="30" maxlength="30">
<br><br>
Número de repostas: <input type="text" name="respostas" size="2"> até 3 respostas.
<br>
<input type="button" value=" Gerar respostas " onClick="gerar()">
<br>
<br>
<span id="resp"></span>

<br><br>
<input type="submit" value=" Gerar enquete ">
</form>
</body>

</html>