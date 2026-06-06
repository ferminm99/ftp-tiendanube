{% if thumb %}
	{% set svg_size = 'fa-lg' %}
{% else %}
	{% set svg_size = 'fa-2x' %}
{% endif %}

{# Common variables #}
{% set embed_responsive_class = 'embed-responsive embed-responsive-16by9' %}
{% set play_icon_class = "svg-inline--fa play-icon " ~ svg_size %}
{% set video_name = template != 'product' ? store.name : product.name %}
{% set play_video_label = 'Reproducir video de' | translate ~ ' ' ~ video_name %}
{% set video_alt = 'Video de' | translate ~ ' ' ~ video_name %}
{% set video_image_class = 'lazyload video-image' %}
{% set empty_placeholder = 'img/empty-placeholder.png' | static_url %}

{# Modal wrapper for native video - hidden content that will be shown in modal #}
{% if product_modal and product_native_video %}
	<div class="js-native-video-modal-item {{ embed_responsive_class }}" data-video-index="{{ video_index }}" style="display: none;">
		{{ video_render | raw }}
	</div>
{% elseif thumb %}
	{# Thumbnail structure - unified for native and YouTube/Vimeo #}
	<div class="{% if product_native_video %}video-thumb-container{% else %}video-container {{ embed_responsive_class }} visible-when-content-ready m-none{% endif %}">
		{% if product_native_video %}
			<img src="{{ empty_placeholder }}" data-src="{{ video_thumbnail }}" class="thumb-image lazyautosizes lazyload full-width h-auto m-none" alt="{{ video_alt }}">
		{% endif %}
		<div class="player-container">
			<div class="btn btn-primary btn-small">
				{% include "snipplets/svg/play.tpl" with {fa_custom_class: play_icon_class} %}
			</div>
		</div>
		{% if not product_native_video %}
			<div class="js-video-image">
				<img src="{{ empty_placeholder }}" data-src="" class="{{ video_image_class }} fade-in" alt="{{ video_alt }}" style="display: none;">
				<div class="placeholder-fade"></div>
			</div>
		{% endif %}
	</div>
{% else %}
	{# Full video player (not thumbnail) #}
	<div class="{% if not product_native_video %}js-video{% endif %} {% if product_video %}js-video-product{% endif %} {{ embed_responsive_class }} visible-when-content-ready {% if product_native_video %}product-native-video-container{% endif %}">
		{% if product_video %}

			{# Open modal on mobile with video inside #}

			<a href="#modal-product-video" 
			   data-toggle="modal" 
			   {% if product_native_video %}data-video-type="native" data-video-index="{{ video_index }}"{% endif %}
			   class="js-play-button js-open-video-modal player-container swiper-no-swiping visible-xs"
			   aria-label="{{ play_video_label }}">
				<div class="btn btn-primary">{% include "snipplets/svg/play.tpl" with {fa_custom_class: play_icon_class} %}</div>
			</a>
		{% endif %}
		<a href="#" {% if product_native_video %}data-video_uid="{{ video_uid }}"{% endif %} class="{% if product_native_video %}js-play-native-button{% else %}js-play-button{% endif %} player-container swiper-no-swiping {% if product_video %}hidden-xs{% endif %}" aria-label="{{ play_video_label }}">
			<div class="btn btn-primary">
				{% include "snipplets/svg/play.tpl" with {fa_custom_class: play_icon_class} %}
			</div>
		</a>

		{# Video thumbnail #}
		{% if product_native_video %}
			<div class="video-native-image embed-responsive-item">
				<div data-video_uid="{{ video_uid }}" class="js-native-video-iframe embed-responsive-item" data-video-color="{{ settings.primary_color | trim('#') }}" style="display:none;">
					{{ video_render | raw }}
				</div>
				<img data-video_uid="{{ video_uid }}" src="{{ empty_placeholder }}" data-src="{{ video_thumbnail }}" class="{{ video_image_class }}" alt="{{ video_alt }}">
			</div>
		{% else %}
			<div class="js-video-image">
				<img src="{{ empty_placeholder }}" data-src="" class="{{ video_image_class }} fade-in" alt="{{ video_alt }}" style="display: none;">
				<div class="placeholder-fade"></div>
			</div>
		{% endif %}
	</div>
{% endif %}

{% if not thumb and not product_native_video %}
	{# Empty iframe component: will be filled with JS on play button click #}
	<div class="js-video-iframe {{ embed_responsive_class }}" style="display: none;" data-video-color="{{ settings.primary_color | trim('#') }}">
	</div>
{% endif %}
