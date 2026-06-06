{% set has_multiple_slides = product.media_count > 1 or product.video_url %}

{# Product availability #}

{% set has_product_available = product.available and product.display_price %}

{% set is_subscription_only_product = product.isSubscribable() and product.isSubscriptionOnly() %}

<div class="container js-product-container js-product-detail js-shipping-calculator-container js-has-new-shipping" data-store="product-detail" data-discount-percentage="{{ product.promotional_price_percentage | round }}">
    <div class="row m-bottom m-bottom-half-xs">
        {% snipplet "breadcrumbs.tpl" %}
    </div>
    <div class="row" id="single-product" data-variants="{{product.variants_object | json_encode }}">
        <div class="col-xs-12 col-sm-6" data-store="product-image-{{ product.id }}">
            <div class="row">
                <div id="product-slider-container" class="js-product-image-container product-slider-container {% if not has_multiple_slides %}product-single-image{% endif %}">
                    {% if product.media_count > 0 %}
                        <div class="js-swiper-product product-slider no-slide-effect-md swiper-container">

                            {{ component('nubesdk-slot', { type: "product_detail_image" }) }}

                            <div class="swiper-wrapper">
                                {% for media in product.media %}
                                    {% if media.isImage %}
                                        <div class="js-product-slide swiper-slide product-slide {% if store.useNativeJsLibraries() %}desktop-zoom-container{% endif %}" data-image="{{media.id}}" data-image-position="{{loop.index0}}" data-zoom-url="{{ media | product_image_url('original') }}">
                                        {% if store.useNativeJsLibraries() %}
                                            <div class="js-desktop-zoom p-relative d-block" style="padding-bottom: {{ media.dimensions['height'] / media.dimensions['width'] * 100}}%;">
                                        {% else %}
                                            <a href="{{ media | product_image_url('original') }}" class="js-desktop-zoom cloud-zoom" rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'" style="padding-bottom: {{ media.dimensions['height'] / media.dimensions['width'] * 100}}%;">
                                        {% endif %}

                                                {% set apply_lazy_load = not loop.first %}

                                                {% if apply_lazy_load %}
                                                    {% set product_image_src = 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==' %}
                                                {% else %}
                                                    {% set product_image_src = media | product_image_url('large') %}
                                                {% endif %}
                                                
                                                <img 
                                                    {% if not apply_lazy_load %}fetchpriority="high"{% endif %}
                                                    {% if apply_lazy_load %}data-{% endif %}src="{{ product_image_src }}"
                                                    {% if apply_lazy_load %}data-{% endif %}srcset='{{  media | product_image_url('large') }} 480w, {{  media | product_image_url('huge') }} 640w, {{  media | product_image_url('original') }} 1024w' 
                                                    class="js-product-slide-img js-image-open-mobile-zoom product-slider-image img-absolute img-absolute-centered {% if apply_lazy_load %}lazyautosizes lazyload blur-up{% endif %}" 
                                                    {% if apply_lazy_load %}data-sizes="auto"{% endif %}
                                                    {% if media.dimensions.width and media.dimensions.height %}width="{{ media.dimensions.width }}" height="{{ media.dimensions.height }}"{% endif %}
                                                    {% if media.alt %}alt="{{media.alt}}"{% endif %} />

                                            {% if store.useNativeJsLibraries() %}
                                                <div class="js-desktop-zoom-big desktop-zoom-big product-slider-image hidden-xs" data-desktop-zoom="{{ media | product_image_url('original') }}"></div>
                                            {% endif %}
                                        {% if store.useNativeJsLibraries() %}
                                            </div>
                                        {% else %}
                                            </a>
                                        {% endif %}
                                        </div>
                                    {% else %}
                                        {# Native video slide #}
                                        {% include 'snipplets/product-video.tpl' with {product_native_video: true, video_uid: media.uid, video_thumbnail: media.thumbnail, video_render: media.render, video_index: loop.index0} %}
                                    {% endif %}
                                {% endfor %}
                                {# YouTube/Vimeo video slide #}
                                {% if product.video_url %}
                                    {% include 'snipplets/product-video.tpl' %}
                                {% endif %}
                            </div>
                            {% if has_multiple_slides %}
                                <div class="js-swiper-product-pagination swiper-pagination visible-xs"></div>
                                <div class="js-swiper-product-prev swiper-button-prev hidden-xs">{% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "slider-arrow"} %}</div>
                                <div class="js-swiper-product-next swiper-button-next hidden-xs">{% include "snipplets/svg/angle-right.tpl" with {fa_custom_class: "slider-arrow"} %}</div>
                            {% endif %}
                        </div>
                    {% endif %}

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
                                group: 'js-labels-floating-group labels-floating m-left-quarter',
                                promotion: label_accent_classes,
                                promotion_primary_text: 'd-inline-block p-top-quarter weight-strong',
                                promotion_secondary_text: 'd-inline-block label-small',
                                offer: 'js-offer-label ' ~ label_accent_classes,
                                shipping: 'label label-circle label-primary-dark label-overlap',
                                no_stock: 'js-stock-label label label-circle label-primary label-accent label-overlap',
                            },
                        })
                    }}
                    <div class="visible-when-content-ready visible-xs">
                        <a href="#" class="js-open-mobile-zoom btn-floating" aria-label="{{ 'Zoom de la imagen' | translate }}">
                            <div class="zoom-svg-icon">
                                {% include 'snipplets/svg/arrows-alt.tpl' with {fa_custom_class: "svg-text-fill"} %}
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row hidden-xs">
                {% if has_multiple_slides %}
                    <div class="thumbs visible-when-content-ready m-top">
                        {% for media in product.media %}
                            {% if media.isImage %}
                                <a href="#" class="js-product-thumb thumb-link m-none" data-slide-index="{{loop.index0}}">
                                    <img data-sizes="auto" src="{{ media | product_image_url('small') }}" data-srcset='{{  media | product_image_url('large') }} 480w, {{  media | product_image_url('huge') }} 640w' class="thumb-image lazyautosizes lazyload blur-up" {% if media.alt %}alt="{{media.alt}}"{% endif %} />
                                </a>
                            {% else %}
                                {# Native video thumb #}
                                {% include 'snipplets/product-video.tpl' with {thumb: true, product_native_video: true, video_uid: media.uid, video_thumbnail: media.thumbnail, video_render: media.render, video_index: loop.index0} %}
                            {% endif %}
                        {% endfor %}

                        {# YouTube/Vimeo video thumb #}
                        {% if product.video_url %}
                            {% include 'snipplets/product-video.tpl' with {thumb: true} %}
                        {% endif %}
                    </div>
                {% endif %}
            </div>
        </div>
        <div class="col-xs-12 col-sm-6 product-form-container" data-store="product-info-{{ product.id }}">

            {{ component('nubesdk-slot', { type: "before_product_detail_name" }) }}

            <h1 itemprop="name" class="js-item-name product-name" data-store="product-name-{{ product.id }}" data-component="product.name" data-component-value="{{ product.name }}">{{ product.name }}</h1>

            <div class="clear-both">
                {{ component('nubesdk-slot', { type: "after_product_detail_name" }) }}
            </div>

            <div>

                {{ component('nubesdk-slot', { type: "before_product_detail_price" }) }}

                {% if not is_subscription_only_product %}
                <div class="js-price-container product-price-container" data-store="product-price-{{ product.id }}">
                    <div class="m-bottom-quarter">
                        <h4 id="compare_price_display" class="js-compare-price-display product-price-compare price-compare weight-normal d-inline" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% endif %}>
                            {% if product.compare_at_price %}
                                {{ product.compare_at_price | money }}
                            {% endif %}
                        </h4>
                    </div>

                    {% set show_compare_price_saved_amount = not (settings.payment_discount_price and product.maxPaymentDiscount.value > 0) and settings.compare_price_saved_money %}

                    {{ component('compare-price-saved-amount', {
                            visibility_condition: show_compare_price_saved_amount,
                            discount_percentage: false,
                            container_classes: "m-left-quarter",
                            text_classes: {
                                amount_message: 'font-small',
                            },
                        })
                    }}

                    <h2 class="h1 product-price js-price-display d-inline" {% if not product.display_price %}style="display:none;"{% endif %} id="price_display" data-product-price="{{ product.price }}">
                    {% if product.display_price %}
                        {{ product.price | money }}
                    {% endif %}
                    </h2>
                    <span style="display:{% if not product.display_price %}none{% else %}inline-flex{% endif %}; align-items:center;">
                        <span class="js-offer-label text-accent"{% if not product.compare_at_price or not product.display_price %}style="display:none;"{% endif %}>
                            <span>
                                <span class="js-offer-percentage">{{ product.promotional_price_percentage |round }}</span>% OFF
                            </span>
                        </span>
                        {{ component('promotional-price-details', {
                            svg_sprites: false,
                            promotional_price_details_custom_icon: include("snipplets/svg/tag.tpl", { fa_custom_class: "svg-inline--fa fa-lg fa-w-12" }),
                            promotional_price_details_classes: {
                                container: 'tooltip-container p-relative m-left-quarter',
                                trigger: 'tooltip-trigger text-accent',
                                detail_container: 'tooltip-card',
                                detail_row: 'tooltip-card-row font-small',
                                detail_total: 'weight-strong m-top-half'
                            },
                        }) }}
                    </span>

                    {% set price_discount_disclaimer_margin_class = show_compare_price_saved_amount ? 'm-top-half' : 'm-top-quarter' %}

                    {{ component('price-discount-disclaimer', {
                        container_classes: 'font-small opacity-60 ' ~ price_discount_disclaimer_margin_class,
                    }) }}

                    {{ component('price-without-taxes', {
                            container_classes: "m-top-quarter font-small opacity-60",
                        })
                    }}

                    {{ component('payment-discount-price', {
                            visibility_condition: settings.payment_discount_price,
                            location: 'product',
                            container_classes: "h5 weight-normal text-accent m-top-half m-bottom-quarter",
                            text_classes: {
                            price: 'h3 product-price product-price-small-xs',
                            }
                        })
                    }}

                    {{ component('promotions-details', {
                        promotions_details_classes: {
                            container: 'js-product-promo-container row-fluid m-top',
                            promotion_title: 'h4 promo-title text-accent',
                            valid_scopes: 'promo-message m-bottom-none',
                            categories_combinable: 'promo-message m-bottom-none',
                            not_combinable: 'font-small m-top-quarter m-bottom-none',
                            progressive_discounts_table: 'table m-bottom-half m-top',
                            progressive_discounts_hidden_table: 'table-body-inverted',
                            progressive_discounts_show_more_link: 'btn-link btn-link-primary m-bottom-double',
                            progressive_discounts_promotion_quantity: 'font-weight-light text-lowercase'
                        },
                        svg_sprites: false,
                        custom_control_show: include("snipplets/svg/chevron-down.tpl", { fa_custom_class: "svg-inline--fa m-left-quarter" }),
                        custom_control_hide: include("snipplets/svg/chevron-up.tpl", { fa_custom_class: "svg-inline--fa m-left-quarter" }),
                    }) }}
                </div>
                {% endif %}

                {{ component('subscriptions/subscription-price', {
                    location: is_subscription_only_product ? 'product_detail',
                    subscription_classes: {
                        container: 'full-width-container m-bottom',
                        prices_container: 'd-flex flex-wrap align-items-baseline',
                        price_compare: 'h4 product-price-compare price-compare weight-normal full-width m-top-none m-bottom-half',
                        price_with_subscription: 'h1 product-price m-none',
                        discount: 'text-accent m-left-quarter',
                        price_without_taxes_container: 'm-top-quarter font-small opacity-60',
                    },
                    subscription_discount_position: 'inline',
                }) }}

                {{ component('nubesdk-slot', { type: "after_product_detail_price" }) }}

                {% snipplet 'placeholders/product-detail-form-placeholder.tpl' %}

                {# Product Installments button and info #}

                {{ component('nubesdk-slot', { type: "before_product_detail_payment_options" }) }}

                {% set hasDiscount = product.maxPaymentDiscount.value > 0 %}

                {% if product.show_installments and product.display_price %}
                    {% set installments_info = product.installments_info_from_any_variant %}
                    {% if installments_info or hasDiscount %}
                        <a href="#installments-modal" data-toggle="modal" data-modal-url="modal-fullscreen-payments" class="js-fullscreen-modal-open js-refresh-installment-data js-product-payments-container d-block link-module" {% if not product.display_price or not (product.get_max_installments and product.get_max_installments(false)) %}style="display: none;"{% endif %}>
                            {% if settings.product_detail_installments %}

                                {% set max_installments_without_interests = product.get_max_installments(false) %}
                                {% set installments_without_interests = max_installments_without_interests and max_installments_without_interests.installment > 1 %}

                                <div class="js-product-installments-container m-bottom-quarter">
                                    {% set card_icon_color = installments_without_interests ? 'svg-accent-fill' : 'svg-text-fill' %}
                                    {% set installment_text_color = installments_without_interests ? 'text-accent' : '' %}

                                    {% include "snipplets/svg/credit-card.tpl" with {fa_custom_class: "payment-credit-card m-right-quarter " ~ card_icon_color} %}
                                    {{ component('installments', {'location': 'product_detail', container_classes: { installment: "installments d-inline-block text-uppercase " ~ installment_text_color}}) }}
                                </div>
                            {% endif %}

                            {# Max Payment Discount #}

                            {% set hideDiscountContainer = not (hasDiscount and product.showMaxPaymentDiscount) %}
                            {% set hideDiscountDisclaimer = not product.showMaxPaymentDiscountNotCombinableDisclaimer %}

                            <div class="js-product-discount-container m-left-none m-bottom-half p-right-double full-width" {% if hideDiscountContainer %}style="display: none;"{% endif %}>
                                {% if settings.accent_color_active %}
                                    {% set svg_payment_color = 'svg-accent-fill' %}
                                {% else %}
                                    {% set svg_payment_color = 'svg-primary-fill' %}
                                {% endif %}
                                <div class="d-flex align-items-baseline">
                                    {% include "snipplets/svg/money-bill.tpl" with { fa_custom_class: "payment-credit-card m-right-quarter " ~ svg_payment_color } %}
                                    <span class="m-left-quarter {% if settings.accent_color_active %}text-accent{% endif %}">
                                        <span>
                                            <strong>{{ product.maxPaymentDiscount.value }}% {{'de descuento' | translate }}</strong>
                                            {{'pagando con' | translate }} {{ product.maxPaymentDiscount.paymentProviderName }}
                                        </span>
                                        <div class="js-product-discount-disclaimer font-small" {% if hideDiscountDisclaimer %}style="display: none;"{% endif %}>
                                            {{ (product.showMaxPaymentDiscountCombinesWithSomeDiscounts
                                                ? "No acumulable con algunas promociones"
                                                : "No acumulable con otras promociones")
                                            | translate }}
                                        </div>
                                    </span>
                                </div>
                            </div>


                            {% if product.show_installments and product.display_price %}
                                <div id="btn-installments" class="btn-link btn-link-small" {% if not (product.get_max_installments and product.get_max_installments(false)) %}style="display: none;"{% endif %}>
                                    {% set store_set_for_new_installments_view = store.is_set_for_new_installments_view %}
                                    {% if store_set_for_new_installments_view %}
                                        {% if not settings.product_detail_installments %}
                                            {% include "snipplets/svg/credit-card.tpl" with {fa_custom_class: "payment-credit-card m-right-quarter svg-primary-fill"} %}
                                        {% endif %}
                                        {{ "Ver medios de pago" | translate }}
                                    {% else %}
                                        {{ "Ver el detalle de las cuotas" | translate }}
                                    {% endif %}
                                </div>
                                <div class="visible-xs link-module-icon-right">
                                    {% include "snipplets/svg/angle-right.tpl" %}
                                </div>
                            {% endif %}
                        </a>
                    {% endif %}
                {% endif %}

                {{ component('nubesdk-slot', { type: "after_product_detail_payment_options" }) }}

                {# Gift promotion message #}

                {{ component('gift-promotion-message', {
                    svg_sprites: false,
                    gift_custom_icon: include('snipplets/svg/gift.tpl', {fa_custom_class: 'shipping-truck svg-accent-fill m-right-quarter'}),
                    container_classes: {
                        container: 'p-top',
                        highlight: 'text-accent weight-strong',
                    },
                }) }}

                {# Free shipping minimum message #}

                {% set has_free_shipping = cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}
                {% set has_product_free_shipping = product.free_shipping %}

                {% if not product.is_non_shippable and has_product_available and (has_free_shipping or has_product_free_shipping) %}
                    <div class="js-free-shipping-minimum-message free-shipping-message p-top p-bottom">
                        {% include "snipplets/svg/truck.tpl" with {fa_custom_class: "shipping-truck m-right-quarter svg-accent-fill"} %}
                        <span>
                            <strong class="text-accent">{{ "Envío gratis" | translate }}</strong>
                            <span {% if has_product_free_shipping %}style="display: none;"{% else %}class="js-shipping-minimum-label"{% endif %}>
                                {{ "superando los" | translate }} <span>{{ cart.free_shipping.min_price_free_shipping.min_price }}</span>
                            </span>
                        </span>
                        {% if not has_product_free_shipping %}
                            <div class="js-free-shipping-discount-not-combinable font-small m-top-quarter">
                                {{ "No acumulable con otras promociones" | translate }}
                            </div>
                        {% endif %}
                    </div>
                {% endif %}

                <form id="product_form" method="post" action="{{ store.cart_url }}" class="js-product-form display-when-content-ready" data-store="product-form-{{ product.id }}">
                    <input type="hidden" name="add_to_cart" value="{{product.id}}" />

                    {# --- INICIO SELECTOR DE COLOR PROGRAMADO (EL MENSUAL) --- #}
                    {% if product.related_products %}
                        <div class="m-bottom">
                            <label class="form-label font-small weight-strong text-uppercase m-bottom-quarter d-block">Color</label>
                            <div style="display: flex; gap: 10px; flex-wrap: wrap;">
                                
                                {# 1. Color de la página actual (Desactivado/Seleccionado) #}
                                {% set color_actual = 'Marrón' %}
                                {% if 'azul' in product.name | lower %}
                                    {% set color_actual = 'Azul' %}
                                {% endif %}

                                <span class="p-top-quarter p-bottom-quarter p-left-half p-right-half text-center weight-strong" style="border: 2px solid #333; border-radius: 4px; min-width: 60px; cursor: default;">
                                    {{ color_actual }}
                                </span>

                                {# 2. Colores hermanos (Links clickeables a los otros productos) #}
                                {% for related in product.related_products %}
                                    {% set color_relacionado = 'Marrón' %}
                                    {% if 'azul' in related.name | lower %}
                                        {% set color_relacionado = 'Azul' %}
                                    {% endif %}
                                    
                                    <a href="{{ related.url }}" class="p-top-quarter p-bottom-quarter p-left-half p-right-half text-center text-primary" style="border: 1px solid #ccc; border-radius: 4px; min-width: 60px; text-decoration: none;">
                                        {{ color_relacionado }}
                                    </a>
                                {% endfor %}
                            </div>
                        </div>
                    {% endif %}
                    {# --- FIN SELECTOR DE COLOR PROGRAMADO (EL MENSUAL) --- #}

                    {% if product.variations %}
                        {% include "snipplets/variants.tpl" with {'quickshop': false} %}
                    {% endif %}
                    {% if product.is_kit %}
                        {{ component('kit-products', {
                            kit_products_classes: {
                                container: 'm-bottom',
                                list: 'list-unstyled m-bottom-none',
                                item_wrap: 'kit-products-item-wrap',
                                item: 'd-flex align-items-center p-top-half p-bottom-half',
                                image_wrap: 'col-auto m-right-half',
                                image: 'kit-products-item-image',
                                text: 'col font-small',
                                quantity: 'font-small',
                                name: 'font-medium m-top-half m-bottom-half',
                            },
                        }) }}
                    {% endif %}
                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                    {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'catalog': "Consultar", 'nostock' : settings.no_stock_text} %}

                    {% if product.available and product.display_price %}

                        {{ component('subscriptions/subscription-selector', {
                            allow_subscription_only: is_subscription_only_product,
                            subscription_classes: {
                                container: 'radio-button-container full-width-container m-bottom-half',

                                radio_button_text: 'row d-flex align-items-center',
                                radio_button_icon: 'radio-button-icons',
                                purchase_option_info_container: 'col-xs-8 font-body p-right-none',
                                purchase_option_price: 'col-xs-4 text-right font-medium weight-strong p-none',
                                purchase_option_single_frequency: 'm-top-quarter p-top-quarter font-small opacity-80',
                                purchase_option_discount: 'label label-primary label-inline m-left-quarter m-bottom-none font-small-extra',

                                dropdown_container: 'form-group row p-relative m-top-half m-bottom-none m-left-none',
                                dropdown_button: 'form-control',
                                dropdown_icon: 'form-select-icon',
                                dropdown_options: 'form-select-options',
                                dropdown_option: 'form-select-option row no-gutters font-body',
                                dropdown_option_info: 'col-xs-7 p-none',
                                dropdown_option_price: 'col-xs-5 p-right-none text-right weight-strong',
                                dropdown_option_discount: 'text-accent m-top-quarter weight-strong',
                                
                                cart_alert: 'font-small text-center m-bottom p-bottom-half',
                                shipping_message: 'm-top-half m-bottom-double',
                                shipping_message_text: 'font-small m-top-quarter m-left p-left-half',
                                
                                legal_message: 'font-small-extra text-center m-bottom-half full-width-container',
                                legal_link: 'font-small-extra d-inline-block btn-link btn-link-primary p-none',
                                legal_modal: 'modal-centered-small modal-xs modal-xs-centered modal-zindex-top',
                                legal_modal_header: 'modal-header p-all-half-xs',
                                legal_modal_body: 'p-all-half-xs',
                                legal_modal_title: 'h4 text-uppercase m-top-none m-bottom m-right p-right',
                                legal_modal_details_title: 'h5 m-bottom',
                                legal_modal_close_button: 'btn-floating m-right-half m-top-quarter p-top-half',
                                legal_modal_details_paragraph: 'font-small m-bottom',
                                legal_modal_details_link: 'font-small d-inline-block btn-link btn-link-primary p-none',
                                legal_modal_overlay: 'modal-backdrop-zindex-top',
                            },
                            svg_sprites: false,

                            dropdown_icon: true,
                            dropdown_custom_icon: include("snipplets/svg/angle-down.tpl", { fa_custom_class: "svg-inline--fa fa-2x svg-text-fill" }),

                            cart_alert_icon: true,
                            cart_alert_custom_icon: include("snipplets/svg/info-circle.tpl", { fa_custom_class: "svg-inline--fa svg-text-fill m-right-quarter" }),

                            shipping_message_icon: true,
                            shipping_message_custom_icon: include("snipplets/svg/truck.tpl", { fa_custom_class: "svg-inline--fa fa-lg m-right-quarter svg-icon-text" }),

                            legal_modal_close_custom_icon: include("snipplets/svg/times.tpl", { fa_custom_class: "svg-inline--fa fa-lg" }),
                        }) }}

                        {% if settings.product_stock %}
                            <div class="font-small m-bottom">
                                <span class="js-product-stock">{{ product.selected_or_first_available_variant.stock }}</span> {{ "en stock" | translate }}
                            </div>
                        {% endif %}
                        {% if settings.last_product %}
                            <div class="{% if product.variations %}js-last-product {% endif %}text-accent font-medium text-uppercase m-top-none m-bottom"{% if product.selected_or_first_available_variant.stock != 1 %} style="display: none;"{% endif %}>
                                <strong>{{ settings.last_product_text }}</strong>
                            </div>
                            {% if settings.latest_products_available %}
                                {% set latest_products_limit = settings.latest_products_available %}
                                <div class="{% if product.variations %}js-latest-products-available {% endif %}text-accent font-medium text-uppercase m-top-none m-bottom" data-limit="{{ latest_products_limit }}" {% if product.selected_or_first_available_variant.stock > latest_products_limit or product.selected_or_first_available_variant.stock == null or product.selected_or_first_available_variant.stock == 1 %} style="display: none;"{% endif %}>
                                    <strong>{{ "¡Solo quedan" | translate }} <span class="js-product-stock">{{ product.selected_or_first_available_variant.stock }}</span> {{ "en stock!" | translate }}</strong>
                                </div>
                            {% endif %}
                        {% endif %}
                    {% endif %}

                    <div class="clear-both">
                        {{ component('nubesdk-slot', { type: "before_product_detail_add_to_cart" }) }}
                    </div>

                    {# Add to cart CTA #}
                    
                    {% set btn_value = is_subscription_only_product ? ('our_components.subscriptions.subscribe' | tt) : (texts[state] | translate) %}
                    <input type="submit" class="js-prod-submit-form js-addtocart btn btn-primary btn-block m-bottom d-inline-block {{ state }}" value="{{ btn_value }}" {% if state == 'nostock' %}disabled{% endif %} data-store="product-buy-button" data-component="product.add-to-cart"/>

                    {# Fake add to cart CTA visible during add to cart event #}
                    {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "m-top-none m-bottom"} %}

                    {% if settings.ajax_cart %}
                        <div class="js-added-to-cart-product-message pull-left full-width m-bottom p-bottom-quarter m-top-half" style="display: none;">
                            {{'Ya agregaste este producto.' | translate }}
                            <a href="#" class="js-toggle-cart js-fullscreen-modal-open btn-link btn-link-small p-left-quarter"  data-modal-url="modal-fullscreen-cart">{{ 'Ver carrito' | translate }}</a>
                        </div>
                    {% endif %}

                    {{ component('nubesdk-slot', { type: "after_product_detail_add_to_cart" }) }}

                    {# Free shipping visibility message #}

                    {% set free_shipping_minimum_label_changes_visibility = has_free_shipping and cart.free_shipping.min_price_free_shipping.min_price_raw > 0 %}

                    {% set include_product_free_shipping_min_wording = cart.free_shipping.min_price_free_shipping.min_price_raw > 0 %}

                    {% if not product.is_non_shippable and has_product_available and has_free_shipping and not has_product_free_shipping %}

                        {# Free shipping add to cart message #}

                        {% if include_product_free_shipping_min_wording %}

                            {% include "snipplets/shipping/shipping-free-rest.tpl" with {'product_detail': true} %}

                        {% endif %}

                        {# Free shipping achieved message #}

                        <div class="js-product-form-free-shipping-message {% if free_shipping_minimum_label_changes_visibility %}js-free-shipping-message{% endif %} p-top-quarter m-bottom p-bottom-quarter text-accent weight-strong" {% if not cart.free_shipping.cart_has_free_shipping %}style="display: none;"{% endif %}>
                            {{ "¡Genial! Tenés envío gratis" | translate }}
                        </div>

                    {% endif %}

                    {# Define contitions to show shipping calculator and store branches on product page #}

                    {% set show_product_fulfillment = settings.shipping_calculator_product_page and (store.has_shipping or store.branches) and not product.free_shipping and not product.is_non_shippable %}

                    {{ component('nubesdk-slot', { type: "before_product_detail_shipping_options" }) }}

                    {% if show_product_fulfillment %}

                        <div class="row clear-both">

                            {# Shipping calculator and branch link #}

                            <div class="container-fluid">
                                <div id="product-shipping-container" class="product-shipping-calculator list-readonly m-bottom-double" {% if not product.display_price or not product.has_stock %}style="display:none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">
                                    {% if store.has_shipping %}
                                        <div class="row">
                                            {% include "snipplets/shipping/shipping_cost_calculator.tpl" with { 'shipping_calculator_variant' : product.selected_or_first_available_variant, 'product_detail' : true} %}
                                        </div>
                                    {% endif %}
                                    {% if store.branches %}
                                        {# Link for branches #}

                                        {% include "snipplets/shipping/branch-details.tpl" with {'product_detail': true} %}
                                    {% endif %}
                                </div>
                            </div>
                        </div>
                    {% endif %}

                    {{ component('nubesdk-slot', { type: "after_product_detail_shipping_options" }) }}

                    {# Product informative banners #}

                    {% include 'snipplets/product-informative-banner.tpl' %}

                    {% include 'snipplets/social-widgets.tpl'%}
                    {% if not settings.show_description_bottom %}
                        <div class="description user-content m-top" data-store="product-description-{{ product.id }}">{{ product.description }}</div>

                        {{ component('nubesdk-slot', { type: "after_product_description" }) }}

                    {% endif %}
                </form>
            </div>
        </div>
    </div>
	<div class="row visible-when-content-ready">
		{% if settings.show_description_bottom %}
    		<div class="col-xs-12 user-content m-top" data-store="product-description-{{ product.id }}">
    			<div class="description user-content">{{ product.description }}</div>

                {{ component('nubesdk-slot', { type: "after_product_description" }) }}

    		</div>
		{% endif %}
		<div class="col-xs-12 visible-when-content-ready">
			<div class="comments-area m-top">
                {% if settings.show_product_fb_comment_box %}
				    <div class="fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
                {% endif %}
            </div>
		</div>
	</div>
</div>

{# Related products #}

{% include 'snipplets/related-products.tpl' %}

{# Payments details #}

{% include 'snipplets/product-payment-details.tpl' %}

<div class="js-mobile-zoom-panel mobile-zoom-panel">
    {% include "snipplets/svg/circle-notch.tpl" with {fa_custom_class: "svg-inline--fa js-mobile-zoom-spinner mobile-zoom-spinner fa-2x fa-spin svg-text-fill"} %}
    <div class="js-mobile-zoomed-image mobile-zoom-image-container">
       {# Container to be filled with the zoomable image #}
    </div>
    <a class="js-close-mobile-zoom btn btn-default btn-floating">
        {% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa fa-2x"} %}
    </a>
</div>

{# Product video modal on mobile #}

{% if product.video_url or product.hasNativeVideos %}
    <div id="modal-product-video" class="js-fullscreen-modal modal fade modal-xs modal-xs-right bottom" tabindex="-1" role="dialog" aria-labelledby="modal-product-video-label" aria-hidden="true">
        <div class="modal-dialog modal-xs-dialog">
            <div class="modal-header">
                <a class="js-video-modal-close modal-xs-header visible-xs" href="#" data-dismiss="modal">
                    {% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "svg-inline--fa fa-2x modal-xs-header-icon modal-xs-right-header-icon"} %}
                    <span id="modal-product-video-label" class="modal-xs-header-text modal-xs-right-header-text text-trim">{{ "Video de" | translate }} {{ product.name }}</span>
                </a>
            </div>
            <div class="modal-content p-none">
                <div class="modal-body modal-xs-body p-none">
                    <div class="js-product-video-modal video-modal">
                        {% if product.video_url %}
                            {# YouTube/Vimeo: Empty container filled by LS.loadVideo #}
                            <div class="js-video-iframe embed-responsive embed-responsive-16by9" style="display: none;" data-video-color="{{ settings.primary_color | trim('#') }}"></div>
                        {% endif %}
                        {% if product.hasNativeVideos %}
                            {# Native videos: Content is rendered inline with slider via product-video.tpl and moved here by JS #}
                            <div class="js-native-video-modal-content native-video-modal-content embed-responsive embed-responsive-16by9" style="display: none;"></div>
                        {% endif %}
                    </div>
                </div>
            </div>
        </div>
    </div>
{% endif %}
