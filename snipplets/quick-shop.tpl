{% if settings.quick_view %}
    <div id="quickshop-modal" class="js-fullscreen-modal js-quickshop-container js-modal-xs-centered modal modal-xs modal-xs-small fade modal-xs-left product-container modal-zindex-top" tabindex="-1" role="dialog" q-hidden="true">
        <div class="modal-dialog modal-lg modal-xs-dialog">
            <div class="modal-content">
                <div class="modal-body modal-xs-body">
                    <span class="js-fullscreen-modal-close btn btn-floating pull-right m-top-half-xs m-right-half-xs" data-dismiss="modal" aria-label="Close">
                        {% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa fa-lg pull-left m-none"} %}
                    </span>
                    <div class="js-item-product" data-product-id="">
                        <div class="js-product-container js-quickshop-container js-quickshop-modal" data-variants="" data-quickshop-id="">
                            <div class="js-item-variants">
                                <div class="row">
                                    <div class="col-md-5 text-center">
                                        <div class="quickshop-img-container">
                                            <div class="js-quickshop-img-padding">
                                                <img srcset="" class="js-item-image js-quickshop-img quickshop-img"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7 product-form-container m-top">
                                        <div class="js-item-name h1 product-name"></div>
                                        <div class="product-price-container">
                                            <span class="js-compare-price-display product-price-compare price-compare h4 m-bottom-quarter-xs m-right-half"></span>
                                            <span class="js-price-display d-inline h4"></span>
                                            {{ component('payment-discount-price', {
                                                    visibility_condition: settings.payment_discount_price,
                                                    location: 'product',
                                                    container_classes: "h5 weight-normal text-accent m-top-half m-top-quarter-xs m-bottom-quarter",
                                                    text_classes: {
                                                      price: 'h3 product-price product-price-small-xs',
                                                    }
                                                }) 
                                            }}
                                        </div>
                                        <div id="quickshop-form"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{% endif %}
