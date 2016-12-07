$(function () {
  $(".js-next").on('click', getNext);
  $(".js-previous").on('click', getPrevious);
  $('form').submit(function(event) { 
    event.preventDefault();
    alert("we r hack3rz");
  })
});

function getNext() {
  event.preventDefault();
  var nextId = parseInt($(".js-next").attr("data-id")) + 1;
  $.get("/services/" + nextId + ".json", function(data) {
    
    $(".serviceTitle").text(data["title"]);
    $(".servicePrice").text(data["price"]);
    $(".serviceDescription").text(data["description"]);

    $(".js-next").attr("data-id", data["id"]);
    $(".js-previous").attr("data-id", data["id"]);
  });
}

function getPrevious() {
  event.preventDefault();
  var previousId = parseInt($(".js-previous").attr("data-id")) - 1;

  $.get("/services/" + previousId + ".json", function(data) {

    $(".serviceTitle").text(data["title"]);
    $(".servicePrice").text('$' + data["price"] + '.00');
    $(".serviceDescription").text(data["description"]);

    $(".js-next").attr("data-id", data["id"]);
    $(".js-previous").attr("data-id", data["id"]);
  });
};
