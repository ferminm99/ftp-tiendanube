<div class="js-mobile-nav js-search-container mobile-nav">
    <div class="p-relative" data-store="head-mobile">
        <div class="js-mobile-first-row mobile-nav-first-row">           
            <div class="js-toggle-hamburger-panel btn-hamburger text-center visible-phone pull-left" aria-label="{{ 'Menú' | translate }}" data-component="menu-button">
                <div class="mobile-nav-first-row-icon p-relative">
                    {% include "snipplets/svg/hamburger.tpl" %}
                    {% if store.country == 'AR' and template == 'home' %}
                        <span class="js-quick-login-badge badge badge-primary badge-small badge-top bounce" style="display: none;"></span>
                    {% endif %}
                </div>
            </div>
            <div class="mobile-nav-title">
                {% snipplet "mobile-page-title.tpl" %}
            </div>
            <div class="js-toggle-mobile-search js-toggle-mobile-search-open mobile-search-btn visible-phone text-center pull-right">
                <div class="mobile-nav-first-row-icon pull-right" aria-label="{{ 'Buscador' | translate }}">
                    {% include "snipplets/svg/search.tpl" %}
                </div>
            </div>
        </div>
        <div class="js-mobile-search-row mobile-nav-search-row">
            <form action="{{ store.search_url }}" method="get" class="js-search-form mobile-search-form">
                <div class="mobile-search-input-container">
                    <span class="js-search-back-btn js-toggle-mobile-search mobile-search-input-back m-top-half p-left-half">
                        {% include "snipplets/svg/chevron-left.tpl" with {fa_custom_class: "svg-inline--fa fa-lg mobile-search-input-icon svg-text-fill"} %}
                    </span>
                    <input class="h6 js-mobile-search-input js-search-input mobile-search-input" autocomplete="off" type="search" name="q" placeholder="{{ 'Buscar' | translate }}" aria-label="{{ 'Buscador' | translate }}"/>
                    <button type="submit" class="mobile-search-input-submit" value="" aria-label="{{ 'Buscar' | translate }}">
                        {% include "snipplets/svg/search.tpl" with {fa_custom_class: "svg-inline--fa fa-lg mobile-search-input-icon svg-text-fill"} %}
                    </button>
                </div>
            </form>
        </div>
        <div class="js-mobile-nav-second-row mobile-nav-second-row container-fluid">
            {% snipplet "navigation/navigation-mobile-tabs.tpl" %}
        </div>
        <div class="js-mobile-nav-arrow mobile-nav-arrow-up" style="display:none;">
            {% include "snipplets/svg/caret-up.tpl" with {fa_custom_class: "svg-inline--fa fa-2x"} %}
        </div>
    </div>
</div>
<div class="js-search-suggest search-suggest">
    {# AJAX container for search suggestions #}
</div>
{# Categories list for mobile #}
<div class="js-categories-mobile-container" style="display:none;">
    <ul class="js-categories-mobile-tabs modal-xs mobile-nav-categories-container">
        <li>
            <a class="modal-xs-list-item modal-xs-list-subtitle"  href="{{ store.products_url }}">
                {{ 'Ver todos los productos' | translate }}
            </a>
        </li>
        {% snipplet "navigation/navigation-mobile-categories.tpl" %}
    </ul>
    {% for category in categories %}
        {% snipplet "navigation/navigation-mobile-categories-panels.tpl" %}
    {% endfor %}
</div>
