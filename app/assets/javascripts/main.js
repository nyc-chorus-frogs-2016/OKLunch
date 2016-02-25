$(document).ready(function(){

  $('.card').flip({trigger: 'manual', })

  $('.user-swipe-yes').on('submit', function(event){
    event.preventDefault();
    thisCard = $(event.target).parent().parent().parent();
    
    userSwipeeId = event.currentTarget[2].value
    var requestOptions = {
      url: $(event.target).attr('action'),
      method: 'POST',
      data: $(event.target).serialize(),
      dataType: 'HTML'
    }
    $.ajax(requestOptions).done(function(response){
      console.log(response)
      $('[data-id=' + userSwipeeId + ']').parent().siblings().append(response)
    }).fail(function(response){
      console.log(response)
    });


  thisCard.flip(true);
  });
  $('.user-swipe-no').on('submit', function(event){
    event.preventDefault();
    thisCard = $(event.target).parent().parent().parent();
    userSwipeeId = event.currentTarget[2].value
    var requestOptionsTwo = {
      url: $(event.target).attr('action'),
      method: 'POST',
      data: $(event.target).serialize(),
      dataType: 'HTML'}
      $.ajax(requestOptionsTwo).done(function(response){
         $('[data-id=' + userSwipeeId + ']').parent().siblings().append(response)
      }).fail(function(response){
        console.log(response)
      });
      thisCard.flip(true);
    });
});
