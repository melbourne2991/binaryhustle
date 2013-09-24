function popupMenu() {
	jQuery('#nav_menu').fadeIn();
	var nav_height = jQuery('#nav_menu').height() + 90;
}

function popdownMenu() {
	jQuery('#nav_menu').fadeOut();
	var nav_height = jQuery('#nav_menu').height() - 90;
}

jQuery(document).ready(function () {

	//Get width to determine device
	var width = jQuery('.container').width();

	if(width > 720) {
		jQuery('#nav_container').hover(function () {
			popupMenu();
		}, function() {
			popdownMenu();
		});
	}
	else
	{	

	var toggle = 0;

	jQuery('#nav_menu ul').append('<li class="close"><a>CLOSE X</a></li>');
				
		jQuery('#nav_container').click(function () {
				if(toggle == 0) {
					popupMenu();
					toggle = 1;
				}
			});	
		

		jQuery('.close').click(function() {
			jQuery('#nav_menu').fadeOut(function() {
			toggle = 0;
			});
			
		});
	}




});