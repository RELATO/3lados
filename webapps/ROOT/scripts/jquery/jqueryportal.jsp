<!--
Criado por: Willian S. Bispo
Relato Consultorias
 
A Pesquisar:
http://docs.jquery.com/Plugins/Validation - Validações
http://flowplayer.org/tools/index.html - Itens Variados
http://plugins.jquery.com/project/ac - AutoComplete
http://plugins.jquery.com/project/text-input-field-filter - Filtros de Textos
http://plugins.jquery.com/project/jstree - Lista Estilo diretorios
http://plugins.jquery.com/project/format - Formatadores de Valores
http://plugins.jquery.com/project/calendrical - Calendario
http://ganov.net/projects/calendar/ - Calendario
http://jqueryui.com/ - Itens Variados
-->


<script language="JavaScript" src="/scripts/jquery/jquery-1.4.4.min.js"></script>
<!-- Inicio de Plugins -->

<!--http://digitalbush.com/projects/masked-input-plugin/-->

<script language="JavaScript" src="/scripts/jquery/jquery.maskedinput/jquery.maskedinput-1.2.2.js"></script>
<!--http://jqueryui.com/-->
<script language="JavaScript" src="/scripts/jquery/jquery.ui/jquery.ui.core.js"></script>
<script language="JavaScript" src="/scripts/jquery/jquery.ui/jquery.ui.widget.js"></script>
<script language="JavaScript" src="/scripts/jquery/jquery.ui/jquery.ui.accordion.js"></script>
<script language="JavaScript" src="/scripts/jquery/jquery.ui/jquery.ui.datepicker.js"></script>
<script language="JavaScript" src="/scripts/jquery/jquery.ui/jquery.ui.datepicker-pt-BR.js"></script>
<link rel="stylesheet" type="text/css" href="/scripts/jquery/jquery.ui/css/dark-hive/jquery-ui-1.8.9.custom.css"/>
<!--<link rel="stylesheet" type="text/css" href="/scripts/jquery/jquery.ui/css/smoothness/jquery-ui-1.8.5.custom.css"/>-->
<!--<link rel="stylesheet" type="text/css" href="/scripts/jquery/jquery.ui/css/overcast/jquery-ui-1.8.5.custom.css"/>-->
<!--<link rel="stylesheet" type="text/css" href="/scripts/jquery/jquery.ui/css/excite-bike/jquery-ui-1.8.5.custom.css"/>-->


<!--http://jquery.malsup.com/corner/-->
<script language="JavaScript" src="/scripts/jquery/jquery.corners/jquery.corners.js"></script>



<script>
/************************************************************************
 Tipos de dados:
	-input
	--jqr_date: define um campo do tipo data.
 ************************************************************************/

/************************************************************************
 Tipos de dados:
	-div
	--jqr_accordion: Forma titulo e textos com opção de collapse. 
	Devem ser colocados na ordem de titulo depois texto, pode fazer 
	esquema de árvore. Titulos devem ser encapsulados em tags "<a>".
 ************************************************************************/
 
$(document).ready(function() {
	$(".jqr_date").datepicker();
    $(".jqr_date").mask("99/99/9999");
	$(".jqr_accordion").accordion({ collapsible: true, active: false, clearStyle: true });
	$(".jqr_accordion").accordion({active: 1});
	$(".jqr_corner").corner("keep 20px");
});
 </script>
 
 