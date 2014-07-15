
## Loading Page Functions ##

$(document).ready -> loadpage()

loadpage = () -> 

	buildNavFunctions()
	
	setAndBindHowPageSizes()

	$("#headerBar").hide().fadeIn(1000)

	howWeDidIt()


buildNavFunctions = () ->

	$("#Gallery").click -> exitPage("gallery.html")
	$("#About").click -> exitPage('about.html')
	$("#headerBarLogo").click -> exitPage("index.html")

howWeDidIt = () -> 

	setAndBindHowPageSizes()
	$("#method").removeClass("hidden").fadeIn(1000)
	

## Set and Bind CSS Functions ##

setAndBindHowPageSizes = () -> 

	width = $(window).width()

	setTitleFontSize = () -> 
		s = Math.floor($("#teachingMasha").height() / 6)
		$(".title, #inspiTitle").css("font-size": s)

	setFontSize = () -> 
		width = $(window).width()
		size = Math.floor(width / 180) * 2
		titleSize = Math.floor(size * 0.6) * 2
		if size > 18 
			$(".tool-text p, article p, #actionText, #settingText p").css("font-size": size)
			$(".tool-text h2, #settingText h2, .inspiration-link").css("font-size": titleSize)
		else 
			$(".tool-text p, article p, #actionText, #settingText p").css("font-size": 18)
			$(".tool-text h2, #settingText h2, .inspiration-link").css("font-size": "1.5em";)


	$(window).bind 'resize', -> 
		setTitleFontSize()
		setFontSize()

	setTitleFontSize()	
	setFontSize()


## Exiting page functions ## 

exitPage = (destination) ->

	go = () -> window.location.href = destination

	$("#headerBar").fadeOut(400)
	$(".pane").fadeOut(400)

	window.setTimeout(go, 400)

