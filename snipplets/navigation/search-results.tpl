<ul class="search-suggest-list">
    {% set search_suggestions = products | take(6) %}
    {% for product in search_suggestions %}
        <li class="search-suggest-item">
            <a href="{{ product.url }}" class="search-suggest-link">
                <div class="search-suggest-image-container hidden-xs">
                    {{ product.featured_image | product_image_url("tiny") | img_tag(product.featured_image.alt, {class: 'search-suggest-image'}) }}
                </div>
                <div class="search-suggest-text text-uppercase full-width-xs">
                    <div class="search-suggest-name text-left font-small">
                        {{ product.name | highlight(query) }}
                    </div>
                    {% set is_subscription_only = product.isSubscriptionOnly() %}

                    {% if product.display_price %}
                        {% if is_subscription_only %}
                            {{ component('subscriptions/subscription-price', {
                                location: 'product_list',
                                subscription_classes: {
                                    price_compare: 'price-compare',
                                },
                            }) }}
                        {% else %}
                        <div class="search-suggest-price hidden-xs weight-strong">
                            {{ product.price | money }}
                        </div>

                        {% set product_can_show_installments = product.show_installments and product.display_price and product.get_max_installments.installment > 1 and settings.product_installments %}
                        {% if product_can_show_installments %}
                            <span class="hidden-xs font-small">
                                {% set max_installments_without_interests = product.get_max_installments(false) %}
                                {% if max_installments_without_interests and max_installments_without_interests.installment > 1 %}
                                     <div class="installments m-top-quarter">{{ "Hasta <strong class='installment-amount'>{1}</strong> cuotas sin interés" | t(max_installments_without_interests.installment) }}</div>
                                {% endif %}
                            </span>
                        {% endif %}
                        {% endif %}
                    {% endif %}

                    {{ component('subscriptions/subscription-message', {
                        subscription_classes: {
                            container: 'font-small',
                        },
                    }) }}
                </div>
                {% include "snipplets/svg/chevron-right.tpl" with {fa_custom_class: "svg-inline--fa search-suggest-icon hidden-xs"} %}
            </a>
        </li>
    {% endfor %}
    <li class="search-suggest-item hidden-xs">
        <a href="#" class="js-search-suggest-all-link search-suggest-link search-suggest-all-link">{{ 'Ver todos los resultados' | translate }}</a>
    </li>
</ul>