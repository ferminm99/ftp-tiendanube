{% if product.video_url or product_native_video %}
	{% if product_native_video %}
		{# Native video slide position - comes from product.media loop #}
		{% set slide_position = loop.index0 %}
	{% else %}
		{# YouTube/Vimeo video position - after all images and native videos #}
		{% if product.media_count > 1 %}
			{% set slide_position = product.media_count %}
		{% else %}
			{% set slide_position = 1 %}
		{% endif %}
	{% endif %}

	{% if thumb %}
		<a href="#" class="js-product-thumb js-video-thumb thumb-link thumb-image" data-slide-index="{{ slide_position }}" aria-label="{{ 'Video de' | translate }} {{ product.name }}">
			{% include 'snipplets/video-item.tpl' with {thumb: true, product_native_video: product_native_video, video_uid: video_uid, video_thumbnail: video_thumbnail, video_render: video_render, video_index: video_index} %}
		</a>
	{% else %}
		<div class="js-product-slide js-product-video-slide swiper-slide slider-slide product-slide {% if product_native_video %}product-native-video-slide h-auto{% endif %}" data-image-position="{{ slide_position }}">
			<div class="product-video-container">
				<div class="product-video">
					{% if product_native_video %}
						{% set native_video_params = {product_video: true, product_native_video: true, video_uid: video_uid, video_thumbnail: video_thumbnail, video_render: video_render, video_index: video_index} %}
						{# Visible video inside slider #}
						{% include 'snipplets/video-item.tpl' with native_video_params %}
						{# Hidden video for modal #}
						{% include 'snipplets/video-item.tpl' with native_video_params|merge({product_modal: true}) %}
					{% else %}
						{% include 'snipplets/video-item.tpl' with {product_video: true} %}
					{% endif %}
				</div>
			</div>
		</div>
	{% endif %}
{% endif %}
