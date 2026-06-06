<div id="shoppingCartPage" data-minimum="{{ settings.cart_minimum_value }}" class="container" data-store="cart-page">
    <div class="title-container" data-store="page-title">
        {% snipplet "breadcrumbs.tpl" %}
        <h1 class="title">{{ "Carrito de Compras" | translate }}</h1>
    </div>
    {# Page preloader #}
    <div class="page-loading-icon-container full-width hidden-when-content-ready">
        <div class="page-loading-icon page-loading-icon opacity-80 rotate">
            {% include "snipplets/svg/spinner.tpl" %}
        </div>
    </div>

    <span class="js-has-new-shipping" data-priceraw="{{ cart.subtotal }}"></span>

	<form role="form" action="" method="post" data-store="cart-form">

        {# Define contitions to show shipping calculator and store branches on cart #}

        {% set show_calculator_on_cart = settings.shipping_calculator_cart_page and store.has_shipping %}
        {% set show_cart_fulfillment = settings.shipping_calculator_cart_page and (store.has_shipping or store.branches) %}

        {# Price without taxes classes #}
        {% set price_without_taxes_container_classes = "text-right font-small opacity-60" %}
        {% set price_without_taxes_price_classes = "text-right" %}

        {# Cart alerts #}

        {% if error.add %}
            {{ component('alert', {'type': 'info', 'message': 'our_components.cart.error_messages.' ~ error.add }) }}
        {% endif %}

		{% if cart.items %}
        <div class="js-cart-contents cart-table col-xs-12 visible-when-content-ready">
            {% for error in error.update %}
                <div class="alert alert-info">{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</div>
            {% endfor %}

            {# Cart items #}

            {{ component('nubesdk-slot', { type: "before_line_items" }) }}

            {% for item in cart.items %}

            {% set compare_at_price = item.compare_at_price %}
            {% set hide_compare_price_subtotal = not item.compare_at_price_subtotal or item.is_subscription_item %}
            {% set discount_percentage = item.discount_percentage %}

            {{ component('nubesdk-slot', { type: "before_line_item", pick: item.id }) }}

            <ul class="js-cart-item {% if item.product.is_non_shippable %}js-cart-item-non-shippable{% else %}js-cart-item-shippable{% endif %} cart-table-row cart-table-row-md-flex row list-unstyled" data-item-id="{{ item.id }}" data-store="cart-item-{{ item.product.id }}" data-component="cart.line-item">
                <li class="cart-table-product col-xs-12 col-sm-4">
                    <div class="cart-product-row-md row">

                        {# Cart item image #}
                        <a href="{{ item.url }}" class="col-xs-3">
                            {{ item.featured_image | product_image_url("medium") | img_tag(item.featured_image.alt, {class: 'img-responsive'}) }}
                        </a>

                        {# Cart item name #}
                        <div class="col-xs-9 p-left-none-xs p-right-double-xs" data-component="line-item.name">
                            <a class="h5" href="{{ item.url }}" data-component="name.short-name">
                                {{ item.short_name }}
                                <div class="font-small weight-normal m-top-quarter" data-component="name.short-variant-name">{{ item.short_variant_name }}</div>
                            </a>
                            {{ component(
                                'cart-labels', {
                                    group: true,
                                    labels_classes: {
                                        group: 'full-width-container m-top-half',
                                        label: 'd-inline-block label label-primary label-primary-dark font-small-extra m-right-quarter m-bottom-quarter'
                                    },
                                })
                            }}
                        </div>
                    </div>
                </li>

                {# Cart item quantity controls #}
                <li class="cart-quantity col-xs-12 col-sm-3 {% if item.compare_at_price_subtotal and not item.is_subscription_item %}m-top-half-xs{% else %}m-top-xs{% endif %}">
                    <div class="cart-quantity-container text-right text-left-xs pull-left-xs {% if item.compare_at_price_subtotal and not item.is_subscription_item %}m-top-half-xs{% endif %}" data-component="line-item.subtotal">
                        <button type="button" class="js-cart-quantity-btn cart-quantity-btn cart-quantity-btn-left small" onclick="LS.minusQuantity({{ item.id }})" data-component="quantity.minus">
                            <div class="cart-quantity-svg-icon">
                                {% include "snipplets/svg/minus.tpl" %}
                            </div>
                        </button>
                        <div class="cart-quantity-input-container d-inline-block">

                            {# Always place this spinner before the quantity input #}
                            
                            <span class="js-cart-input-spinner cart-item-spinner" style="display: none;">
                              {% include "snipplets/svg/circle-notch.tpl" with {fa_custom_class: "svg-inline--fa fa-spin"} %}
                            </span>
                            <input type="number" name="quantity[{{ item.id }}]" value="{{ item.quantity }}" pattern="\d*" data-item-id="{{ item.id }}" onKeyUp="LS.resetItems();" class="js-cart-quantity-input cart-quantity-input small" data-component="quantity.value" data-component-value="{{ item.quantity }}" />
                        </div>
                        <button type="button" class="js-cart-quantity-btn cart-quantity-btn cart-quantity-btn-right small" onclick="LS.plusQuantity({{ item.id }})" data-component="quantity.plus">
                            <div class="cart-quantity-svg-icon">
                                {% include "snipplets/svg/plus.tpl" %}
                            </div>
                        </button>
                    </div>

                    {# Cart item mobile subtotal #}
                    <div class="visible-xs cart-item-subtotal pull-right h5 font-medium-xs {% if item.compare_at_price_subtotal and not item.is_subscription_item %}m-top-none{% else %}m-top-quarter{% endif %}">
                        <small class="hidden-xs">{{ "Precio" | translate }}</small>
                        <div class="js-cart-item-subtotal-compare-price-container m-bottom-quarter" data-line-item-id="{{ item.id }}"{% if hide_compare_price_subtotal %} style="display: none"{% endif %}>
                            <span class="text-accent font-small weight-strong">-{{ discount_percentage }}%</span>
                            <span class="js-cart-item-subtotal-compare-price price-compare font-small opacity-80 weight-normal" data-line-item-id="{{ item.id }}" data-component="subtotal_compare_price.value" data-component-value='{{ item.compare_at_price_subtotal | money }}'>{{ item.compare_at_price_subtotal | money }}</span>
                        </div>
                        <div class="js-cart-item-subtotal" data-line-item-id="{{ item.id }}" data-component="subtotal.value" data-component-value="{{ item.subtotal | money }}">{{ item.subtotal | money }}</div>
                    </div>
                </li>

                {# Cart item unit price #}
                <li class="col-price col-sm-2 hidden-xs text-center">
                    <small>{{ "Precio" | translate }}</small>
                    <div class="js-cart-item-unit-price-compare-price-container m-top-quarter" data-line-item-id="{{ item.id }}"{% if not compare_at_price %} style="display: none"{% endif %}>
                        <span class="text-accent font-small weight-strong">-{{ discount_percentage }}%</span>
                        <span class="js-cart-item-unit-price-compare-price price-compare font-small opacity-80 weight-normal" data-line-item-id="{{ item.id }}" data-component="subtotal_compare_price.value" data-component-value='{{ compare_at_price | money }}'>{{ compare_at_price | money }}</span>
                    </div>
                    <div class="js-cart-item-unit-price h4 m-top-quarter" data-line-item-id="{{ item.id }}">{{ item.unit_price | money }}</div>
                </li>

                {# Cart item subtotal #}
                 <li class="col-sm-2 hidden-xs text-center">
                    <small>{{ "Subtotal" | translate }}</small>
                    <div class="js-cart-item-subtotal-compare-price-container m-top-quarter" data-line-item-id="{{ item.id }}"{% if hide_compare_price_subtotal %} style="display: none"{% endif %}>
                        <span class="text-accent font-small weight-strong">-{{ discount_percentage }}%</span>
                        <span class="js-cart-item-subtotal-compare-price price-compare font-small opacity-80 weight-normal" data-line-item-id="{{ item.id }}" data-component="subtotal_compare_price.value" data-component-value='{{ item.compare_at_price_subtotal | money }}'>{{ item.compare_at_price_subtotal | money }}</span>
                    </div>
                    <div class="js-cart-item-subtotal h4 m-top-quarter" data-line-item-id="{{ item.id }}" data-component="subtotal.value" data-component-value="{{ item.subtotal | money }}">{{ item.subtotal | money }}</div>
                </li>

                {# Cart item delete #}
                <li class="cart-delete-container col-xs-1 text-right">
                    <button type="button" class="item-delete cart-btn-delete pull-right-xs" onclick="LS.removeItem({{ item.id }})" data-component="line-item.remove">
                        <div class="cart-delete-svg-icon">
                            {% include "snipplets/svg/trash-o.tpl" with {fa_custom_class: "svg-trash-icon svg-text-fill"} %}
                        </div>
                    </button>
                </li>
            </ul>            
            {% endfor %}

            {{ component('nubesdk-slot', { type: "after_line_items" }) }}

            {# Cart alerts #}
            <div id="error-ajax-stock" class="row" style="display: none;">
                <span colspan="12" class='alert alert-warning col-xs-12' role='alert'>
                    {{ "No hay suficiente stock para agregar este producto al carrito." | translate }}
                </span>
            </div>
        </div>
        
        {# Cart totals #}
        <div class="cart-totals-container visible-when-content-ready clear-both">

            {# Check if store has free shipping without regions or categories #}

            {% set has_free_shipping = cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}

            {% if has_free_shipping and cart.free_shipping.min_price_free_shipping.min_price_raw > 0 %}
              
              {# includes free shipping progress bar: only if store has free shipping with a minimum #}
              
              {% include "snipplets/shipping/shipping-free-rest.tpl" %}
            {% endif %}

            <div class="row">
                <div class="js-shipping-calculator-container col-12 col-sm-6 m-bottom-xs p-bottom-xs">
                    {% if show_cart_fulfillment %}

                        <div class="js-fulfillment-info js-allows-non-shippable" {% if not cart.has_shippable_products %}style="display: none"{% endif %}>

                            {# Saved shipping not available #}

                            <div class="js-shipping-method-unavailable alert alert-warning clear-both m-top" style="display: none;">
                                <div>
                                    <strong>{{ 'El medio de envío que habías elegido ya no se encuentra disponible para este carrito. ' | translate }}</strong>
                                </div>
                                <div>
                                    {{ '¡No te preocupes! Podés elegir otro.' | translate}}
                                </div>
                            </div>
                            
                            {# Shipping calculator and branch link #}
                            <div id="cart-shipping-container" class="row clear-both" {% if cart.items_count == 0 %} style="display: none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">

                                {# Used to save shipping #}

                                <span id="cart-selected-shipping-method" data-code="{{ cart.shipping_data.code }}" class="hide">{{ cart.shipping_data.name }}</span>

                                <div class="col-md-8">
                                    <div class="m-bottom-half m-top-half border-bottom p-bottom-half">

                                        {% if store.has_shipping %}
                                            <div class="row">
                                                {% include "snipplets/shipping/shipping_cost_calculator.tpl" with { 'product_detail': false} %}
                                            </div>
                                        {% endif %}

                                        {% if store.branches %}

                                            {# Link for branches #}

                                            {% include "snipplets/shipping/branch-details.tpl" with {'product_detail': false} %}
                                        {% endif %}
                                    </div>
                                </div>
                            </div>
                        </div>                          
                    {% endif %}

                    {% if cart.items and settings.continue_buying %}
                        {% set last_item_added = (cart.items | first) %}
                        <div class="continue-buying-container hidden-xs">
                            <a href="{{ last_item_added.product.category.url }}" class="btn-link continue-buying pull-left m-top m-bottom">{{ 'Ver más productos' | translate }}</a>
                        </div>
                    {% endif %}
                </div>

                <div class="col-xs-12 col-sm-6">
                    {# Cart subtotal #}
                    <div class="cart-totals cart-subtotal" data-store="cart-subtotal">
                        <span>
                            {{ "Subtotal" | translate }}
                        </span>
                        <small class="js-subtotal-shipping-wording" {% if not (cart.has_shippable_products or show_calculator_on_cart) %}style="display: none"{% endif %}>{{ " (sin envío)" | translate }}</small>
                        :
                        <span class='js-cart-subtotal' data-priceraw="{{ cart.subtotal }}" data-component="cart.subtotal" data-component-value="{{ cart.subtotal }}">
                            {{ cart.subtotal | money }}
                        </span>
                    </div>

                    {{ component('price-without-taxes', {
                        location: 'cart',
                        container_classes: price_without_taxes_container_classes,
                        text_classes: {
                            price: price_without_taxes_price_classes,
                        },
                        })
                    }}

                    {# Cart promos #}

                    <div class="js-total-promotions total-promotions text-accent clear-both m-top-none pull-right">
                        <span class="js-promo-discount" style="display:none;"> {{ "Descuento" | translate }}</span>
                        <span class="js-promo-in" style="display:none;">{{ "en" | translate }}</span>
                        <span class="js-promo-all" style="display:none;">{{ "todos los productos" | translate }}</span>
                        <span class="js-promo-buying" style="display:none;"> {{ "comprando" | translate }}</span>
                        <span class="js-promo-units-or-more" style="display:none;"> {{ "o más." | translate }}</span>
                        {% for promotion in cart.promotional_discount.promotions_applied %}
                            {% if not promotion.is_subscription_promotion %}
                                {% if(promotion.scope_value_id) %}
                                    {% set id = promotion.scope_value_id %}
                                {% else %}
                                    {% set id = 'all' %}
                                {% endif %}
                                <span class="js-total-promotions-detail-row total-promotions-row p-bottom-quarter" id="{{ id }}">
                                    {% if promotion.discount_script_type != "custom" %}
                                        {% if promotion.discount_script_type == "NAtX%off" %}
                                            {{ promotion.selected_threshold.discount_decimal_percentage * 100 }}% OFF
                                        {% elseif promotion.isBuyXPayY %}
                                            {{ promotion.buy }}x{{ promotion.pay }}
                                        {% elseif promotion.isCrossSelling %}
                                            {{ "Descuento" | translate }}
                                        {% else %}
                                            {{ promotion.discount_script_type }}
                                        {% endif %}

                                        {{ "en" | translate }} {% if id == 'all' %}{{ "todos los productos" | translate }}{% else %}{{ promotion.scope_value_name }}{% endif %}

                                        {% if promotion.discount_script_type == "NAtX%off" %}
                                            <span class="text-lowercase">{{ "Comprando {1} o más." | translate(promotion.selected_threshold.quantity) }}</span>
                                        {% endif %}
                                    {% else %}
                                        {{ promotion.scope_value_name }}
                                    {% endif %}
                                    :  
                                    <span class="cart-promotion-number">-{{ promotion.total_discount_amount_short }}</span>
                                </span>
                            {% endif %}
                        {% endfor %}
                    </div>

                    <div class="clear-both">
                        {{ component('nubesdk-slot', { type: "after_cart_summary" }) }}
                    </div>

                    {# Cart total #}
                    <div class="cart-totals cart-total" data-store="cart-total">
                        <span class="text-secondary">{{ "Total" | translate }}: </span>
                        <span class="js-cart-total {% if cart.free_shipping.cart_has_free_shipping %}js-free-shipping-achieved{% endif %} {% if cart.shipping_data.selected %}js-cart-saved-shipping{% endif %} text-secondary" data-priceraw="{{ cart.total }}" data-component="cart.total" data-component-value="{{ cart.total }}">{{ cart.total | money }}</span>

                        {# IMPORTANT Do not remove this hidden total, it is used by JS to calculate cart total #}
                        <div class="total-price hidden" data-priceraw="{{ cart.total }}">
                            {{ "Total" | translate }} {{ cart.total | money }}
                        </div>


                        {# Cart payment discount price #}

                        {{ component('payment-discount-price', {
                                visibility_condition: settings.payment_discount_price,
                                location: 'cart',
                                container_classes: "font-body m-top-quarter text-accent text-right",
                            }) 
                        }}

                        {% if not settings.payment_discount_price %}
                        
                            {# Cart installments #}
    
                            {{ component('installments', {'location': 'cart', container_classes: { installment: "m-top-quarter font-small"}}) }}

                        {% endif %}

                    </div>

                    <div class="clear-both">
                        {{ component('nubesdk-slot', { type: "before_go_to_checkout" }) }}
                    </div>

                    <div class="go-to-checkout m-top full-width-container visible-when-content-ready">
                        {# Cart CTA #}
                        {% set has_validation_messages = cart.checkout_enabled_validation_messages | length > 0 %}
                        {% set should_show_checkout_button = cart.checkout_enabled and not has_validation_messages %}

                        <input id="go-to-checkout" class="btn btn-primary pull-right full-width-xs m-bottom m-top-half-xs" {{ not should_show_checkout_button ? 'style="display:none"' }} type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}" autocomplete="off" data-component="cart.checkout-button"/>

                        {# Cart alert messages #}
                        {{ component(
                            'checkout-enabled-validation-messages', {
                            alert_classes: 'h5 text-right pull-right',
                            cart_minimum_value: settings.cart_minimum_value
                            })
                        }}

                        {% if cart.items and settings.continue_buying %}
                            {% set last_item_added = (cart.items | first) %}
                            <div class="continue-buying-container text-center visible-xs">
                                <a href="{{ last_item_added.product.category.url }}" class="btn-link continue-buying pull-left m-bottom full-width">{{ 'Ver más productos' | translate }}</a>
                            </div>
                        {% endif %}
                        <input class="hidden pull-right" type="submit" name="update" value="{{ 'Cambiar cantidad' | translate }}" id="change-quantities"/>
                    </div>

                    <div class="clear-both">
                        {{ component('nubesdk-slot', { type: "after_go_to_checkout" }) }}
                    </div>
                </div>
            </div>
        </div>

        <div class="row">    		
    		
        </div>
		{% else %}

            {#  Empty cart  #}

            {% if not error %}
                {{ component('alert', {'type': 'warning', 'message': ('El carrito de compras está vacío.' | translate) }) }}
            {% endif %}
		{% endif %}		
	</form>

	<div id="store-curr" class="hidden">{{ store.currency }}</div>

</div>
