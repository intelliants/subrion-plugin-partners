{if !empty($partners)}
	<div class="btn-group filters-button-group m-b">
		<button class="btn btn-default is-checked" data-filter="*">{lang key='all'}</button>
		{if !empty($categories)}
			{foreach $categories as $item}
				<button class="btn btn-default" data-filter=".{$item}">{lang key="field_partners_category+{$item}"}</button>
			{/foreach}
		{/if}
	</div>

	<div class="row partners js-partners">
		{foreach $partners as $item}
			<div class="col-md-3 js-partner{if !empty($item.category)} {$item.category}{/if}">
				<div class="item">
					{if !empty($item.pictures)}
						{ia_image file=$item.pictures[0] title=$item.title class='img-responsive'}</a>
					{/if}
					<h4>{$item.title|escape:'html'}</h4>
				</div>
			</div>
		{/foreach}
	</div>

	{ia_add_media files='tagsinput, js:_IA_URL_modules/partners/js/isotope.pkgd.min, css:_IA_URL_modules/partners/templates/front/css/style'}

	{ia_add_js}
var $grid = $('.js-partners').isotope({
  itemSelector: '.js-partner',
  layoutMode: 'fitRows'
});

var filterFns = {
  numberGreaterThan50: function() {
    var number = $(this).find('.number').text();
    return parseInt( number, 10 ) > 50;
  },
  ium: function() {
    var name = $(this).find('.name').text();
    return name.match( /ium$/ );
  }
};

$('.filters-button-group').on( 'click', 'button', function() {
  var filterValue = $( this ).attr('data-filter');
  // use filterFn if matches value
  filterValue = filterFns[ filterValue ] || filterValue;
  $grid.isotope({ filter: filterValue });
});

$('.button-group').each( function( i, buttonGroup ) {
  var $buttonGroup = $( buttonGroup );
  $buttonGroup.on( 'click', 'button', function() {
    $buttonGroup.find('.is-checked').removeClass('is-checked');
    $( this ).addClass('is-checked');
  });
});
	{/ia_add_js}
{else}
	<div class="alert alert-info">{lang key='no_partners'}</div>
{/if}