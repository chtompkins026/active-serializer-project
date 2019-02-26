$(document).ready(function() {
  $("#create_team").click(function(event) {
    var button = $(this);
    var url = $(this).data("url")
    console.log("THIS IS ME", url)

    $.get(url, function(response){
      console.log(response)
      $button.before(response)
      $
    });
    event.preventDefault();
  })
});
