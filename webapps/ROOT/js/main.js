$(function(){
	
	$("a")
		.hover(function(){
			$(this).animate({
				backgroundPosition: "0 -140px"
			}, 100)
		}, function() {
			$(this).animate({
				backgroundPosition: "0 -183px"
			}, 100)
		})
		.mousedown(function(){
			$(this).css({
				backgroundPosition: "0 -220px"
			})	
		});
	
});