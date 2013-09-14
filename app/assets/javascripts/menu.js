function popupMenu() {
	jQuery('#nav_menu').fadeIn();
	var nav_height = jQuery('#nav_menu').height() + 90;

	jQuery('#nav_container').css({width:300, height:nav_height});

}

function popdownMenu() {
	jQuery('#nav_menu').fadeOut();
	jQuery('#nav_container').css({width:70, height:70});
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