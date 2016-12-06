$(function () {
  $(".js-view-appt").on('click', showAppointments);
});

function showAppointments() {
  event.preventDefault();
  var userId = parseInt(this.attributes[2].value)
}