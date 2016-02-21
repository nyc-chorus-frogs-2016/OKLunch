function Controller(view){
  this.view = view;
};


Controller.prototype.getNextUnswipedRestaurant = function(){
  // Make an ajax call to the custom route that returns
  // the next unswiped restaurant for that user

  var options = new Object();
  options.url = '/restaurants/next_unswiped'
  options.method ='GET'
  options.dataType = 'json'
  $.ajax(options).done(function(response){
    debugger;
    view.drawRestaurant(response);
    view.makeDraggable();
  }).fail(function(response){
    console.log(response);
  });

  };

Controller.prototype.submitDrop = function(args){
  var dataObj = {match: args.match, restaurant_id: args.restaurantID, is_permanent: args.isPermanent}
  var options = {url: '/match_restaurants', method: 'POST', data: dataObj, dataType: 'json'};

  $.ajax(options).done(function(response){
    view.addTile(response)
  });
};
