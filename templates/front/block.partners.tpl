{if !empty($blockPartners)}
	<div class="ia-items latest-partners">
		{foreach $blockPartners as $entry}
			<div class="media ia-item ia-item--border-bottom">
				{if !empty($entry.pictures)}
					<span class="pull-left">
						{ia_image file=$entry.pictures[0] width=50 title=$entry.title class='media-object'}
					</span>
				{/if}
				<div class="media-body">
					<h5 class="media-heading">{$entry.title|escape}</h5>
				</div>
			</div>
		{/foreach}
	</div>
{/if}