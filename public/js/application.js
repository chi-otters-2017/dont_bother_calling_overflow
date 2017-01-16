$(document).ready(function(){
  $("#login").on("click", function(){
    event.preventDefault();
    console.log($(".popup")[0]);
    $($(".popup")[0]).removeClass("hidden")
    $($(".popup")[0]).addClass("displayed");
    $($(".popup")[0]).css("height","25%");
    $($(".popup")[0]).css("width","15%");
  });

  $("#actual_popup").on("submit", function(){
    $(".popup").removeClass("displayed");
    $(".popup").addClass("hidden");
    var data = $(this).serialize()
    var action = $(this).attr("action")
    var method = $(this).attr("method")
    $.ajax({
      url: action,
      method: method,
      data: data
    });
  });

  $("#registration").on("click", function(){
    event.preventDefault();
    $($(".popup")[1]).removeClass("hidden")
    $($(".popup")[1]).addClass("displayed");
    $($(".popup")[1]).css("height","30%");
    $($(".popup")[1]).css("width","20%");
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
    });
  });

  $("#edit-question-link").on("click", function(){
    event.preventDefault();
    $("#edit-question").removeClass("hidden");
  });

  $("#edit-question form").on("submit", function(){
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
      $(".body_fonts").text(response);
      $("#edit-question").addClass("hidden");
    });

      // if (response === "Cannot vote"){window.alert("You cannot vote more then once!");
      // }
      // else{
      //   var counter = $($target).parent().parent().find(".vote_tally");
      //   $(counter).html("Score: "+ response);
      // }
    })
  $("#add-comment-to-question-link").on("click", function(){
    event.preventDefault();
    $("#add-comment-to-question").removeClass("hidden");
  });

  $("#add-comment-to-question form").on("submit", function(){
    event.preventDefault();
    var $form = $(this);
    var action = $form.attr("action");
    var method = $form.attr("method");
    var data = $form.serialize();
    console.log(action);
    console.log(method);
    console.log(data);

    $.ajax({
      method: method,
      url: action,
      data: data
    })
    .done(function(response){
      var commentBlock = $(".comment_block")[0]
      var numOfComments = $(commentBlock).children().length
      var lastComment = $(commentBlock).children()[numOfComments - 3];
      $(response).insertAfter($(lastComment) );
      $("#add-comment-to-question").addClass("hidden");
    });
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
      if (response === "Cannot vote"){
        window.alert("You cannot vote more then once!");
      }
      else{
      var counter = $($target).parent().parent().find(".vote_tally");
      $(counter).html("Score: "+ response);
      }
    });
  });
});



