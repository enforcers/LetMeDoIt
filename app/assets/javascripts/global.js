$(document).ready(function(){

	$('.controls .date').datepicker()
	$('.controls input').tooltip({placement: 'right'});

	$('[data-toggle="tabajax"]').click(function(e) {
		e.preventDefault();
		$this = $(this);
		var loadurl = $(this).attr('href');
		var target = $(this).attr('data-target');
		$(target).load(loadurl, function() { $this.tab('show') });
	});

	$('.profile-hover').hover(function() {
		$this = $(this);
		//$this.unbind("hover");

		if ($this.data('popover') == null) {
			$.ajax({
				url: $this.attr('href'),
				success: function(data) {
					$this.popover({
						placement: 'top',
						animation: 'fade',
						html: true,
						content: data,
						trigger: 'hover'
					}).popover('show')
				}
			});
		}
	});

});