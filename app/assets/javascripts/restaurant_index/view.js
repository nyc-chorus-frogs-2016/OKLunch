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

View.prototype.drag_and_drop = function(){
  var self = this;

  $('div.active-restaurant-tile').draggable();



};
