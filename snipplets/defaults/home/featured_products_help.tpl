{# Products featured that work as examples #}

<div class="container" data-store="home-products-{{ section_id }}">
	{% if slider %}
		<div class="row text-center-xs">
	{% endif %}
		<div class="title-container row m-top">
			<h2 class="title h1 h5-xs">{{ products_title }}</h2>
		</div>
		<div class="{% if slider %}products-slider p-relative{% else %}row{% endif %}">
			<section class="{% if slider %}js-swiper-empty-sale-products swiper-container grid-row{% else %}grid clearfix{% endif %}"> 
				<div class="{% if slider %}swiper-wrapper{% else %}js-masonry-grid{% endif %}">
					{% if not slider %}
						<div class="row">
					{% endif %}
						{% set slide_item_value = slider ? true %}

						{% include 'snipplets/defaults/help_item.tpl' with {'help_item_1': true, slide_item : slide_item_value, item_promotional_price: true} %}
						{% include 'snipplets/defaults/help_item.tpl' with {'help_item_2': true, slide_item : slide_item_value} %}
						{% include 'snipplets/defaults/help_item.tpl' with {'help_item_3': true, slide_item : slide_item_value, item_promotional_price: true} %}
						{% include 'snipplets/defaults/help_item.tpl' with {'help_item_4': true, slide_item : slide_item_value} %}
						{% include 'snipplets/defaults/help_item.tpl' with {'help_item_5': true, slide_item : slide_item_value} %}
						{% include 'snipplets/defaults/help_item.tpl' with {'help_item_6': true, slide_item : slide_item_value} %}
						{% include 'snipplets/defaults/help_item.tpl' with {'help_item_7': true, slide_item : slide_item_value, item_promotional_price: true} %}
						{% include 'snipplets/defaults/help_item.tpl' with {'help_item_8': true, slide_item : slide_item_value} %}
					{% if not slider %}
						</div>
					{% endif %}
				</div>
				{% if slider %}
					<div class="js-swiper-empty-sale-products-pagination swiper-pagination"></div>
					<div class="js-swiper-empty-sale-products-prev swiper-button-prev hidden-xs">{% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "slider-arrow"} %}</div>
					<div class="js-swiper-empty-sale-products-next swiper-button-next hidden-xs">{% include "snipplets/svg/angle-right.tpl" with {fa_custom_class: "slider-arrow"} %}</div>
				{% endif %}
			</section>
		</div>
	{% if slider %}
		</div>
	{% endif %}
</div>