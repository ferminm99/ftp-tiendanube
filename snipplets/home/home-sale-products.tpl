{# Home sale products #}

{% if sections.sale.products %}

    {{ component('nubesdk-slot', { type: 'before_section_products_sale' }) }}

    <div class="container" data-store="home-products-sale">
        <div class="row text-center-xs">
        	{% if settings.sale_products_title %}
        		<div class="title-container m-top">
                	<h2 class="title h1 h5-xs m-top">{{ settings.sale_products_title }}</h2>
            	</div>
            {% endif %}
            <div class="products-slider p-relative">
                <div class="js-swiper-sale-products swiper-container grid-row">
                    <div class="swiper-wrapper">
                        {% for product in sections.sale.products %}
                            {% include 'snipplets/single_product.tpl' with {'slide_item': true} %}
                        {% endfor %}
                    </div>
                    <div class="js-swiper-sale-products-pagination swiper-pagination"></div>
                    <div class="js-swiper-sale-products-prev swiper-button-prev hidden-xs">{% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "slider-arrow"} %}</div>
                    <div class="js-swiper-sale-products-next swiper-button-next hidden-xs">{% include "snipplets/svg/angle-right.tpl" with {fa_custom_class: "slider-arrow"} %}</div>
                </div>
            </div>
        </div>
    </div>

    {{ component('nubesdk-slot', { type: 'after_section_products_sale' }) }}

{% endif %}