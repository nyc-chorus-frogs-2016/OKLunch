$(document).ready(function(){

  $('.user-swipe-yes').on('submit', function(event){
    event.preventDefault();
    userSwipeeId = event.currentTarget[2].value
    var requestOptions = {
      url: $(event.target).attr('action'),
      method: 'POST',
      data: $(event.target).serialize(),
      dataType: 'HTML'
    }
    $.ajax(requestOptions).done(function(response){
      console.log(response)
      $('[data-id=' + userSwipeeId + ']').replaceWith(response)
    }).fail(function(response){
      console.log(response)
    });
  });
  //   $('input.submit-no-swipe').on('click', function(event){
  //   event.preventDefault();
  //   debugger
  // })
});
