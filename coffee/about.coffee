
## Loading Page Functions ##

loadpage = () -> 

	buildNavFunctions()

	$("#headerBar").hide().fadeIn(1000)
	$(".pane").hide().fadeIn(1000)


$(document).ready -> loadpage()






























## Exiting page functions ## 

exitPage = (destination) ->

	go = () -> window.location.href = destination

	$("#headerBar").fadeOut(800)
	$(".pane").fadeOut(800)

	window.setTimeout(go, 800)	

buildNavFunctions = () ->

	$("#Gallery").click -> exitPage("gallery.html")
	$("#Contact").click -> exitPage("404.html")
	$("#headerBarLogo").click -> exitPage("index.html")



