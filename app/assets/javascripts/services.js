$(function () {
  getNext();
  getPrevious();
});

function getNext() {
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
}

function getPrevious() {
  $(".js-previous").on("click", function(event) {
    event.preventDefault();
    var previousId = parseInt($(".js-previous").attr("data-id")) - 1;

    $.get("/services/" + previousId + ".json", function(data) {

      $(".serviceTitle").text(data["title"]);
      $(".servicePrice").text(data["price"]);
      $(".serviceDescription").text(data["description"]);

      $(".js-previous").attr("data-id", data["id"]);
    });
  });
};
