$(function () {
  $(".js-next").on("click", function(event) {
    event.preventDefault();
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/services/" + nextId + ".json", function(data) {
      
      $(".serviceTitle").text(data["title"]);
      $(".servicePrice").text(data["price"]);
      $(".serviceDescription").text(data["description"]);

      $(".js-next").attr("data-id", data["id"]);
    });
  });


  $(".js-previous").on("click", function(event) {
    event.preventDefault();
    var nextId = parseInt($(".js-previous").attr("data-id")) - 1;

    $.get("/services/" + nextId + ".json", function(data) {

      $(".serviceTitle").text(data["title"]);
      $(".servicePrice").text(data["price"]);
      $(".serviceDescription").text(data["description"]);

      $(".js-previous").attr("data-id", data["id"]);
    });
  });
});