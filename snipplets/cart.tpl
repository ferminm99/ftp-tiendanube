<div class="cart-summary">
    {% if cart.items_count > 0 %}
		<a href="{{ store.cart_url }}" class="cart-summary-link">
			{% set total_comprado = 0 %}
			{% for compra in cart.items %}
				{% set total_comprado = compra.quantity + total_comprado %}
			{% endfor %}
			<div class="badge">{{ "{1}" | translate(total_comprado ) }}</div>
			<div class="cart-summary-icon svg-text-fill">
	            {% include "snipplets/svg/cart.tpl" %}
			</div>
			<div class="cart-summary-total">
				{{ cart.total | money }}
			</div>
		</a>
    {% else %}
		<a href="{{ store.cart_url }}" class="cart-summary-link">
			<div class="badge">0</div>
			<div class="cart-summary-icon svg-text-fill">
                {% include "snipplets/svg/cart.tpl" %}
            </div>
		</a>
    {% endif %}
</div>
