<html>
<head>
<%
	java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z");
	String text = sdf.format(date);
%>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" content="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="<%=text%>">
<META HTTP-EQUIV="Date" CONTENT="<%=text%>">
<script src="scripts/script.js"></script>
<script src="scripts/script-htmleditor.js"></script>
	<title>Email</title>


<script>
var iframeLoaded = false;
var checkLoaded;

this_page.loadIFrame = function(obj){
	frameXXX = obj;
}

this_page.loadedIFrame = function(){ 
	iframeLoaded = true;
}

this_page.loadIFrame = function(obj){
	frameXXX = obj;
}

function getData(){
	document.getElementById("content").value = intermediateGetData();	
	return true;
}

</script>

<%!
String htmlBody;

	 private String pegaUrl( String uri ) {

		 String cRetVal = "";
		 if (uri != null) { 
	 		if ( uri.lastIndexOf("/") > 0) {
	 			 cRetVal = uri.substring(0, uri.lastIndexOf("/"));
				 cRetVal = cRetVal.replaceAll(":80/","/");
			} else {
				 cRetVal = uri;
			}	 
			cRetVal = cRetVal.replaceAll(":80","/");
		 }
		 return cRetVal;
	 }
	 private String pegaUrlX( String uri ) {

		 String cRetVal = "";
		 if (uri != null) { 
	 		if ( uri.lastIndexOf("/") > 0) {
 			 	cRetVal = uri.substring(0, uri.lastIndexOf("/")+1);
				cRetVal = cRetVal.replaceAll(":80/","/").replaceAll("/","\\\\/");
			} else {
			 cRetVal = uri;
			}	 
		}
		return cRetVal;
	 }
			 
%>

<style type="text/css">
	* { font-size: 10px; font-family: Tahoma, Verdana, Arial }
	input, select { font-size: 11px; font-family: Tahoma, Verdana, Arial }
	input.textfield {width: 250px;}
	input.botaoesp {
		border: 1px solid white;
		background-color: black;
		color: white;
		font-weight: bolder;
		font-family: Verdana, Tahoma, Arial, sans-serif;
		font-size: 10px;
		height: 20px;
		width: 120px;
		text-align: center;
		}
	input.botaoespover {
		border: 1px solid black;
		background-color: white;
		color: black;
		font-weight: bolder;
		font-family: Verdana, Tahoma, Arial, sans-serif;
		font-size: 10px;
		height: 20px;
		width: 120px;
		text-align: center;
		cursor: pointer;
		}
</style>

</head>
<body bgcolor="#FFFFFF" style="font-family: Verdana, Tahoma, Arial">


<%
String hePath = "/he/";
int idConteudo = 1;
String titulo = "Teste";
String tipoConteudo = "C";
String acao = "I";

String urlEspecial = pegaUrlX(request.getServerName() + ":"  + request.getServerPort() + request.getRequestURI());
%>

<link rel="stylesheet" href="he_includes/he_styles.css" type="text/css">
<form action="/enviaemail" method="post" onSubmit="return getData()">
<input type="hidden" name="action">
<textarea name="content" id="content" style="display: none;"></textarea>
  <table align="center" bgcolor="#FFFFFF" width="800" cellpadding="0" cellspacing="0" style="border: 1px solid black; border-collapse: collapse; vertical-align: middle;">
    <tr>
      <td colspan="1" align="right">De:</td>
      <td colspan="4" align="left"><input class="textfield" type="text" name="from"></td>
    </tr>
	<tr>
      <td colspan="1" align="right">Para:</td>
      <td colspan="4" align="left"><input class="textfield" type="text" name="to">
		 (Somente para testes)</td>
    </tr>
	<tr>
      <td colspan="1" align="right">Assunto:</td>
      <td colspan="4" align="left"><input class="textfield" type="text" name="subject"></td>
    </tr>
	<tr height="30"> 
      <td colspan="5" align="center"> 
        <input type="submit" onClick="action.value='send'" name="enviar" value="Enviar" class="botaoesp" onMouseOver="this.className='botaoespover'" onMouseOut="this.className='botaoesp'">&nbsp;
        <input type="submit" onClick="action.value='test'" name="teste" value="Teste" class="botaoesp" onMouseOver="this.className='botaoespover'" onMouseOut="this.className='botaoesp'">
      </td>
    </tr>
	<td width="287"><tr style="vertical-align: middle">	
		<td colspan="5" height="480" align="center" style="vertical-align: middle; padding-top: 30px;" bgcolor="#FFFFFF">
		<textarea style=display:none id='HEControl_src'><link rel="stylesheet" href="he_includes/he_styles.css" type="text/css">
						<script language="JavaScript" src="he_includes/he_xhtml.js" type="text/javascript"></script>
					
					<script>
							var customInserts = [];
							var customLinks = [];
							var tableDefault = 1;
							var useBR = 0;
							var useXHTML = "0";
							var ContextMenuWidth = 225;
							var URL = "<%=pegaUrl(request.getServerName() + ":"  + request.getServerPort() + request.getRequestURI())%>";
							var ScriptName = "/heutil.jsp";
							var sTxtGuidelines = "Linhas-Guia";
							var sTxtOn = "Ativar";
							var sTxtOff = "Desativar";
							var sTxtClean = "Você tem certeza de que deseja limpar o código HTML?";
							// var re2 = /href="http:\/\/<%=request.getServerName()%>/g
							var re3 = /src="http:\/\/<%=urlEspecial%>/g
							var re4 = /src="http:\/\/<%=urlEspecial%>/g
							var re5 = /src="http:\/\/<%=urlEspecial%>/g
							var isEditingHTMLPage = 0;
							var pathType = 0;
							var imageDir = "/imagens";
							var flashDir = "/flash";
							var showThumbnails = 0;
							var showFlashThumbnails = 0;
							var disableImageUploading = 0;
							var disableImageDeleting = 0;
							var disableFlashUploading = 0;
							var disableFlashDeleting = 0;
							var HideWebImage = 0;
							var HideWebFlash = 0;
							var HTTPStr = "http";
							var spellLang = "portugese";
							var controlName = "HEControl_frame";
							var imageLibs = '<option value="/imagens">Biblioteca de Imagens Padrão</option><option value="/devedit/flash_test">Image Library #1</option><option value="/images/library_1/other">Image Library #2</option>';
							var flashLibs = '<option value="/flashdir">Biblioteca de Flash Padrão</option><option value="/flash_files">Flash Library #1</option><option value="/flash_files/other">Flash Library #2</option>';
							var myBaseHref = '';
							var deveditPath = '<%= hePath%>';
							var deveditPath1 = '<%= hePath%>';
					</script>

					<script language = JScript.Encode>#@~^ToIAAA==[^Px,NKmEs+	OR^lz+M/I[mP',[W1E:UORmV^iL+~x,NGm!h+	Y LY2sns+UY~z&NIS/,'PSk	[WSRdk9+8CMi\m.Ps/o{vvi6E	mOkGU,xn:vb	M+O;MxPO.!+NiSr	NGSRKx+MDK.P{PU+si-CMPwlfi@#@&d6;UmDkKx~/OCMY92vbPP@#@&7i0WG 9W^Esn	Y 9+kko	HK[+,'~B}xvI@#@&did+D.l^;n`*@#@&@#@&d7r6PcYm8VfnWmEVO~e'~!*~P@#@&idiYWTo^nAKD[+M/cbp@#@&i78@#@&diWGW`IdPxPWGKRsW1CYbWU 4D+W@#@&d7/m-CrkYKDXv0ms/#@#@&idrUbYsKG`*@#@&i7d+DKb:nW;OvJ;w9CY.Cs!+`bIr~q!ZT*i@#@&diNW\WKh`.WG:Uk"n*@#@&@#@&dizz,dnY,N0CEsO,4Cm0LDKEU[,mWsGMPG0,^KVGMP9DWaP9Gh	@#@&diNG^!:+	ORT+YAsn:xDAzq[cr0GxD/W^W.E*R/Oz^+ 4m^0o.KE	NZKVK.P{PEaZ!TTZ!J@#@&diNW1;h+	YconY3s:nxD$X&NcE6WxOubo4VbL4YE*RkYX^+c8l13LDKEU[;WVK.P{PJ[oosw!ZJ@#@&@#@&i8@#@&@#@&d6EU^DkWU~9WPWKs(l.v#,	@#@&@#@&7db0~`NrOtWN6x,'',O.E#@#@&7d`@#@&@#@&dir0,`WGKRNG^!:nxD k+smDkW	RDzwPZ',J/G	YDKsJ*P	@#@&@#@&idikWPc[Km;:UYconOAV+hn	Y$X&[vJWKxDfDKwrbPe'~x!Vsb,	@#@&7did0KUO1m:PxPWGKR[W1;:xO $E+.z;Wh:mU9.C^E`BwW	O1m:nB*@#@&7iddbWPv`0KUO1m:Px'~U!Vs#,ku,`WG	Y1ChPx',Er#b,	@#@&didi70KxO1m:n~{PJwGxDJ@#@&77di8@#@&7d7N@#@&@#@&i7db0~c9Wm;hxORTnD2s:xY~X&[`r/ryf.GaJ#,Z',xE^sbPP@#@&d7d7WKxO?b"+,'~WKWR[G1Eh+	Oc;;DHZWs:mUNjlsE`voKxYUryB#@#@&7didb0~`cWKxO?b"+,'x~	EVsb,ukPvWKxOUk.+P{',E!r#bPP@#@&7iddiWW	Y?b"nP{Pr?rynE@#@&7di78@#@&77i8@#@&@#@&d7dbW,`[Km!:+	YcL+D2s+s+UO~Xq9cJ6WDsCOfMWaJbPZx,x;V^bPP@#@&7iddWG	YoWMhmY~{P6WWcNK^Es+UYc;;nMXZKh:mxNjCsE`E0GDhCDAsW1VB*@#@&7iddrW,`c0KUDsGM:mYP{',UE^VbP-u~c6WxDoWM:lD~x',Jr#bP`@#@&d7di70KxOoKD:CO,'~JwGM:CDJ@#@&didiN@#@&d7d)@#@&@#@&ddi-lMPmKhhl	NdkdY~x,b.Dmz`EAGs9B~vi	NnD^r	+vBB&Yl^k1v~E?ODb3nO4DW!LtE~B&Ud+MY}D[+.n9Sr/Dv~EqUdDYiUKD[+Mn9SrkYE~BUEanDUm.kaYvSE?E(jmMkwDvSBxEkYr0zJ0OBBv9!/Or6XZnUD+.BBvxEdDk6XIbo4OBBBBEkYrWHsE^sB*i@#@&77d6WMPckxTpPrP@!~mK:hC	NSrdDRs+	LDtI,k3_#,	@#@&did7:Hq9~{PJ6GxDJP3~^Ws:mx[SrdD$rT@#@&did7r6P`WGKR[W1;s+UDR$E+MX;G:slUNUYCO`mKh:mxNdrdY]kY#~'x~DD;+*~	@#@&77iddrW,`[W1;s+UDRT+YAVh+	Y$X&NchHqf*~"{Px!ss#@#@&id7d7`@#@&7di7di4;ODWxm[KhU`9G1EhxDRoYAs+s+UY~X([v:X&9#*@#@&i77di8@#@&7d77)PnVknPP@#@&7idd7r6PcNK^!:n	Yco+D2^n:xOAHq[csXqGbPe'P	;sV*@#@&d7d77P@#@&di7did8;DYWUmKEO`9G1EhxDRoYAs+s+UY~X([v:X&9#*@#@&i77di8@#@&7d77)@#@&di78@#@&@#@&@#@&d77b0~`9G1EhxDRoYAs+s+UY~X([vJ/UOX^+/rb~"{P	EsVb~P@#@&@#@&7didns:Px~6WGR9G1EhxDR/V^YbWUR1DnCD+ImUo`#@#@&7didJz~+snsRhW7n2	Ncb@#@&d77i+s+s~{Pn^+sRwmDUYAVn:xOc*@#@&i7dihtbsnPv+^+hR^sm/d1mh+,'x~rJ#~`@#@&7di7i+s:,'PVhRal.+	Y3s:+	O@#@&ddi77k6Pv+s+h~{'~x!sV*@#@&7idd77(Dnl0@#@&d7id)@#@&@#@&i7dikWPv+sns#PP@#@&iddi7[W1Es+UY LY3Vh+	Y$z&N`EdUYzVdr# KwDkW	/]TTcYn6DPx~V+s m^l/kHC:@#@&d7d7N,+s/~	@#@&77idd[G1Eh+	OconD2^+:xD$X&NcJk?Oz^+/rbRKwYbGU/]!YRO+aO,PxPrjYHVnEp@#@&77idN@#@&@#@&d7i8@#@&@#@&di7k6PcNKm;hxYcL+D2VhnxDAHq[`EWKxOfMGwr#~Z{Px;s^#~	@#@&id7iNKmEs+	ORT+O2^+hn	YAH(NvJ0KUOfMWaJbRG2DkGxk,!YROnXYPx~6WUYgCs+@#@&did8@#@&@#@&didr0,`[G1E:UYco+D3s+s+	Y$X([vJdk.nfMW2E*P"x~	EsV*~P@#@&ididNKm!h+	Y oY3s:+	OAHqNvEdk.+GDGwEbcW2YbGxk$TDcY+aO,'~0KUD?r.+@#@&did)@#@&@#@&7dikW~vNW1;:xYcLnYAV:nxO$Hq[`rWWM:COGDW2E*PZ',U!Vs*PP@#@&idi7NKm;:xO T+YAs+s+xD$zq9`r0GDhCDf.WaE#cW2ObWxd,ZT YaDPx,0KxYwWMhlD@#@&didN@#@&@#@&i78,+Vkn~	@#@&id7z&~k+s+1O+9PG8N+mO~b/~l,^KxOMW^@#@&@#@&i7db0~`9W^;s+xD oY2^nh+	Y~X(NcE6WUYG.WaJb~e'PU;^VbPP@#@&d7id9Wm!:UYconYAVnhxY~zq9`J6GUYGDKwE# GaYrW	d$ZT O6Y~~{PEsKUDJI@#@&idd)@#@&@#@&id7k6Pc[KmEsnxDRoO3V:xOAz(9`E/b"+GDG2r#PZx,x;V^b,	@#@&didd9W1;:xORT+O3^+:UY~Xq9cE/byf.W2E*RGwDrW	/,TYRYnaDPxPrjbynri@#@&did)@#@&@#@&7dikW~vNW1;:xYcLnYAV:nxO$Hq[`rWWM:COGDW2E*PZ',U!Vs*PP@#@&idi7NKm;:xO T+YAs+s+xD$zq9`r0GDhCDf.WaE#cW2ObWxd,ZT YaDPx,JwWDslDEi@#@&7di8@#@&@#@&di7k6P`9G^Es+	Y onOAVn:UY~X([vJ/jOHVn/rb,"x,x!VV*PP@#@&@#@&7di+snsP',WWKRNK^;:xDRd+sn1YrW	 mM+COIlUL`b`Zb@#@&7idik0,`vnV: m^lddgl:~'{Px!ss#,u-Pc+snsR^Vmd/glhn,''~Er#b@#@&7id7P@#@&ddidi[W1Eh+	Y LY2^n:xY~z(NvJk?OXsnkJbRK2YbWUd]!T O6OP,x,JjDX^+Jp@#@&7didNPVdn,	@#@&7didd9G^Es+	Y onOAVn:UY~X([vJ/jOHVn/rbcW2DkKx/]!Y Y6OP,'~n^+:c^Vm//gCh+@#@&id7dN@#@&d7d)@#@&idN@#@&@#@&77b0~`9G1EhxDRoYAs+s+UY~X([vJ0KUYGDWaEbPe',x;Vsb,	@#@&i7d9W^;s+xO T+O2^ns+UDAHqNvJ6GxDf.WaJb k+V^YNq	[n6,',!I@#@&7i8@#@&@#@&dikW~vNW^;s+UYcLY3^+s+xDAH(NvJdk.+9.KwJ*~"{Px!ss#,	@#@&7d7[Km;:UYconOAV+hn	Y$X&[vJdbyfDKwrbRk+s+1Yn[&xNaP{P!p@#@&di8@#@&@#@&77b0~`9Gm!:nUDRonOAVn:UDAz&NvJ0KDsCYGDGwr#~Z{Px!sV*P	@#@&7diNKm;:nUDRL+D3V:nUDAX([vJWWMhmY9MWaJ#c/s+1YnN&x[nXP',Ti@#@&diN@#@&@#@&idr0~c9W^EsnxDRLnD2VnhxOAH(9`Ek?DXV/rbPe'~x!Vsb,	@#@&7diNW1;h+	YconY3s:nxD$X&NcEk?Yzs/E#cdVn1YNq	NaP{PTi@#@&77)@#@&@#@&di/tKAKWkkDkGxcb@#@&@#@&i7\mD~^K::CU9Sr/D~{P)MDmX`E9!dYb0zS0OvBB9!dYb0X;nUYDE~v9;dDkWX"ro4YvSE9EdOb0zs!s^BSEb(/W^EDnnK/rYbWUv*i@#@&7di0WM~ck{!pPrP@!~1Wh:mUNdkdOcV+ULDtIPbQ3#~P@#@&ddidszqGPxPr0GUDJP3~mK::mU[Sb/D$rT@#@&id7dbWPv0GGcNW^;s+UYc5!+.HZK::mx9jYmYn`1WhhmxNdr/D$kYb~'{PDD;+b~P@#@&di7dikW~vNW^;s+UYcLY3^+s+xDAH(Nv:zqG#~Z{Px!sV*@#@&i77di	@#@&7d77id8EDOW	{[GSx`[G1Eh+	OconD2^+:xD$X&Nc:Hq9b*@#@&i7did8@#@&7did)PnVdn,	@#@&i7didrW,`NG^!:nxD T+OAV:+	Y~zq9`hX&fb~e'P	;V^#@#@&77didP@#@&d77id74!OYKxmG!Y`[G1Eh+	OconD2^+:xD$X&Nc:Hq9b*@#@&i7did8@#@&7did)@#@&d77)@#@&@#@&7dkl-n_k/OGMXc0msk+b@#@&@#@&di8,&z,2UN,kW@#@&@#@&i7/4Wh;;OZKwHnC/Onv#@#@&i7/4WAJbx3cb@#@&7dk4Khi	NKI+9Wvb@#@&dN@#@&@#@&@#@&d0!UmDkW	~dtKhhWdkOrKxc#,`@#@&@#@&7i\l.~aWdkDrKx$!YDWx}x,xP9W^Es+UOco+D3V:+	O$X&NvJWWUOz4dW^;YnGdbYkGUr#@#@&i77l.,wK/kDkKUA!YOW	rWW,'P9Gm!:+	O oYAVn:nUDAzq9cJ6WUOz4/Gs!YnnKdbYrKx|W06J*@#@&@#@&7db0~caW/bOkKxA!OOW	r	PZ'~U!Vs#@#@&di	@#@&iddrW,`WWK 9W^!:xYc;!nDHZG:slU[Axl(s+9`Jz8dW^ED+KWdrDkGxrb#@#@&77i	@#@&7id7wKdbYrKx~EYDW	6xc/OX^+ [b/w^CX,'PrrUVbxJ@#@&77id2WkrYbWU$!YYGU}0WRkOHVncNb/w^lH~',JUW	+E@#@&ddiNPV/~`@#@&did7wGdbYrW	$EDYGU}xRdOHVnR9rkwsmX,'PrxKU+r@#@&did72K/kDrW	AEDOGx}06RdYzsR[kk2VmX~x,JkUsbxnJ@#@&id7)@#@&dd)@#@&78@#@&@#@&@#@&7W!xmDrW	P/4GASbx0`bP`@#@&d7zJ~m4+^V,k0~sbxVP(;DYG	Pb/P\UPDtnD@#@&@#@&@#@&i7\mDP^rU3~EDYGx6U,'~NK^Es+UOco+O3^+h+	O~X(9`rYWKV(CDdkU3|WUE*@#@&i7\mDP^rU3~EDYGx6W6PxP9Gm!:nUDRonOAVn:UDAz&NvJYKW^8lMSrx0{GW6J#@#@&@#@&dd7C.P:mksA;ODWUr	~',NG^!:+UOconYAs:n	Y~Xq9`rOWKV8lM2hCbV{KUJ*@#@&i7-lMP:Cks$!YOW	606Px~9Wm;hxORTnD2s:xY~X&[`rYGW^4C.A:lbs{K00rb@#@&@#@&idr0~c^kU3~;YDWU6	P"x~	EsV,k-PnslbVA!YDGx}x~"{PU;^V#@#@&di	@#@&77db0,`WWG 9W^EsnxDR5;DX/Gs:Cx93	l8^+9`J1EDE#,['Pekd/KxYMGVU+V^O+9`*#@#@&77i	@#@&i7dikW~vk/Jr	3j+^n1Yn9`*#@#@&di7dP@#@&did77b0Pvr/A:lbsJk	3v#b@#@&7id7dP@#@&id77idkW~v+hlbs~EODW	rx,"{~x!Vs#,	@#@&iddi7di+:mrsA!YDWUrU kYzV Nb/2smXPx~rkUVbUJ@#@&diddidin:mksA!YOG	r06 /DXV [kkw^lzPx~rxGxE@#@&d77iddN@#@&@#@&di7id7b0,`Vbx0$EDYGx}x~Z{Px!sV*P	@#@&7didid7VrU0A;YDGx}x dDXVn 9kdw^CHPx,J	WxJ@#@&did7didsr	3A!OYKxr6W /DX^+ NrdaVCX,xPrkUsbx+E@#@&d7di7i8@#@&@#@&ddidiNPVd+,	@#@&@#@&di7didk6~cVbx0A;YOG	rUPexP	Ess*P	@#@&id7di7iVr	3~EYDW	6xc/OX^+ [b/w^CX,'PrrUVbxJ@#@&77id7disk	3$;DYWU660 /Dz^+ 9kkwVmX,xPrxGxJ@#@&iddi7d)@#@&@#@&7dididr0~c:Ck^$EDYGU}xPZx,x;V^b,	@#@&diddidin:mksA!YOG	rxcdYHV+c[r/aVmX~'~E	WU+r@#@&id77iddnhmksA!ODWU}06R/DX^nR9kdw^lz~{PJbUVbx+r@#@&didid78@#@&@#@&7di7d)@#@&7iddN~Vd+,`@#@&@#@&diddik6~`:Ck^A;ODWx}UPe'P	;sV*PP@#@&d77id7+sCk^A;ODWx6Uc/OX^ncNrkw^lX,',Ek	VrxJ@#@&iddi7d:lbs$EDYKx60W kYzV Nb/2smXPx~rxGxE@#@&7idid8@#@&@#@&did7db0~c^kx0$EDYW	6UPe',x;Vsb,	@#@&i7did7sbx3$;DYGx}Uc/OHVRNb/aslHPxPrkUsbx+r@#@&iddi77Vbx0A;YOG	rW0cdYHVn 9k/2smX~',E	WUJ@#@&didi78@#@&7didN@#@&@#@&i7d)P+^dnPP@#@&@#@&d77ikWPvsk	3$;DYWU6	PZ',U!Vs*PP@#@&idi7d^kU3~EOOKxr	 /DXV [kkw^lzPx~rxGxE@#@&d77idVrU0A;YDG	rW6RkYX^+c[kkwslHPx~rkx^rxJ@#@&77di8@#@&@#@&77idr0,c+slrs~EYOG	rUPex,x;^V*P	@#@&i7didn:mks$!YYKUr	R/Dzs+cNb/2VCz,'~J	GxJ@#@&idd77:Ck^$!YOKx}00c/DzVR[kkwsCHP',Ek	Vk	nE@#@&did78@#@&id78@#@&di8@#@&i8@#@&@#@&dWE	^DkG	Pb/Sbx0j+^+^YNcb,	@#@&@#@&idk6~c0KWcNGm;hxORknVmOrKxROza+~'{~rZG	YMWVr#,`@#@&d7d7l.~KZW	ODKVImUL+,',0GW [Km;:UYc/nsmYrG	R^DCD+]mxT+`*i@#@&didr0,`G/KxYMGV"lxTnc!*RDlL1ChROW`2wD/Ck+`b~{'~J&\VJb,	@#@&didi-lMPG?V~x,WZKUYMWV"CUo`Z# wC.xO1K[+p@#@&7id8~n^/nPP@#@&d7idM+Y!D	~0mVd+p@#@&7id8@#@&di8Psd+,	@#@&7d7GU+sP{~0KW [KmEhn	Y /smObW	RmM+mO+"lUo`b alDUYAV+snUYv#p@#@&d7N@#@&@#@&i7k6PcGU+V OmoHlsncYG`wa+D;lkn`*Px',J)E*@#@&i7	@#@&di7hX_D0~'~GU+sRTnYzYO.b4EOnvJ4DWr~+*@#@&ddik6~`sXuD0~Z{PJrb@#@&ddi`@#@&idid.+O;Mx~YM;+p@#@&7id8@#@&idN@#@&7iDnDEMxP6l^d+p@#@&d)@#@&@#@&d0!UmDkW	~r/A:mksSrU0`bPP@#@&idrW,`0GGcNGm!hxOc/V+1YbGxcYzwPxx,JZKUYMWVrb~	@#@&id7\C.,W/W	ODKV]C	o+~x,0GWc[Km;s+	YRk+^nmDkGxcm.nmY+"CxT+`*I@#@&idikWPcG;WUYMGV"lUL`!b DlL1mhROKjaw+MZmd+v#~'{PE(tMJ*~	@#@&di77\mD,Wj+s~{PGZKUYMWs]mxoncZ# wm.xOgW9+i@#@&i7d)PnVk+~`@#@&di7dM+Y!.UP6l^/ni@#@&id78@#@&di8~n^/+~`@#@&7diGU+s,',0WKR9Gm!:nxDRdn^+mDrW	RmMnCYImxL+cbcwCDUYAVnhxYcbp@#@&diN@#@&@#@&dik0,`Kj+^ROlT1ChRYKiwa+D;Cd+v#,'xPE)r#@#@&i7	@#@&77i:Xu.0~',GU+scoYbDYMr4!Yn`rt.n6J~yb@#@&@#@&i77k6Pv:zC.n6Rrx9n6}0cvslksOK)v#,@* Pq*@#@&ddi	@#@&did7DY;.	PYM;+p@#@&i778@#@&idN@#@&7iDnY!.x,0Csk+i@#@&i8@#@&@#@&i0;	mDkW	Pk4WSZ;Y;W2zhl/Dn`*P	@#@&7d7lMP^EO$!YOW	6x,'~[KmEhn	Y oOAVns+	YAHq9cJDWGV(l./!Y{KUJ*@#@&i7-lMP1EOA;ODWUr6WP{P[G1E:nUDRL+D3^+hxDAX&NvEYKWs4mD/;D{W6WJ*@#@&@#@&7d7lMP^EO$!YOW	+r	Px~9Wm;hxORTnD2s:xY~X&[`rYGW^4C.;EYymW	J#@#@&7d7lMP^EO$!YOW	+r60~x,NW^;s+UYcLY3^+s+xDAH(NvJOWKV8CMZED+{K00rb@#@&@#@&id-l.~1W2X~;YDWU6	P'~[Km;:UDRLYAV+s+	OAHq[`rYGG^4lM/WaX{KUE#@#@&id-l.~1W2X~;YDWU660Px~9W^Esn	Y T+D2V:UY~X(NvJOGKV4m.ZKwX|GW0r#@#@&@#@&777l.P1GwHA;ODWx+6	PxP9G1EhxDRoYAs+s+UY~X([vJYKGV(lD;G2Xy{KxE#@#@&id-lM~mKwz$!YYGUyrW0,x,NG1Es+xDRTnYAVn:xO$HqNvEYKWV(C.ZKwH mWWWr#@#@&@#@&di\C.,wldOA;YDG	rU,',NW1EsnxDRL+D2sns+xD$X&N`rOGW^4mDKldOA;YDGx|WUE*@#@&777l.PaCkYn~EDYW	r6WP{P[W1Ehn	YRTnYAV+snUY~X&NcJOGKV8lMKlkYn$!YYGU|WW0rb@#@&@#@&di\lMPaC/D+$EDYGUyrx,xP9Wm!hnxDRT+O2sns+UY~zq9`EOKWV8CMnC/Dn~EODW	 {Kxrb@#@&d7\mD~2m/Y$EDYW	+606P{P[W^;s+UYcL+D2sns+xO$Hq[`rOKWs(lMnlkY$EDYGxy{GW6J#@#@&@#@&dd7C.PalkYnf.GarUP{~NKm;hxY LY3VhxO~X&N`rYKGV(l.nm/OnGDWamW	J#@#@&7d7lMP2ldOf.Wa606Px~9Wm;hxORTnD2s:xY~X&[`rYGW^4C.hl/DnfMWw|GW0r#@#@&@#@&77b0~`6GWcNG^!:+UOc;;+Mz;Whsl	N2	l(s+9`Em!YEb*@#@&i7	@#@&di7r0,`NrY\G9+6x,x',Y.;#P`@#@&d7di^!Y$!YDWx}06 /DXs+cNrdaVlH~',JxKUnJ@#@&id7d^;DA;YDGx}x dDXVn 9kdw^CHPx,JbxVbxE@#@&@#@&did7^KwX~;YDWx}WWRkYHVnR[rkwslH~',JUG	+J@#@&id7d1GaX$!YDWx}xcdYHVnR9kd2^lX,xPrkx^rU+r@#@&d7dN~Vd+,`@#@&d77imEO$!YOW	+}0Wc/DXVR9r/aVCX,'~E	WxE@#@&ddi7^EDA!YOWU+}x /DzVR[rkwVCz,'~JbU^kUJ@#@&@#@&di7d1W2X~EOOKx }W0c/YHsnR9kkwslz~{PExKU+r@#@&7idd^GaX$EDOKx+}xc/YHV Nb/2VmX~x,Jk	sk	+J@#@&7di8@#@&7dN~Vd+,`@#@&d77b0Pcn9kOHK[rU,'{PYMEbPP@#@&did7^!YA!OYKxr6W /DX^+ NrdaVCX,xPrkUsbx+E@#@&d7di^!Y$!YDWx}xcdYHVnR9kd2^lX,xPrxW	nE@#@&@#@&d7d7^KwzA!OYKx6W6R/Oz^+ NbdaVCHP{PJbx^rxJ@#@&id771WwH$EDYW	6URkYHVnR[rkwslH~',JUG	+J@#@&id78,n^/n,	@#@&didi^EDA;YDWU+}00cdYHV+c[r/aVmX~'~Ebxsk	nJ@#@&77idm;O~EOYKUyrUc/DXVR9r/aVCX,'~E	WxE@#@&@#@&i77d1WaX$EOOKx+r6WRkYzsRNrdaVCX,x,Jr	Vbx+r@#@&7did^WaX$;DYW	+r	R/Dzs+cNb/2VCz,'~J	GxJ@#@&iddN@#@&d78@#@&@#@&7ik6P`6WK NKm;:xO $E+MzZK::mU[2	l(VnNcEaldYE#*@#@&7i	@#@&7idr0,cNrDHKN+}x,x',Y.E#@#@&iddP@#@&iddi2C/D+~EOYGU}0WRkOX^+ [b/wsCHPxPrUKxnr@#@&ddidaC/D+$EDYGU}xRkOX^+R9rdw^lHPxPEr	VrxE@#@&@#@&7idd2CkYnfMGarW6RkYX^+c[kkwslHPx~rxW	nJ@#@&di77wm/D+9DG2}x /DzVR[rkwVCz,'~JbU^kUJ@#@&did)~+^/nPP@#@&7iddaC/D+A!OOW	 }0WRdOHVnR9r/aVCz,'PEUKxnJ@#@&id7iwm/YA!OYKx+r	RdOHV+c[kkwVmz~',JbxskUnr@#@&di78@#@&@#@&id8~n^/nPP@#@&@#@&idik0,`[kDHGNrU~{'PD.E#@#@&77dP@#@&d7d72m/O+~;YDWU660RdOHVnR9rkwsmX,'Prk	sk	+E@#@&d77iwlkO+~EYDGUr	RkYzVn 9kdw^CX,'~E	WxnE@#@&@#@&i7id2m/D+fMWa606RdYHVn 9k/aslHP',Erx^k	+E@#@&7id7wmdYf.Garx dDXs+c[b/2^lHP',J	GxJ@#@&id7N,+VknPP@#@&i77dalkYnA;ODWU }W0c/Oz^+R[rkwslH~{PEbx^kxJ@#@&did7wm/On~EYDGxyrxcdOX^+cNr/2smX~',ExKxnE@#@&d77)@#@&diN@#@&7)@#@&@#@&i0!UmDkGx,l22^X?DzV`/Dzs+jl^En#~`@#@&7dbWPvkd)^VWAn9`b#@#@&id`@#@&@#@&di\m.P9WU+@#@&777lD,d+^+mDn[bM+mPxPWGKR[W1;:xO k+Vn^DkGxc^M+CD+"lxT+vb@#@&d7k6PcdDXV#l^E+,ZxPrJ*P`@#@&7iddYHs+jls;P'~dDXs+jC^Enc/!4/DDbUovFSPkYzs.l^;+cV+	LOt*@#@&d78@#@&@#@&7dbWPv0GGcNW^;s+UYcdVn1YbWxcYH2+,'xPrZGUDDW^E#,	@#@&77dmwaVz?Oz^+PW,xPk+sn1Y+[)M+CR1Gs:G	nmD+	YAs+s+UYv#@#@&id8,~+^/+,`@#@&idikWPcWKW NK^Es+UOc/+sn1YrW	 1DnmYIl	oc#ctO:^KnaDP'{~Jr#PP@#@&didil2wszUYzVPW,'~dV+^ON)DCcwCM+	Y2^+snxD`b@#@&d77)P+^d+,	@#@&77dik6Pc`dn^+^Y[bM+C alDnUD2s+sn	Yc*RDloglsnRDWiwa+./m/+vbP{'PrjKbgJ*Pku~ck+s+1O+9b.nmRwC.xO2^ns+UD`*RYmogC:ROW`w2nMZlkn`*P'{~Ebr#*P`@#@&7id7dm2w^XjOHV+PG,'~/smONzD+mRaCDxO2^+hn	Y`*@#@&iddi7r0,`v/OXsnjlsE~'{PEE*P['~v/nV^D+[zDlRalMnxD2s+s+UOv#RDCogl: OW`wa+.ZCd`bP{xPr?K)gJ#b~P@#@&di7id7mwaVXUYHs+:W D:G-1W9n`6lVknbi@#@&id7d779WU+,xPDD;n@#@&d77idN@#@&7id7)PV/PP@#@&id7dikW~v/YHs+jlV!n~"{PrJbP`@#@&d7di7dk+sn1Y+[)M+CRaCkYn_KtS`r@!k2l	P^Vm/dxrP_,dYHV+jCsEP3PE@*E~3Pd+^nmD+[)M+l 4D:sKaDPQ,J@!z/al	@*J*@#@&did77)@#@&i7didNKUnP{PDD;+@#@&id7d)@#@&id7N@#@&d7N@#@&7dbW,`[KxP"{PD.E#~	@#@&77ilwasXUYX^nPWcm^ld/HCs+~',dYHVn#mVEn@#@&d78@#@&@#@&7iNKKWKV(CDv#@#@&idN@#@&d8@#@&@#@&d0!U^YbW	P[kd2^lzjknDUYzs/`b~P@#@&di-mD~Dt?YHV~',xnh,b..mX`*I@#@&dd7C.PDt?OXsn:+aY,xP	+A~zDDCzv#I@#@&7i\CMPkYX^+AakkYd@#@&d7UKr0U4+Y/,x~0KWUYzVndcNGm!h+	Y dDXVnj4+nYk ^+UTY4@#@&idbWPvxGr6?4nY/,@*PZ#PP@#@&did6W.Pcr{FIk@!xxKrWj4++OdpkQ_*~P@#@&ididxKr6jYHVn/,'~WKW?DzV/R9G^Es+	Y /Oz^+jtnYk`UG}0?4nYdO8bcD;^+kRVxTOt@#@&7did7WKDPva'Zi6@!UGr6?DXs+dIX_Q#P@#@&id77id/Oz^+#l^;Px,0KW?DX^n/cNGm!:nUDR/DzV?tnO/vxKrW?4nYdO8bRMEsnk`6b k+s+1OKDP6D@#@&@#@&i7did7zJPdOHV+k4+YPM;s+,mKxOlrUkPCPc~`boUGM+PCUHPdYHs/~DtmYP9W	OP1WUYmkU~mPR,OtXPm.nPgr:P;/n.,/OX^n/*@#@&7idd77b0~`kOHVnjl^E+ck	[+XrW`rREb,@*',T#,	@#@&@#@&didid7d&&,/OX^n/4+nO,DEsn,NG+kUDP^KxDlk	P=@#@&id7did7r6P`kOX^+.ms;+ck	Nn66WvJlJ*~@!,!b~P@#@&@#@&id7di7id&JPkYX^+,^W	YCk	/~C,RPmOP(+obUUk	o@#@&7d77id7dbWPv/Oz^+.Cs!+ k	[666`rRJ*P{xPZ#~	@#@&77iddi7di/YHsnK6DPxPdOHVn.msERd;(/Y.r	ocFBdDXs.mVER^nxTY4#@#@&77iddi7diYtjOX^+]Y4+jOHVnR^nxTY4D,'PdOHVn.ms!+@#@&diddidi7dDtn?DXsn:+6D,Y4+?Dzs+:+XY VnUTY4T,xPkYzsK+aO@#@&@#@&i7id7idi8PVknPP@#@&did77iddi&z,/YHsnP1W	YCkUd,l~R,UWDPCO,4+Lr	xrxT@#@&d7ididdidbWPv/OX^+#C^E+crx9+6}WcJcJ*P@*PTb,	@#@&i7did77idddOHVnKaDPx,/DXV.msERdE(/O.bxovdYHV+jCsERbx[+a66`ERrb_8~dOHV+#C^EnR^n	oO4#@#@&didi7did7dkYzs.l^;+,'PkOzV.mV;+ d!4dYMrxT`dOHV+#C^EnRbU9+a}0vJRr#BdYHVn.mV;ncV+	LY4#@#@&@#@&didid7d77iY4+UOX^+PnXY$O4?OX^n:+aDR^+xTY4DP{PdYHVnP6Y@#@&diddi77didDtn?Oz^+,Y4n?DXsncV+ULDtDP{~kYz^+jlV!+@#@&did7did77)@#@&i7diddi7N@#@&@#@&d7d77id&z,^W	YCr	/P$6:C~l, ,lU9PmP)@#@&i7did7d)Pnsk+PP@#@&iddi77di/DXs+#C^EnP{~/DXsnjlV;nc/;4kOMkUT`kYX^+jCV!+ k	Nna}0`r J*~/Dzs+jl^EnRrU9+ar6cJ=Jbb@#@&@#@&7id7di7i0GMPvk'Zib@!Y4+jYHVn ^+xTOtpk_3b~	@#@&id7d77id7k6~`kYzs.ls;Px',O4+jDX^+$bT*~	@#@&7did77iddidYHV+Aar/D/,'~Y.;@#@&di7did77i8@#@&7id7di7i8@#@&@#@&ddidi7dikWPv/Oz^+2Xr/D/Pex~YME#~	@#@&id7di7didO4?Yzs$OtjDXsR^+xTY4DP{PdYHVn#mVE@#@&@#@&di77dididdYzsKn6D~',/Oz^+.Cs!+ /!8kY.bxT`/DX^n.mV;+ckU[6r6cJcJ#3qS/DX^+#ls;Rs+	LY4#@#@&idd77id7dD4?OHVK+XY]Ot?OX^+PnXYR^nxTYtY~xPkYHVnKnaD@#@&di7did77)@#@&@#@&id7di7iddDX^+2XkkO/,'~0mVdn@#@&di7didd)@#@&@#@&did7d7N@#@&@#@&i7didN~JzP3U9PWWM@#@&@#@&ididd6WM~`.'Ti,y~@!{PY4n?DXV s+	oDtRFI~._Q#,`@#@&d77iddUnSr2YbG	Px,NKmEs+	OR1DnlD+3s:+	O`rWwDrGxr#p@#@&d77,P7diU+Sr2ObWx -mV;+,x,Y4?DXV$.Di@#@&7did77	+h}2YbWxcOn6DP{POtnjDXs+:n6D$"Dp@#@&77id7d9G1EhxDRoYAs+s+UY~X([vJ/UOX^+/rb l9Nvxnh62DkGx*@#@&id77i8@#@&@#@&d7d)~Jz~Ax9PsKD@#@&di8~zJP3U9Pk6@#@&i8PJ&~2	N,0;x^ObWU@#@&@#@&i0;U1YkGU,qU/.DIGSb(W\`*~	@#@&@#@&idrW,`kk/EM/WM(UKm4^+/+ssv#b	@#@&did-CMPx;h;Ws/,x,!@#@&@#@&ddil^sZVs/,'~dV+1O+9KIc^nV^/@#@&7d7WKD~`7CD,kxTpk@!Cs^ZnV^dcVn	oDtib_3bPP@#@&did~7	E:;GVkP',U;:;W^/~_~C^V/+^s/]kD T+Y)ODDr4!O`v1W^?wmxEb@#@&d7d)@#@&@#@&ddi-lMPxAPI,',/nVn^D+[Km8VRrUk+DO]Khc/smON:IRMWS(x9+a#@#@&@#@&idd6GD,`k,x~!pPbP@!PU;sZGVkIPb_Qb,	@#@&7id~d	nSK9,',x+SK" k	/nDDZns^`#@#@&didd	nAKGRbxU+.u:HJP{~JLx8daiJ@#@&@#@&7di7b0~v4KDNDU4WSx~'{PEz/J*~	@#@&di77d	+SK9R.;	Yr:jYHVn (WD[nMPxPrqa6~9WDY+9P[$s~s$sr@#@&7idd)@#@&@#@&di7N@#@&di8@#@&@#@&i8~zJ~2	N~W!xmOrKx@#@&@#@&i0;	mDkW	P&U/DOIKh$n^WhvbPP@#@&@#@&7db0,`r//;M/GD&UKm4sn;+Vsc*#`@#@&@#@&d7i\mDP	Es/W^/~',!@#@&@#@&di7l^VZss/,',/nVn^D+[K" mVsd@#@&d776W.Pv-mD~b'Zik@!l^sZVs/cVnUTYtpr_3#PP@#@&did,dUEh/KVdP{~x!:/G^/PQ~mVsZs^/,bTco+DbDODb4;Y`v^KV?aCxE#@#@&77d)@#@&@#@&d777l.P	nh:I~x,/+sn1YnN:C(Vnck	/+MY"Ghv/nVmOn9KIc.WSqx9na_8#@#@&@#@&77i0GD,ck,'~TpPk~@!,x;:;G^/I,k3_#,	@#@&did~d	+APGP',U+SKIcrU/DDZnVsc*@#@&di7d	+APGRkUUDuKtJ,'~r[	4/air@#@&@#@&7didrW,`4K.ND?4GAx,'{PEXndr#~	@#@&did77	+hP9cD;xDrs+jDX^+R(WM[+MPxPrF2a,NWDO+9Pa~o$s~sr@#@&d77i8@#@&i7d)@#@&7i8@#@&@#@&dNPJ&,2U9P6Ex1YbGx@#@&@#@&i0;U1YkKUP&xmMnC/ZKVdwCUv#~	@#@&dikW~vk//;M/GD&U:l8^+;+V^`*bPP@#@&@#@&d777lD,^W^?wmUPf,',/nVn^D+[KG oY)ODDk8;D+cB1G^?2mxE#@#@&di7l^V/+^Vd~{P/s+1Y+9P]R1+^Vd@#@&@#@&d7dbWPv/nsmYn[:f ms^qU9+XP_,F,Z',/nVmOn9KIc^+^V/csnxTY4#~	@#@&id7d7CD,l[[;WVd2mx~',C^V/V^/$k+^nmD+[KGR^n^Vq	[+X_FY L+DbDY.k8;D+cB1GVUwCUE#@#@&7id7/smON:fR1W^jwmx~',mGsUwl	Pf,_Pm[[ZKVkwCx@#@&id7dknVmOn9KI [VnY/Vsv/V+1Y[KGR^+^V(U9+63q#@#@&di7N@#@&di8@#@&@#@&i8~zJ~2	N~W!xmOrKx@#@&@#@&i0;	mDkW	P&UmM+C/IGAkwl	c#,	@#@&77k6PvkdZ;.kW.q	Pl(Vn/VVcb*P`@#@&@#@&d7i\mDPMWSjwmxPf,'~dV+1O+9KfcLnYzYDDr4;O`vDKA?alUv*@#@&77ilsV"GS/~{Pk+VmDnN:l8VR.GS/@#@&7dik0,cd+^+1YnNP]cDGh&UN6~Q8P"x~mVsIKAkRsxTYt*PP@#@&@#@&7did-CMPl^sZVVk(U16DIGh~x,lsV"Ghk$dn^+mOn9K]RMGSqU9+X_/V^YNPfcDGAUwl	DR1+V^d@#@&idid-l.~mN[IKA?alU~{Plss;+sVk(	1nXY"Wh]/s+1YnN:f ^VV&UN6TcLnYzYDDr4;O`vDKA?alUv*@#@&77id-lM~sW-KKP',/s+1YnN:f .Kh?aCx@#@&@#@&77dik6Pc"C[9IGhU2l	#~C9NIGAUwCx,x,FI@#@&@#@&didid+^+^YNP9cDWSjwmxP{~d+^+1YnNP9cDGhU2l	PQ~mNN]GS?2l	@#@&d7idmVV"WSd$k+s+1Yn[:IRMGh&xNa~_,:K\nKGDcNnVO+;+ssv/+sn1YnN:9cmn^V&xN6*@#@&id78@#@&77)@#@&@#@&d)PzJ~3x9P6EUmOrKx@#@&@#@&d6EU^DkWU~G+^DCk+/KVkwl	`*~	@#@&@#@&idrW,`kk/EM/WM(UKm4^+/+ssv#bPP@#@&id7r6P`dn^+^Y[:f 1W^?wmx,Z',FbPP@#@&7iddknVmY[PIck	/nDO/Vs`knVmOn9Kf ^Vsq	[6Q8#@#@&didid+^+^YNP9cmW^jwmxP{~d+^+1YnNP9cmGVU2l	PR~8@#@&77i8@#@&i7)@#@&@#@&i8PJz,3x9PWE	mOrKx@#@&@#@&i0E	^OkKx,fnm.nm/nIKA/alUc*P	@#@&idr0,cb//!DkWD&x:C4^+/+^Vcb*P	@#@&@#@&ddiCs+MYvJPW~9KJb@#@&7d)@#@&@#@&d8~&JP3x9~6EU1YbWx@#@&@#@&d6EUmDkGU,f+^nYIWScbPP@#@&d7kW~vkdZ!./KD(U:l4sn;+sVvb*P`@#@&iddk+^nmD+[Km4sncN+^nYIWScd+^+1YnNP]cDGh&UN6b@#@&ddN@#@&dN@#@&@#@&dW!x1YkKx,9+^+O+;Wsc*P	@#@&P,PP,~~Pik6Pckd/!DdWM(x:l8sZ+ssv#bPP@#@&d7i:K\+wDKh2	N~',`dn^+mDnN:IR1nsVkR^+UoO4 FbP ~`k+sn1Y+[PGR^+^s&x[6*@#@&idiCV^IGhkPx~k+V^YNKm8s+cDKhd@#@&7idWWM~`7l.~b'!Ir@!lsV"GS/ ^+	oY4ibQ_*P`@#@&d77i+x960"Wh,x~l^V"WA/,rYR^+^s/cVnUTYt~R,F@#@&i7id2K/bYkKx,xPx[r6IGA,OPsG\sDKh3x9@#@&d7d7r6PcwKdkDkGU,@!PTb,	@#@&i7id7aWkkYbW	~',!@#@&id77)PzJ~2	NP&W@#@&@#@&@#@&7d77mVsZsVkqU]KhPx~mVsIKAk$rYR1+V^/@#@&@#@&d7dikW~vlV^/+^V/&U]WS$aWdkOrKxDR1GVUwCU,@*Pqb,	@#@&i7id7mV^Z+^Vk(x"WA$aWdrDkW	DR1WVU2Cx,',lsV/n^Vdq	]WS$2GkkYrG	T mKsUwC	P PF@#@&i7di8~+^/n~P@#@&i7didl^s]WS/]kDR[n^+O+;nV^`2GkkYrG	#@#@&i7idN@#@&@#@&did)~zJP3x9PoGM@#@&@#@&P,PP,~~Pi8,z&P3U9P(0@#@&@#@&dN~JzP3U9PoE	^DkG	@#@&@#@&i0!UmDkGx,qUdDY;GVz0Y.c#,	@#@&~P~~,P~Pir0,`rd;EDdGMqUKm8^+/V^`#*PP@#@&id7:K\noMW:AUN,'PvdnVmD+[K] 1+sVk VxLO4OFb~ Pc/smON:fR1+^sq	Nn6*@#@&7idl^sIKh/,x~/VmO+[Pm4s+c.WS/@#@&iddWGMPck{Tpk@!mV^IWS/cs+	oOtpkQQ*P	@#@&didDKA/W!xDPxPCs^IGhk,kYR^n^V/ sxLY4~ Pq@#@&iddaWkrYbWUP{P.GSZW!UY,OPsG-+wDK:3x[@#@&d7dbWPvwGdbYkGU,@!~!*~P@#@&ididwK/bOkKx~',!@#@&idd)@#@&iddiUnh;+^V~'~C^V]WSd$bT r	/+.O;+sVv2K/rDkKx_8#@#@&did7xh/n^VRbUxDC:\JP{Pr[U4d2pJ@#@&@#@&did7r6P`8GMNnDU4KhU,'{PJH+kE#,	@#@&id77ix+S/+^VRM;UYb:?OXsnc4GD9nD,'~E8w6~[KYO+9~[Ao~s~sJ@#@&i7di8@#@&id7N@#@&P,~P,PP,7N@#@&d)P&z~3	N~s!UmDkGU@#@&@#@&@#@&dWE	^DkG	P&x/DD/W^An0KDnc*P	@#@&P,PP,~~Pik6Pckd/!DdWM(x:l8sZ+ssv#bPP@#@&d7i:K\+wDKh2	N~',`dn^+mDnN:IR1nsVkR^+UoO4 FbP ~`k+sn1Y+[PGR^+^s&x[6*@#@&idiCV^IGhkPx~k+V^YNKm8s+cDKhd@#@&7idWWM~`b'TIb@!lss"WA/csxLDtpk_3#,`@#@&d7diDGA;WE	OP{Pl^s]WS/]kDR^n^VdR^nxTY4~ PF@#@&id7daGkkObW	P',DKAZKEUY,O~hK\+w.Ws2x9@#@&didikWPc2K/rYbGx,@!~T*P	@#@&id7di2K/rDkKxP{PZ@#@&id7d)@#@&7idd	nh;+V^~xPmV^IGhd,bT k	d+MY/n^V`2GkkOkKU*@#@&ididxh;nV^Rrx	+.u:HS,xPr[x(d2ir@#@&@#@&d77ikWPv8WMNn.UtWAU,'xPrz/E*PP@#@&idi7d	+AZVs MExDr:?YHsnR(WMNnD~x,JqwX~NKYOn9Pa$o~s$sr@#@&d7id)@#@&idiN@#@&P~P,P~~,d8@#@&d)@#@&@#@&70!x1YrWU~b/(:mL+U+sn1Y+[c*P`@#@&7ikW,`6WWcNK^Es+UYc/nsmYbGxcYXan~'{PrZGxO.KVE#,`@#@&d777lD~G;WUYMG^IC	oP',0KGR9W^Es+UOc/+^nmDkW	 ^DlD+]lUL`bi@#@&didrW,`W/G	Y.W^]mxL`Z#RDlTHls+ YKj22DZmd+v#P{x~J&HVJbP`@#@&d7did+^+^ONqhCT+~',WKW 9W1E:xD /VnmDkGUcmDCYIl	Ln`*`Z#I@#@&7id7DOEMx~OME+I@#@&d7d)@#@&d7)@#@&d8@#@&@#@&d6EUmDkGU,k/wslkt?snmD+9`bP`@#@&d7k6~`6WG 9Wm;hxORkn^+^DkKxRDXanP{'~J;WUOMWVrbPP@#@&i77\mD,W/WUOMWsImUoPx~6WW [Km;:UDRdVmYbW	 mM+CYICUT+`*I@#@&ddirWPvW;WUY.G^ICxTn`Z# Omo1ChROW`2a+.;lk+`*P{xPrr$9AZPE*P	@#@&diddbW~`KZKxODGs"lUoc!*RG;D+DuPtS k	[666`r0Vm/4E#,@*xP Fb@#@&ddi7/V+1OnNwVm/4Px~6WGR9Gm!:nUDR/nsmOkKUcm.lD+ImxTn`*`T#p@#@&7iddMnY!Dx,O.Ei@#@&7d7N@#@&7d)@#@&i8@#@&@#@&dW;	mOkKU,kd;W	YDKVUnVmO+9`b~P@#@&i7k6P`6GGR9W1Eh+UOc/nV^YbWU DXwn~{'~J;G	Y.KVr#PP@#@&7di\CD,W/G	YDKsImxo~xP6WKR[W^;s+UYcd+^+^ObWx ^M+CY]mxL`*i@#@&di7k6PcW;WUOMWV"CxT+`Zb Ymoglh+ OKj2w.Zm/nc*P"x~rq\Mrb,	@#@&diddk+^nmD+[qslLn,'P6GWcNW1;h+	Yc/nVn^DkGxc^DlOn"lxLnv#c!*I@#@&7idiD+DEMUPDD;+p@#@&7id8@#@&di8@#@&7N@#@&@#@&dWEU^DkGx,r/:l8s?+sn1YnNvb,	@#@&dik0,`6GWcNGm!:nUDR/s+1YkKU YHwPx'~E;WUYMGVr#~`@#@&d777l.PK/KxOMW^Il	o~',0GWcNG^!:+	ORk+V^OkKxcm.+COICxTn`*i@#@&iddrW,`GZKUDDG^Imxo`ZbRDlL1m:n DWja2+MZlknc#,'{PEK)$d2E#,`@#@&d77i/+sn1YnN:C(Vn,',0WKR9Gm!:nxDRdn^+mDrW	RmMnCYImxL+cbv!bi@#@&did7.YE.U,Y.EI@#@&7id)@#@&id)@#@&i8~zJP3U9Ps!UmDkW	@#@&@#@&d6EUmOrKx~kk/EM/G.&xKC8^+/+^sv#~P@#@&ddb0,cNKm;:xO k+V^YbWxcOzwPe'~J/G	Y.W^E#,	@#@&,PP~~,P~P,~,P~,P,PP,P,~P,P-lMPns:P{~NKmEsnUYc/VnmOrKx mMnlD+]C	o+cbcwCDUD2s:xYv#@#@&P,P~P,P~~,PP,~P,PP,~~P,P,PAtrsPc+^n:cYCLgl:n DWiwanMZCk+v#Pe',EKGJ~[LPns:RDCogl: OW`wa+.ZCd`bPexPrKuE*@#@&~~,P~P,~,P~,P,PP,P,~P,P~P,	@#@&,PP,~P,PP,~~P,P,P~P~~,P~P,~PVnh,'Pns: wm.xOAV:+	Y@#@&P,P~P,P~~,PP,~P,PP,~~P,P,P~PrW,`nVhP{'~U!VVb@#@&P~P,~,P~,P,PP,P,~P,P~P,P~~,PP,8Dl3@#@&~P,P,P~P~~,P~P,~P,P~~,PP~~)@#@&di7ikW,`V+s#,`@#@&d7diddn^+mDnN:fP{~nV:@#@&7d77i/nV^YNP],'Pdn^+^Y[:f alM+xD2^n:xO@#@&d77id/s+1Y+9P$rG5,'~Pdn^+^Y[K"R2CM+xO3^+h+	O@#@&7idid/V^YNPl(Vn~{P/s+1Y+9P$rG5cwCDnUD2s+snxD@#@&7idd7.Y;D	~DD;@#@&ddid)@#@&idN@#@&dN~JzPAUN,0E	^OkKx@#@&@#@&7W!x^YbGx,kd/!D/G.&xoWMhv#~P@#@&ddb0,cNKm;:xO k+V^YbWxcOzwPe'~J/G	Y.W^E#,	@#@&,PP~~,P~P,~,P~,P,PP,P,~P,P-lMPns:P{~NKmEsnUYc/VnmOrKx mMnlD+]C	o+cbcwCDUD2s:xYv#@#@&P,P~P,P~~,PP,~P,PP,~~P,P,PAtrsPc+^n:cYCLgl:n~e'~Jw6"HE*@#@&PP,P,~P,P~P,P~~,PP,~P,PP,~`@#@&P,P~P~~,P~P,~P,P~~,PP~~,P~P,n^+h,',+V:c2lM+UYAVnhxY@#@&P,PP,~~P,P,P~P~~,P~P,~P,P~~,k0~cVn:,x{PU!V^#@#@&P,~P,P~P,P~~,PP,~P,PP,~~P,P,P~4.nm3@#@&,~P,P~~,PP~~,P~P,~,P~,P,PP)@#@&7didr0,`ns:#,`@#@&ddi77/VmO+[oKDhP{~+^+h@#@&dd77iDnY!.	POME@#@&idi78@#@&7d)@#@&7)PzJ~2	NP6;UmDkKx@#@&@#@&i0;x1OkKx~rkZE.dKD(xdrkYc*PP@#@&idbWPvNGm!:nUDR/s+1YkKU YHwPZ'~E;WUYMGVr#~`@#@&P~~,P~P,~,P~,P,PP,P,~P,P~P7l.~V+s~',NW1;h+	Yc/nVn^DkGxc^DlOn"lxLnv# wm.xOAV:+	Yvb@#@&P~P,P~~,PP,~P,PP,~~P,P,P~PA4bVnPvnV: Omo1ChROW`2a+.;lk+`*PexPrrJJ,['~V+s Ymo1mhnRDW`w2+./m/n`*~"{PEidJ#@#@&,P~P,~,P~,P,PP,P,~P,P~P,P~`@#@&P,~P,PP,~~P,P,P~P~~,P~P,~P,Pns:Px~Vn:c2mDn	YAV+s+	O@#@&P~P,P~~,PP,~P,PP,~~P,P,P~P~~b0~`s+sPxx,xEss*@#@&P,~,P~,P,PP,P,~P,P~P,P~~,PP,~P(D+mV@#@&,P,P~P~~,P~P,~P,P~~,PP~~,PN@#@&7id7b0,`+^+sbPP@#@&did77M+Y!.x,YD!n@#@&ididN@#@&7i8@#@&iNPJz~3	NPW;	mOkKU@#@&@#@&dJzPDWTLVPLEbNnsbx+k@#@&i0E	^OkKx,YGoLsAGD9nDk`b~P@#@&777l.Pms^sGM:kP',0KGR9W^Es+UOc4W9zRT+YAsn:xD/$XPCT1C:cJwr]\r#i@#@&id-lM~mVs&xaEYkP{~0KW NKm;hxYc8W9XRTnO2^+s+UYd$HKCogC:`E(gnjPE*i@#@&i77l.,l^VKm4^n/,'~0KW [KmEsnxDR4K[zRT+D2s+hn	YdAHPlT1Ch`JP)~S3J*I@#@&7i\mDPmV^Jk	3dP{PWGKRNK^Es+xD 8W9XconY3s:nxDdAHKCLgl:ncrbE#p@#@&@#@&idb0PvNK^Es+UYconOAV+snxDAX&[cJTEbNnVrU/E#*@#@&id`@#@&@#@&77ikWPv8KD[DUtWSx,x',JUWr#@#@&iddP@#@&iddi8;YDW	{[WAUvNGm!h+	Y LY2sns+UY~z&Ncro!kNVbU+kJb#@#@&77i8Ps/P	@#@&7did(EOYGU|W;Yv[W1Ehn	YRLnD2s+sn	Y$Hq9`JTEb[+^kU+kJbb@#@&di78@#@&@#@&778@#@&@#@&7d&&,fGP6GDs/@#@&id0G.,`C'ZI,l~@!PmVVwWMh/cVnxTY4I,l_3bPP@#@&i77k6Pv4GD[nM?4WSUP{'~E	WJb~P@#@&di7ils^sKD:k$mDRMEUYb:njDXV 4KDN.~',J8waP[GDYnN,:sw!TTZJ@#@&7idNPsk+~P@#@&ddidmsVwW.:k$CDcDE	Oks+?Dzs+cmk/P+aO,'~Jr@#@&id7N@#@&d7N@#@&@#@&i7Jz~GW,r4N+1O/@#@&7d7l.~mVV}8LmYk~xP6WKR[W^;s+UYc8W9X LY2sns+UYk$HKCT1m:+vJ}$9AZPJ*i@#@&id0K.Pvl'ZI~l,@!,lsV68N+^Yk VxLO4iPCQ3#~	@#@&id7b0,`4KD9nDUtGh	Pxx,JxKE#,	@#@&77dil^V64%n1Yd$mDRMEUOb:+jOHVnR(GMNnMP{PJ8wX~NKYO+9P:TZ!!woJ@#@&di7NPVk+~	@#@&id7dmsV}4%n1Y/,CYR.E	Ob:nUYHV+cmkdK6OP{PEE@#@&di78@#@&diN@#@&@#@&id&z~9KP4k9[+	PWrVNd@#@&d70K.,`8{!pP4,@!,CV^qUw!Yd ^+xTOtpP43QbPP@#@&d7drW,`8WM[+M?4GSxPxx,JUWrb,	@#@&diddb0,cl^V(xaEOd]4TcOXa+RDGiwa+MZC/nc*Px',EC&f93gJ#~`@#@&7di7ils^q	wED/]8TcD;xDkhnUYX^nR(WD9n.P{Pr!26E@#@&d7di7l^V(UaEYd,(T D!UDkh?DXVRSrNDt~',J+Ta6J@#@&diddiCsV&xaEO/,8YR.E	Oks+jOHV+ 4kLtD~{PEy!a6J@#@&i7didCV^qU2!Y/]8TcDE	Or:?DXs+ 8mmVoMGE	N(hmo+~x,J;D^crPQ,N\+9kDKlDtqP3PE&9+{bhlT+/J4rN9+	RLkWbr@#@&di7dilss&xw;Ok$8Tc.!xOb:?YHV 0KxO?byn~{PJO1wXJ@#@&77di8@#@&7d7N,+s/~	@#@&77idkW~vlsV&UaEOk$(TRDXanRDWiwa+./m/+vbP{'Pru(fG2gJb@#@&7id7dmsV&x2;D/$8DcD;xDrs+jDX^+R1/kP+XY~',JE@#@&ddiN@#@&dd)@#@&@#@&diz&P9G,YC4^n/@#@&776WD~cb'Ti,r,@!~mV^Kl(VdR^+UoDtI~b__*~	@#@&di77k6Pv4GD[nM?4WSUP{'~E	WJb~P@#@&di7idC^V:l4^+k,kYR.E	Yrh?YHs+c4WM[nD,',Jqwa~9WOY[P[Ao$wAsE@#@&d7diN,+sk+,	@#@&di7dilsV:l8s/$bDRMExDrh+UYHVnR^dkKn6D~',JE@#@&dd77)@#@&@#@&7id7mV^IWS/,xPmVsKm4snk$kY DKh/@#@&7did6W.Pcz{!IPH~@!,lss"Whd ^+UoD4pPz3_*P	@#@&i7diP7l^V/n^V/&UIKhP{~CV^IKhd$zDcmnV^d@#@&d77iddWGMPc6{TpPa,@!,lV^ZsVkqUIKh sxoD4i,6_3b~	@#@&id7d77ikWPv8WMNn.UtWAU,'xPrUKJb,	@#@&didi7didCV^Zns^/q	]WS$6Y .E	Yb:n?Oz^+ 4K.ND~x,JF2a,NGYDn9P:~s~sAwJ@#@&did7didN~V/~	@#@&di77didilsV/n^Vdq	]WS$aDcDEUOb:n?Dz^+ 1/kK+XY,xPrJ@#@&id77idd)@#@&iddi778@#@&id7dN@#@&d78@#@&@#@&d7&JPfG~mx^tK.k@#@&id6WD,`mx!pPCP@!PCs^Sk	V/cV+	LOtpPm_Q#~`@#@&7dir0,`8GMN+.j4WAx,x{PE	Wr#PP@#@&7didr0,`Cs^Sk	V/]lTc4.+6RDWiw2nMZC/c#,'x~rJ#~`@#@&7di7ils^Sbx3k$mDRMEUYb:njDXV hbNY4~xPr ZwaJ@#@&id7diCV^SrU0/$CDcD;xDrs+jDX^+R4+bLtDPxPr T2XJ@#@&7diddmssSbx0/,lD MEUYbh+UYzsRYnaDqUNUDP~{Pr !a6r@#@&id7dilssdkx0d$mTRM;UYb:?OXsnc4Cm0LDKEU["+wnCDP~',E	WRM+a+lDJ@#@&did7dmVsJbx3k,lYRD!UOks+UYzVn (l^3T.W!x[(slon~{PEEMsvJ~3P9+\NbOnmY4F,_~EJN+|r:mo+k&Cx1tKD orW*J@#@&i7di8@#@&iddN~Vd+,`@#@&7idilV^SbU3k$CTcD;UDk:jYHV+c^d/:+XY~'~Er@#@&di78@#@&77)@#@&@#@&idr0,c(W.9+M?tKh	~'{PExKJb~P@#@&i7d(WD9n.?4WSx~'~EH+dJ@#@&di8~n^/+~`@#@&7di8KD[DUtWSx,xPrxGJ@#@&77)@#@&@#@&di/mMGsV`wv#@#@&7N@#@&@#@&J&P~+Lr	P/2n^V~m4n13~6E	mYbW	d@#@&@#@&zCPAGMNPK8LmY,O4lDPkYGDnd,Y4+,rNBPAGMNPCU9POt~(WG0:mD3,eJ@#@&7l.PmD.S,DxTI@#@&@#@&JM~hKD9PG4%n1Y~Y4CY,/OGM+/~O4+~k9S,hGMN,lx9PD4+,4GW0:C.0PeJ@#@&6Ex1OrW	PKGD[caWd~,AD9~~80:DVbP@#@&P,~,Y4b/ckN,',2Wki@#@&,P~~Dtkk hKDN,x~hMNp@#@&P~~,Y4kk 4KWVhmD3~x,4V:MVp@#@&,P,PY4kk oY	WMN~x,o+D	WMNi@#@&~P,PDtr/ Wb6	WM[P{PWrXW.[p@#@&8@#@&@#@&W!x1YkKx,L+DGD9`b`@#@&P,~P7lD,.x0KWcNGm;hxOR(GNHR^.lYnP6OImUT+c*i@#@&P,P,.RsW-+vJAGMNJBOtb/Rb[bi@#@&,P~P. sW-+AUNvJAGMNJSq*i@#@&,~,Pr6`MRY6D :mY^tvz,w,-x'.T3^z*b~Dc:K\n2U[vJ^tm.l1Yn.r~OqbpP&z,dDDraPKEY,l	zPDDCk^kUL,Vk	nP6++9d~l	N,/2l^nk@#@&P,~PMRdn^+mOc*i@#@&,~,P.Y!Dx,YM;+p@#@&8@#@&@#@&6Ex1OkKxP6raKD9`AD[S,x;:*`@#@&P~~,\l.~M'WWK 9W^!:xYc4K[Xcm.+mYnP6Y"CxT+`*I@#@&,P,P.RhG7+cJSGD9JSO4k/ r9#I@#@&~,P~MRsW\2	[`rhGD9JSq*i@#@&~P,Pk6c.RD+XY :CO1tcz]wP'xw.Y_^&b*P.RsG7+3	NvJm4lMCmD+.JBOqbpPzJ~/DDka~GEDPmxzPO.mksk	LP^kUn,0+n[kPCx9~kwC1+k@#@&,P,~DcYn6DPx~SDNp@#@&@#@&P,~~0KDvkxY4rkRrNpr@!mD. ^+xLO4ir_3b,l.M$bTRbN,xPmD.$bT r9P_,cx!:P ~q#pP,P~P&&,E2NmO+,hG.9PwGdbYrW	r	o@#@&P,PPM+D;D	POD!+I@#@&8@#@&@#@&6Ex1OrW	PT+OICUT+c#P@#@&,P~~7lD~dMPxP	;^VI@#@&,PP,k6c0KW NKm;hxYcd+^+mDrGxcYHwnROGdWA+M/lk+cb,''~ED+aYrbP@#@&,P,PP,P,dD,'~0KW [KmEsnxDR/snmDkKx m.nmYnImUo`bI@#@&P~~,8~+^dP`@#@&,PP,P,~PkD~',0GGcNW1;:xYc8GNHR1DnlOn:+aY"CxT+cbp@#@&~~,PN@#@&~,P~M+DED	Pk.i@#@&N@#@&@#@&W!xmDrW	PoO	WMNk`b	@#@&,P~P7CD,/.~{Px;s^i@#@&,~,Pr6`6WWcNK^Es+UYc/nsmYbGxcYXan YKSKhnD/Ck+c#,x',JOnXYJb`@#@&~P,~,P~,/MP',0KGR9W^Es+UOc/+^nmDkW	 ^DlD+]lUL`bi@#@&P,P~~,PPd.c+awmU9`ESWMNJ*i@#@&P,P~P,P~dMR/s+1Y`*I@#@&,P,PNi@#@&@#@&~P,~\mD~.{0WG 9W^Esn	Y (W9XR1DCYKn6DICUT+`*I@#@&PP,~&z,oY~0r.kY~hK.N@#@&~~,PD hK\n`rAKD[r~Z#i@#@&,~P,D3x9Px~MR+X2l	N`rAGD9J*i@#@&~~,P-lM~hKD[2K/'TI@#@&~P,~7l.,k9wWk'ZI@#@&P~P,\C.,hWM[4^Wm0xEJp@#@&P~P~-mD~lqGD9/~x,x+A~zD.lHc*i@#@&P,PPJz,sWKw~E	Yrs,qPM;x,WED~G0,hKD[/@#@&,P~PS4k^+c.AxNb`@#@&~P,~,P~,k6`DcYaYc:CY1tc&]-P'U-MT_f&b#,Dc:G\n3	NcJ14lMl^ODJSR8#IPJ&,/OMkaPW!Y,CxHPODmksr	oP^rxP0n[/,l	N~/2C1+d@#@&~P,P~~,PYx.cYn6DI,z&,oMl4,Y4nPD+aY@#@&~~,PP,~Pb0`vOZ'rRrPku~Oe'E"r~u-POZ{JgEb,['Pv.Ax[e'ZP[LPD :mY^tvJ,) }l "Tr##*~`@#@&P,P~P~~,P~P,r0v`d.e'x;s^#_/M bx]mxT+`M#=OD!+b	@#@&~~,PP,~P,PP,~~P,DcmGVsCa/n`*I@#@&P~~,PP~~,P~P,~,PCqWMN/]k92WkT~',xnA,WK.NvhWM[2Wk~,YSP. T+OAKG3sl.Vv##I@#@&P~P,~,P~,P,PP,P,rNaWd_3i@#@&,PP,~P,PP,~~8@#@&,P~P~~,PN@#@&@#@&,P~~,PP~&CPLDm8,Y4P	+6DPSGD9PMz@#@&~~,PP,~PMR:K-n`rhKD[JSq*i@#@&,~P,P~~,D2U[,'~DcnXwC	NvJhKD9E#p@#@&P,P~~,PPSGD9wWkQQi@#@&,P~PN@#@&P~P,.+DE.U,lG.9/I@#@&N@#@&@#@&zJP2	N,dwVsP1tn^0P0!UmDkW	d@#@&@#@&Jz~jU[KP&P"nNKPWrX@#@&-CMP4kkOKDz,',x+SP}8LmOi@#@&@#@&4k/DGDHRNmOCP{P]T@#@&4rkYGDH wK/rObWx~x,!@#@&4rkYGMXc4WK3sCD0PxP]T@#@&4k/DGDHR:ma~',&Z@#@&@#@&W!x^YbGx,/C-CkdOKDz`bU1nGkkDkW	#,`@#@&@#@&db0~cNkD\W9+r	~x',YMEn#@#@&i	@#@&@#@&dikW~vtkdOKDzR9CDl,4kkYWMXc[lDl VxLO4PO8DPe'P6GGR9W1Eh+UOcNGm!h+	Y3s:+UOcW;Y._K\d#@#@&di	@#@&@#@&d7d6W.cbP',4kkYWMz NmYmRs+ULDt~O,qi,k~@*{PtrdDW.Xc2K/rDkKxP3P8IP Or#@#@&77i	@#@&7didtbdOWMXcNCYC aW2`*I@#@&d77itkdOKDzR(GK3hmD0RwKwvbi@#@&7di8@#@&@#@&@#@&7ditkkOGDHR9lOl,4b/OWMzR9lOCcV+ULDtDP{~6WGcNKmEs+	OR9W^Es+UOAV+snxDRW!OnD_KtS@#@&@#@&id7k6~`6WG 9Wm;hxORkn^+^DkKxRDXanPe'~J;WUOMWVrb@#@&ddi`@#@&idid4kdOKDzR(GW0:C.0$trdDW.Xc8KWVslM3R^+	LY4T~',0GGcNW1;:xYcdnVmDkGx ^M+CY]l	onc*RonO~WG3sCM3c*@#@&ddi8,nVk+~	@#@&77idW;GxDDW^~xP6WKR[W^;s+UYcd+^+^ObWx ^M+CY]mxL`*@#@&idi7tb/OWMX 8KW3sCD0$tbdOWMXc4GWVhmDVR^nxTY4D,'PG/KxODKsv!b@#@&idd)@#@&@#@&id7k6PcZbxmhG/bYkKUb@#@&did`@#@&7id7tbdYKDz aW/rObWU_3@#@&d7i8@#@&di8@#@&@#@&d7/4WAi	NW"nNK`#@#@&78@#@&)@#@&@#@&W!x^YbGx,oGub/YG.H`-l^;#~P@#@&@#@&idJ&P!x[W@#@&77b0Pv-l^E+,xxP F*@#@&d7`@#@&7dir0,`4rkYW.zcwG/bObWU,'{Ptb/DGDHR[lDl sxoD4#@#@&di7`@#@&did7/C-Cr/DGDH`O.!+#@#@&id78@#@&@#@&7idb0PvtbdYKDzRaWdrDkW	~"{P!*@#@&didP@#@&d77i0GWc[W1Ehn	YRA.bYn`4rkYGMXcNlDl]RO4kdYKDz aW/bOkKxT*@#@&didi0GW [Km;:UYcmsGk+`b@#@&d7didYub/DWDHZ!./KDc#@#@&77i8@#@&@#@&@#@&di&&PM+9W@#@&77)PnVknPP@#@&@#@&dd7r6PctbdDW.HRaW/bYbGx,@!~tb/OGMXR9CYmRVULY4P Fb@#@&7id`@#@&7didWGKRNG^!:nxD SDrD+vtkkYK.XcNCYm$QQ4k/DGDHRwKdrYbW	Tb@#@&7id70KGR9W^;s+xO 1VG/c*@#@&idid/Y_r/DW.X;E.dKD`*@#@&idd)@#@&di8@#@&@#@&77ktGh`UNKIn[K`#@#@&)@#@&@#@&W!x^DkKxPk+DukkYGDHZ;.kWDvbPP@#@&@#@&7YKoTVnAG.9+./vb@#@&dOGToVn$KD[+Mdv#@#@&dbxkDsKG`*i@#@&@#@&7r6P`4r/DWDH 8WK3sl.3,4b/OWMzRaWdrDkWUD*@#@&dP@#@&d7MP{P0KWc[W1Eh+	Y 8KNXc^DlYPn6DImxL+cb@#@&7dbWPvtrdDWDz (WG3sCM3,4kkYWMXc2WkkOkKxD~e'Pr,W(L+1ODJ*@#@&d7	@#@&id7k6~`MRhG7+KG$KWV:m.0`4b/DWDHR(GW0:CD0$4rkYWMzRaW/bOrW	T*#@#@&77i	@#@&i7dMR^G^Vl2d`Wl^d#@#@&@#@&ddiNKjl7+~',F@#@&iddM /V+1Oc#p@#@&d7d[GUl-+,xPZ@#@&7id8@#@&idN@#@&7)@#@&)@#@&zz,2	[P`x[W,z~]NW,okX@#@&@#@&WE	mDkGx~d4WAj	[W"+[Gv#P`@#@&@#@&dbW,`n9kDHW9+}UP{'~YMEnb@#@&dP@#@&@#@&di-CD,4!YOWUi	NGr	~',NG^!:+UOconYAs:n	Y~Xq9`r;x9WmW	Jb@#@&dd7CD,4EDOGx`x9W60W~{P[W1;:xO T+Y3s:nxD$Hq[vJ!xNK{KW0r#@#@&@#@&77b0Pv4kkYWMz NmYmRs+ULDt~@!{~F,uk~4k/OGMX wKdbYrKx,@!',!*@#@&id`@#@&d77(EYDGx`xNK6W0c/DXs+ [b/2VmzP{PEr	VkUnr@#@&di7(EODW	jx9W}URkYzVR[rkwVmzP{PJ	GU+r@#@&d78~n^/nPP@#@&id78!YYGU`x[W}W6RdDX^+R9kk2VmX~',JUG	+J@#@&did4!OOW	j	NGrU kYzV Nb/2smXPx~rkUVbUJ@#@&di8@#@&@#@&7d7l.P(EOOKxI[W}xP{~[W1Es+UY LY3Vh+	Y$z&N`E.NG{KUr#@#@&di\lMP(;YDWUING660P{~NKmEsnUYcoY3VnhxOAH(NvJ.n9W{GW6Jb@#@&@#@&d7b0,`tb/DGDHR2WkkOrKxP@*xP4k/DG.XcNmYCRsn	oOt qP-u~4b/YG.HR[lDCcVn	oDtP{',T#@#@&7dP@#@&7id4!OYKxI[Gr60c/OXsncNr/aslHPx~rkxsr	+E@#@&7id8!YDWx"+9Gr	RdYHVn 9k/aslHP',EUW	+r@#@&d7N,+s/~	@#@&77i4EOOKx]+9G}0Wc/DXVR9r/aVCX,'~E	WxE@#@&ddi8;YDW	InNG6	RdYHs+cNrdaVlz~{PEk	sbxnr@#@&dd)@#@&@#@&i8~+^/n~P@#@&@#@&di\lM~8EDYKxix[GyrUP{~NKm;hxY LY3VhxO~X&N`rE	[Wy{Gxr#@#@&id\m.P(EYDGUj	NK 60W~{P[W1;:xO T+Y3s:nxD$Hq[vJ!xNK |G06Jb@#@&@#@&7ik0,c"6WWc[Gm!:xOR5;DzZKh:mx[3	l4sn9`EE	[KJb*@#@&ddP@#@&7di4;YDWUi	NWy606R/Dzs+cNb/2VCz,'~JbUVbxnE@#@&d77(EOYKU`x[K }xRkYHs+cNr/aVCz,'PrUW	+J@#@&7d)PVd+~`@#@&7di8EDYGU`xNG+}0WRkOHVncNb/w^lH~',JUW	+E@#@&ddi8EDYW	iUNK }x /Oz^+ Nbdw^lz~{PJrU^kU+r@#@&d7)@#@&@#@&id7CD,4;YDWU]NWy6x,'P9G^Es+	Y onOAVn:UY~X([vJDn[K mW	E*@#@&id7lD,4!OYKx]+9W+660P{~NKmEsnUYcoY3VnhxOAH(NvJ.n9W mG60E#@#@&@#@&7ik6P`e0KGR9W^Es+UOc;E.X;W:sCUNAxm4s+[crDnNKE#*@#@&7i	@#@&7id8EDOKx]NK r60cdYHVnR9kd2^lX,xPrkx^rU+r@#@&d7d8;DYGx"nNK 6Uc/YzsR[kk2^lz,',JxKxE@#@&d78,+sdP	@#@&did4!OOW	ING 6W6RdYHs+cNrdaVlz~{PExKUJ@#@&did4!YDGx"+[WyrU kYX^nR9k/asCX,',Jrxsr	+E@#@&7d)@#@&7)@#@&N@#@&@#@&\m.,0;^VkmD+	\W9+~',0Csk+@#@&WE	mYbGUPDWTos+jr.+c#,`@#@&@#@&7b0PcZ6EsVk^M+n	HKN+*@#@&7	@#@&7dal.n	YR9Gm!:+	O oYAVn:nUDAzq9cmKxO.KV1Ch# D!UDkh?DXVRaG/bYrW	Px~rb4kGV!Y+r@#@&diwmDnxO 9W^EsnxDRLnD2VnhxOAH(9`^KxDDW^1mh+*R.E	Yrh?YHs+cyq	[n6,',J1,1E@#@&7daCDxO 9Wm;hxORTnD2s:xY~X&[`1WUYMWsHm:+* D!xYbhn?DX^+ wGd:W2P{~FZ@#@&7iwl.n	Y NK^!:n	Yco+D2^n:xOAHq[c1WxD.W^1lsnbRME	Yr:njDXs+c2WkSnWDP'~qZ@#@&di2mDn	YcNW1EsnxDRL+D2sns+xD$X&N`1GUYMW^1C:nbcD;xDr:?Oz^+RAr9Y4P{~al.xDRNKm!h+	Y 4KNz 1VkUYqkND4~O,Fl@#@&d72mDnxD NKm;hxY LY3VhxO~X&N`1W	ODKVHls+b MExDr:?YHsnR4+bo4Y~x,wCDUYcNG^!:+UOc4GNH K0Wk+DC+bo4OP Pf!@#@&77alDUYcNW1;h+	YconY3s:nxD$X&Nc^KxY.G^1C:bc0G1Ek`#@#@&i74!YOW	{[GSx`9Gm!:+	O oYAVn:nUDAzq9cJ6EsskmDnn	Jb#@#@&id8!YDWx|NKAxvNGm!:nUDRoO2^+:UOAHq9`E0;s^/^DnxyJbb@#@&d7W!Vs/1.+UtW9+P{PD.E@#@&d)Pnsk+PP@#@&idwm.nxDR9W^Ehn	Y oO2^+hn	YAz(9`^W	OMWsgls+#cD!UYb:n?DXsncm/kP+XYP{~EJ@#@&id2l.n	Y NK^Es+UOco+O3^+h+	O~X(9`1WxDDKs1m:n#c0G^!/`*@#@&id4!OOW	{KEO`[G1Eh+	ORT+O3^+:nUDAzq9cr0;^VkmD+	E#*@#@&di4;ODWx|GED`NK^;:xDRL+O3^+h+	OAHq[cr0Esskm.+UyJb*@#@&dd6E^s/1Dn+	HG[P',Wl^/+@#@&78@#@&)wjskAA==^#~@</script>


					<script language="JavaScript" src="scripts/he_functions.js" type="text/javascript"></script>

					<!-- modified for v5.0 -->
					<span id="fooContainer" style="width:100%; border:1px ridge">
        			
						<table width="100%" cellspacing="0" cellpadding="0" class=toolbar>
							<tr>
							<td class="body" height="24">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class="hide" align="center" id="toolbar_preview">
								<tr>
								  <td class="body" height="24">
								  &nbsp;<img src="he_imagens/popups/preview.gif" width="21" height="20" align=absmiddle>&nbsp;Preview Mode
								  </td>
								 </tr>
							</table>
							 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="hide" align="center" id="toolbar_code">
								<tr>
								  <td class="body" height="22">
								  <table border="0" cellspacing="0" cellpadding="1">
									  <tr id=de>
										
											<td>
												<img id=fullscreen2 border="0" src="he_imagens/button_fullscreen.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out2(this);" onmousedown="button_down(this);" onClick='toggleSize();foo.focus();' title="Modo Tela Cheia" class=toolbutton></td>
										
										<td>
										  <img border="0" disabled id="toolbarCut2_off" src="he_imagens/button_cut_disabled.gif" width="21" height="20" title="Recortar (Ctrl+X)" class=toolbutton><img border="0" id="toolbarCut2_on" src="he_imagens/button_cut.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick='doCommand("Cut");foo.focus();' title="Recortar (Ctrl+X)" class=toolbutton style="display:none"></td>
										<td>
										  <img border="0" disabled id="toolbarCopy2_off" src="he_imagens/button_copy_disabled.gif" width="21" height="20" title="Copiar (Ctrl+C)" class=toolbutton><img border="0" id="toolbarCopy2_on" src="he_imagens/button_copy.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick='doCommand("Copy");foo.focus();' title="Copiar (Ctrl+C)" class=toolbutton style="display:none"></td>
										<td>
										  <img border="0" disabled id="toolbarPasteButton2_off" src="he_imagens/button_paste_disabled.gif" width="21" height="20" title="Colar (Ctrl+V)" class=toolbutton><img border="0" id="toolbarPasteButton2_on" src="he_imagens/button_paste.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick='doCommand("Paste");foo.focus();' title="Colar (Ctrl+V)" class=toolbutton style="display:none"></td>
										<td>
										  <img border="0" src="he_imagens/button_find.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick='ShowFindDialog();foo.focus();' title="Localizar e Substituir" class=toolbutton></td>
										<td><img src="he_imagens/seperator.gif" width="2" height="21"></td>
										<td>
										  <img border="0" disabled id="undo2_off" src="he_imagens/button_undo_disabled.gif" width="21" height="20" title="Desfazer (Ctrl+Z)" class=toolbutton><img border="0" id="undo2_on" src="he_imagens/button_undo.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick='doCommand("Undo");' title="Desfazer (Ctrl+Z)" class=toolbutton style="display:none"></td>
										<td>
										  <img border="0" disabled id="redo2_off" src="he_imagens/button_redo_disabled.gif" width="21" height="20" title="Refazer (Ctrl+Y)" class=toolbutton><img border="0" id="redo2_on" src="he_imagens/button_redo.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick='doCommand("Redo");' title="Refazer (Ctrl+Y)" class=toolbutton style="display:none"></td>
										</tr>
									</table>
								  </td>
								 </tr>
								<tr>
								  <td class="body" bgcolor="#808080"><img src="he_imagens/1x1.gif" width="1" height="1"></td>
								</tr>
								<tr>
								  <td class="body" bgcolor="#FFFFFF"><img src="he_imagens/1x1.gif" width="1" height="1"></td>
								</tr>
								 <tr><td height=24>&nbsp;</td></tr>
							</table>
							  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bevel3" align="center" id="toolbar_full">
								<tr>
								  <td class="body" height="22">
									<table border="0" cellspacing="0" cellpadding="1" id=toolbar1>
									  <tr id=de>
										  
											<td>
												<img id=fullscreen border="0" src="he_imagens/button_fullscreen.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out2(this);" onmousedown="button_down(this);" onClick='toggleSize();foo.focus();' title="Modo Tela Cheia" class=toolbutton></td>
										  
											<td>
												<img border="0" disabled id="toolbarCut_off" src="he_imagens/button_cut_disabled.gif" width="21" height="20" title="Recortar (Ctrl+X)" class=toolbutton><img border="0" id="toolbarCut_on" src="he_imagens/button_cut.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick='doCommand("Cut");foo.focus();' title="Recortar (Ctrl+X)" class=toolbutton style="display:none"></td>
											<td>
												<img border="0" disabled id="toolbarCopy_off" src="he_imagens/button_copy_disabled.gif" width="21" height="20" title="Copiar (Ctrl+C)" class=toolbutton><img border="0" id="toolbarCopy_on" src="he_imagens/button_copy.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick='doCommand("Copy");foo.focus();' title="Copiar (Ctrl+C)" class=toolbutton style="display:none"></td>
											<td>
												<img id=toolbarPasteButton_off disabled class=toolbutton width="21" height="20" src="he_imagens/button_paste_disabled.gif" border=0 unselectable="on" title="Colar (Ctrl+V)"><img id=toolbarPasteButton_on class=toolbutton onMouseDown="button_down(this);" onMouseOver="button_over(this); button_over(toolbarPasteDrop_on)" onClick="doCommand('Paste'); foo.focus()" onMouseOut="button_out(this); button_out(toolbarPasteDrop_on);" width="21" height="20" src="he_imagens/button_paste.gif" border=0 unselectable="on" title="Colar (Ctrl+V)" style="display:none"><img id=toolbarPasteDrop_off disabled class=toolbutton width="7" height="20" src="he_imagens/button_drop_menu_disabled.gif" border=0 unselectable="on"><img id=toolbarPasteDrop_on class=toolbutton onMouseDown="button_down(this);" onMouseOver="button_over(this); button_over(toolbarPasteButton_on)" onClick="showMenu('pasteMenu',225,42)" onMouseOut="button_out(this); button_out(toolbarPasteButton_on);" width="7" height="20" src="he_imagens/button_drop_menu.gif" border=0 unselectable="on" style="display:none"></td>
											<td>
											  <img border="0" src="he_imagens/button_find.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick='ShowFindDialog();foo.focus();' title="Localizar e Substituir" class=toolbutton></td>
											<td>
												<img src="he_imagens/seperator.gif" width="2" height="21"></td>
											<td>
												<img id="undo_off" disabled UNSELECTABLE="on" border="0" src="he_imagens/button_undo_disabled.gif" width="21" height="20" title="Desfazer (Ctrl+Z)" class=toolbutton><img id="undo_on" UNSELECTABLE="on" border="0" src="he_imagens/button_undo.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick='goHistory(-1);' title="Desfazer (Ctrl+Z)" class=toolbutton style="display:none"></td>
											<td>
												<img id="redo_off" disabled UNSELECTABLE="on" border="0" src="he_imagens/button_redo_disabled.gif" width="21" height="20" title="Refazer (Ctrl+Y)" class=toolbutton><img id="redo_on" UNSELECTABLE="on" border="0" src="he_imagens/button_redo.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick='goHistory(1);' title="Refazer (Ctrl+Y)" class=toolbutton style="display:none"></td>
											<td><img src="he_imagens/seperator.gif" width="2" height="21"></td>

										  
											<td>
												<img id="toolbarSpell" border="0" src="he_imagens/button_spellcheck.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick='spellCheck();' title="Checar Ortografia (F7)" class=toolbutton></td>
										<td><img src="he_imagens/seperator.gif" width="2" height="21"></td>
										  
											<td>
												<img border="0" src="he_imagens/button_remove_format.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick='doCommand("RemoveFormat");' title="Remover a Formatação de Texto" class=toolbutton></td>
											<td><img src="he_imagens/seperator.gif" width="2" height="21"></td>
										  
											<td>
												<img id="fontBold" border="0" src="he_imagens/button_bold.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out2(this);" onmousedown="button_down(this);" onClick='doCommand("Bold");foo.focus();' title="Negrito (Ctrl+B)" class=toolbutton></td>
										  
											<td>
												<img id="fontUnderline" border="0" src="he_imagens/button_underline.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out2(this);" onmousedown="button_down(this);" onClick='doCommand("Underline");foo.focus();' title="Sublinhado (Ctrl+U)" class=toolbutton></td>
										  
											<td>
												<img id="fontItalic" border="0" src="he_imagens/button_italic.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out2(this);" onmousedown="button_down(this);" onClick='doCommand("Italic");foo.focus();' title="Itálico (Ctrl+I)" class=toolbutton></td>
										  
											<td>
												<img id="fontStrikethrough" border="0" src="he_imagens/button_strikethrough.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out2(this);" onmousedown="button_down(this);" onClick='doCommand("Strikethrough");foo.focus();' title="Tachado" class=toolbutton></td>
										
											<td><img src="he_imagens/seperator.gif" width="2" height="21"></td>

										  
											<td>
												<img id="fontInsertOrderedList" border="0" src="he_imagens/button_numbers.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out2(this);" onmousedown="button_down(this);" onClick='doCommand("InsertOrderedList");foo.focus();' title="Inserir Lista Numerada" class=toolbutton></td>
										  
											<td>
												<img id="fontInsertUnorderedList" border="0" src="he_imagens/button_bullets.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out2(this);" onmousedown="button_down(this);" onClick='doCommand("InsertUnorderedList");foo.focus();' title="Inserir Lista com Marcadores" class=toolbutton></td>
										  
											<td>
											<img border="0" src="he_imagens/button_decrease_indent.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick='doCommand("Outdent");foo.focus();' title="Diminuir Recuo" class=toolbutton></td>
										  
											<td>
												<img border="0" src="he_imagens/button_increase_indent.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick='doCommand("Indent");foo.focus();' title="Aumentar Recuo" class=toolbutton></td>
											<td><img src="he_imagens/seperator.gif" width="2" height="21"></td>
										  
											<td>
												<img id="fontSuperScript" border="0" src="he_imagens/button_superscript.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out2(this);" onmousedown="button_down(this);" onClick='doCommand("superscript");foo.focus();' title="Sobrescrito" class=toolbutton></td>
										  
											<td>
												<img id="fontSubScript" border="0" src="he_imagens/button_subscript.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out2(this);" onmousedown="button_down(this);" onClick='doCommand("subscript");foo.focus();' title="Subscrito" class=toolbutton></td>
											<td><img src="he_imagens/seperator.gif" width="2" height="21"></td>
										  
											<td>
												<img id="fontJustifyLeft" border="0" src="he_imagens/button_align_left.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out2(this);" onmousedown="button_down(this);" onClick='doCommand("JustifyLeft");foo.focus();' title="Alinhar à Esquerda" class=toolbutton></td>
										  
											<td>
												<img id="fontJustifyCenter" border="0" src="he_imagens/button_align_center.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out2(this);" onmousedown="button_down(this);" onClick='doCommand("JustifyCenter");foo.focus();' title="Centralizar" class=toolbutton></td>
										  
											<td>
												<img id="fontJustifyRight" border="0" src="he_imagens/button_align_right.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out2(this);" onmousedown="button_down(this);" onClick='doCommand("JustifyRight");foo.focus();' title="Alinhar à Direita" class=toolbutton></td>
										  
											<td>
												<img id="fontJustifyFull" border="0" src="he_imagens/button_align_justify.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out2(this);" onmousedown="button_down(this);" onClick='doCommand("JustifyFull");foo.focus();' title="Justificar" class=toolbutton></td>
											<td><img src="he_imagens/seperator.gif" width="2" height="21"></td>
										  
											<td>
												<img disabled id="toolbarLink_off" border="0" src="he_imagens/button_link_disabled.gif" width="21" height="20" title="Criar ou Modificar Link" class=toolbutton><img id="toolbarLink_on" border="0" src="he_imagens/button_link.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick='doLink()' title="Criar ou Modificar Link" class=toolbutton style="display:none"></td>
										  
											<td>
												<img border="0" id="toolbarEmail_off" disabled src="he_imagens/button_email_disabled.gif" width="21" height="20" title="Criar Link de E-mail" class=toolbutton><img border="0" id="toolbarEmail_on" src="he_imagens/button_email.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick='doEmail()' title="Criar Link de E-mail" class=toolbutton style="display:none"></td>
										  
											<td>
												<img border="0" src="he_imagens/button_anchor.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick='doAnchor()' title="Inserir/Modificar Âncora" class=toolbutton></td>
											<td><img src="he_imagens/seperator.gif" width="2" height="21"></td>
										  
											<td>
												<img border="0" src="he_imagens/button_help.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick='doHelp()' title="Ajuda" class=toolbutton></td>
										  
									  </tr>
									</table>
								  </td>
								</tr>
									<tr>
								  <td class="body" bgcolor="#808080"><img src="he_imagens/1x1.gif" width="1" height="1"></td>
								</tr>
								<tr>
								  <td class="body" bgcolor="#FFFFFF"><img src="he_imagens/1x1.gif" width="1" height="1"></td>
								</tr>
								<tr>
								  <td class="body" height=22>
								  <table border="0" cellspacing="0" cellpadding="1" id=toolbar2>
									  <tr id=de>
										
										<td>
										  <select id="fontDrop" onChange="doFont(this[this.selectedIndex].value)" class="Text120" style="border:3px solid #FFFFFF" unselectable="on">
											<option selected>Fonte</option>
					<option value="Times New Roman">Default</option>
					<option value="Arial">Arial</option>
					<option value="Verdana">Verdana</option>
					<option value="Tahoma">Tahoma</option>
					<option value="Courier New">Courier New</option>
					<option value="Georgia">Georgia</option>
				
										  </select></td>
										
										<td>
										  <select id="sizeDrop" onChange="doSize(this[this.selectedIndex].value)" class=Text50 unselectable="on">
											<option selected>Tamanho</option>
					<option value="1">1</option>
			  		<option value="2">2</option>
			  		<option value="3">3</option>
			  		<option value="4">4</option>
			  		<option value="5">5</option>
			  		<option value="6">6</option>
			  		<option value="7">7</option>
				
										  </select></td>
										
										<td>
										  <select id="formatDrop" onChange="doFormat(this[this.selectedIndex].value)" class="Text70" unselectable="on">
											<option selected>Formato
											<option value="<P>">Normal
											<option value="<H1>">Heading 1
											<option value="<H2>">Heading 2
											<option value="<H3>">Heading 3
											<option value="<H4>">Heading 4
											<option value="<H5>">Heading 5
											<option value="<H6>">Heading 6
										  </select></td>
										
										<td>
										  <select id="sStyles" onChange="applyStyle(this[this.selectedIndex].value);foo.focus();this.selectedIndex=0;foo.focus();" class="Text90" unselectable="on" onmouseenter="doStyles()">
											<option selected>Estilo</option>
											<option value="">Nenhum</option>
										  </select></td>
										<td><img src="he_imagens/seperator.gif" width="2" height="21"></td>
										

										<td><span id=fontColor><img id=toolbarFont border="0" src="he_imagens/button_font_color.gif" width="21" height="20" onmouseover="button_over(this);  button_over(toolbarFontdrop)" onmouseout="button_out(this); button_out(toolbarFontdrop)" onmousedown="button_down(this);" onClick="(isAllowed()) ? doColorDirectly(1) : foo.focus()" class=toolbutton title="Cor de Fonte"></span><img id=toolbarFontdrop class=toolbutton onMouseDown="button_down(this);" onMouseOver="button_over(this); button_over(toolbarFont)" onClick="(isAllowed()) ? showMenu('colorMenu',157,158) : foo.focus()" onMouseOut="button_out(this); button_out(toolbarFont);" width="7" height="20" src="he_imagens/button_drop_menu.gif" border=0 unselectable="on"></td>
										
										<td><span id=fontHighlight><img id=toolbarHighlight border="0" src="he_imagens/button_highlight.gif" width="21" height="20" onmouseover="button_over(this);  button_over(toolbarHighlightdrop)" onmouseout="button_out(this); button_out(toolbarHighlightdrop)" onmousedown="button_down(this);" onClick="(isAllowed()) ? doColorDirectly(2) : foo.focus()" class=toolbutton title="Realçar"></span><img id=toolbarHighlightdrop class=toolbutton onMouseDown="button_down(this);" onMouseOver="button_over(this); button_over(toolbarHighlight)" onClick="(isAllowed()) ? showMenu('colorMenu2',157,158) : foo.focus()" onMouseOut="button_out(this); button_out(toolbarHighlight);" width="7" height="20" src="he_imagens/button_drop_menu.gif" border=0 unselectable="on"></td>
										<td><img src="he_imagens/seperator.gif" width="2" height="21"></td>
										
										<td id=toolbarTables>
										  <img border="0" src="he_imagens/button_table_down.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick="(isAllowed()) ? showMenu('tableMenu',225,262) : foo.focus()" class=toolbutton title="Funções de Tabela"></td>
										<td><img src="he_imagens/seperator.gif" width="2" height="21"></td>
										
										<td>
										  <img class=toolbutton onMouseDown=button_down(this); onMouseOver=button_over(this); onClick="(isAllowed()) ? showMenu('formMenu',225,210) : foo.focus()" onMouseOut=button_out(this); type=image width="21" height="20" src="he_imagens/button_form_down.gif" border=0 title="Funções de Formulário"></td>
										<td><img src="he_imagens/seperator.gif" width="2" height="21"></td>
										
										<td>
										  <img border="0" src="he_imagens/button_flash.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick="doFlash()" class=toolbutton title="Insert / Modify Flash"></td>
										<td><img src="he_imagens/seperator.gif" width="2" height="21"></td>
										
										<td>
										  <img border="0" src="he_imagens/button_image.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick="doImage()" class=toolbutton title="Inserir/Modificar Imagem"></td>
										<td><img src="he_imagens/seperator.gif" width="2" height="21"></td>
										
										<td>
										  <img border="0" src="he_imagens/button_textbox.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick="doTextbox()" class=toolbutton title="Inserir Caixa de Texto"></td>
										
											<td>
												<img border="0" src="he_imagens/button_hr.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick='doCommand("InsertHorizontalRule");foo.focus();' title="Inserir Linha Horizontal" class=toolbutton></td>
										  
										<td>
										  <img border="0" src="he_imagens/button_chars.gif" width="21" height="20" onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" onClick="doChars()" class=toolbutton title="Inserir Caracteres Especiais"></td>
										
										<td>
										  <img class=toolbutton onmousedown="button_down(this);" onmouseover="button_over(this);" onClick="cleanCode()" onmouseout="button_out(this);" type=image width="21" height="20" src="he_imagens/button_clean_code.gif" border=0 title="Limpar Código HTML"></td>
										
										<td>
											<img id="fontAbsolutePosition_off" disabled class=toolbutton onmousedown="button_down(this);" onmouseover="button_over(this);" width="21" height="20" src="he_imagens/button_absolute_disabled.gif" border=0 title="Trocar Posicionamento Absoluto"><img id="fontAbsolutePosition" class=toolbutton onmousedown="button_down(this);" onmouseover="button_over(this);" onClick="doCommand('AbsolutePosition')" onmouseout="button_out2(this);" type=image width="21" height="20" src="he_imagens/button_absolute.gif" border=0 title="Trocar Posicionamento Absoluto" style="display:none"></td>
										
										<td>
										  <img id="botaobordatabela" class=toolbutton onMouseDown="button_down(this);" onMouseOver="button_over(this);" onClick="toggleBorders();" onMouseOut="button_out2(this);" type=image width="21" height="20" src="he_imagens/button_show_borders.gif" border=0 title="Mostrar/Ocultar Linhas-Guia" id=guidelines></td>
										
										<td><div class="pasteArea" id="myTempArea" contentEditable></div></td>
									  </tr>
									</table>
								  </td>
								</tr>
							  </table>
							</td>
						  </tr>
						</table>
						<!-- table menu -->
						<DIV ID="tableMenu" STYLE="display:none">
						<table border="0" cellspacing="0" cellpadding="0" width=225 style="BORDER-LEFT: buttonhighlight 1px solid; BORDER-RIGHT: buttonshadow 2px solid; BORDER-TOP: buttonhighlight 1px solid; BORDER-BOTTOM: buttonshadow 1px solid;" bgcolor="threedface">
						  <tr onClick="parent.ShowInsertTable()" title="Inserir Tabela" onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							<td style="cursor: hand; font:8pt tahoma;" height=20>
							  &nbsp;&nbsp;Inserir Tabela...&nbsp; </td>
						  </tr>
						  <tr onClick=parent.ModifyTable(); title="Modificar Propriedades de Tabela" onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							<td style="cursor: hand; font:8pt tahoma;" height=20 id=modifyTable>
							  &nbsp;&nbsp;Modificar Propriedades de Tabela...&nbsp;</td>
						  </tr>
						  <tr title="Modificar Propriedades de Célula" onClick=parent.ModifyCell() onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							<td style="cursor: hand; font:8pt tahoma;" height=20 id=modifyCell>
							&nbsp;&nbsp;Modificar Propriedades de Célula...&nbsp; </td>
						  </tr>
						  <tr height=10>
							<td align=center><img src="he_imagens/vertical_spacer.gif" width="140" height="2"></td>
						  </tr>
						  <tr title="Inserir Coluna à Direita" onClick=parent.InsertColAfter() onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							<td style="cursor: hand; font:8pt tahoma;" height=20 id=colAfter>
							  &nbsp;&nbsp;Inserir Coluna à Direita&nbsp;
							</td>
						  </tr>
						  <tr title="Inserir Coluna à Esquerda" onClick=parent.InsertColBefore() onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							<td style="cursor: hand; font:8pt tahoma;" height=20 id=colBefore>
							  &nbsp;&nbsp;Inserir Coluna à Esquerda&nbsp;
							</td>
						  </tr>
						  <tr height=10>
							<td align=center><img src="he_imagens/vertical_spacer.gif" width="140" height="2"></td>
						  </tr>
						  <tr title="Inserir Linha Acima" onClick=parent.InsertRowAbove() onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							<td style="cursor: hand; font:8pt tahoma;" height=20 id=rowAbove>
							  &nbsp;&nbsp;Inserir Linha Acima&nbsp;
							</td>
						  </tr>
						  <tr title="Inserir Linha Abaixo" onClick=parent.InsertRowBelow() onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							<td style="cursor: hand; font:8pt tahoma;" height=20 id=rowBelow>
							  &nbsp;&nbsp;Inserir Linha Abaixo&nbsp;
							</td>
						  </tr>
						  <tr height=10>
							<td align=center><img src="he_imagens/vertical_spacer.gif" width="140" height="2"></td>
						  </tr>
						  <tr title="Excluir Linha" onClick=parent.DeleteRow() onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							<td style="cursor: hand; font:8pt tahoma;" height=20 id=deleteRow>
							  &nbsp;&nbsp;Excluir Linha&nbsp;
							</td>
						  </tr>
						  <tr title="Excluir Coluna" onClick=parent.DeleteCol() onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							<td style="cursor: hand; font:8pt tahoma;" height=20 id=deleteCol>
							  &nbsp;&nbsp;Excluir Coluna&nbsp;
							</td>
						  </tr>
						  <tr height=10>
							<td align=center><img src="he_imagens/vertical_spacer.gif" width="140" height="2" tabindex=1 HIDEFOCUS></td>
						  </tr>
						  <tr title="Mesclar Coluna" onClick=parent.IncreaseColspan() onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							<td style="cursor: hand; font:8pt tahoma;" height=20 id=increaseSpan>
							  &nbsp;&nbsp;Mesclar Coluna&nbsp;
							</td>
						  </tr>
						  <tr title="Dividir Coluna" onClick=parent.DecreaseColspan() onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							<td style="cursor: hand; font:8pt tahoma;" height=20 id=decreaseSpan>
							  &nbsp;&nbsp;Dividir Coluna&nbsp;
							</td>
						  </tr>
						</table>
						</div>
						<!-- end table menu -->

						<!-- form menu -->
						<DIV ID="formMenu" STYLE="display:none;">
						<table border="0" cellspacing="0" cellpadding="0" width=225 style="BORDER-LEFT: buttonhighlight 1px solid; BORDER-RIGHT: buttonshadow 2px solid; BORDER-TOP: buttonhighlight 1px solid; BORDER-BOTTOM: buttonshadow 1px solid;" bgcolor="threedface">
						  <tr title="Inserir Formulário" onClick=parent.insertForm() onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							<td style="cursor: hand; font:8pt tahoma;" height=22>
							  <img width="21" height="20" src="he_imagens/button_form.gif" border=0 align="absmiddle">&nbsp;Inserir Formulário...&nbsp;</td>
						  </tr>
						  <tr title="Modificar Propriedades de Formulário" onClick=parent.modifyForm() onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							<td style="cursor: hand; font:8pt tahoma;" id="modifyForm1" height=22 class=dropDown>
							  <img id="modifyForm2" width="21" height="20" src="he_imagens/button_modify_form.gif" border=0 align="absmiddle">&nbsp;Modificar Propriedades de Formulário...&nbsp;</td>
						  </tr>
						  <tr height=10>
							<td align=center><img src="he_imagens/vertical_spacer.gif" width="140" height="2" tabindex=1 HIDEFOCUS></td>
						  </tr>
						  <tr title="Inserir/Modificar Campo Texto" onClick=parent.doTextField() onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							<td style="cursor: hand; font:8pt tahoma;" height=22>
							  <img width="21" height="20" src="he_imagens/button_textfield.gif" border=0 align="absmiddle">&nbsp;Inserir/Modificar Campo Texto...&nbsp;</td>
						  </tr>
						  <tr title="Inserir/Modificar Área de Texto" onClick=parent.doTextArea() onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							<td style="cursor: hand; font:8pt tahoma;" height=22>
							  <img type=image width="21" height="20" src="he_imagens/button_textarea.gif" border=0 align="absmiddle">&nbsp;Inserir/Modificar Área de Texto...&nbsp;</td>
						  </tr>
						  <tr title="Inserir/Modificar Campo Oculto" onClick=parent.doHidden(); onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							<td style="cursor: hand; font:8pt tahoma;" height=22>
							  <img width="21" height="20" src="he_imagens/button_hidden.gif" border=0 align="absmiddle">&nbsp;Inserir/Modificar Campo Oculto...&nbsp;</td>
						  </tr>
						  <tr title="Inserir/Modificar Botão de Ação" onClick=parent.doButton(); onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							<td style="cursor: hand; font:8pt tahoma;" height=22>
							  <img width="21" height="20" src="he_imagens/button_button.gif" border=0 align="absmiddle">&nbsp;Inserir/Modificar Botão de Ação...&nbsp;</td>
						  </tr>
						  <tr title="Inserir/Modificar Caixa de Seleção" onClick=parent.doCheckbox(); onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							<td style="cursor: hand; font:8pt tahoma;" height=22>
							  <img width="21" height="20" src="he_imagens/button_checkbox.gif" border=0 align="absmiddle">&nbsp;Inserir/Modificar Caixa de Seleção...&nbsp;</td>
						  </tr>
						  <tr title="Inserir/Modificar Botão de Opção" onClick=parent.doRadio(); onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							<td style="cursor: hand; font:8pt tahoma;" height=22>
							  <img width="21" height="20" src="he_imagens/button_radio.gif" border=0 align="absmiddle">&nbsp;Inserir/Modificar Botão de Opção...&nbsp;</td>
						  </tr>
						  <tr title="Insere / Modifica Campo Seleção" onClick=parent.doSelect(); onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							<td style="cursor: hand; font:8pt tahoma;" height=22>
							  <img width="21" height="20" src="he_imagens/button_select.gif" border=0 align="absmiddle">&nbsp;Insere / Modifica Campo Seleção...&nbsp;</td>
						  </tr>
						</table>
						</div>
						<!-- formMenu -->

						<!-- zoom menu -->
						<DIV ID="zoomMenu" STYLE="display:none;">
						<table border="0" cellspacing="0" cellpadding="0" width=65 style="BORDER-LEFT: buttonhighlight 1px solid; BORDER-RIGHT: buttonshadow 2px solid; BORDER-TOP: buttonhighlight 1px solid; BORDER-BOTTOM: buttonshadow 1px solid;" bgcolor="threedface">
						  <tr onClick=parent.doZoom(500) onMouseOver="parent.contextHilite(this); parent.toggleTick(zoom500_,1);" onMouseOut="parent.contextDelite(this); parent.toggleTick(zoom500_,0);">
							<td style="cursor: hand; font:8pt tahoma;" height=22 id="zoom500_">
							 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;500%&nbsp;</td>
						  </tr>
						  <tr onClick=parent.doZoom(200) onMouseOver="parent.contextHilite(this); parent.toggleTick(zoom200_,1);" onMouseOut="parent.contextDelite(this); parent.toggleTick(zoom200_,0);">
							<td style="cursor: hand; font:8pt tahoma;" height=22 id="zoom200_">
							  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;200%&nbsp;</td>
						  </tr>
						  <tr onClick=parent.doZoom(150) onMouseOver="parent.contextHilite(this); parent.toggleTick(zoom150_,1);" onMouseOut="parent.contextDelite(this); parent.toggleTick(zoom150_,0);">
							<td style="cursor: hand; font:8pt tahoma;" height=22 id="zoom150_">
							  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;150%&nbsp;</td>
						  </tr>
						  <tr onClick="parent.doZoom(100)" onMouseOver="parent.contextHilite(this); parent.toggleTick(zoom100_,1);" onMouseOut="parent.contextDelite(this); parent.toggleTick(zoom100_,0)";">
							<td style="cursor: hand; font:8pt tahoma;" height=22 id="zoom100_">
							  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;100%&nbsp;</td>
						  </tr>
						  <tr onClick=parent.doZoom(75); onMouseOver="parent.contextHilite(this); parent.toggleTick(zoom75_,1);" onMouseOut="parent.contextDelite(this); parent.toggleTick(zoom75_,0);">
							<td style="cursor: hand; font:8pt tahoma;" height=22 id="zoom75_">
							  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;75%&nbsp;</td>
						  </tr>
						  <tr onClick=parent.doZoom(50); onMouseOver="parent.contextHilite(this); parent.toggleTick(zoom50_,1);" onMouseOut="parent.contextDelite(this); parent.toggleTick(zoom50_,0);">
							<td style="cursor: hand; font:8pt tahoma;" height=22 id="zoom50_">
							  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;50%&nbsp;</td>
						  </tr>
						  <tr onClick=parent.doZoom(25); onMouseOver="parent.contextHilite(this); parent.toggleTick(zoom25_,1);" onMouseOut="parent.contextDelite(this); parent.toggleTick(zoom25_,0);">
							<td style="cursor: hand; font:8pt tahoma;" height=22 id="zoom25_">
							  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;25%&nbsp;</td>
						  </tr>
						  <tr onClick=parent.doZoom(10); onMouseOver="parent.contextHilite(this); parent.toggleTick(zoom10_,1);" onMouseOut="parent.contextDelite(this); parent.toggleTick(zoom10_,0);">
							<td style="cursor: hand; font:8pt tahoma;" height=22 id="zoom10_">
							  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10%&nbsp;</td>
						  </tr>
						</table>
						</div>
						<!-- zoomMenu -->

						<DIV ID="colorMenu" STYLE="display:none;">
						<table cellpadding="0" cellspacing="5" style="cursor: hand;font-family: Verdana; font-size: 6px; BORDER-LEFT: buttonhighlight 1px solid; BORDER-RIGHT: buttonshadow 2px solid; BORDER-TOP: buttonhighlight 1px solid; BORDER-BOTTOM: buttonshadow 1px solid;" bgcolor="threedface"><tr><td>

						<table cellpadding=0 cellspacing=0 style="font-size: 3px;">
						  <tr>
							<td colspan="10" style="border: solid 1px #d4d0c8;" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" onClick="parent.doColor()"><div style="border: solid 1px #808080; padding: 2px; margin: 2px;">
							<table cellspacing=0 cellpadding=0 border=0 width=90% style="font-size:3px">
							<tr><td><div style="background-color:#000000; border:solid 1px #808080; width:12px; height:12px"></div></td><td align=center style="font-size:11px">Nenhum&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
							</table>
							</div>
							</td>
						  </tr>
						  <tr><td>&nbsp;</td></tr>
						  <tr>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#000000; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#993300; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#333300; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#003300; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#003366; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#000099; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#333399; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#333333; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
						  </tr>
						  <tr>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#990000; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#FF6600; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#999900; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#009900; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#009999; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#0000FF; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#666699; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#808080; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
						  </tr>
						  <tr>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#FF0000; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#FF9900; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#99CC00; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#339966; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#33CCCC; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#3366FF; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#990099; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#999999; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
						  </tr><tr>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#FF00FF; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#FFCC00; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#FFFF00; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#00FF00; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#00FFFF; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#00CCFF; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#993366; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#CCCCCC; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
						  </tr>
						  <tr>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#FF99CC; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#FFCC99; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#FFFF99; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#CCFFCC; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#CCFFFF; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#99CCFF; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#CC99FF; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
							<td onClick="parent.doColor(this)" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" style="padding:2px;border:solid 1px #d4d0c8;"><div style="background-color:#FFFFFF; border:solid 1px #808080; width:12px; height:12px">&nbsp;</div></td>
						  </tr>
						  <tr><td>&nbsp;</td></tr>
						  <tr>
							<td colspan="10" style="height:23px; font-family: arial; font-size:11px; border: solid 1px #d4d0c8;" onMouseOver="parent.button_over(this)" onMouseOut="parent.button_out(this)" onClick="parent.doMoreColors()" align=center>&nbsp;Mais Cores...</td>
						  </tr>
						</table>

						</td></tr>
						</table>
						</DIV>


						<DIV ID="contextMenu" style="display:none;">
						<table border="0" cellspacing="0" cellpadding="3" width="223" style="BORDER-LEFT: buttonhighlight 1px solid; BORDER-RIGHT: buttonshadow 1px solid; BORDER-TOP: buttonhighlight 1px solid; BORDER-BOTTOM: buttonshadow 1px solid;" bgcolor="threedface">
						  <tr id=cmCut onClick ='parent.document.execCommand("Cut");parent.oPopup2.hide()'>
							<td style="cursor:default; font:8pt tahoma; border: threedface 1px solid;" onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							  &nbsp&nbsp;&nbsp;&nbsp&nbsp;Recortar&nbsp;</td>
						  </tr>
						  <tr id=cmCopy onClick ='parent.document.execCommand("Copy");parent.oPopup2.hide()'>
							<td style="cursor:default; font:8pt tahoma; border: threedface 1px solid;" onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							  &nbsp&nbsp;&nbsp;&nbsp&nbsp;Copiar&nbsp;</td>
						  </tr>
						  <tr id=cmPaste onClick ='parent.document.execCommand("Paste");parent.oPopup2.hide()'>
							<td style="cursor:default; font:8pt tahoma; border: threedface 1px solid;" onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							  &nbsp&nbsp;&nbsp;&nbsp&nbsp;Colar&nbsp;</td>
						  </tr>
						</table>
						</div>

						<DIV ID="cmTableMenu" style="display:none">
						<table border="0" cellspacing="0" cellpadding="3" width="223" style="BORDER-LEFT: buttonhighlight 1px solid; BORDER-RIGHT: buttonshadow 1px solid; BORDER-TOP: buttonhighlight 1px solid; BORDER-BOTTOM: buttonshadow 1px solid;" bgcolor="threedface">
						  <tr onClick ='parent.ModifyTable();'>
							<td style="cursor:default; font:8pt tahoma; border: threedface 1px solid;" onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							  &nbsp&nbsp;&nbsp;&nbsp&nbsp;Modificar Propriedades de Tabela...&nbsp;</td>
						  </tr>
						</table>
						</DIV>

						<DIV ID="cmTableFunctions" style="display:none">
						<table border="0" cellspacing="0" cellpadding="3" width="223" style="BORDER-LEFT: buttonhighlight 1px solid; BORDER-RIGHT: #808080 1px solid; BORDER-TOP: buttonhighlight 1px solid; BORDER-BOTTOM: #808080 1px solid;" bgcolor="threedface">
						  <tr onClick ='parent.ModifyCell();'>
							<td style="cursor:default; font:8pt tahoma; BORDER-LEFT: threedface 1px solid; BORDER-RIGHT: threedface 1px solid; BORDER-TOP: threedface 1px solid; BORDER-BOTTOM: threedface 1px solid;" onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							  &nbsp&nbsp;&nbsp;&nbsp&nbsp;Modificar Propriedades de Célula...&nbsp;</td>
						  </tr>
						</table>
						<table border="0" cellspacing="0" cellpadding="3" width="223" style="BORDER-LEFT: buttonhighlight 1px solid; BORDER-RIGHT: #808080 1px solid; BORDER-TOP: buttonhighlight 1px solid; BORDER-BOTTOM: #808080 1px solid;" bgcolor="threedface">
						  <tr onClick ='parent.InsertColBefore(); parent.oPopup2.hide();'>
							<td style="cursor:default; font:8pt tahoma; BORDER-LEFT: threedface 1px solid; BORDER-RIGHT: threedface 1px solid; BORDER-TOP: threedface 1px solid; BORDER-BOTTOM: threedface 1px solid;" onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							  &nbsp&nbsp;&nbsp;&nbsp&nbsp;Inserir Coluna à Esquerda&nbsp;</td>
						  </tr>
						  <tr onClick ='parent.InsertColAfter(); parent.oPopup2.hide();'>
						   <td style="cursor:default; font:8pt tahoma; BORDER-LEFT: threedface 1px solid; BORDER-RIGHT: threedface 1px solid; BORDER-TOP: threedface 1px solid; BORDER-BOTTOM: threedface 1px solid;" onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							  &nbsp&nbsp;&nbsp;&nbsp&nbsp;Inserir Coluna à Direita&nbsp;</td>
						  </tr>
						</table>
						<table border="0" cellspacing="0" cellpadding="3" width="223" style="BORDER-LEFT: buttonhighlight 1px solid; BORDER-RIGHT: #808080 1px solid; BORDER-TOP: buttonhighlight 1px solid; BORDER-BOTTOM: #808080 1px solid;" bgcolor="threedface">
						  <tr onClick ='parent.InsertRowAbove(); parent.oPopup2.hide();'>
							<td style="cursor:default; font:8pt tahoma; BORDER-LEFT: threedface 1px solid; BORDER-RIGHT: threedface 1px solid; BORDER-TOP: threedface 1px solid; BORDER-BOTTOM: threedface 1px solid;" onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							  &nbsp&nbsp;&nbsp;&nbsp&nbsp;Inserir Linha Acima&nbsp;</td>
						  </tr>
						  <tr onClick ='parent.InsertRowBelow(); parent.oPopup2.hide();'>
							<td style="cursor:default; font:8pt tahoma; BORDER-LEFT: threedface 1px solid; BORDER-RIGHT: threedface 1px solid; BORDER-TOP: threedface 1px solid; BORDER-BOTTOM: threedface 1px solid;" onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							  &nbsp&nbsp;&nbsp;&nbsp&nbsp;Inserir Linha Abaixo&nbsp;</td>
						  </tr>
						</table>
						<table border="0" cellspacing="0" cellpadding="3" width="223" style="BORDER-LEFT: buttonhighlight 1px solid; BORDER-RIGHT: #808080 1px solid; BORDER-TOP: buttonhighlight 1px solid; BORDER-BOTTOM: #808080 1px solid;" bgcolor="threedface">
						  <tr onClick ='parent.DeleteRow(); parent.oPopup2.hide();'>
							<td style="cursor:default; font:8pt tahoma; BORDER-LEFT: threedface 1px solid; BORDER-RIGHT: threedface 1px solid; BORDER-TOP: threedface 1px solid; BORDER-BOTTOM: threedface 1px solid;" onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							  &nbsp&nbsp;&nbsp;&nbsp&nbsp;Excluir Linha&nbsp;</td>
						  </tr>
						  <tr onClick ='parent.DeleteCol(); parent.oPopup2.hide();'>
							<td style="cursor:default; font:8pt tahoma; BORDER-LEFT: threedface 1px solid; BORDER-RIGHT: threedface 1px solid; BORDER-TOP: threedface 1px solid; BORDER-BOTTOM: threedface 1px solid;" onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							  &nbsp&nbsp;&nbsp;&nbsp&nbsp;Excluir Coluna&nbsp;</td>
						  </tr>
						</table>
						<table border="0" cellspacing="0" cellpadding="3" width="223" style="BORDER-LEFT: buttonhighlight 1px solid; BORDER-RIGHT: #808080 1px solid; BORDER-TOP: buttonhighlight 1px solid; BORDER-BOTTOM: #808080 1px solid;" bgcolor="threedface">
						  <tr onClick ='parent.IncreaseColspan(); parent.oPopup2.hide();'>
							<td style="cursor:default; font:8pt tahoma; BORDER-LEFT: threedface 1px solid; BORDER-RIGHT: threedface 1px solid; BORDER-TOP: threedface 1px solid; BORDER-BOTTOM: threedface 1px solid;" onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							  &nbsp&nbsp;&nbsp;&nbsp&nbsp;Mesclar Coluna&nbsp;</td>
						  </tr>
						  <tr onClick ='parent.DecreaseColspan(); parent.oPopup2.hide();'>
							<td style="cursor:default; font:8pt tahoma; BORDER-LEFT: threedface 1px solid; BORDER-RIGHT: threedface 1px solid; BORDER-TOP: threedface 1px solid; BORDER-BOTTOM: threedface 1px solid;" onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							  &nbsp&nbsp;&nbsp;&nbsp&nbspDividir Coluna&nbsp;</td>
						  </tr>
						</table>
						</DIV>

						<DIV ID="cmImageMenu" style="display:none">
						<table border="0" cellspacing="0" cellpadding="3" width="223" style="BORDER-LEFT: buttonhighlight 1px solid; BORDER-RIGHT: #808080 1px solid; BORDER-TOP: buttonhighlight 1px solid; BORDER-BOTTOM: #808080 1px solid;" bgcolor="threedface">
						  <tr onClick ='parent.doImage();'>
							<td style="cursor:default; font:8pt tahoma; BORDER-LEFT: threedface 1px solid; BORDER-RIGHT: threedface 1px solid; BORDER-TOP: threedface 1px solid; BORDER-BOTTOM: threedface 1px solid;" onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							  &nbsp&nbsp;&nbsp;&nbsp&nbsp;Modificar Propriedades da Imagem...&nbsp;</td>
						  </tr>
						</table>
						</DIV>

						<DIV ID="cmLinkMenu" style="display:none">
						<table border="0" cellspacing="0" cellpadding="3" width="223" style="BORDER-LEFT: buttonhighlight 1px solid; BORDER-RIGHT: #808080 1px solid; BORDER-TOP: buttonhighlight 1px solid; BORDER-BOTTOM: #808080 1px solid;" bgcolor="threedface">
						  <tr onClick ='parent.doLink();'>
							<td style="cursor:default; font:8pt tahoma; BORDER-LEFT: threedface 1px solid; BORDER-RIGHT: threedface 1px solid; BORDER-TOP: threedface 1px solid; BORDER-BOTTOM: threedface 1px solid;" onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							  &nbsp&nbsp;&nbsp;&nbsp&nbsp;Criar ou Modificar Link...&nbsp;</td>
						  </tr>
						</table>
						</DIV>

						<DIV ID="cmSpellMenu" style="display:none">
						<table border="0" cellspacing="0" cellpadding="3" width="223" style="BORDER-LEFT: buttonhighlight 1px solid; BORDER-RIGHT: #808080 1px solid; BORDER-TOP: buttonhighlight 1px solid; BORDER-BOTTOM: #808080 1px solid;" bgcolor="threedface">
						  <tr onClick ='parent.spellCheck();'>
							<td style="cursor:default; font:8pt tahoma; BORDER-LEFT: threedface 1px solid; BORDER-RIGHT: threedface 1px solid; BORDER-TOP: threedface 1px solid; BORDER-BOTTOM: threedface 1px solid;" class="parent.toolbutton" onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							  &nbsp&nbsp;&nbsp;&nbsp&nbsp;Check Spelling...&nbsp;</td>
						  </tr>
						</table>
						</DIV>

						<!-- Start Paste Menu -->
						<DIV ID="pasteMenu" STYLE="display:none">
						<table border="0" cellspacing="0" cellpadding="0" width=180 style="BORDER-LEFT: buttonhighlight 1px solid; BORDER-RIGHT: buttonshadow 2px solid; BORDER-TOP: buttonhighlight 1px solid; BORDER-BOTTOM: buttonshadow 1px solid;" bgcolor="threedface">
						  <tr onClick="parent.doCommand('Paste');">
							<td height=20 style="cursor: hand; font:8pt tahoma; BORDER-LEFT: threedface 1px solid; BORDER-RIGHT: threedface 1px solid; BORDER-TOP: threedface 1px solid; BORDER-BOTTOM: threedface 1px solid;" onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
						&nbsp&nbsp;&nbsp;&nbsp&nbsp;Colar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ctrl+V </td>
						  </tr>
						  <tr onClick="parent.pasteWord();">
							<td height=20 style="cursor: hand; font:8pt tahoma; BORDER-LEFT: threedface 1px solid; BORDER-RIGHT: threedface 1px solid; BORDER-TOP: threedface 1px solid; BORDER-BOTTOM: threedface 1px solid;" onMouseOver="parent.contextHilite(this);" onMouseOut="parent.contextDelite(this);">
							  &nbsp&nbsp;&nbsp;&nbsp&nbsp;Colar do MS Word&nbsp;&nbsp;&nbsp;&nbsp;Ctrl+D </td>
						  </tr>
						</table>
						</div>
						<!-- End Paste Menu -->
					<!-- END DEVEDIT TOOLBAR -->

					<!-- removed security=restricted to allow Flash insertion -->
					<span id=divContainer style="width:100%" class=divContainer>
					<iFrame onBlur="updateValue()" contenteditable id="foo" src='' style="width:100%; border: 1px solid #D4D0C8"></iFrame>
					<iFrame id="fooStyles" src='' style="display:none"></iFrame>
					<iframe onBlur="updateValue()" id=previewFrame height=80% style="width=100%; display:none" style="border: 1px solid #D4D0C8"></iframe>
					</span>
        						<script>
								document.getElementById("foo").style.setExpression("height", "document.body.clientHeight - 85")
								document.getElementById("previewFrame").style.setExpression("height", "document.body.clientHeight - 59")
								</script>

        							<table cellpadding=0 cellspacing=0 width=100% style="background-color: threedface">
        								<tr>
        									<td height=22><img style="cursor:hand;" id=editTab src=he_imagens/status_edit_up.gif width=98 height=22 border=0 onClick=editMe()><img style="cursor:hand; " id=sourceTab src=he_imagens/status_source.gif width=98 height=22 border=0 onClick=sourceMe()><img style="cursor:hand; " id=previewTab src=he_imagens/status_preview.gif width=98 height=22 border=0 onClick=previewMe()></td><td width=100%  height=22 background=he_imagens/status_border.gif>&nbsp;</td><td background=he_imagens/status_border.gif id=statusbar align=right valign=bottom><img src=he_imagens/button_zoom.gif width=42 height=17 valign=bottom onmouseover="button_over(this);" onmouseout="button_out(this);" onmousedown="button_down(this);" class=toolbutton onClick="showMenu('zoomMenu',65,178)"></td>
        								</tr>
        							</table>
						</span>
						<!-- end mod -->

        				<script language="JavaScript">

        					var fooWidth = "90%";
        					var fooHeight = "80%";

							function getDataIframe(){
								if ( Mode == "2" )
									return foo.document.documentElement.outerText;
								
								return foo.document.documentElement.outerHTML;
							}

							function setDataIframe(value){
								foo.document.write(value);
								foo.document.close();
								
								fooStyles.document.write(value);
								fooStyles.document.close();
								initFoo();
								foo.focus();

								toggleBorders()
								toggleWasOn = "yes"

								if (toggleWasOn == "yes") {
									toggleBorders()
									toggleWasOn = "no"
								}
							}

        					function setValue(){
									foo.document.write('&lt;body>&lt;/body>');
									foo.document.close();							
									fooStyles.document.write('&lt;body>&lt;/body>');
									fooStyles.document.close();
									window.parent.loadIFrame(window);
        					}

							function updateValue(isSave)
							{
							 if (document.activeElement) {
							  if ((document.activeElement.parentElement.id == "de") && (!isSave)) {
							   return false;
							  } else {
							   if (parent.document.all.HEControl_html != null) {
								parent.document.all.HEControl_html.value = SaveHTMLPage();
							   }
							  }
							 }
							}

        				</script>

        			
						</textarea>

						<iframe id="HEControl_frame" width="90%" height="93%" frameborder=0 scrolling="no"></iframe>

						<input type="hidden" name="HEControl_html">

						<script language="JavaScript">
							HEControl_frame.document.write(document.getElementById("HEControl_src").value)
							HEControl_frame.document.close()
							HEControl_frame.document.body.style.margin = "0px";

							// set the width of the editor.
							// dont forget to add the toolbar2 id in the toolbar

							setTimeout("doMyWidth();",100);

							function doMyWidth() {
								minWidth = 0
								if (HEControl_frame.document.getElementById("toolbar1").clientWidth > HEControl_frame.document.getElementById("toolbar2").clientWidth)
									minWidth = HEControl_frame.document.getElementById("toolbar1").clientWidth
								else
									minWidth = HEControl_frame.document.getElementById("toolbar2").clientWidth

								document.getElementById("HEControl_frame").style.setExpression("width", "setFrameWidth_HEControl()")
							}

							function setFrameWidth_HEControl () {

							frame_offsetLeft = document.getElementById("HEControl_frame").offsetLeft

								if (document.body.clientWidth > minWidth) {
									if ("90%".indexOf('%') > -1) {

										if (parseInt("90%") / 100 * document.body.clientWidth < (minWidth + frame_offsetLeft + 11))
											return minWidth + 2
										else
											return "90%"

									} else {

										if (parseInt("90%") < minWidth + 2)
											return minWidth + 2
										else
											return "90%"
									}

								} else {
									return minWidth + 2
								}
							}

						</script>
					</textarea>
		</td></tr></table>
	</form>
</body>
</html>