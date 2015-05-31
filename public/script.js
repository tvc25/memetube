console.log('testing!');



function createVideo() {
  console.log('createVideo');
  var newTitle = $('#new-title').val();
  var newDescription = $('#new-description').val();
  var newURL = $('#new-url').val();
  var newGenre = $('#new-genre').val();
  $("#video-list").append("<li>" + newTitle + "</li>");
    $.ajax({
      type: 'POST',
      url: '/videos',
      dataType: 'json',
      data: {title: newTitle, description: newDescription, url: newURL, genre: newGenre}
  }).done(function(data) {
    console.log(data.title);
    $('#video-list').val('');
  })
}

function getVideos() {
  console.log('getVideos');
  $.ajax({
    type: 'GET',
    url: '/videos',
    dataType: 'json'
  }).done(function(data) {
    $.each(data, function(index, newSong) {
    console.log(newSong);
    // $("#video-list").append("<li>" + newSong.title + "</li>");
    // $("li").append("<button id="+ newSong.id + ">delete</button>");

    $("#video-list").append("<li>" + newSong.title + "</li>" + "<button id="+ newSong.id + ">delete</button>");
    })
  })
}

function deleteVideo() {
  var deleteBox = $(this);
  console.log('testing');
  debugger;
}


$(document).ready(function() {
  getVideos();

  $('#new-genre').on('keypress', function(event) {
    console.log(event.which);
      if(event.which === 13) {
        createVideo();
      }
  })


  $('#3').on('click', function(event) {
    console.log('tesssssting');
  })
  

// $("#1").live("click", function(){
//    console.log('this worked!');
// });


});