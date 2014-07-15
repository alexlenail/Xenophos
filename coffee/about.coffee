## Loading Page Functions ##

$(document).ready -> loadpage()


loadpage = () -> 

	buildNavFunctions()
	bindClickEvents()
	bindHoverEvents()

	$("#headerBar").hide().fadeIn(1000)
	who = $("#who").hide().fadeIn(1000)
	what = $("#what").hide().fadeIn(1000)

	preloadAboutImages()


buildNavFunctions = () ->

	$("#Gallery").click -> exitPage("gallery.html")
	$("#headerBarLogo").click -> exitPage("index.html")


bindClickEvents = () -> 

	$("#who").click -> 
		$("#what, #who").fadeOut(400)
		exitPage('people.html')

	$("#what").click -> 
		$("#what, #who").fadeOut(400)
		exitPage('method.html')

	$("#About").click -> back()
	$(".backButton").click -> back()


bindHoverEvents = () -> 

	$('#who').children().hover (-> $('#meet').addClass('aboutHover')), (-> $('#meet').removeClass('aboutHover'))
	$('#what').children().hover (-> $('#how').addClass('aboutHover')), (-> $('#how').removeClass('aboutHover'))


## Exiting page functions ## 

exitPage = (destination) ->

	go = () -> window.location.href = destination

	$("#headerBar").fadeOut(400)
	$(".pane").fadeOut(400)

	window.setTimeout(go, 400)


## Preload the images ##

preloadAboutImages = () -> 

	gallery = []

	gallery.push("images/about/t4.jpg")
	gallery.push("images/about/tools0.jpg")
	gallery.push("images/about/Alex5.jpg")
	gallery.push("images/about/Bradford1.jpg")
	gallery.push("images/about/Max.jpg")
	gallery.push("images/about/icons/raw/Anna.jpg")
	gallery.push("images/about/icons/raw/masha.jpg")
	gallery.push("images/about/greg&arun.jpg")
	gallery.push("images/about/t3.jpg")
	gallery.push("images/about/tools6.jpg")
	gallery.push("images/about/tools/sticks.jpg")
	gallery.push("images/about/tools/staves2.jpg")
	gallery.push("images/about/tools/whip.jpg")
	gallery.push("images/about/tools/steel-wool.jpg")
	gallery.push("images/about/tools/floodlight.jpg")
	gallery.push("images/about/tools/orb.jpg")
	gallery.push("images/about/tools/saber.jpg")
	gallery.push("images/about/Alex3.jpg")
	gallery.push("images/portfolio/lightpainting/2.jpg")
	gallery.push("images/portfolio/lightpainting/21.jpg")
	gallery.push("images/portfolio/lightpainting/23.jpg")
	gallery.push("images/portfolio/lightpainting/12.jpg")
	gallery.push("images/about/Alex2.jpg")
	gallery.push("images/about/us.jpg")
	gallery.push("images/about/photo-e.jpg")
	gallery.push("images/about/lapp.jpg")
	
	preload(gallery)


preload = (array) -> 

	for image in array
		img = new Image()
		img.src = image


