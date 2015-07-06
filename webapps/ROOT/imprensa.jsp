<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=windows-1252" %>
<%@ page import="system.*" %>
<%@ page import="br.com.relato.util.SqlHelper" %>
<%@ page import="br.com.relato.EntryPoint" %>
<%@ page import="br.com.relato.portal.Novidade" %>
<%@ page import="br.com.relato.portal.ControlPortal" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="mc" scope="request" class="system.MenuConstructor"/>
<jsp:useBean id="cm" scope="request" class="system.ContentManager"/>

<%!
    String checkNull(Object valor){
        if ( "".equals(valor) || valor == null || "null".equals(valor) )
            return "";
        return String.valueOf(valor);
    }
   
    String checkNull(Map mapa, Object valor, int lingua){
        String retorno = "";
        List key = new ArrayList();
        key.add(valor);
        key.add(new Integer(lingua));
        if(mapa.containsKey(key)){
            retorno = String.valueOf(mapa.get(key));
        }
        
        else{
            key = new ArrayList();
            key.add(valor);
            key.add(new Integer(1));
            if(mapa.containsKey(key)){
                retorno = String.valueOf(mapa.get(key));
            }
        }
        
        return retorno;
    }
 
%>

<% 
    
    Map map = ControlPortal.getPortalLingua();
    String urlConteudo;
    int idConteudo;
    int idLingua;
    int idLinguaX;

    try {
        urlConteudo = (request.getParameter("u") != null ? request.getParameter("u") : "");
    }catch ( Exception e ) {
        urlConteudo = "";
    }
    
    try {
        idConteudo = (request.getParameter("conteudo") != null ? Integer.parseInt(request.getParameter("conteudo")) : 1);
    }catch ( Exception e ) {
        idConteudo = 1;
    }
    
    if(!"".equals(urlConteudo)){
        int idFind = cm.getConteudoUrl(urlConteudo);
        if(idFind != -1){
            idConteudo = idFind;
        }
    }
    
    try {
        idLinguaX = (request.getParameter("lingua") != null ? Integer.parseInt(request.getParameter("lingua")) : 0);
    }catch ( Exception e ) {
        idLinguaX = 0;
    }
    
    if(idLinguaX != 0){
        request.getSession().setAttribute("lingua",new Integer(idLinguaX));
    }
    try {
        idLingua = (request.getSession().getAttribute("lingua") != null ? Integer.parseInt(String.valueOf(request.getSession().getAttribute("lingua"))) : 1);
    }catch ( Exception e ) {
        idLingua = 1;
    }   
    int lingua;
    try {
        lingua = (request.getSession().getAttribute("lingua") != null ? Integer.parseInt(String.valueOf(request.getSession().getAttribute("lingua"))) : 1);
    }catch ( Exception e ) {
        lingua = 1;
    }
    
    java.util.Date date = new java.util.Date();
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z");
    String text = sdf.format(date);
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<link rel="icon" type="image/x-icon" href="/favicon.png" />
<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" />

<%
if ( idConteudo != 1 ){ 
    if ( "true".equals(request.getParameter("permission")) ){
%>
    <title><%=UriUtil.decodeUri(cm.getTitulo(idConteudo,idLingua))%></title>
<%  
    }else{
%>
    <title><%=UriUtil.decodeUri(cm.getTituloIndex(idConteudo))%></title>
<%
    }
}else{
%>
    <title>Reabilyt na Imprensa</title>
<%
}
%> 

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<META NAME="TITLE" CONTENT=" Os Aparelhos Auditivos Mais Baratos de Campinas e Região ">
<meta http-equiv="imagetoolbar" content="no" />
<META name="robots" content="index, follow">
<META name="googlebot" content="index, follow">
<META NAME="DC.title" CONTENT=" Os Aparelhos Auditivos Mais Baratos de Campinas e Região ">
<META NAME="Unknownrobot"   CONTENT="index,follow,all">

<%
if ( idConteudo != 1 ){ 
    if ( "true".equals(request.getParameter("permission")) ){
%>
    <META name="keywords" content="<%=UriUtil.decodeUri(cm.getKeywords(idConteudo,idLingua))%>">
<%  
    }else{
%>
    
    <META name="keywords" content="<%=UriUtil.decodeUri(cm.getKeywords(idConteudo))%>">
<%
    }
}else{
%>
    <META name="keywords" content="reabilyt, aparelho auditivo, centro auditivo, aparelho de audição, aparelhos de audição, aparelho de surdez, aparelhos de surdez, aparelho de ouvido, aparelhos de ouvido, aparelho auditivo barato, aparelho auditivo 780,00 reais.">
<%
}
%> 

<%
if ( idConteudo != 1 ){ 
    if ( "true".equals(request.getParameter("permission")) ){
%>
    <META name="description" content="<%=UriUtil.decodeUri(cm.getDescricao(idConteudo,idLingua))%>">
<%  
    }else{
%>
    
    <META name="description" content="<%=UriUtil.decodeUri(cm.getDescricao(idConteudo))%>">
    
<%
    }
}else{
%>
    <META name="description" content="Não compre aparelhos auditivos sem procedência, compare nossos preços.">
<%
}
%> 

<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<link type="text/css" href="menu.css" rel="stylesheet" />
<link rel="stylesheet" href="css/prettyPhoto.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
<script src="js/jquery-1.6.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="menu.js"></script>
<script type="text/javascript" src="scripts/jquery.defaultvalue.js"></script>
<script type="text/javascript" src="scripts/jquery-ui-1.8.13.custom.min.js"></script>
<script type="text/javascript" src="scripts/jquery.scrollTo-min.js"></script>
<script src="js/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function () {
    $("#fullname, #validemail, #message").defaultvalue("Nome", "Email", "Mensagem");
    $('#shout a').click(function () {
        var to = $(this).attr('href');
        $.scrollTo(to, 1200);
        return false;
    });
    $('a.topOfPage').click(function () {
        $.scrollTo(0, 1200);
        return false;
    });
    $("#tabcontainer").tabs({
        event: "click"
    });
});
</script>
<!-- Homepage Only Scripts -->
<!-- <script type="text/javascript" src="scripts/jquery.cycle.min.js"></script> -->
<!-- <script type="text/javascript" src="scripts/jquery.cycle.setup.js"></script> -->
<script type="text/javascript" src="scripts/piecemaker/swfobject/swfobject.js"></script>
<script type="text/javascript">
var flashvars = {};
flashvars.cssSource = "scripts/piecemaker/piecemaker.css";
flashvars.xmlSource = "scripts/piecemaker/piecemaker.xml";
var params = {};
params.play = "false";
params.menu = "false";
params.scale = "showall";
params.wmode = "transparent";
params.allowfullscreen = "true";
params.allowscriptaccess = "sameDomain";
params.allownetworking = "all";
swfobject.embedSWF('scripts/piecemaker/piecemaker.swf', 'piecemaker', '960', '375', '10', null, flashvars, params, null);
</script>
<!-- End Homepage Only Scripts -->

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-25681842-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

</head>
<body id="top">
<!-- 
<div class="wrapper col1">
  <div id="topbar" class="clear">
    <ul>
      <li><a href="#">Contato</a></li>
      
     </ul>
    <form action="#" method="post" id="search">
      <fieldset>
        <legend>Site Search</legend>
        <input type="text" value="Pesquisa ae velho&hellip;" onfocus="this.value=(this.value=='Search Our Website&hellip;')? '' : this.value ;" />
        <input type="image" id="go" src="images/search.gif" alt="Search" />
      </fieldset>
    </form>
  </div>
</div>
 -->
<!-- ####################################################################################################### -->
<div class="wrapper col2">
  <div id="header" class="clear">
    <div class="fl_left">
        <a href="/index.jsp"><img src="/images/logo9.png" alt=""/></a>
<!--       <h1><a href="index.html">PhotoProwess</a></h1> -->
<!--       <p>Free CSS Website Template</p> -->
    </div>
    <div id="topnav">

    <%
    out.println(GetMenuJquery.renderVisualizacao(mc, true ,idLingua));
    %>   

</div>
  </div>
</div>
<!-- ####################################################################################################### -->
    <div class="wrapper col3">
     <div id="portal" class="clear">
        <div id="imprensa">
            <h1>Reabilyt Na Imprensa</h1>
            <br>
            <center>
                    <ul class="gallery clearfix menu">
                            <h4>Associação dos Aposentados da Fundação </h4>
		                <a href="images/fullscreen/aafc1.jpg" rel="prettyPhoto[mixed]"><img src="images/imprensa/aafc1.jpg" alt="Associação dos Aposentados da Fundação 1" width="150" height="83"/></a>&nbsp;&nbsp;&nbsp;
		                <a href="images/fullscreen/aafc2.jpg" rel="prettyPhoto[mixed]"><img src="images/imprensa/aafc2.jpg" alt="Associação dos Aposentados da Fundação 2" width="150" height="83"/></a>
		                    <h4>Semanário Oficial de Paulínia</h4>
		                <a href="images/fullscreen/paulinia.jpg" rel="prettyPhoto[mixed]"><img src="images/imprensa/paulinia1.jpg"alt="Governo de Paulinia" width="150" height="83"/></a>
		                    <h4>Veja Paulínia</h4>
		                <a href="images/fullscreen/vejap.jpg" rel="prettyPhoto[mixed]"><img src="/images/imprensa/veja.jpg" alt="Veja Paulinia" width="150" height="83"/></a>
		                    <h4>Igreja do Nazareno</h4>
		                <a href="/images/fullscreen/nazareno.jpg" rel="prettyPhoto[mixed]"><img src="/images/imprensa/nazareno.jpg" alt="Igreja Nazareno" width="150" height="83"/></a>
		                    <h4>Ciclo de palestras Surdez e prevenção - Paulínia</h4>
                        <a href="http://www.youtube.com/watch?v=Ep_l7gqdR7o" rel="prettyPhoto[mixed]"><img src="/images/imprensa/vid1.jpg" alt="Palestra 1" width="150" height="83"/></a>&nbsp;&nbsp;&nbsp;
                        <a href="http://www.youtube.com/watch?v=e-53vpk7E50" rel="prettyPhoto[mixed]"><img src="/images/imprensa/vid2.jpg" alt="Palestra 2" width="150" height="83"/></a>
                    </ul>  
            </center>
            <script type="text/javascript" charset="utf-8">
            $(document).ready(function(){
                $("area[rel^='prettyPhoto']").prettyPhoto();
                
                $(".gallery:first a[rel^='prettyPhoto']").prettyPhoto({animation_speed:'normal',theme:'light_square',slideshow:68000, autoplay_slideshow: true});
                $(".gallery:gt(0) a[rel^='prettyPhoto']").prettyPhoto({animation_speed:'fast',slideshow:68000, hideflash: true});
        
                $("#custom_content a[rel^='prettyPhoto']:first").prettyPhoto({
                    custom_markup: '<div id="map_canvas" style="width:260px; height:265px"></div>',
                    changepicturecallback: function(){ initialize(); }
                });

                $("#custom_content a[rel^='prettyPhoto']:last").prettyPhoto({
                    custom_markup: '<div id="bsap_1259344" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6"></div><div id="bsap_1237859" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6" style="height:260px"></div><div id="bsap_1251710" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6"></div>',
                    changepicturecallback: function(){ _bsap.exec(); }
                });
            });
            </script>
    
            <!-- Google Maps Code -->
            <script type="text/javascript"
                src="http://maps.google.com/maps/api/js?sensor=true">
            </script>
            <script type="text/javascript">
              function initialize() {
                var latlng = new google.maps.LatLng(-34.397, 150.644);
                var myOptions = {
                  zoom: 8,
                  center: latlng,
                  mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                var map = new google.maps.Map(document.getElementById("map_canvas"),
                    myOptions);
              }

            </script>
            <!-- END Google Maps Code -->
    
            <!-- BuySellAds.com Ad Code -->
            <style type="text/css" media="screen">
                .bsap a { float: left; }
            </style>
            <script type="text/javascript">
            (function(){
              var bsa = document.createElement('script');
                 bsa.type = 'text/javascript';
                 bsa.async = true;
                 bsa.src = '//s3.buysellads.com/ac/bsa.js';
              (document.getElementsByTagName('head')[0]||document.getElementsByTagName('body')[0]).appendChild(bsa);
            })();
            </script>
            <!-- END BuySellAds.com Ad Code -->
        </div>
     </div>
    </div>
<!-- ####################################################################################################### -->
<div class="wrapper">
  <div id="footer" class="clear">
    <div class="fl_left">
      <div class="about_us border">
        <h2 class="shadow">Sobre a Reabilyt</h2>
        <p>Somos uma empresa voltada para a reabilitação auditiva, de pessoas que não podem mais ser tratadas com medicação e atos cirurgicos, e assim nao terão outra indicação médica, senão o uso de aparelhos auditivos. </p>
            <br>
          <ul  id="topbar">
              <li><a href="/localizacao.jsp" class="shadow">Localização</a></li>
          </ul>
      </div>
            <h2 class="shadow">Siga-Nos</h2>
      <ul class="socialize">
        <li><img src="/images/facebook.png" class="icon"><span>Facebook:</span> <a href="http://pt-br.facebook.com/pages/Reabilyt-Centro-Auditivo/211148935605253" target="_blank">www.facebook.com/reabilyt</a></li>
        <li class="last"><img src="/images/twitter.png" class="icon"><span>Twitter:</span> <a href="http://www.twitter.com/reabilyt" target="_blank">www.twitter.com/reabilyt</a></li>
      </ul>
      
    </div>
    <!-- ####################################################################################################### -->
    <div class="fl_right">
    <div id="contact" class="clear">
        <h2 class="shadow">Contate-Nos</h2>
        <div class="fl_left">
          <form method="post" action="/enviaemail.jsp">
            <label for="fullname">Nome:</label>
            <input type="text" name="fullname" id="fullname" value="" />
            <label for="validemail">Email:</label>
            <input type="text" name="validemail" id="validemail" value="" />
            <label for="message">Mensagem:</label>
            <textarea name="message" id="message" cols="45" rows="10"></textarea>
            <button type="submit" value="submit"><span>Enviar</span></button>
            <input name="destform" type=HIDDEN NAME=Escondido value="rafael.lontra@relato.com.br" />
          </form>
        </div>
      </div>
    </div>
  </div>
  <div id="backtotop"><a href="#top" class="topOfPage">Ir Para o Topo</a></div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper">
  <div id="copyright" class="clear">
    <p class="fl_left">Reabilyt &copy; 2011 - Todos os direitos reservados</p>
    <p class="fl_right">Template by <a href="http://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p>
  </div>
</div>
</body>
</html>