// Generated by CoffeeScript 1.8.0
(function() {
  var bindContact;

  bindContact = function() {
    var backsplash;
    backsplash = $('<div/>', {
      "class": 'backsplash'
    });
    backsplash.width($(window).width());
    backsplash.height($(window).height());
    return $('#Contact').click(function() {
      backsplash.hide();
      backsplash.fadeIn();
      return $('html').prepend(backsplash);
    });
  };

}).call(this);
