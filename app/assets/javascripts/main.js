jQuery(document).ready(function(){
	if (jQuery('#comment').offset() !== undefined)
	{
		var commentPosition = jQuery('#comment').offset().top;
		jQuery('html, body').animate({scrollTop:commentPosition}, 'slow');
	}		
});
