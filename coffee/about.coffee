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

loadpage = () -> 

	buildNavFunctions()
	bindClickEvents()
	setAndBindTextWidthSize()

	$("#headerBar").hide().fadeIn(1000)
	who = $("#who").hide().fadeIn(1000)
	what = $("#what").hide().fadeIn(1000)

	addToCurrentPanes(who, what)


$(document).ready -> loadpage()


buildNavFunctions = () ->

	$("#Gallery").click -> exitPage("gallery.html")
	$("#Contact").click -> exitPage("404.html")
	$("#headerBarLogo").click -> exitPage("index.html")



bindClickEvents = () -> 

	$("#meet").click -> 
		$("#what, #who").fadeOut(400); 
		clearAllCurrentPanes(); 
		meetUs();

	$("#how").click -> 
		$("#what, #who").fadeOut(400); 
		clearAllCurrentPanes(); 
		howWeDidIt();


setAndBindTextWidthSize = () -> 

	setTextWidthSize = () -> 

		w = $(window).width()
		if w > 1400 then $(".text").css(width:"20%")
		else if w > 1200 then $(".text").css(width:"30%")
		else if w > 900 then $(".text").css(width:"40%")
		else $(".text").css(width:"60%")

	
	$(window).bind 'resize', -> setTextWidthSize()

	setTextWidthSize()



## Functions for portraits ##

meetUs = () ->

	$("#meet").unbind()
	addToCurrentPanes( $("#people").removeClass("hidden") )

	setPortraitWidth = () -> 
		width = $(window).width()
		if width < 1200 then $(".portrait").width("33%")
		else if width < 1700 then $(".portrait").width("24.75%")
		else $(".portrait").width("16.35%")

	$(window).bind 'resize', -> setPortraitWidth()
	
	for person in Xenophos
		buildPortraitFor(person)

	setPortraitWidth()

	$(".portraits").each -> setTimeout( (-> $(this).addClass("popIn")), 200) 

	$('html, body').animate({scrollTop: $("#headerBar").height() + 60}, 1000)


buildPortraitFor = (person) -> 

	$portrait = $("<div/>", class: "hidden portrait", id: "#{person.firstname}")
	$image = $("<img/>", src: "images/about/icons/#{person.firstname}.jpg")
	name = "<h1>#{person.firstname} #{person.lastname}</h1>"
	tags = "<p>" + person.tags.join(", &nbsp") + "</p>"
	$nametag = $("<div/>", class: "nametag").append(name).append(tags)
	
	$portrait.append($image).append($nametag)
	$("#people").append($portrait)

	$portrait.removeClass("hidden").addClass("popIn")

	$portrait.click -> showSpecificBio(person.firstname)



## Functions for specicic people pages ##

showSpecificBio = (name) -> 

	if name is "Alex" then $div = $("#Alex_Lenail")
	else if name is "Bradford" then $div = $("#Bradford_Thorne")
	else if name is "Max" then $div = $("#Max_Lenail")
	else if name is "Anna" then $div = $("#Anna_McGarrigle")
	else if name is "Masha" then $div = $("#Masha_Andreyeva")
	else if name is "Arun" then $div = $("#Arun_Varma_Gregory_Dunn")
	else if name is "Gregory" then $div = $("#Arun_Varma_Gregory_Dunn")
	else if name is "Tiffany" then $div = $("#Tiffany_Tsung_Paige_Morkner_Eric_Theis")
	else if name is "Paige" then $div = $("#Tiffany_Tsung_Paige_Morkner_Eric_Theis")
	else if name is "Eric" then $div = $("#Tiffany_Tsung_Paige_Morkner_Eric_Theis")
	else if name is "Kevin" then $div = $("#Kevin_Lee_Allen_Lee_Jason_Liang")
	else if name is "Jason" then $div = $("#Kevin_Lee_Allen_Lee_Jason_Liang")
	else throw new Error "Name unrecognized"

	for pane in getCurrentPanes()
		do (pane) -> pane.fadeOut(400)

	$div.removeClass("hidden")

	$div.children().each -> undefined #show in progression




## Functions for Method Pane ##

howWeDidIt = () -> 

	$("#meet").unbind()
	addToCurrentPanes( $("#method").removeClass("hidden") )

	setAndBindHowPageSizes()


setAndBindHowPageSizes = () -> 

	setTitleFontSize = () -> 

		s = Math.floor($("#teachingMasha").height() / 6)
		$(".title, #inspiTitle").css("font-size": s)

	setMargins = () -> 

		w = $(window).width()
		if w < 1000 
			$("article").css(left:"5%",right:"5%",width:"90%")
			$(".aboutImage").css(width:"96%")
			$(".tool").css(right:"45%",width:"50%")
			$(".tool-text").css(width:"40%",left:"50%")
			$("#actionTitleImage").css(width:"90%",left:"5%")
			$("#actionText").css(width:"26%",top:"20%",left:"58%")
			$(".inspirationImage").css(width:"90%")
		else 
			$("article").css(left:"30%",right:"30%",width:"40%")
			$(".aboutImage").css(width:"80%")
			$(".tool").css(right:"12%",width:"40%")
			$(".tool-text").css(width:"25%",left:"55%")
			$("#actionTitleImage").css(width:"50%",left: "10%")
			$("#actionText").css(width:"22%",top:"26%",left:"62.5%")
			$(".inspirationImage").css(width: "80%")

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
		setMargins()
		setFontSize()

	setTitleFontSize()	
	setMargins()
	setFontSize()




## Exiting page functions ## 

exitPage = (destination) ->

	go = () -> window.location.href = destination

	$("#headerBar").fadeOut(400)
	$(".pane").fadeOut(400)

	window.setTimeout(go, 400)

