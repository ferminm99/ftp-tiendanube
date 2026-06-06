{% if store.country == 'AR' and template == 'home' %}
    <div class="js-notification js-login-tooltip {% if desktop %}js-login-tooltip-desktop fade-in-vertical tooltip-left hidden-xs{% endif %} tooltip tooltip-bottom {% if mobile %}m-top-half{% else %}m-top-quarter{% endif %}" style="display: none;">
        <span class="tooltip-arrow tooltip-arrow-up m-right{% if desktop %}-half{% endif %}"></span>
        <a href="#quick-login" data-toggle="modal" class="js-trigger-modal-zindex-top">
            {{ '<strong>¡Comprá más rápido</strong> y seguí tus pedidos!' | translate }}
        </a>
        <a href="#" class="js-tooltip-close js-dismiss-quicklogin pull-right p-left-half p-right-half">
            {% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa svg-icon-text fa-lg"} %}
        </a>
    </div>
{% endif %} 