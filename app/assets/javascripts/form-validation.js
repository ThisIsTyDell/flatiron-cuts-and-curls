$(function() {
  $('.quick-add').validate({
    rules: {
      title: "required",
      description: "required",
      price: "required"
    },
    messages: {
      title: "Please enter a service name",
      description: "Please enter a description",
      price: "Please enter a price"
    },
    submitHandler: function(form) {
      form.submit();
    }
  });
});