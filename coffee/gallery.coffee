## The data model is stored locally ##

images = []
selected = 4  # Initial value
numberOfGalleryImages = 30


## Resize functions ##

resizeTheImage = () ->

	windowHeight = $(window).height()
	desiredImageHeight = windowHeight - 350 # which is the header and bottom combined
	$("#theImage").height(desiredImageHeight)

resizeBottomBar = () -> 

	windowWidth = $(window).width()
	desiredWidth = windowWidth + 193 * 2
	$("#bottomBar").width(desiredWidth)

	return desiredWidth


## Initialization functions ##

loadBottomBarImages = () ->

	numberOfIconsToDisplay = Math.floor(resizeBottomBar()/193)

	images.length = 0
	images.push(i) for i in [1..numberOfIconsToDisplay]
		
	refreshIcons()


refreshIcons = () -> 

	$bottomBar = $("#bottomBar")

	$bottomBar.empty()

	$bottomBar.append ListItem(i) for i in images


reloadPage = () -> 

	resizeTheImage()
	loadBottomBarImages()
	buildNavFunctions()


loadPage = () -> 

	reloadPage()
	$("#headerBar").hide().fadeIn(1000)
	$("#theImage").hide().fadeIn(1000)
	$("#bottomBar").hide().fadeIn(1000)


$(document).ready ->

	loadPage()	

	$(window).bind 'resize', () -> reloadPage()



## Bottom Bar Functions ##

ListItem = (id) ->  # constructor

	url = "url(\"images/portfolio/lightpainting/icons/#{id}.jpg\")"
	$li = $("<li/>", class: "fade", id: "#{id}", style: "background-image: #{url};")
	$li.click (e) -> selectIcon(e.target.id)

	return $li


deleteListItem = (id) -> $("##{id}").remove()  # destructor


selectIcon = (id) ->   # called on click

	selected = parseInt(id)

	centerSelectedImage()

	$theImage = $("#theImage")
	url = "images/portfolio/lightpainting/#{selected}.jpg"

	unless $theImage.attr('src') is url
		$theImage.fadeTo("fast", 0, -> $(@).attr 'src', url).fadeTo("slow", 1.0)

	resizeTheImage()



## Slide Effects ##

centerSelectedImage = () ->

	if images.indexOf(selected) > images.length * 0.7 then slideLeft()
	else if images.indexOf(selected) < images.length * 0.16 then slideRight()
	else return


slideLeft = () -> 

	addBack()

	$("#bottomBar").animate("padding-left": "0px", 400, 'linear', -> 
		$("#bottomBar").css("padding-left": "193px")
		removeFront()
	)



slideRight = () ->

	$("#bottomBar").css("padding-left": "0px")
	
	addFront()

	$("#bottomBar").animate("padding-left": "193px", 400, 'linear', removeBack())

	
removeFront = () -> deleteListItem( images.shift() )

removeBack = () -> deleteListItem( images.pop() )

addFront = () -> 

	image = theImageBefore images[0]
	images.unshift(image)
	$("#bottomBar").prepend ListItem(image)

addBack = () -> 
	
	image = theImageAfter images[images.length - 1]
	images.push(image)
	$("#bottomBar").append ListItem(image)


window.theImageBefore = (id) -> 

	if id - 1 isnt 0 then return id - 1
	else return numberOfGalleryImages


window.theImageAfter = (id) -> 

	if id + 1 > numberOfGalleryImages then return 1
	else return id + 1


## Arrow Key & Spacebar Functionality ##

$(document).keydown( (e) -> 

	if e.keyCode is 37 or e.keyCode is 40 then selectIcon(theImageBefore(selected))
	else if e.keyCode is 32 or e.keyCode is 38 or e.keyCode is 39 then selectIcon(theImageAfter(selected))
	else return

)



## Exiting page functions ## 

exitPage = (destination) ->

	go = () -> window.location.href = destination

	$("#headerBar").fadeOut(400)
	$("#theImage").fadeOut(400)
	$("#bottomBar").fadeOut(400)

	window.setTimeout(go, 400)	


buildNavFunctions = () ->

	$("#About").click -> exitPage("About.html")
	$("#Contact").click -> exitPage("404.html")
	$("#headerBarLogo").click -> exitPage("index.html")



