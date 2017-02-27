{if !empty($partners)}
	<div class="ia-items">
		{foreach $partners as $entry}
			<div class="media ia-item">
				{if !empty($entry.pictures)}
					{ia_image file=$entry.pictures[0] width=150 title=$entry.title class='media-object'}</a>
				{/if}
				<div class="media-body">
					<h4 class="media-heading">{$entry.title|escape:'html'}</h4>
				</div>
			</div>
		{/foreach}
	</div>
{else}
	<div class="alert alert-info">{lang key='no_partners'}</div>
{/if}