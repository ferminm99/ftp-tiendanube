{% set has_main_slider = settings.slider and settings.slider is not empty %}
{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}
{% set has_two_sliders = has_main_slider and has_mobile_slider %}

{% if not mobile %}
	<div class="js-home-main-slider-container {% if not has_main_slider %}hidden{% endif %}">
{% endif %}
		<div class="{% if mobile %}js-home-mobile-slider-visibility{% else %}js-home-main-slider-visibility{% endif %}  {% if has_main_slider and has_mobile_slider %}{% if mobile %}visible-xs{% else %}hidden-xs{% endif %}{% elseif not settings.toggle_slider_mobile and mobile %}hidden{% endif %}">
			<div class="js-home-slider{% if mobile %}-mobile{% endif %} home-slider swiper-container m-bottom m-bottom-half-xs swiper-container-horizontal">
				<div class="swiper-wrapper">
					{% if mobile %}
						{% set slider = settings.slider_mobile %}
					{% else %}
						{% set slider = settings.slider %}
					{% endif %}
					{% for slide in slider %}
						<div class="swiper-slide slide-container">
							{% if not slide.link is empty %}
							<a href="{{ slide.link | setting_url }}" aria-label="{{ 'Imagen del carrusel' | translate }} {{ loop.index }}">
							{% endif %}

								{% set has_img_sizes = slide.width and slide.height %}
								{% set first_slide_img_with_sizes = loop.first and has_img_sizes %}

								{% set apply_lazy_load = 
									(has_two_sliders and first_slide_img_with_sizes and not mobile) or 
									not loop.first
								%}

								{% if apply_lazy_load %}
									{% set slide_src = 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==' %}
								{% else %}
									{% set slide_src = slide.image | static_url | settings_image_url('large') %}
								{% endif %}

								<img 
									{% if not apply_lazy_load %}fetchpriority="high"{% endif %}
									{% if has_img_sizes %} width="{{ slide.width }}" height="{{ slide.height }}" {% endif %}
									{% if apply_lazy_load %}data-{% endif %}src="{{ slide_src }}"
									{% if apply_lazy_load %}data-{% endif %}srcset='{{ slide.image | static_url | settings_image_url('large') }} 480w, {{ slide.image | static_url | settings_image_url('huge') }} 640w, {{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w' 
									class="{% if apply_lazy_load %}swiper-lazy fade-in{% endif %} slide-img" 
									alt="{{ "Imagen del carrusel" | translate }} {{ store.name }}"
								/>
								{% if apply_lazy_load %}
									<div class="placeholder-fade"></div>
								{% endif %}
							{% if not slide.link is empty %}
							</a>
							{% endif %}
						</div>
					{% endfor %}
				</div>

				<div class="js-swiper-home-control js-swiper-home-pagination{% if mobile %}-mobile{% endif %} swiper-pagination swiper-pagination-bullets d-block">
					{% if slider | length > 1 and not params.preview %}
						{% for slide in slider %}
							<span class="swiper-pagination-bullet"></span>
						{% endfor %}
					{% endif %}
				</div>
				<div class="js-swiper-home-control js-swiper-home-prev{% if mobile %}-mobile{% endif %} swiper-button-prev hidden-xs">{% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "slider-arrow"} %}</div>
				<div class="js-swiper-home-control js-swiper-home-next{% if mobile %}-mobile{% endif %} swiper-button-next hidden-xs">{% include "snipplets/svg/angle-right.tpl" with {fa_custom_class: "slider-arrow"} %}</div>
			</div>
		</div>
{% if not mobile %}
	</div>
{% endif %}
