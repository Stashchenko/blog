$(document).ready ->
  $("#new_comment").on("ajax:success", (event) ->
    [data, status, xhr] = event.detail
    $(".comments").append("<tr><td>" + JSON.parse(xhr.responseText).content + "</td></tr>")
    $("#comment_content").val("")
  ).on "ajax:error", (event) ->
    alert ("ERROR")