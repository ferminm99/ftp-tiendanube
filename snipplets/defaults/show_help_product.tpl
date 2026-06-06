{# Single product that works as an example #}
<div class="container m-top-double m-bottom-double">
    <div class="row">
        <div class="col-xs-12 col-md-6 product-img-col visible-when-content-ready">
            <div class="row">
                <div class="product-slider-container">
                    <div class="labels-floating">
                        <div class="label label-circle label-secondary">{{ settings.offer_text }}</div>
                    </div> 
                    <div class="js-swiper-product-demo product-slider no-slide-effect-md swiper-container">
                        <div class="swiper-wrapper">
                            <div class="js-product-slide swiper-slide product-slide desktop-zoom-container">
                                <div class="p-relative d-block">
                                    {{ component('placeholders/product-placeholder',{
                                            type: 'dress',
                                        })
                                    }}
                                </div> 
                            </div>
                            <div class="js-product-slide swiper-slide product-slide desktop-zoom-container">
                                <div class="p-relative d-block">
                                    {{ component('placeholders/product-placeholder',{
                                            type: 'dress',
                                            color: 'red',
                                        })
                                    }}
                                </div> 
                            </div>
                            <div class="js-product-slide swiper-slide product-slide desktop-zoom-container">
                                <div class="p-relative d-block">
                                    {{ component('placeholders/product-placeholder',{
                                            type: 'dress',
                                            color: 'green',
                                        })
                                    }}
                                </div> 
                            </div>
                        </div>
                        <div class="js-swiper-product-pagination-demo swiper-pagination visible-xs">
                            
                        </div>
                        <div class="js-swiper-product-prev-demo swiper-button-prev hidden-xs">{% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "slider-arrow"} %}</div>
                        <div class="js-swiper-product-next-demo swiper-button-next hidden-xs">{% include "snipplets/svg/angle-right.tpl" with {fa_custom_class: "slider-arrow"} %}</div>
                    </div>
                </div>
            </div>
            <div class="row hidden-xs m-top"> 
                <div class="thumbs visible-when-content-ready">   
                    <div class="thumb-link">
                        <div class="thumb-image">
                            {{ component('placeholders/product-placeholder',{
                                    type: 'dress',
                                    color: 'red',
                                })
                            }}
                        </div>
                    </div> 
                    <div class="thumb-link">
                        <div class="thumb-image">
                            {{ component('placeholders/product-placeholder',{
                                    type: 'dress',
                                    color: 'green',
                                })
                            }}
                        </div>
                    </div> 
                </div> 
            </div>
        </div>
        <div class="col-xs-12 col-md-6 product-form-container">
            <h1 class="product-name">{{ "Producto de ejemplo" | translate }}</h1>
            <div class="product-price-container">
                <h4 id="compare_price_display" class="product-price-compare price-compare m-bottom-quarter-xs">{{ "1200.50" | money }}</h4>
                <h2 class="h1 product-price js-price-display d-inline" id="price_display">{{ "1890.00" | money }}</h2>
            </div>
            <div class="row-fluid m-bottom">
                <h5>{{ "En hasta 12 cuotas con tarjeta de crédito" | translate }}</h5>
            </div>
            <form id="product_form" method="post" action="">
                <div class="product-variants">
                    <input type="hidden" name="add_to_cart" value="2243561">
                        <div class="desktop-product-variation variant-container col-md-4 col-sm-4 col-xs-12">
                            <label class="variant-label" for="variation_1">{{ "Talle" | translate }}</label>
                            <div class="select-container">
                                <select id="variation_1" class="form-control select" name="variation[0]">
                                    <option value="s" selected="selected">{{ "S" | translate }}</option>
                                    <option value="m">{{ "M" | translate }}</option>
                                    <option value="l">{{ "L" | translate }}</option>
                                    <option value="xl">{{ "XL" | translate }}</option>
                                </select> 
                            </div>
                        </div>
                        <div class="desktop-product-variation variant-container col-md-4 col-sm-4 col-xs-12"> 
                            <label class="variant-label" for="color_variant">{{ "Color" | translate }}</label>
                            <div class="select-container">
                                <select id="color_variant" class="form-control select" name="color_variant">
                                    <option value="blue" selected="selected">{{ "Azul" | translate }}</option>
                                    <option value="green">{{ "Verde" | translate }}</option>
                                    <option value="red">{{ "Rojo" | translate }}</option>
                                </select> 
                            </div>
                        </div>
                        <div class="desktop-product-variation variant-container col-md-4 col-sm-4 col-xs-12"> 
                            <label class="variant-label" for="variation_3">{{ "Material" | translate }}</label>
                            <div class="select-container">
                                <select id="variation_3" class="form-control select" name="variation[2]">
                                    <option value="Resorte" selected="selected">{{ "Denim" | translate }}</option>
                                    <option value="Ganchito">{{ "Algodón" | translate }}</option>
                                </select> 
                            </div>
                        </div>
                    </div>
                
                <input type="submit" href="#" class="btn btn-primary btn-block m-bottom m-top d-inline-block" value="{{ "Agregar al carrito" | translate }}" disabled>
            </form> 
        </div>
    </div>
    <div class="m-top-double m-bottom" data-store="related-products">
        <div class="title-container">
            <h2 class="products-section-title subtitle">{{ "Productos relacionados" | translate }}</h2>
        </div>
        <div class="products-slider swiper-container-horizontal p-relative">
            <div class="js-swiper-related-demo swiper-container grid-row">
                <div class="swiper-wrapper">
                    {% include 'snipplets/defaults/help_item.tpl' with {'help_item_1': true, slide_item : true, item_promotional_price: true} %}
                    {% include 'snipplets/defaults/help_item.tpl' with {'help_item_2': true, slide_item : true} %}
                    {% include 'snipplets/defaults/help_item.tpl' with {'help_item_4': true, slide_item : true} %}
                    {% include 'snipplets/defaults/help_item.tpl' with {'help_item_5': true, slide_item : true} %}
                    {% include 'snipplets/defaults/help_item.tpl' with {'help_item_6': true, slide_item : true} %}
                    {% include 'snipplets/defaults/help_item.tpl' with {'help_item_7': true, slide_item : true, item_promotional_price: true} %}
                </div>
                <div class="js-swiper-related-pagination-demo swiper-pagination"></div>
                <div class="js-swiper-related-demo-prev swiper-button-prev hidden-xs">{% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "slider-arrow"} %}</div>
                <div class="js-swiper-related-demo-next swiper-button-next hidden-xs">{% include "snipplets/svg/angle-right.tpl" with {fa_custom_class: "slider-arrow"} %}</div>
            </div>
        </div>
    </div>
</div>