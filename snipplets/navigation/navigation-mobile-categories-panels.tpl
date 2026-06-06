<ul id="js-category-{{ category.id }}" class="js-mobile-nav-subcategories-panel mobile-nav-subcategories-panel modal-xs modal-xs-right" style="display:none;">
    <div class="modal-xs-dialog">
        <a class="js-go-back-mobile-categories modal-xs-header" href="#">
            <span class="modal-xs-header-icon modal-xs-right-header-icon">
                {% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "svg-inline--fa fa-2x"} %}
            </span>
            <span class="modal-xs-header-text modal-xs-right-header-text">{{ category.name }}</span>
        </a>
        <div class="modal-xs-body modal-xs-body-list">
            <li class="mobile-nav-list-item">
                <a class="modal-xs-list-item modal-xs-list-subtitle" href="{{ category.url }}">
                {{ "Ver toda esta categoría" | translate }}
                </a>
            </li>
            {% snipplet "navigation/navigation-mobile-categories.tpl" with categories = category.subcategories %}
        </div>
    </div>
</ul>
{% for subcategory in category.subcategories %}
    {% snipplet "navigation/navigation-mobile-categories-panels.tpl" with category = subcategory %}
{% endfor %}
