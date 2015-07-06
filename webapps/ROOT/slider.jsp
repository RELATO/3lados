<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br" dir="ltr" >
<head profile="http://gmpg.org/xfn/11">
<title>3 Lados - Soluções Empresariais Integradas</title>
 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
 
 	
		 <script type="text/javascript">
			 setInterval(
	
					 function() {
					     $('#ticker div').each(function() {
					         $(this).animate({
					             'top': '-=1px'
					         }, 50, function() {
					             var top = parseInt($(this).css('top').replace('px', '')) +
					                         parseInt($(this).css('height').replace('px', ''));
					             if (top < 0) {
					                 //console.log('removing', this)
					                 var clone = $(this).clone();
					                 var parent = $(this).parent();
					                 clone.css('top', '0px');
					                 $(this).remove();
					                 parent.append(clone);
					             }
					         })
					     })
					 }, 40)
		 </script>
		 <style type="text/css">
		 	#ticker {
			    height: 500px;
			    width:268px;
			    overflow: hidden;
			    margin:auto;
			}
			
			#ticker div {
			    position: relative;
			    padding: 10px;
			    top: 0px;
			}
			
			#ticker div img {
			    display: block;
			    margin:70px auto;
			    
			}
		 </style>
		 
</head>
<body id="top" >

	<div id="ticker">
	    <div>
	        <img src="/images/rbt.jpg"/>
	        <img src="/images/minigranjas.jpg"/>
	        <img src="/images/unb.jpg"/>
	        <img src="/images/ascon.jpg"/>
	        <img src="/images/capte.jpg"/>
	    </div>
	</div>

</body>
</html>