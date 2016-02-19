function View(){};

View.prototype.drawRestaurant = function(thisRestaurant){
  var html = '<h1>THIS IS THE RESTAURANT DETAILS</h1>'

  $('div#active-restaurant').append(html)
  debugger;




}

View.prototype.listenForDrop = function(){

}


//take this driver code out
$(document).ready(function(){
  view = new View;
  controller = new Controller(view);
  view.controller = controller;

  $('a#testing-button').on("click", function(event){
    firstRestaurant = controller.getNextUnswipedRestaurant;
    view.drawRestaurant(firstRestaurant);
  });

});
