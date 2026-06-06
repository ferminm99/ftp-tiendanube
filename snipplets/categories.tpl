{% if not mobile %}
    <div class="full-width-container m-bottom-double">
        {% include "snipplets/filters.tpl" with {applied_filters: true} %}

        {% if parent_category and parent_category.id!=0 %}
            <a href="{{ parent_category.url }}" title="{{ parent_category.name }}" class="category-back">
                {% include "snipplets/svg/chevron-left.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %}
                {{ parent_category.name }}
            </a>
        {% endif %}
{% endif %}
        {% if filter_categories %}
            <div class="{% if mobile %}container-with-border full-width-container{% else %}hidden-xs{% endif %}">
                {% if mobile %}
                   <p class="font-medium m-bottom p-bottom-quarter weight-strong">{{ "Categorías" | translate }}</p>
                {% else %}
                   <h4 class="m-bottom">{{ "Categorías" | translate }}</h4>
                {% endif %}
                <ul class="list-unstyled font-medium">
                    {% for category in filter_categories %}
                        <li class="{% if mobile %}d-inline-block{% else %}m-bottom-half{% endif %}" data-item="{{ loop.index }}"><a href="{{ category.url }}" title="{{ category.name }}" {% if mobile %}class="pill-link pill-link-small d-block"{% endif %}>{{ category.name }}</a></li>
                        {% if loop.index == 8 and filter_categories | length > 8 %}
                            <div class="js-accordion-container" style="display: none;">
                        {% endif %}
                        {% if loop.last and filter_categories | length > 8 %}
                            </div>
                            <a href="#" class="js-accordion-toggle btn-link btn-link-primary btn-link-small m-top-half m-bottom-half full-width-container">
                                <span class="js-accordion-toggle-inactive">
                                    {{ 'Ver más' | translate }}
                                </span>
                               <span class="js-accordion-toggle-active" style="display: none;">
                                    {{ 'Ver menos' | translate }}
                                </span>
                            </a>
                        {% endif %}
                    {% endfor %}
                </ul>
            </div>
        {% endif %}
{% if not mobile %}
    </div>
{% endif %}