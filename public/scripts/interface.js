$(document).ready(function() {

	// // Use the code below to hide the sign-in-box after page loads
	
	$('#sign-in-box').hide();

	$('#forgot-password').hide();

	$('#sign-in-button').on('click', function() {
	  $('#sign-in-box').toggle();
	});


	// $.getJSON('/api', function(peepData){

	// 	$('#app=a').text(peepData[1]["name"])
	
	// 	$('#username').text(peepData[0]["username"])
	
	// });


});