$(document).ready ->
  $("#new_comment").on("ajax:success", (event) ->
    [data, status, xhr] = event.detail
    $(".comments").append("<p>" + JSON.parse(xhr.responseText).content + "</p>")
    $("#comment_content").val("")
  ).on "ajax:error", (event) ->
    alert ("ERROR")