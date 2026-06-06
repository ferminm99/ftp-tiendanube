{# On first calculation select as default the first option: If store only has pickup option selects pickup else selects shipping option #}

{% if has_featured_shipping %}
    {% set checked_option = featured_option and loop.first and not pickup %}
{% else %}
    {% set checked_option = featured_option and loop.first and pickup %}
{% endif %}

{% if store.has_smart_shipping_no_auto_select %}
    {% set checked_option = false %}
{% endif %}

<li class="js-shipping-list-item list-item radio-button-item" data-store="shipping-calculator-item-{{ option.code }}" data-component="shipping.option">
	<label class="js-shipping-radio radio-button" data-shipping-type="{% if pickup %}pickup{% else %}delivery{% endif %}">
    	<input 
        id="{% if featured_option %}featured-{% endif %}shipping-{{loop.index}}" 
        class="js-shipping-method {% if not featured_option %}js-shipping-method-hidden{% endif %} {% if pickup %}js-pickup-option{% endif %} shipping-method" 
        data-price="{{option.cost.value}}" 
        data-code="{{option.code}}" 
        data-name="{{option.name}}" 
        data-cost="{% if option.show_price %} {% if option.cost.value == 0  %}{{ 'Gratis' | translate }}{% else %}{{option.cost}}{% endif %}{% else %} {{ 'A convenir' | translate }} {% endif %}" 
        type="radio" 
        value="{{option.code}}" 
        {% if checked_option %}checked="checked"{% endif %} name="option" 
        style="display:none" />
    	<div class="radio-button-content">
            <div class="radio-button-icons-container">
                <span class="radio-button-icons">
                    <span class="radio-button-icon unchecked"></span>
                    <span class="radio-button-icon checked"></span>
                </span>
            </div>
            <div class="radio-button-label">

                <div class="radio-button-text row"> 
                    <div class="col-xs-8 p-right-none font-small">
                        <div class="opacity-80 {% if option.payment_rules or option.time or option.suboptions is not empty %}m-bottom-quarter{% endif %}" data-component="option.name">
                            {{option.short_name}} {% if option.method == 'branch' %}<span class="m-left-quarter">{{ option.extra.extra }}</span>{% endif %}
                        </div>
                        {% if option.time %}
                            <div {% if option.suboptions is not empty or option.payment_rules or (option.method == 'pickup-point' and option.pickup_hours is not empty) %}class="m-bottom-quarter"{% endif %} data-component="option.date">
                                {% if store.has_smart_dates %}
                                    {{option.dates}}
                                {% else %}
                                    {{option.time}}
                                {% endif %}
                            </div>
                        {% endif %}                        
                        {% if option.method == 'pickup-point' and option.pickup_hours is not empty %}
                            <ul style="padding-left: 1rem; margin: 0;">
                                {% for pickup_hour in option.pickup_hours %}
                                    <li>{{ pickup_hour }}</li>
                                {% endfor %}
                            </ul>
                        {% endif %}
                        {% if option.suboptions is not empty %}
                            <div {% if option.payment_rules %}class="m-bottom-quarter"{% endif %}>
                                {% include "snipplets/shipping_suboptions/#{option.suboptions.type}.tpl" with {'suboptions': option.suboptions} %}
                            </div>
                        {% endif %}
                        {% if option.payment_rules %}
                            <div class="font-small">
                                <i class="fa fa-info-circle opacity-80 m-right-quarter" aria-hidden="true"></i>
                                <i>{{option.payment_rules}}</i>
                            </div>
                        {% endif %}
                        {% if option.warning['enable'] %}
                            <div class="alert alert-warning m-top m-bottom-none">
                                {{ option.warning['message'] }}
                            </div>
                        {% endif %}
                    </div>
                    {% if option.show_price %} 
                        <div class="col-xs-4 text-right p-right-none">
                            <strong class="shipping-price d-inline-block font-medium font-bold {% if option.cost.value == 0  %}text-accent{% endif %}">
                                {% if option.cost.value == 0  %}
                                    {{ 'Gratis' | translate }}
                                {% else %}
                                    {{option.cost}}
                                {% endif %}
                                {% if option.cost.value == 0 and option.old_cost.value %}
                                    <span class="price-compare font-small">{{option.old_cost}}</span>
                                {% endif %}
                            </strong>
                        </div>
                    {% endif %}
                </div>
            </div>
        </div>
    </label>
</li>