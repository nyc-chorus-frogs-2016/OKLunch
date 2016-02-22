function View(){};

View.prototype.drawRestaurant = function(thisRestaurant){
  var html = '<div id="active-restaurant-tile" data-id="' + thisRestaurant.id.toString() + '">';
  html += '<ul id="restaurant-tile-details">';
  html += '<li>name: thisRestaurant.name</li>';
  html += '<li>cuisine' + thisRestaurant.cuisine + '</li>';
  html += '</ul></div>';
  $('div#wrapper').append(html);
};

View.prototype.makeDraggable = function(){
   $('div#active-restaurant-tile').draggable();
};

View.prototype.dragAndDrop = function(){
  var self = this;
  var targetID;

  $('div.quadrant').on('drop', function(event, ui){
    var whichQuad = $(event.target).attr('id');
    var args = {'restaurantID': ui.draggable.data('id'), 'stat': whichQuad};
    switch(whichQuad) {
      case 'yes':
        args.isPermanent = false;
        args.match = true;
        break;
      case 'no':
        args.isPermanent = false;
        args.match = false;
        break;
      case 'always':
        args.isPermanent = true;
        args.match = true;
        break;
      case 'never':
        args.isPermanent = true;
        args.match = false;
        break;
    };
    self.controller.submitDrop(args);
  });
};

  View.prototype.addTile = function(args){
    console.log(args);
    $('div#active-restaurant-tile').remove();
    var html = ""

    if(args.stat === "yes" || args.stat === "always"){
      html += '<a href="match_restaurants/' + args.matchrestaurant_id + '">'
    }

    html += '<div class="inactive-restaurant-tile">'
    html+= args.restaurant_name
    html += '</div>'
    console.log(html)
    $('div#' + args.stat).append(html);
    controller.getNextUnswipedRestaurant();
  };
