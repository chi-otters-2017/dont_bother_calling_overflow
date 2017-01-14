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
    var $whatever = $(this).children(3)
    $($whatever).css("color: blue")
    var action = $(this).attr("action")
    var type = $(this).attr("method")
    var data = $(this).serialize()

    $.ajax({
      url: action,
      type: type,
      data: data
    })
    .done(function(response){
    });
  });

  $("#edit-question-link").on("click", function(){
    event.preventDefault();
    $(".text-form").removeClass("hidden");
  });

  $(".text-form form").on("submit", function(){
    event.preventDefault();
    var $form = $(this);
    var action = $form.attr("action");
    var method = $form.attr("method");
    var data = $form.serialize();
    
    $.ajax({
      method: method,
      url: action,
      data: data
    })
    .done(function(response){
      $(".question-body").text(response);
      $(".text-form").addClass("hidden");
    });

  });
});
