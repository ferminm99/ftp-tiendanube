<div class="hamburger-panel-first-row">
    <span class="btn-hamburger-close full-width">
        <span class="js-toggle-hamburger-panel btn-hamburger-close-icon pull-right p-all-half">
            {% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa fa-lg"} %}
        </span>
    </span>
    {% if languages | length > 1 %}
        <div class="languages full-width pull-left p-left-quarter p-right-double border-box">
            {% for language in languages %}
                {% set class = language.active ? "" : "opacity-50" %}
                <a href="{{ language.url }}" class="{{ class }} pull-left p-all-half border-top-none-xs border-bottom-none-xs">
                    <img class="lazyload" src="{{ 'img/empty-placeholder.png' | static_url }}" data-src="{{ language.country | flag_url }}" alt="{{ language.name }}" />
                </a>
            {% endfor %}
        </div>
    {% endif %}
    <ul class="hamburger-panel-list list-unstyled {% if not customer %}list-inline m-bottom{% else %}m-none{% endif %} p-left-quarter m-top-half" data-store="account-links">
        {% if not customer %}
            {% include "snipplets/svg/user-alt.tpl" with {fa_custom_class: "svg-inline--fa font-medium m-right-quarter p-left-half"} %}
            {% if 'mandatory' not in store.customer_accounts %}
                <li class="border-right p-right-half">
                    {{ "Crear cuenta" | translate | a_tag(store.customer_register_url, '', 'hamburger-panel-link border-none') }}
                </li>
            {% endif %}
            <li class="p-relative">
                {{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, '', 'js-login hamburger-panel-link border-none') }}
                {% include "snipplets/tooltip-login.tpl" with {mobile: "true"} %}
            </li>
        {% else %}
            <li class="hamburger-panel-item p-right-half p-left-quarter m-left-quarter m-bottom-half m-top-half">
                {% include "snipplets/svg/user-alt.tpl" with {fa_custom_class: "svg-inline--fa font-medium m-right-quarter"} %}
                {% set customer_short_name = customer.name|split(' ')|slice(0, 1)|join %} 
                <strong>{{ "¡Hola, {1}!" | t(customer_short_name) | a_tag(store.customer_home_url) }}</strong>
            </li>
            <li class="hamburger-panel-item p-left-half border-top">
                {{ "Mi cuenta" | translate | a_tag(store.customer_home_url, '', 'p-top-half p-bottom-half p-left-quarter full-width-container') }}
            </li>
            <li class="hamburger-panel-item p-left-half border-top">
                {{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, '', 'p-top-half p-bottom-half p-left-quarter full-width-container') }}
            </li>
        {% endif %}
    </ul>
</div>
<ul class="hamburger-panel-list" data-store="navigation" data-component="menu">
    {% snipplet "navigation/navigation-hamburger-list.tpl" %}
</ul>
