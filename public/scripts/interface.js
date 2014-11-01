$(document).ready(function() {

	$('#sign-in-box').hide();
	$('#forgot-password-box').hide();

	$('#forgot-password').hide();

	$('#sign-in-button').on('click', function() {
	  $('#sign-in-box').toggle();
	  $('#sign-up-box').hide(); 
	})

	$('#sign-up-button').on('click', function() {
	  $('#sign-up-box').toggle();
	  $('#sign-in-box').hide(); 
	})

	$('#forgot-password-button').on('click', function() {
	  $('#forgot-password-box').toggle();
	})


	$.getJSON('/api', function(peepData){
		var source   = $('#peep-template').html();
		var template = Handlebars.compile(source);
		var peepList = $.each(peepData, function(count, listOfAllPeeps) {})

			$.each(peepList, function(count, individualPeep) {
				$('#list-of-peeps').append(template(individualPeep))
				return count < 9;
			})
	});


	$(document).on('click', '.remove-peep', function(){
   $(this).parent('li').remove();
	});


});