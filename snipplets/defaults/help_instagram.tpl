<div class="instafeed-item col-md-3 col-xs-6 m-bottom p-left-half-xs p-right-half-xs">
	<div class="instafeed-link">
		<div class="instafeed-img img-responsive overflow-none">
			{% set type_value = help_item_1 ? 'like_icon' : 'instagram_icon' %}
			{{ component('placeholders/instagram-post-placeholder',{type: type_value})}}
		</div>
	</div>
</div>