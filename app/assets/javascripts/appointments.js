$(function () {
  $(".js-view-appt").on('click', getAppointments);
});

var userId 
var contentId 
var appointmentText 

function getAppointments() {
  event.preventDefault();
  userId = parseInt(this.attributes[2].value);
  contentClassId = ".added-content-" + userId
 
  if ($(contentClassId).length) {
    $(contentClassId).toggle();
  } else {
    $.get("/users/" + userId + "/appointments.json", generateList)
  }
    
};

function generateList(data) {
  var appointments = data
  var services = []

  appointments.forEach(function(appointment) {
    var time = "<h4 class='dark-gray'>" + appointment.time_slot.name + " at " + appointment.time_slot.time + "</h4>"
    var paid = "<p>Paid: " + appointment.paid + "</p>"
    var total = "<p>Total: $" + appointment.total_price_paid + ".00</p>"

    appointmentText = "<li class='added-content-" + userId + "'>" + time + paid + total + services.join(' - ') + "</li>"
    
    appointment.services.forEach(function(service) {
      services.push(service.title)
    });

    showAppointments();
  });
};

function showAppointments() {
  $("#user-" + userId + "-appointments").append(appointmentText)
}