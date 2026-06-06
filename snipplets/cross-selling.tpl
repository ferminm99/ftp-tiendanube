{# Cross selling promotion form #}

{% if promotion %}
    {{ component(
        'promotions/cross-selling-form', {
            css_classes: {
                main_container: 'm-auto',
                image_container: 'p-relative',
                discount_percentage_label: 'label label-accent p-absolute label-top-left',
                image: 'img-fluid full-width lazyload product-image-limited',
                form_container: 'p-quarter',
                product_name: 'font-big text-center m-top-half m-bottom-none',
                prices_container: 'price-container text-center m-top-none m-bottom-quarter',
                price_wrapper: 'd-inline-block',
                original_price: 'price-compare font-weight-normal m-bottom-none',
                promo_price: 'text-primary m-bottom-none m-top-quarter',
                variant_selection_group: 'form-group p-right-quarter p-left-quarter m-bottom-xs',
                variant_selection_label: 'variant-label',
                variant_select: 'form-control select full-width',
                variant_select_icon_container: 'form-select-icon',
                add_to_cart_button: 'btn btn-primary btn-block d-inline m-top-half'
            },
            icon_config: {
                use_svg_icon: false
            },
            content: {
                button_placeholder: include('snipplets/placeholders/button-placeholder.tpl', { custom_class: 'm-top-half' })
            }
        })
    }}
{% endif %}