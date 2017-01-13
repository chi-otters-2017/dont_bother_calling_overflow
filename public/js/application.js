$(document).ready(function(){
  $("#login").on("click", function(){
    event.preventDefault();
    $(".popup").removeClass("hidden")
    $(".popup").addClass("displayed");
  });
  $("#actual_popup").on("submit", function(){
    $(".popup").addClass("hidden");
    var data = $(this).serialize()
    var action = $(this).attr("action")
    var method = $(this).attr("method")
    $.ajax({
      url: action,
      method: method,
      data: data
    })
  });
});
