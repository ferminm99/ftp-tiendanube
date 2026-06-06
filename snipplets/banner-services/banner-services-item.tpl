<div class="swiper-slide">
    <div class="service-item-container col-xs-12 col-sm-{{ 12 / num_banners_services }} has-{{ num_banners_services }}-banner{% if num_banners_services > 1 %}s{% endif %}">
        <div class="js-service-item service-item {% if num_banners_services == 1 %} p-bottom-half-xs {% endif %}">
            {% if banner_services_url %}
                <a class="service-link" href="{{ banner_services_url | setting_url }}">
            {% endif %}
            <span class="service-icon">
                {% if banner_services_icon == 'shipping' %}
                    {% include "snipplets/svg/truck.tpl" with {fa_custom_class: "svg-text-fill"} %}
                {% elseif banner_services_icon == 'card' %}
                    {% include "snipplets/svg/credit-card.tpl" with {fa_custom_class: "svg-text-fill"} %}
                {% elseif banner_services_icon == 'security' %}
                    {% include "snipplets/svg/lock.tpl" with {fa_custom_class: "svg-text-fill"} %}
                {% elseif banner_services_icon == 'returns' %}
                    {% include "snipplets/svg/refresh.tpl" with {fa_custom_class: "svg-text-fill"} %}
                {% elseif banner_services_icon == 'whatsapp' %}
                    {% include "snipplets/svg/whatsapp.tpl" with {fa_custom_class: "svg-text-fill service-icon-big"} %}
                {% elseif banner_services_icon == 'promotions' %}
                    {% include "snipplets/svg/tag.tpl" with {fa_custom_class: "svg-text-fill"} %}
                {% elseif banner_services_icon == 'hand' %}
                    {% include "snipplets/svg/clean-hands.tpl" with {fa_custom_class: "svg-text-fill"} %}
                {% elseif banner_services_icon == 'home' %}
                    {% include "snipplets/svg/stay-home.tpl" with {fa_custom_class: "svg-text-fill"} %}
                {% elseif banner_services_icon == 'office' %}
                    {% include "snipplets/svg/home-office.tpl" with {fa_custom_class: "svg-text-fill"} %}
                {% elseif banner_services_icon == 'cash' %}
                    {% include "snipplets/svg/dollar.tpl" with {fa_custom_class: "svg-text-fill"} %}
                {% endif %}
            </span>
            <h3 class="service-title">{{ banner_services_title }}</h3>
            <p class="service-text">{{ banner_services_description }}</p>
            {% if banner_services_url %}
                </a>
            {% endif %}
        </div>
    </div>
</div>