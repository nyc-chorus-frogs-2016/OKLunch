$(document).ready(function(){
  view = new View;
  controller = new Controller(view);
  view.controller = controller;

  view.makeDraggable();
  $('div.quadrant').droppable();

  view.dragAndDrop();
  $('a#testing-button').on("click", function(event){
    event.preventDefault();
    controller.getNextUnswipedRestaurant();
  });

});
