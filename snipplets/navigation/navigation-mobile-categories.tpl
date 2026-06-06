{% for category in categories %}
    {# asking for subcategories without images #}
    {% if category.subcategories(false) %}
        <li class="mobile-nav-list-item">
            <span data-target="js-category-{{ category.id }}" class="js-open-mobile-subcategory modal-xs-list-item">
                {{ category.name }}
                <div class="link-module-icon-right modal-xs-list-icon">
                  {% include "snipplets/svg/angle-right.tpl" %}
                </div>  
            </span>
        </li>
    {% else %}
        <li class="mobile-nav-list-item">
            <a class="modal-xs-list-item" href="{{ category.url }}">
                {{ category.name }}
            </a>
        </li>
    {% endif %}
{% endfor %}
