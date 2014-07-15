

bindContact = () -> 

	backsplash = $('<div/>', class: 'backsplash')
	backsplash.width $(window).width()
	backsplash.height $(window).height()

	$('#Contact').click -> 
		backsplash.hide()
		backsplash.fadeIn()
		$('html').prepend(backsplash)




