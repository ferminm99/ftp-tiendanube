{# Product item example #}

<a href="/product/example" title="{{ product.name }}" data-path-hover="M 180,400 0,400 0,140 180,160 z" class="{% if slide_item %}js-item-slide swiper-slide products-slider-item item-container-slide{% else %}js-masonry-grid-item{% endif %} item-container"> 
	<div class="item">
		{% if item_promotional_price %}
			<div class="labels-floating">
				<div class="label label-circle label-secondary">{{ "Oferta" | translate }}</div> 
			</div>
		{% endif %}
		<div class="p-relative overflow-none">
			<div class="item-image-container">
				{% set type_value = 
					help_item_1 ? 'shirt' : 
					help_item_2 ? 'camera' :
					help_item_3 ? 'dress' :
					help_item_4 ? 'sneakers' :
					help_item_5 ? 'joystick' :
					help_item_6 ? 'shoes' :
					help_item_7 ? 'bag' :
					help_item_8 ? 'glasses' 
				%}
				{{ component('placeholders/product-placeholder',{
						type: type_value,
					})
				}}
				<div class="item-overlay"></div>
			</div>
			<div class="item-info-container">
				<div class="item-info">
					<h2 class="item-name">{{ "Producto de ejemplo" | translate }}</h2>
					<div class="item-price-container">
						{% set help_item_price = 
							help_item_1 ? '9600' : 
							help_item_2 ? '68000' :
							help_item_3 ? '18200' :
							help_item_4 ? '32000' :
							help_item_5 ? '24900' :
							help_item_6 ? '42000' :
							help_item_7 ? '36800' :
							help_item_8 ? '12200' 
						%}
						{% if item_promotional_price %}
							{% set help_item_price_compare = 
								help_item_1 ? '120000' : 
								help_item_3 ? '28000' :
								help_item_7 ? '46000'
							%}
						{% endif %}
						{% if store.country != 'BR' %}
							{% set help_item_price = help_item_price ~ "00" %}
							{% if item_promotional_price %}
								{% set help_item_price_compare = help_item_price_compare ~ "00" %}
							{% endif %}
						{% endif %}
						{% if item_promotional_price %}
							<div class="item-price-compare price-compare">{{ help_item_price_compare | money }}</div>
						{% endif %}
						<div class="price item-price" id="price_display">{{ help_item_price | money }}</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</a>