function Controller(view){
  this.view = view;
};


Controller.prototype.getNextUnswipedRestaurant = function(){
  // Make an ajax call to the custom route that returns
  // the next unswiped restaurant for that user

  var options = new Object();
  options.url = '/restaurants/next_unswiped'
  option.method ='GET'
  option.dataType = 'json'

  var retrievedRestaurant

  $.ajax(options).done(function(response){
    retrievedRestaurant = response;
  }).fail(function(response){
    console.log(response);
  });

  return retreivedRestaurant

  };
