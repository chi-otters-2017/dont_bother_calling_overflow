$(document).ready(function(){
  $("#login").on("click", function(){
    event.preventDefault();
    $(".popup_login").removeClass("hidden")
    $(".popup_login").addClass("displayed");
  });
  $("#actual_popup").on("submit", function(){
    $(".popup_login").removeClass("displayed");
    $(".popup_login").addClass("hidden");
    var data = $(this).serialize()
    var action = $(this).attr("action")
    var method = $(this).attr("method")
    $.ajax({
      url: action,
      method: method,
      data: data
    })
  });
  $("#registration").on("click", function(){
    event.preventDefault();
    $(".popup_register").removeClass("hidden")
    $(".popup_register").addClass("displayed");
  });
  $(".upvote_button").on("submit", function(){
    event.preventDefault();
    var $target= $(this).children().get(3)
    $($target).css({"background-color": "blue"})
    var action = $(this).attr("action")
    var type = $(this).attr("method")
    var data = $(this).serialize()

    $.ajax({
      url: action,
      type: type,
      data: data
    })
    .done(function(response){
      var counter = $($target).parent().parent().find(".vote_tally")
      $(counter).html("Score: "+ response)
    })
  });
  $(".downvote_button").on("submit", function(){
    event.preventDefault();
    var $target= $(this).children().get(3)
    $($target).css({"background-color": "red"})
    var action = $(this).attr("action")
    var type = $(this).attr("method")
    var data = $(this).serialize()

    $.ajax({
      url: action,
      type: type,
      data: data
    })
    .done(function(response){
      var counter = $($target).parent().parent().find(".vote_tally")
      $(counter).html("Score: "+ response)
    })
  });
});
