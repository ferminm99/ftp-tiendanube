{% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url %}

{% set is_subscription_only = product.isSubscriptionOnly() %}

{# Item image slider #}

{% set show_image_slider = 
    (template == 'category' or template == 'search')
    and settings.product_item_slider 
    and not reduced_item 
    and not has_filters 
    and product.other_images
%}

{% if show_image_slider %}
    {% set slider_controls_container_class = 'item-slider-controls-container hidden-xs' %}
    {% set control_prev = include ('snipplets/svg/angle-left.tpl') %}
    {% set control_next = include ('snipplets/svg/angle-right.tpl') %}
{% endif %}

{# Secondary images #}

{% set show_secondary_image = settings.product_hover %}

<div data-path-hover="M 180,400 0,400 0,140 180,160 z" class="js-item-product {% if slide_item %}js-item-slide swiper-slide products-slider-item item-container-slide{% else %}js-masonry-grid-item{% endif %} item-container{% if reduced_item %} p-none{% endif %}" data-product-type="list" data-product-id="{{ product.id }}" data-store="product-item-{{ product.id }}" data-component="product-list-item" data-component-value="{{ product.id }}">
  <div class="item{% if reduced_item %} item-product-reduced{% endif %}">
    {% if (settings.quick_view or settings.product_color_variants) and not reduced_item %}
      <div class="js-product-container js-quickshop-container {% if product.variations %}js-quickshop-has-variants{% endif %}" data-variants="{{ product.variants_object | json_encode }}" data-quickshop-id="quick{{ product.id }}{% if slide_item and section_name %}-{{ section_name }}{% endif %}" data-discount-percentage="{{ product.promotional_price_percentage | round }}">
    {% endif %}
    {% if not reduced_item %}

      {% set label_accent_classes = 'label label-circle label-secondary label-text label-accent' %}

      {{ component(
        'labels', {
          defer_stock_label_text: true,
          prioritize_promotion_over_offer: true,
          promotion_nxm_long_wording: false,
          promotion_quantity_long_wording: true,
          offer_quantity_long_wording: true,
          offer_custom_wording: settings.offer_text,
          shipping_custom_wording: settings.free_shipping_text,
          no_stock_custom_wording: settings.no_stock_text,
          labels_classes: {
            group: 'js-labels-floating-group labels-floating',
            promotion: label_accent_classes,
            promotion_primary_text: 'd-inline-block p-top-quarter weight-strong',
            promotion_secondary_text: 'd-inline-block label-small',
            offer: 'js-offer-label ' ~ label_accent_classes,
            shipping: 'label label-circle label-primary-dark label-overlap',
            no_stock: 'js-stock-label label label-circle label-primary label-overlap',
          },
        })
      }}
      
    {% endif %}

    <div class="p-relative overflow-none">
      {% if slide_item %}
        <div class="item-image-container-slide">
      {% endif %}
        
        {% set image_classes = 'js-item-image item-image lazyautosizes lazyload img-absolute img-absolute-centered fade-in' %}
        {% set data_expand = show_image_slider ? '50' : '-10' %}

        {{ component(
          'product-item-image', {
            image_lazy: true,
            image_lazy_js: true,
            image_thumbs: ['small', 'medium', 'large', 'huge', 'original'],
            image_data_expand: data_expand,
            image_secondary_data_sizes: 'auto',
            image_container: 'item-image-container',
            secondary_image: show_secondary_image,
            slider: show_image_slider,
            svg_sprites: false,
            slider_pagination_container: true,
            product_item_image_classes: {
              image_container: 'item-image',
              image_padding_container: 'p-relative d-block',
              image: image_classes ~ (slide_item ? ' item-image-slider'),
              image_featured: 'item-image-featured',
              image_secondary: 'item-image-secondary',
              slider_container: 'swiper-container p-absolute',
              slider_wrapper: 'swiper-wrapper',
              slider_slide: 'swiper-slide item-image-slide',
              slider_control_pagination_container: 'item-slider-pagination-container d-md-none ' ~ (product.images_count == 2 ? 'two-bullets'),
              slider_control_pagination: 'item-slider-pagination visible-xs',
              slider_control: 'slider-arrow',
              slider_control_prev_container: 'swiper-button-prev ' ~ slider_controls_container_class,
              slider_control_next_container: 'swiper-button-next ' ~ slider_controls_container_class,
              more_images_message: 'item-more-images-message',
            },
            custom_control_prev: control_prev,
            custom_control_next: control_next,
          })
        }}

        
      {% if slide_item %}
        </div>
      {% endif %}
      <div class="item-info-container" data-store="product-item-info-{{ product.id }}">
          <div class="item-info">
            {% if not reduced_item %}
              {% if settings.product_color_variants %}
                {% include 'snipplets/item-colors.tpl' %}
              {% endif %}
              {% if 
                ((settings.quick_view and not product.isSubscribable()) or settings.product_color_variants)
                and product.available 
                and product.display_price 
                and product.variations
              %}
                <div class="js-item-variants item-buy-variants hidden">
                  <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                    <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                    {% include "snipplets/variants.tpl" with {'quickshop': true} %}
                    <div class="js-quantity pull-left full-width-xs m-top">
                      <button type="button" class="js-quantity-down cart-quantity-btn cart-quantity-btn-left">
                        <div class="cart-quantity-svg-icon">
                          {% include "snipplets/svg/minus.tpl" %}
                        </div>
                      </button>
                      <div class="cart-quantity-input-container d-inline-block" data-component="product.adding-amount">
                        <input type="number" class="js-quantity-input cart-quantity-input text-center" autocorrect="off" autocapitalize="off" name="quantity" value="1" min="1" pattern="\d*" aria-label="{{ 'Cambiar cantidad' | translate }}" data-component="adding-amount.value">
                      </div>
                      <button type="button" class="js-quantity-up cart-quantity-btn cart-quantity-btn-right">
                        <div class="cart-quantity-svg-icon">
                          {% include "snipplets/svg/plus.tpl" %}
                        </div>
                      </button>
                    </div>
                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                    {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'catalog': "Consultar", 'nostock' : settings.no_stock_text} %}
                    <div class="m-top full-width-container">
                      <input type="submit" class="js-prod-submit-form js-addtocart js-variant-addtocart btn btn-primary btn-block m-bottom d-inline-block {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} data-component="product-list-item.add-to-cart" data-component-value="{{product.id}}"/>

                      {# Fake add to cart CTA visible during add to cart event #}
                      {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "m-bottom m-top-none"} %}
                    </div>
                  </form>
                </div>
              {% endif %}
            {% endif %}
            <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" aria-label="{{ product.name }}">

              {{ component('nubesdk-slot', { type: "before_product_grid_item_name" }) }}

              <div class="js-item-name h2 item-name" data-store="product-item-name-{{ product.id }}">{{ product.name }}</div>

              {{ component('nubesdk-slot', { type: "after_product_grid_item_name" }) }}

              {{ component('nubesdk-slot', { type: "before_product_grid_item_price" }) }}

              <div class="item-price-container {% if not product.display_price%}hidden{% endif %}" data-store="product-item-price-{{ product.id }}">
                {% if is_subscription_only %}
                  {# Subscription price for subscription-only products #}
                  {{ component('subscriptions/subscription-price', {
                      location: 'product_list',
                      subscription_classes: {
                          price_compare: 'js-compare-price-display item-price-compare price-compare',
                          price_with_subscription: 'js-price-display price item-price',
                          discount_container: 'font-small-extra opacity-80 m-top-quarter text-accent text-uppercase',
                      },
                  }) }}
                {% else %}
                  {# Standard price display #}
                  {% if not reduced_item %}
              	  <span class="js-compare-price-display {% if not product.compare_at_price %}hidden{% endif %} item-price-compare price-compare">
                   {% if product.compare_at_price %}
                    {{ product.compare_at_price | money }}
                   {% endif %}
                  </span>
                  <span class="js-offer-label m-left-half font-small"{% if not product.compare_at_price or not product.display_price %}style="display:none;"{% endif %}>
                    <span class="js-offer-percentage">{{ product.promotional_price_percentage |round }}</span>% OFF
                  </span>
                {% endif %}
                <div class="js-price-display price item-price" {% if not product.display_price %}class="hidden"{% endif %} data-product-price="{{ product.price }}">
                  {% if product.display_price %}
                    {{ product.price | money }}
                  {% endif %}
                </div>

                {% if not reduced_item %}
                  {{ component('payment-discount-price', {
                      visibility_condition: settings.payment_discount_price,
                      location: 'product',
                      container_classes: discount_price_spacing_classes ~ " font-small opacity-80 m-bottom-quarter text-accent text-uppercase",
                      text_classes: {
                        price: 'item-price font-body',
                      }
                    })
                  }}

                  {% set product_can_show_installments = product.show_installments and product.display_price and product.get_max_installments.installment > 1 and settings.product_installments %}

                  {% set installments_font_size = settings.payment_discount_price ? 'font-small-extra' : 'font-small' %}

                  {% if product_can_show_installments %}
                      {{ component('installments', {'location': 'product_item', container_classes: { installment: "installments m-top-quarter item-installments " ~ installments_font_size }}) }}
                  {% endif %}
                {% endif %} {# endif not reduced_item #}
              {% endif %} {# endif is_subscription_only #}
              </div>

              {{ component('nubesdk-slot', { type: "after_product_grid_item_price" }) }}
              
              {% if not reduced_item %}
                {{ component('subscriptions/subscription-message', {
                  subscription_classes: {
                    container: 'font-small-extra opacity-80 m-top-quarter text-accent text-uppercase',
                    value: 'item-price font-body',
                  },
                }) }}
              {% endif %}
              
              {% if settings.quick_view and product.available and product.display_price and not reduced_item %}

                {% set quickshop_button_classes = 'btn btn-primary btn-block btn-small btn-small-xs' %}

                {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

                <div class="item-actions m-top-half">

                  {% if product.isSubscribable() %}
                    
                    {# Product with subscription will link to the product page #}

                    {% set quickshop_btn_text = is_subscription_only ? ('our_components.subscriptions.subscribe' | tt) : (texts[state] | translate) %}
                    {% set quickshop_title = is_subscription_only ? (('our_components.subscriptions.subscribe' | tt) ~ ' ' ~ product.name) : (('Compra rápida de' | translate) ~ ' ' ~ product.name) %}

                    <span class="{{ quickshop_button_classes }}" title="{{ quickshop_title }}" aria-label="{{ quickshop_title }}">
                      {{ quickshop_btn_text }}
                    </span>

                  {% else %}

                    {% if product.variations %}
                      <a data-toggle="modal" href="#quickshop-modal" data-modal-url="modal-fullscreen-quickshop" class="js-quickshop-modal-open {% if slide_item %}js-quickshop-slide{% endif %} js-modal-open js-fullscreen-modal-open js-trigger-modal-zindex-top {{ quickshop_button_classes }}" title="{{ 'Compra rápida de' | translate }} {{ product.name }}" aria-label="{{ 'Compra rápida de' | translate }} {{ product.name }}" data-component="product-list-item.show-add-to-cart">{{ 'Agregar al carrito' | translate }}</a>
                    {% else %}
                      <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                          <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                          

                          <input type="submit" class="js-addtocart js-prod-submit-form {{ quickshop_button_classes }} {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} data-component="product-list-item.add-to-cart" data-component-value="{{product.id}}"/>

                          {# Fake add to cart CTA visible during add to cart event #}
                          {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "btn-small btn-small-xs m-top-none"} %}

                      </form>
                    {% endif %}
                  {% endif %}
                </div>
              {% endif %}
            </a>
          </div>
        
      </div>
    </div>
    {% if (settings.quick_view or settings.product_color_variants) and not reduced_item %}
      </div>
    {% endif %}
  </div>
  {# Structured data to provide information for Google about the product content #}
  {{ component('structured-data', {'item': true}) }}
</div>
