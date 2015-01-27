## Data Structures ##

Xenophos = [
	{firstname:"Alex", lastname:"Lenail", tags: ["Co-founder", "Light-painter", "Webmaster"]},
	{firstname:"Bradford", lastname:"Thorne", tags: ["Co-founder", "Light-painter", "Photographer"]},
	{firstname:"Max", lastname:"Lenail", tags: ["Co-founder", "Lead Photographer"]},
	{firstname:"Anna", lastname:"McGarrigle", tags: ["Photographer", "Web Designer"]},
	{firstname:"Masha", lastname:"Andreyeva", tags: ["Photographer", "Light-painter"]},
	{firstname:"Arun", lastname:"Varma", tags: ["Photographer", "Light-painter"]},
	{firstname:"Gregory", lastname:"Dunn", tags: ["Light-painter"]},
	{firstname:"Tiffany", lastname: "Tsung", tags: ["Light-painter"]},
	{firstname:"Paige", lastname:"Morkner", tags: ["Light-painter"]},
	{firstname:"Eric", lastname:"Theis", tags: ["Light-painter"]},
	{firstname:"Kevin", lastname:"Lee", tags: ["Light-painter"]}
	{firstname:"Jason", lastname:"Liang", tags: ["Light-painter"]}
]

currentPanes = []

addToCurrentPanes = (panes...) -> currentPanes.push(pane) for pane in panes

removeFromCurrentPane = (pane) -> currentPanes.splice( indexOf(pane), 1)

clearAllCurrentPanes = () -> currentPanes = []

getCurrentPanes = () -> return currentPanes


## Loading Page Functions ##

$(document).ready -> loadpage()


loadpage = () -> 

	buildNavFunctions()
	
	$("#headerBar").hide().fadeIn(1000)

	meetUs()
	

buildNavFunctions = () ->

	$("#Gallery").click -> exitPage("gallery.html")
	$("#About").click -> exitPage('about.html')
	$("#headerBarLogo").click -> exitPage("index.html")
	$(".backButton").click -> back()
	$("#Contact").click -> exitPage("mailto:zfrenchee@gmail.com")


## Functions for portraits ##

meetUs = () ->

	$people = $("#people")
	$people.children().each -> $(@).remove()  # remove duplicates
	$people.removeClass("hidden").fadeIn(1)

	addToCurrentPanes( $people )
	
	for person in Xenophos
		buildPortraitFor(person)

	$('body').animate({scrollTop: 100}, 1000)


buildPortraitFor = (person) -> 

	$portrait = $("<div/>", class: "hidden portrait", id: "#{person.firstname}")
	$image = $("<img/>", src: "images/about/icons/#{person.firstname}.jpg")
	name = "<h1>#{person.firstname} #{person.lastname}</h1>"
	tags = "<p>" + person.tags.join(", &nbsp") + "</p>"
	$nametag = $("<div/>", class: "nametag").append(name).append(tags)
	
	$portrait.append($image).append($nametag)
	$("#people").append($portrait)

	$portrait.removeClass("hidden").addClass("popIn")

	$portrait.click -> 
		$('body').animate({scrollTop: 0}, 200)
		showSpecificBio(person.firstname)
	

## Functions for specicic people pages ##

showSpecificBio = (name) -> 

	switch name
		when "Alex" then $div = $("#Alex_Lenail")
		when "Bradford" then $div = $("#Bradford_Thorne")
		when "Max" then $div = $("#Max_Lenail")
		when "Anna" then $div = $("#Anna_McGarrigle")
		when "Masha" then $div = $("#Masha_Andreyeva")
		when "Arun" then $div = $("#Arun_Varma_Gregory_Dunn")
		when "Gregory" then $div = $("#Arun_Varma_Gregory_Dunn")
		when "Tiffany", "Paige", "Eric" then $div = $("#Tiffany_Tsung_Paige_Morkner_Eric_Theis")
		when "Kevin", "Jason" then $div = $("#Kevin_Lee_Allen_Lee_Jason_Liang")
		else throw new Error "Name unrecognized"

	oldPane.fadeOut(200) for oldPane in getCurrentPanes()

	$div.removeClass("hidden").fadeIn(600)
	$div.children().each -> $(@).removeClass("hidden").fadeIn(600)

	addToCurrentPanes($div)
	

## Back Button ##

back = () -> 

	oldPanes = getCurrentPanes()

	if (oldPanes[0].selector is "#people" and oldPanes[1]?)
		next = [$("#people")]
		$('body').animate({scrollTop: 100}, 1000)

	else
		next = [$("#who"), $("#what")]

	for oldPane in oldPanes
		do (oldPane) -> 
			oldPane.fadeOut(400)

	clearAllCurrentPanes()

	for newPane in next
			newPane.fadeIn(400)
			addToCurrentPanes(newPane)


## Exiting page functions ## 

exitPage = (destination) ->

	go = () -> window.location.href = destination

	$("#headerBar").fadeOut(400)
	$(".pane").fadeOut(400)

	window.setTimeout(go, 400)

