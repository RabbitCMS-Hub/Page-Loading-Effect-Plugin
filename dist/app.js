$('.color-palette a').each(function(index, el) {
	let $elem 	= $(this);
	let $colors = $elem.data('color').split('|');
	$($colors).each(function(index, el) {
		$elem.append(`<span style="background-color:#${el}"></span>`);
	});
});

$(document).off('click', 'a[data-color]');
$(document).on('click', 'a[data-color]', function(event) {
	event.preventDefault();
	let $elem 	= $(this);
	let $colors = $elem.data('color').split('|');
	
	$('[data-key="PAGE_LOADER_COLOR_1"]').val(`#${$colors[0]}`).trigger('focusout');
	$('[data-key="PAGE_LOADER_COLOR_2"]').val(`#${$colors[1]}`).trigger('focusout');
	$('[data-key="PAGE_LOADER_COLOR_3"]').val(`#${$colors[2]}`).trigger('focusout');
	$('[data-key="PAGE_LOADER_COLOR_BG"]').val(`#${$colors[3]}`).trigger('focusout');
});