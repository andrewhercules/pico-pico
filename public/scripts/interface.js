$(document).ready(function() {

	// // Use the code below to hide the sign-in-box after page loads
	
	// $('#sign-in-box').hide();
	$('#forgot-password-box').hide();

	$('#forgot-password').hide();

	$('#sign-in-button').on('click', function() {
	  $('#sign-in-box').toggle(); 
	})

	$('#forgot-password-button').on('click', function() {
	  $('#forgot-password-box').toggle();
	})


	$.getJSON('/api', function(peepData){
		var source   = $("#peep-template").html();
		var template = Handlebars.compile(source);
		var peepList = $.each(peepData, function(count, listOfAllPeeps) {})

		$.each(peepList, function(count, individualPeep) {
			$('#list-of-peeps').append(template(individualPeep))
			return count < 9;

		})

	$(document).on("click", "#remove", function(){
   $(this).parent('li').remove();
	});

// ('#list-of-peeps').append(template(individualPeep));


		// $.each(peepData, function(count, individualPeep) {
		// 	console.log(individualPeep);
		// })

		// $('#app=a').text(peepData[1]["name"])
	
		// $('#username').text(peepData[0]["username"])
	
	});


});