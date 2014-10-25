$(document).ready(function() {

	$.getJSON('/api', function(peepData){
		console.log(peepData[2])
	});

// 	$.get('/api', function(data) {
// 		console.log(data[1])
// 	})
// 	$.each($.parseJSON(home), function() {
//     console.log(this);
// });


	// $.get('/api', function(data) {
	// 	$('#header h1').text(data[1]["message"])
	// 	$('#list-of-peeps').text(data['main'].temp)
	// });

});