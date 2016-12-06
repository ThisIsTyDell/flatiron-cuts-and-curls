$(function () {
  $(".js-view-appt").on('click', showAppointments);
});

function showAppointments() {
  event.preventDefault();
  var userId = parseInt(this.attributes[2].value);

  $.get("/users/" + userId + "/appointments.json", function(data) {
    var appointments = data
    appointments.forEach(function(appointment) {
      console.log(appointment)
    })
  });

}