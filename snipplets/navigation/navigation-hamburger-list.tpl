{% for item in navigation %}
    {% if not item.isRootCategory and not item.isHomePage  %}
        {% if item.subitems %}
            <li class="hamburger-panel-item item-with-subitems p-relative">
                <div class="js-hamburger-panel-toggle-accordion">
                    <a class="js-toggle-page-accordion hamburger-panel-link p-right-double" href="{{ item.url }}">
                        {{ item.name }}
                        <span class="hamburger-panel-arrow">
                            {% include "snipplets/svg/chevron-down.tpl" with {fa_custom_class: "svg-inline--fa fa-lg  hamburger-panel-arrow-icon"} %}
                        </span>
                    </a>
                 </div>
                <ul class="js-pages-accordion hamburger-panel-accordion hamburger-panel-list" style="display:none;">
                    {% if item.isCategory %}
                        <li class="hamburger-panel-item item-with-subitems" data-component="menu.item">
                            <a class="hamburger-panel-link" href="{{ item.url }}"><strong>{{ 'Ver todo en' | translate }} {{ item.name }}</strong></a>
                        </li>
                    {% endif %}
                    {% snipplet "navigation/navigation-hamburger-list.tpl" with navigation = item.subitems %}
                </ul>
            </li>
        {% else %}
             <li class="hamburger-panel-item" data-component="menu.item">
                <a class="hamburger-panel-link" href="{% if item.url %}{{ item.url }}{% else %}#{% endif %}">
                    {{ item.name }}
                </a>
             </li>
        {% endif %}
    {% endif %}
{% endfor %}
