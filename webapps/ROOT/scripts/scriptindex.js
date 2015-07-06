// ---------------------------------------------- MILONIC --------------------------------------------- //
_meH=1;  // keyword for milonic
_menuCloseDelay=500           // The time delay for menus to remain visible on mouse out
_menuOpenDelay=150            // The time delay before menus open on mouse over
_followSpeed=50               // Follow scrolling speed
_followRate=50                // Follow scrolling Rate
_subOffsetTop=10               // Sub menu top offset
_subOffsetLeft=-10             // Sub menu left offset
_scrollAmount=3               // Only needed for Netscape 4.x
_scrollDelay=20               // Only needed for Netcsape 4.x

// ---------------------------------------------- HTML EDITOR --------------------------------------------- //

function doOpenHE(action){
	var id = window.top.frames.top2.document.getElementById("id");
	id.value = document.getElementById("id").value;
	var idHE = window.top.frames.top2.document.getElementById("idHE");
	idHE.value = document.getElementById("idHE").value;
	window.top.frames.top2.doOpenHE(action);	
}

window.reloadContent = function(){
	window.focus();
	var idConteudo = window.top.frames.top2.getLocation();
	if ( idConteudo == null )
		window.location.href = "/index.jsp";
	else
		window.location.href = "/index.jsp?conteudo="+idConteudo;
}

function gotoMenu(){
	window.location.href = "/siteadmin/menu.jsp";
}

function closePage(){
	window.top.frames.top2.closeEditor();
}

// ---------------------------------------------- MARQUEE --------------------------------------------- //

function stopMarquee(obj){
	obj.stop();
}

function playMarquee(obj){
	obj.start();
}

// ---------------------------------------------- MISC --------------------------------------------- //

	function on_load() {
		atualizaData();
	}
	
	function atualizaData() {
        c = document.getElementById("hoje");
        if (c != null) {
                c.innerHTML = '<div style="font-family:verdana; color: #5F5E5E; font-size: 10px">' + hoje() + '</div>';
        }
	}

	function buildEnquete(x, numero){
	   var width = 520;
	   var height = 450;
	   
	   var left = 99;
	   var top = 99;   
	
	   var url = "/enquete/resultadoenquete.jsp?result=" ;
	   var ok = false;
	   for ( var i = 1; i <= numero; i ++ ){ 
			if ( document.getElementById(x + i).checked ){ 
				url += document.getElementById(x + i).value;
	  			ok = true; 
				break;
			}
	   }
	
	   if ( !ok ){
			alert("Voc? tem que escolher uma op??o");
			return ;
	   }
	
	   window.open(url, 'Enquete', 'width='+width+', height='+height+', top='+top+', left='+left+', scrollbars=no, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no');
	}


	function openWindow(url){
	   var width = 569;
	   var height = 450;
	   
	   var left = 99;
	   var top = 55;   
	
	   window.open(url, 'Programas', 'width='+width+', height='+height+', top='+top+', left='+left+', scrollbars=yes, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no');
	}
	
	function img_on(img){
		oimg=gmobj(img)
		oimg.src="/images/"+img+"_over.gif"
	}
	
	function img_off(img){
		oimg=gmobj(img)
		oimg.src="/images/"+img+".gif"
	}
	
	function m_over(obj, img) {
		obj.src = "img/"+img+"on.gif";
	}

	function m_out(obj, img) {
		obj.src = "img/"+img+"off.gif";
	}	
	
	function hoje() {
	
	var day="";
	var month="";
	var myweekday="";
	var year="";
	newdate = new Date();
	mydate = new Date();
	dston =  new Date('April 4, 1999 2:59:59');
	dstoff = new Date('october 31, 1999 2:59:59');
	var myzone = newdate.getTimezoneOffset();
	newtime=newdate.getTime();
	
	var zone = 6;  // references your time zone
	
	if (newdate > dston && newdate < dstoff ) {
	zonea = zone - 1 ;
	dst = "  Pacific Daylight Savings Time";
	}
	else {
	zonea = zone ; dst = " Hor???rio de Bras???lia - Brasil";
	}
	var newzone = (zonea*30*30*1000);
	newtimea = newtime+(myzone*30*1000)-newzone;
	mydate.setTime(newtimea);
	myday = mydate.getDay();
	mymonth = mydate.getMonth();
	myweekday= mydate.getDate();
	myyear= mydate.getYear();
	year = myyear;
	
	if (year < 2000)    // Y2K Fix, Isaac Powell
	year = year + 1900; // http://onyx.idbsu.edu/~ipowell
	myhours = mydate.getHours();
	if (myhours >= 12) {
	myhours = (myhours == 12) ? 12 : myhours - 12; mm = " ";
	}
	else {
	myhours = (myhours == 0) ? 12 : myhours; mm = " ";
	}
	myminutes = mydate.getMinutes();
	if (myminutes < 10){
	mytime = ":0" + myminutes;
	}
	else {
	mytime = ":" + myminutes;
	};
	arday = new Array("Domingo"," Segunda-feira","Ter&ccedil;a-feira","Quarta-feira","Quinta-feira","Sexta-feira","S&aacute;bado")
	armonth = new Array("Janeiro ","Fevereiro","Mar&ccedil;o ","Abril ","Maio","Junho ","Julho ","Agosto ","Setembro ", "Outubro ","Novembro ","Dezembro ")

	var cHoje = ( arday[myday] +", " + myweekday + " de " + armonth[mymonth] + " de " + year);
	
	return cHoje;
	}
	
	//SUPORTE MULTI LINGUA RAFAEL LIMA
	
	function on_load(lingua) {
		atualizaData(lingua);
	}
	
	function atualizaData(lingua) {
        c = document.getElementById("hoje");
        if (c != null) {
                c.innerHTML = '<div style="font-family:verdana; color: #5F5E5E; font-size: 10px">' + hoje(lingua) + '</div>';
        }
	}
	

    function hoje(lingua) {
     	var day="";
    	var month="";
    	var myweekday="";
    	var year="";
    	newdate = new Date();
    	mydate = new Date();
    	dston =  new Date('April 4, 1999 2:59:59');
    	dstoff = new Date('october 31, 1999 2:59:59');
    	var myzone = newdate.getTimezoneOffset();
    	newtime=newdate.getTime();
    	
    	var zone = 6;  // references your time zone
    	
    	if (newdate > dston && newdate < dstoff ) {
    	zonea = zone - 1 ;
    	dst = "  Pacific Daylight Savings Time";
    	}
    	else {
    	zonea = zone ; dst = " Hor???rio de Bras???lia - Brasil";
    	}
    	var newzone = (zonea*30*30*1000);
    	newtimea = newtime+(myzone*30*1000)-newzone;
    	mydate.setTime(newtimea);
    	myday = mydate.getDay();
    	mymonth = mydate.getMonth();
    	myweekday= mydate.getDate();
    	myyear= mydate.getYear();
    	year = myyear;
    	
    	if (year < 2000)    // Y2K Fix, Isaac Powell
    	year = year + 1900; // http://onyx.idbsu.edu/~ipowell
    	myhours = mydate.getHours();
    	if (myhours >= 12) {
    	myhours = (myhours == 12) ? 12 : myhours - 12; mm = " ";
    	}
    	else {
    	myhours = (myhours == 0) ? 12 : myhours; mm = " ";
    	}
    	myminutes = mydate.getMinutes();
    	if (myminutes < 10){
    	mytime = ":0" + myminutes;
    	}
    	else {
    	mytime = ":" + myminutes;
    	};
    	var cHoje = "";
    	if(lingua == 1){
        	arday = new Array("Domingo"," Segunda-feira","Ter&ccedil;a-feira","Quarta-feira","Quinta-feira","Sexta-feira","S&aacute;bado")
        	armonth = new Array("Janeiro ","Fevereiro ","Mar&ccedil;o ","Abril ","Maio ","Junho ","Julho ","Agosto ","Setembro ", "Outubro ","Novembro ","Dezembro ")
        	cHoje = ( arday[myday] +", " + myweekday + " de " + armonth[mymonth] + " de " + year);
    	}else if(lingua == 2){
    	    //Example: Sunday, January 6, 2008 
        	arday = new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")
        	armonth = new Array("January","February","March","April","May","June","July","August","September", "October","November","December")
        	cHoje = ( arday[myday] +", " + armonth[mymonth] +" "+ myweekday +", "+ year);
    	}else if(lingua == 3){
    	    //Exemplo: domingo, 6 de enero de 2008
        	arday = new Array("Domingo","Lunes","Martes","Mi&eacute;rcoles","Jueves","Viernes","S&aacute;bado")
        	armonth = new Array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre", "Octubre","Noviembre","Diciembre")
        	cHoje = ( arday[myday] +", " + myweekday + " de " + armonth[mymonth] + " de " + year);
    	}else{
        	arday = new Array("Domingo"," Segunda-feira","Ter&ccedil;a-feira","Quarta-feira","Quinta-feira","Sexta-feira","S&aacute;bado")
        	armonth = new Array("Janeiro ","Fevereiro ","Mar&ccedil;o ","Abril ","Maio ","Junho ","Julho ","Agosto ","Setembro ", "Outubro ","Novembro ","Dezembro ")
        	cHoje = ( arday[myday] +", " + myweekday + " de " + armonth[mymonth] + " de " + year);
    	}
    	
    	return cHoje;
	}


// ---------------------------------------------- SWAP - IMAGE --------------------------------------------- //
	
	function MM_reloadPage(init) {  //reloads the window if Nav4 resized
	  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
	    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
	  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
	}
	MM_reloadPage(true);
	
	function MM_swapImgRestore() { //v3.0
	  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
	}
	
	function MM_preloadImages() { //v3.0
	  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
	    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
	    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
	}
	
	function MM_findObj(n, d) { //v4.0
	  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
	    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
	  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
	  if(!x && document.getElementById) x=document.getElementById(n); return x;
	}
	
	function MM_swapImage() { //v3.0
	  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
	   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
	}
	
	function MM_showHideLayers() { //v3.0
	  var i,p,v,obj,args=MM_showHideLayers.arguments;
	  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
	    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v='hide')?'hidden':v; }
	    obj.visibility=v; }
	}
	
	function MM_goToURL() { //v3.0
	  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
	  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
	}
		
		
// ____________------------------------------- marquee ---------------------------------------


		var pausetime = 4000;
		var msginc = 30;
		var interval = 5;
		var ppat = new Array();
		var ipat = new Array();
		var wraptime = false;

		var direction = 'up';
		var dpat = new Array('left','left','left','left');

		var transition = 'contig';
		var tpat = new Array('cover','uncover','contig');

		var bgcolor = 'pattern';
		var cpat = new Array('#E7E7E7');

		var mhalign = 'center';	
		var mvalign = 'middle';	
		var csspat = new Array();

		var dispv = 5;		
		var disph = 5;		

		var nsafe = false;	

		mdump = true;
		dumptest = false;		