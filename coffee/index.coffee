##  Main title image fits window  ##

$(document).ready () -> 

	$.backstretch('images/graphics/index.jpg', {speed: 3000})

	preloadGalleryImages()


$(document).on "backstretch.show", -> prepareEnterSite()


## Preload the images ##

preloadGalleryImages = () -> 

	gallery = []
	for i in [1..30]
		gallery.push("images/portfolio/lightpainting/#{i}.jpg")
		gallery.push("images/portfolio/lightpainting/icons/#{i}.jpg")
	preload(gallery)


preload = (array) -> 

	$(array).each -> 
		$('<img/>')[0].src = this


## Enter Gallery button animation and function ##

prepareEnterSite = () -> 

	$enterSite = $("#enterSite")

	$enterSite.delay(10).fadeIn(3000, -> $enterSite.addClass("fade2").click ->
		$enterSite.removeClass("fade2").fadeOut(800)
		$(".backstretch").fadeOut(2000)
		window.setTimeout(goToGallery, 2000) )



goToGallery = () -> window.location.href = "gallery.html"


## perhaps something that will exist in future versions ##

###

operatingSystem = () ->

	if navigator.appVersion.indexOf("Mac") isnt -1
		return "Enter fullscreen for a better view (⌘ + F11)"

	if navigator.appVersion.indexOf("Win") isnt -1 
		return "Enter fullscreen for a better view (press F11)"

	else return undefined

###
