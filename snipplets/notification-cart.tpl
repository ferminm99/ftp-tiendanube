{% set notification_wrapper_classes = related_products ? 'd-flex d-block-xs m-bottom cart-table' : 'js-alert-added-to-cart notification-floating notification-hidden' %}

<div class="{{ notification_wrapper_classes }}" {% if not related_products %}style="display: none;"{% endif %}>
    <div class="{% if related_products %}full-width-xs col p-right p-right-none-xs{% else %}notification notification-primary{% endif %}">
        {% if not related_products %}
            <div class="notification-header">
                <div class="js-cart-notification-close notification-close m-top-half">
                    {% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill"} %}
                </div>
            </div>
        {% endif %}
        <div class="js-cart-notification-item d-flex" data-store="cart-notification-item">
            <div class="col-auto m-right notification-img">
                <img src="" class="js-cart-notification-item-img img-responsive" />
            </div>
            <div class="col text-left {% if not related_products %}p-right{% endif %}">
                <div class="m-bottom-quarter">
                    <span class="js-cart-notification-item-name"></span>
                    <span class="js-cart-notification-item-variant-container" style="display: none;">
                        (<span class="js-cart-notification-item-variant"></span>)
                    </span>
                </div>
                <div class="d-flex align-items-center m-bottom-quarter">
                    <span class="js-cart-notification-item-quantity"></span>
                    <span> x </span>
                    <span class="js-cart-notification-item-price"></span>
                    <span class="js-cart-notification-discount-label m-left-half" style="display: none;">
                        <span class="label label-primary label-small"><strong class="js-cart-notification-discount-percentage"></strong></span>
                    </span>
                </div>
                {% if not related_products %}
                    <strong>{{ '¡Agregado al carrito!' | translate }}</strong>
                {% endif %}
            </div>
        </div>
    {% if related_products %}
    </div>
    <div class="full-width-xs col-auto">
    {% else %}
    <div class="notification-footer">
    {% endif %}
            <div class="d-flex m-top{% if related_products %}-xs{% endif %}">
                <span class="col-auto text-left p-right-half">
                    <strong>{{ "Total" | translate }}</strong> 
                    (<span class="js-cart-widget-amount">
                        {{ "{1}" | translate(cart.items_count ) }} 
                    </span>
                    <span class="js-cart-counts-plural" style="display: none;">
                        {{ 'productos' | translate }}):
                    </span>
                    <span class="js-cart-counts-singular" style="display: none;">
                        {{ 'producto' | translate }}):
                    </span>
                </span>
                <strong class="js-cart-total col text-right">{{ cart.total | money }}</strong>
            </div>
            <a href="#" class="js-toggle-cart {% if not related_products %}js-cart-notification-close{% endif %} js-fullscreen-modal-open btn btn-primary btn-small full-width m-top-quarter m-top-half-xs" data-modal-url="modal-fullscreen-cart" {% if related_products %}data-dismiss="modal"{% endif %}>
                {{ "Ver carrito" | translate }}
            </a>
    {% if not related_products %}
    </div>
    {% endif %}
    </div>
</div>