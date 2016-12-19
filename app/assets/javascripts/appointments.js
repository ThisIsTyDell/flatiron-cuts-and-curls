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

  if($(contentClassId).length)
    $(contentClassId).toggle();
  else
    $.get("/users/" + userId + "/appointments.json", generateList)
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



  // var appoinments;
  // var accounts;
  // var friends_lists;

  // activate()

  // function activate() {
  //   $http.get('/users/1/appointments.json')
  //     .then(function(data) {
  //       return cb(data)
  //     })
  //     .catch(function(error) {
  //       // console.log('The appoinments has this error', error)
  //       return cb(error)
  //     })
  //   $http.get('/users/1/accounts.json')
  //     .then(function(data) {
  //       accounts = data
  //     })
  //     .catch(function(error) {
  //       console.log('The appoinments has this error', error)
  //     })
  //   $http.get('/users/1/friends_list.json')
  //     .then(function(data) {
  //       friends_list = data
  //     })
  //     .catch(function(error) {
  //       console.log('The appoinments has this error', error)
  //     })
  //   $('current_user').append('<h1>All of me</h1>')
  // }
  

  // 1. I make a HTTP get request to the server 
  // 2. It would return a promise with a status of pending
  // 3. Then the method would procceed with any other necessary logic
  // 4. Then the promise will return with a success or error
  // 5. You will then pass the success or error to the callback method and handle the promise resonse

