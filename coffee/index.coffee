##  Main title image fits window  ##

resizeIndexImage = () ->

	window_height = $(window).height()
	window_width = $(window).width()
	image_height = $(".indexImage").height()
	image_width = $(".indexImage").width()

	if (window_height / window_width) > (image_height / image_width) # => skinny window

		$(".indexImage").height(window_height)
		$(".indexImage").width(window_height * image_width / image_height)
		$(".indexImage").offset({top: 0})

	else # (window_height / window_width) < (image_height / image_width) # => fat window

		$(".indexImage").width(window_width)
		$(".indexImage").height(window_width * image_height / image_width)
		topOffset = ($(".indexImage").height() - $(window).height()) / 2
		if topOffset > 0
			$(".indexImage").offset({top: -topOffset})
		else
			$(".indexImage").offset({top: 0})


$(document).ready () -> 

	$indexImage = $(".indexImage")
	$enterSite = $("#enterSite")
	
	$indexImage.hide()
	$enterSite.hide()
	
	$(window).bind 'resize', () -> resizeIndexImage()

	$indexImage.load -> 
		resizeIndexImage()
		$indexImage.fadeIn(3000, prepareEnterSite)

	preloadGalleryImages()


## Preload the images ##

preloadGalleryImages = () -> 

	gallery = []
	for i in [1..30]
		gallery.push("../images/portfolio/lightpainting/#{i}.jpg") 
	preload(gallery)


preload = (array) -> 

	$(array).each -> 
		$('<img/>')[0].src = this



## Enter Gallery button animation and function ##

prepareEnterSite = () -> 

	$enterSite = $("#enterSite")

	$enterSite.delay(10).fadeIn(3000, -> $enterSite.addClass("fade")).click ->
		$enterSite.removeClass("fade").fadeOut(800)
		$(".indexImage").fadeOut(2000)
		window.setTimeout(goToGallery, 2000)



goToGallery = () -> window.location.href = "gallery.html"



## perhaps something that will exist in future versions ##

operatingSystem = () ->

	if navigator.appVersion.indexOf("Mac") isnt -1
		return "Enter fullscreen for a better view (⌘ + F11)"

	if navigator.appVersion.indexOf("Win") isnt -1 
		return "Enter fullscreen for a better view (press F11)"

	else return undefined




