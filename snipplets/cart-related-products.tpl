{# Set related products classes #}

{% set container_class = 'p-relative' %}
{% set title_class = 'subtitle font-body m-bottom' %}
{% set slider_container_class = 'swiper-container swiper-container-horizontal' %}
{% set swiper_wrapper_class = 'swiper-wrapper' %}
{% set slider_control_pagination_class = 'swiper-pagination m-top-half' %}
{% set slider_control_prev_class = 'swiper-button-prev swiper-button-cart' %}
{% set slider_control_next_class = 'swiper-button-next swiper-button-cart' %}
{% set slider_control_class = 'hidden-xs m-top-quarter' %}
{% set control_prev = include ('snipplets/svg/angle-left.tpl') %}
{% set control_next = include ('snipplets/svg/angle-right.tpl') %}

{# Related cart products #}

{% set related_section_id = 'related-products-notification' %}

{% set related_products = related_products_list | length > 0 %}

{% if related_products %}
    {{ component(
        'products-section',{
            title: 'Sumá a tu compra' | translate,
            id: related_section_id,
            data_component: related_section_id,
            products_amount: related_products_list | length,
            products_array: related_products_list,
            product_template_path: 'snipplets/single_product.tpl',
            product_template_params: {'slide_item': true, 'reduced_item': true},
            slider_controls_position: 'bottom',
            slider_pagination: true,
            svg_sprites: false,
            section_classes: {
                section: 'js-related-products-notification',
                container: container_class,
                title: title_class,
                products_container: 'related-products-notification-container',
                slider_container: 'js-swiper-related-products-notification ' ~ slider_container_class,
                slider_wrapper: swiper_wrapper_class,
                slider_control_pagination: 'js-swiper-related-notification-pagination ' ~ slider_control_pagination_class,
                slider_control: slider_control_class,
                slider_control_prev: 'js-swiper-related-products-notification-prev ' ~ slider_control_prev_class,
                slider_control_next: 'js-swiper-related-products-notification-next ' ~ slider_control_next_class,
            },
            custom_control_prev: control_prev,
            custom_control_next: control_next,
        })
    }}
{% endif %}