$(document).ready(function() {
  $('#amount_button').on("click", function() {
  	event.preventDefault();
  	$('#amount_button').hide();
  	$('#amount').hide()
  	$('#hidden_field').show();
  })
});
