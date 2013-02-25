$(document).ready(function(){

	$('.controls .date').datepicker()
	$('.controls input').tooltip({placement: 'right'});
	$('.profile-hover').popover();

	$('[data-toggle="tabajax"]').click(function(e) {
		e.preventDefault();
		$this = $(this);
		var loadurl = $(this).attr('href');
		var target = $(this).attr('data-target');
		$(target).load(loadurl, function() { $this.tab('show') });
	});
});