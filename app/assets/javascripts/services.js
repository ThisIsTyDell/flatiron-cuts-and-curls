function Service(attributes) {
  this.title = attributes.title;
  this.price = '$' + attributes.price + '.00';
  this.description = attributes.description;
  this.id = attributes.id;
}

Service.formSubmit = function(event) { 
  event.preventDefault();
  var values = $(this).serialize();
  var posting = $.post('/services', values);
  debugger
  posting.done(Service.success)
}

Service.success = function(data){
  var service = new Service(data);
  var serviceDiv = service.renderDIV()
  $("#serviceResult").append(serviceDiv)
  $(":submit").removeAttr("disabled")
}

Service.ready = function() {
  Service.templateSource = $("#entry-template").html();
  Service.template = Handlebars.compile(Service.templateSource);
}

Service.prototype.renderDIV = function() {
  return Service.template(this);
}

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

$(function () {
  $(".js-next").on('click', getNext);
  $(".js-previous").on('click', getPrevious);
  $('.quick-add').on("submit", Service.formSubmit);
  Service.ready();
});