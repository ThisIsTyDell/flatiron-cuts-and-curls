$(function () {
  $(".js-view-appt").on('click', showAppointments);
});

function showAppointments() {
  event.preventDefault();
  var userId = parseInt(this.attributes[2].value);

  $.get("/users/" + userId + "/appointments.json", function(data) {
    var appointments = data
    appointments.forEach(function(appointment) {
      var time = "<h4 class='dark-gray'>" + appointment.time_slot.name + "</h4>"
      var paid = "<p>Paid: " + appointment.paid + "</p>"
      var total = "<p>Total: $" + appointment.total_price_paid + ".00</p>"
      var appointmentText = time + paid + total
      
      $("#user-" + userId + "-appointments").html(appointmentText)

      appointment["services"].forEach(function(service) {
        console.log(service.title)
      })

    })
  });

}
