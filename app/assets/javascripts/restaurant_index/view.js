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
  var targetID;

  $('div#active-restaurant-tile').draggable();
  $('div#active-restaurant-tile').on('drag', function(event){
    targetID = $(event.target).data('id')
  });

  $('div.quadrant').droppable();

  $('div.quadrant').on('drop', function(event){
    var whichQuad = $(event.target).attr('id');s
    var args = {'restaurantID': targetID};
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

  // $('div#no').on('drop', function(event){
  //   args = {"is_permanent": false, }
  // });

  // $('div#yes').on('drop', function(event){

  // });

  // $('div#always').on('drop', function(event){

  // });

  // $('div#never').on('drop', function(event){

  // });


};
