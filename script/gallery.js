// Generated by CoffeeScript 1.6.3
(function() {
  var ListItem, addBack, addFront, buildNavFunctions, centerSelectedImage, deleteListItem, exitPage, images, loadBottomBarImages, loadPage, numberOfGalleryImages, refreshIcons, reloadPage, removeBack, removeFront, resizeBottomBar, resizeTheImage, selectIcon, selected, slideLeft, slideRight;

  images = [];

  selected = 4;

  numberOfGalleryImages = 30;

  resizeTheImage = function() {
    var desiredImageHeight, windowHeight;
    windowHeight = $(window).height();
    desiredImageHeight = windowHeight - 350;
    return $("#theImage").height(desiredImageHeight);
  };

  resizeBottomBar = function() {
    var desiredWidth, windowWidth;
    windowWidth = $(window).width();
    desiredWidth = windowWidth + 193 * 2;
    $("#bottomBar").width(desiredWidth);
    return desiredWidth;
  };

  loadBottomBarImages = function() {
    var i, numberOfIconsToDisplay, _i;
    numberOfIconsToDisplay = Math.floor(resizeBottomBar() / 193);
    images.length = 0;
    for (i = _i = 1; 1 <= numberOfIconsToDisplay ? _i <= numberOfIconsToDisplay : _i >= numberOfIconsToDisplay; i = 1 <= numberOfIconsToDisplay ? ++_i : --_i) {
      images.push(i);
    }
    return refreshIcons();
  };

  refreshIcons = function() {
    var $bottomBar, i, _i, _len, _results;
    $bottomBar = $("#bottomBar");
    $bottomBar.empty();
    _results = [];
    for (_i = 0, _len = images.length; _i < _len; _i++) {
      i = images[_i];
      _results.push($bottomBar.append(ListItem(i)));
    }
    return _results;
  };

  reloadPage = function() {
    resizeTheImage();
    loadBottomBarImages();
    return buildNavFunctions();
  };

  loadPage = function() {
    reloadPage();
    $("#headerBar").hide().fadeIn(1000);
    $("#theImage").hide().fadeIn(1000);
    return $("#bottomBar").hide().fadeIn(1000);
  };

  $(document).ready(function() {
    loadPage();
    return $(window).bind('resize', function() {
      return reloadPage();
    });
  });

  ListItem = function(id) {
    var $li, url;
    url = "url(\"images/portfolio/lightpainting/icons/" + id + ".jpg\")";
    $li = $("<li/>", {
      "class": "fade",
      id: "" + id,
      style: "background-image: " + url + ";"
    });
    $li.click(function(e) {
      return selectIcon(e.target.id);
    });
    return $li;
  };

  deleteListItem = function(id) {
    return $("#" + id).remove();
  };

  selectIcon = function(id) {
    var $theImage, url;
    selected = parseInt(id);
    centerSelectedImage();
    $theImage = $("#theImage");
    url = "images/portfolio/lightpainting/" + selected + ".jpg";
    if ($theImage.attr('src') !== url) {
      $theImage.fadeTo("fast", 0, function() {
        return $(this).attr('src', url);
      }).fadeTo("slow", 1.0);
    }
    return resizeTheImage();
  };

  centerSelectedImage = function() {
    if (images.indexOf(selected) > images.length * 0.7) {
      return slideLeft();
    } else if (images.indexOf(selected) < images.length * 0.16) {
      return slideRight();
    } else {

    }
  };

  slideLeft = function() {
    addBack();
    return $("#bottomBar").animate({
      "padding-left": "0px"
    }, 400, 'linear', function() {
      $("#bottomBar").css({
        "padding-left": "193px"
      });
      return removeFront();
    });
  };

  slideRight = function() {
    $("#bottomBar").css({
      "padding-left": "0px"
    });
    addFront();
    return $("#bottomBar").animate({
      "padding-left": "193px"
    }, 400, 'linear', removeBack());
  };

  removeFront = function() {
    return deleteListItem(images.shift());
  };

  removeBack = function() {
    return deleteListItem(images.pop());
  };

  addFront = function() {
    var image;
    image = theImageBefore(images[0]);
    images.unshift(image);
    return $("#bottomBar").prepend(ListItem(image));
  };

  addBack = function() {
    var image;
    image = theImageAfter(images[images.length - 1]);
    images.push(image);
    return $("#bottomBar").append(ListItem(image));
  };

  window.theImageBefore = function(id) {
    if (id - 1 !== 0) {
      return id - 1;
    } else {
      return numberOfGalleryImages;
    }
  };

  window.theImageAfter = function(id) {
    if (id + 1 > numberOfGalleryImages) {
      return 1;
    } else {
      return id + 1;
    }
  };

  $(document).keydown(function(e) {
    if (e.keyCode === 37 || e.keyCode === 40) {
      return selectIcon(theImageBefore(selected));
    } else if (e.keyCode === 32 || e.keyCode === 38 || e.keyCode === 39) {
      return selectIcon(theImageAfter(selected));
    } else {

    }
  });

  exitPage = function(destination) {
    var go;
    go = function() {
      return window.location.href = destination;
    };
    $("#headerBar").fadeOut(400);
    $("#theImage").fadeOut(400);
    $("#bottomBar").fadeOut(400);
    return window.setTimeout(go, 400);
  };

  buildNavFunctions = function() {
    $("#About").click(function() {
      return exitPage("About.html");
    });
    $("#Contact").click(function() {
      return exitPage("404.html");
    });
    return $("#headerBarLogo").click(function() {
      return exitPage("index.html");
    });
  };

}).call(this);
