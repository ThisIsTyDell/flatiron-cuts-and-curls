function Service(attributes) {
  this.title = attributes.title;
  this.price = attributes.price;
  this.description = attributes.description;
}

Service.success = function(data){
  var service = new Service(data);
  var serviceDiv = service.renderDIV()
  $("#serviceResult").append(serviceDiv)
}

Service.prototype.renderDIV = function() {
  return Service.template(this);
}

$(function () {
  $(".js-next").on('click', getNext);
  $(".js-previous").on('click', getPrevious);

  Service.templateSource = $("#entry-template").html();
  Service.template = Handlebars.compile(Service.templateSource);

  $('.quick-add').submit(function(event) { 
    event.preventDefault();
    var values = $(this).serialize();
    var posting = $.post('/services', values);
    posting.done(Service.success)
    this.reset();
  });
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
