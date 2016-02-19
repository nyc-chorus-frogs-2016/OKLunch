function View(){};

View.prototype.drawRestaurant = function(thisRestaurant){
  var html = '<div id="active-restaurant-tile" data-id="' + thisRestaurant.id.toString() + '">';
  html += '<ul>';
  html += '<li>name:' + thisRestaurant.name + '</li>';
  html += '<li>cuisine' + thisRestaurant.cuisine + '</li>';
  html += '</ul></div>';
  $('div#active-restaurant').append(html);
  $('div#yes-no-buttons').show();
}

View.prototype.listenForDrop = function(){

}
//take this driver code out
$(document).ready(function(){
  view = new View;
  controller = new Controller(view);
  view.controller = controller;

  $('a#testing-button').on("click", function(event){
    event.preventDefault();
    controller.getNextUnswipedRestaurant();
    // debugger;
    // view.drawRestaurant(nextRestaurant);
  });

});
