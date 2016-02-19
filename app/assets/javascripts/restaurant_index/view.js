function View(){};

View.prototype.drawRestaurant = function(thisRestaurant){
  var html = '<div id="active-restaurant-tile">'
  html += '<ul>'
  html += '<li>name:' + thisRestaurant.name + '</li>'
  html += '<li>cuisine' + thisRestaurant.cuisine + '</li>'
  html += '</ul></div>'
  $('div#active-restaurant').append(html)
}

View.prototype.listenForDrop = function(){
    var self = this;
    $('')
}
//take this driver code out
$(document).ready(function(){
  view = new View;
  controller = new Controller(view);
  view.controller = controller;

  $('a#testing-button').on("click", function(event){
    controller.getNextUnswipedRestaurant();
    // debugger;
    // view.drawRestaurant(nextRestaurant);
  });

});
