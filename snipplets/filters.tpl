{% if applied_filters %}

    {# Applied filters chips #}

    {% if has_applied_filters %}
        <div class="m-bottom-double m-bottom-xs container-with-border-top-xs">
            <h4 class="m-bottom p-bottom-half hidden-xs">{{ 'Filtrado por' | translate }}</h5>
            <strong class="visible-xs m-bottom-half">{{ 'Filtrado por' | translate }}</strong>
            {% for product_filter in product_filters %}
                {% for value in product_filter.values %}

                    {# List applied filters as tags #}
                    
                    {% if value.selected %}
                        <button class="js-remove-filter chip" data-filter-name="{{ product_filter.key }}" data-filter-value="{{ value.name }}" data-component="filter.pill-{{ product_filter.type }}" data-component-value="{{ product_filter.key }}">
                            {{ value.pill_label }}
                            {% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa chip-remove-icon"} %}
                        </button>
                    {% endif %}
                {% endfor %}
            {% endfor %}
            <a href="#" class="js-remove-all-filters btn-link btn-link-primary btn-link-small d-inline-block m-top-quater m-bottom " data-component="filter-delete">{{ 'Borrar filtros' | translate }}</a> 
        </div>
    {% endif %}
{% else %}
    {% if product_filters is not empty %}
        <div id="filters-column" class="m-top-half-xs" data-store="filters-nav">
            {% for product_filter in product_filters %}
                {% if product_filter.type == 'price' %}
                    {% if mobile %}
                        {% set btn_price_classes = 'btn-small' %}
                    {% else %}
                        {% set btn_price_classes = 'btn-circle btn-small btn-icon chevron' %}
                    {% endif %}

                    {{ component(
                        'price-filter',
                        {'group_class': 'container-with-border full-width-container', 'title_class': 'font-medium m-bottom weight-strong', 'button_class': 'btn btn-secondary ' ~ btn_price_classes }
                    ) }}

                {% else %}
                    {% if product_filter.has_products %}
                        <div class="container-with-border full-width-container" data-store="filters-group" data-component="list.filter-{{ product_filter.type }}" data-component-value="{{ product_filter.key }}">
                            <p class="font-medium m-bottom"><strong>{{product_filter.name}}</strong></p>
                            {% set index = 0 %}
                            {% for value in product_filter.values %}
                                {% if value.product_count > 0 %}
                                    {% set index = index + 1 %}
                                    <label class="js-filter-checkbox {% if not value.selected %}js-apply-filter{% else %}js-remove-filter{% endif %} checkbox-container" data-filter-name="{{ product_filter.key }}" data-filter-value="{{ value.name }}" data-component="filter.option" data-component-value="{{ value.name }}">
                                        <input type="checkbox" autocomplete='off' {% if value.selected %}checked{% endif %}>
                                        <span class="checkbox">
                                            {% if product_filter.type == 'color' and value.color_type == 'insta_color' %}
                                                <span class="checkbox-color" style="background-color: {{ value.color_hexa }};"></span>
                                                <span class="m-left">
                                            {% endif %}
                                                {{ value.name }} ({{ value.product_count }})
                                            {% if product_filter.type == 'color' and value.color_type == 'insta_color' %}
                                                </span>
                                            {% endif %}
                                        </span>
                                    </label>
                                    {% if index == 8 and product_filter.values_with_products > 8 %}
                                        <div class="js-accordion-container full-width-container" style="display: none;">
                                    {% endif %}
                                {% endif %}
                                {% if loop.last and product_filter.values_with_products > 8 %}
                                    </div>
                                    <a href="#" class="js-accordion-toggle btn-link btn-link-primary btn-link-small m-top-half m-bottom-half full-width-container">
                                        <span class="js-accordion-toggle-inactive">
                                            {{ 'Ver todos' | translate }}
                                        </span>
                                       <span class="js-accordion-toggle-active" style="display: none;">
                                            {{ 'Ver menos' | translate }}
                                        </span>
                                    </a>
                                {% endif %}
                            {% endfor %}
                        </div>
                    {% endif %}
                {% endif %}
            {% endfor %}
        </div>
    {% endif %}
{% endif %}
