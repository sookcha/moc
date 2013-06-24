jQuery(document).ready(function(){
	$("li i.right").hide();
	if (window.location.hash.substring(1) === "comment")
	{
		var commentPosition = jQuery('#comment').offset().top;
		jQuery('html, body').animate({scrollTop:commentPosition}, 'slow');
	}
	
	$("ul li").hover(
	    function() {
				$("i.right", this).show();
	    }, function() {
				$("i.right", this).hide();
	    });
});
