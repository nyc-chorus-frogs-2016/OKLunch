function View(){};

View.prototype.drawRestaurant = function(thisRestaurant){
  var html = '<div id="active-restaurant-tile" data-id="' + thisRestaurant.id.toString() + '">';
  html += '<ul>';
  html += '<li>name:' + thisRestaurant.name + '</li>';
  html += '<li>cuisine' + thisRestaurant.cuisine + '</li>';
  html += '</ul></div>';
  $('div#active-restaurant').prepend(html);
  $('div#yes-no-buttons').show();
}

View.prototype.listenForDrop = function(){

};



//take this driver code out
$(document).ready(function(){
  view = new View;
  controller = new Controller(view);
  view.controller = controller;

  view.listenForDrop();

  $('a#testing-button').on("click", function(event){
    event.preventDefault();
    controller.getNextUnswipedRestaurant();
  });

});
