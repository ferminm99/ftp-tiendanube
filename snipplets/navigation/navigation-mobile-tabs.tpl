<div class="mobile-nav-tabs-container visible-xs">
    <a href="{{ store.url }}" class="mobile-nav-tab {% if store.is_catalog %} col-xs-6 {% else %} col-xs-4 {% endif %} {% if template == 'home' %} js-current-page selected {% endif %}">
        <div class="mobile-nav-tab-icon">
            {% include "snipplets/svg/home.tpl" %}
        </div>
        <div class="mobile-nav-tab-text">{{ 'Inicio' | translate }}</div>
    </a>
    <a {% if categories %}href="#"{% else %}href="{{ store.products_url }}"{% endif %} id="mobile-categories-btn" class="mobile-nav-tab {% if categories %} js-toggle-mobile-categories {% endif %} {% if store.is_catalog %} col-xs-6 {% else %} col-xs-4 {% endif %} {% if template == 'category' or template == 'product' %} js-current-page selected {% endif %}">
        <div class="mobile-nav-tab-icon">
            {% include "snipplets/svg/list.tpl" %}
        </div>
        <div class="mobile-nav-tab-text">{{ 'Productos' | translate }}</div>
    </a>
    {% if not store.is_catalog %}
        {% if settings.ajax_cart %}
            <a {% if template != 'cart' %}href="#"{% endif %} class="mobile-nav-tab col-xs-4 {% if template != 'cart' %} js-toggle-cart js-fullscreen-modal-open {% else %} js-current-page selected {% endif %}" data-modal-url="modal-fullscreen-cart" data-component="cart-button">
                <div class="mobile-nav-tab-icon">
                    {% include "snipplets/svg/cart.tpl" %}
                </div>
                <div class="mobile-nav-tab-text">{{ 'Carrito' | translate }}</div>
                {% if template != 'cart' %}
                    <span class="js-cart-widget-amount badge badge-right badge-number badge-secondary">{{ "{1}" | translate(cart.items_count ) }}</span>
                {% endif %}
            </a>
        {% else %}
            <div class="mobile-nav-tab col-xs-4 {% if template == 'cart' %} js-current-page selected {% endif %}">
            {% if cart.items_count > 0 %}
            <a href="{{ store.cart_url }}">
            {% else %}
            <a href="#" class="js-trigger-empty-cart-alert">
            {% endif %}
                <div class="mobile-nav-tab-icon">
                    {% include "snipplets/svg/cart.tpl" %}
                </div>
                <div class="mobile-nav-tab-text">{{ 'Carrito' | translate }}</div>
                {% if template != 'cart' %}
                   <span class="js-cart-widget-amount badge badge-right badge-number badge-secondary">{{ "{1}" | translate(cart.items_count ) }}</span>
                {% endif %}
            </a>
            </div>
            <div class="js-mobile-nav-empty-cart-alert alert alert-info mobile-nav-empty-cart">{{ "El carrito de compras está vacío." | translate }}</div>
        {% endif %}
    {% endif %}
</div>