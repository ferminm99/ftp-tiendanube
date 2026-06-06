<div href="#" class="{% if store.branches|length > 1 %}js-toggle-branches{% endif %} link-module no-border {% if store.has_shipping %}m-top-half p-bottom-half border-top{% endif %}" data-store="branches">
    <span class="link-module-icon d-inline-block pull-left">
        {% include "snipplets/svg/store.tpl" %}
    </span>
    <span class="d-inline-block">
        <div class="link-module-content link-module-text font-body align-top">
            {% if store.branches|length > 1 %}
                {{ 'Nuestros locales' | translate }}
            {% else %}
                {{ 'Nuestro local' | translate }}
            {% endif %}
        </div>

        {% if store.branches|length > 1 %}
            <div class="btn-link btn-link-primary btn-link-small">
                <span class="js-see-branches">
                    {{ 'Ver opciones' | translate }}
                    {% include "snipplets/svg/chevron-down.tpl" with {fa_custom_class: "svg-inline--fa m-left-quarter"} %}
                </span>
                <span class="js-hide-branches" style="display: none;">
                {{ 'Ocultar opciones' | translate }}
                {% include "snipplets/svg/chevron-up.tpl" with {fa_custom_class: "svg-inline--fa  m-left-quarter"} %}
                </span>
            </div>
        {% endif %}
    </span>
</div>

{# Store branches #}

<ul class="js-store-branches-container list-unstyled full-width-container {% if product_detail %}list-readonly p-none{% else %}radio-button-container{% endif %} m-bottom-half m-top-half" {% if store.branches|length > 1 %}style="display: none;"{% endif %}>

    {% for branch in store.branches %}
        <li class="{% if product_detail %}list-item{% else %}radio-button-item{% endif %}" data-store="branch-item-{{ branch.code }}">

            {# If cart use radiobutton #}

            {% if not product_detail %}

                <label class="js-shipping-radio js-branch-radio radio-button" data-loop="branch-radio-{{loop.index}}">
                    <input 
                    class="js-branch-method {% if cart.shipping_data.code == branch.code %} js-selected-shipping-method {% endif %} shipping-method" 
                    data-price="0" 
                    {% if cart.shipping_data.code == branch.code %}checked{% endif %} type="radio" 
                    value="{{branch.code}}" 
                    data-name="{{ branch.name }} - {{ branch.extra }}"
                    data-code="{{branch.code}}" 
                    data-cost="{{ 'Gratis' | translate }}"
                    name="option" 
                    style="display:none">
                    <div class="radio-button-content">
                        <div class="radio-button-icons-container">
                            <span class="radio-button-icons">
                                <span class="radio-button-icon unchecked"></span>
                                <span class="radio-button-icon checked"></span>
                            </span>
                        </div>
                        <div class="radio-button-label">
            {% endif %}
                            <div class="{% if product_detail %}list-item-content{% else %}radio-button-text{% endif %} row"> 
                                <div class="col-xs-8 font-small p-right-none">
                                    <div class="opacity-80">
                                        {{ branch.name }} <span class="m-left-quarter">{{ branch.extra }}</span>
                                    </div>
                                    
                                </div>
                                <div class="col-xs-4 text-right p-right-none">
                                    <strong class="shipping-price d-inline-block font-medium font-bold text-primary">
                                        {{ 'Gratis' | translate }}
                                    </strong>
                                </div>
                            </div>
            {% if not product_detail %}
                        </div>
                    </div>
                </label>
            {% endif %}
        </li>
    {% endfor %}
</ul>