{% set is_account_activation = action == 'account_activation' %}
<div class="container">
    <div class="title-container" data-store="page-title">
        <h1 class="title">{{ (is_account_activation ? 'Activar cuenta' : 'Cambiar Contraseña') | translate }}</h1>
    </div>
    <div class="row visible-when-content-ready">
        {% if link_expired %}

            {% set contact_links = store.whatsapp or store.phone or store.email %}
            
            <div class="m-bottom text-center">
                {% if is_account_activation %}
                    <div class="weight-strong">{{ 'El link para activar tu cuenta expiró' | translate }}</div>
                    <div>{{ 'Contactanos para que te enviemos uno nuevo.' | translate }}</div>
                {% else %}
                    <div class="m-bottom-quarter weight-strong">{{ 'El link para cambiar tu contraseña expiró' | translate }}</div>
                    <div class="m-bottom">{{ 'Ingresá tu email para recibir uno nuevo.' | translate }}</div>
                    <a href="{{ store.customer_reset_password_url }}" class="btn-link-primary" >{{ 'Ingresar email' | translate }}</a>
                {% endif %}
            </div>

            {% if contact_links and is_account_activation %}
                <ul class="text-center list-unstyled m-bottom">
                    {% if store.whatsapp %}
                        <li class="m-bottom-half">{% include "snipplets/svg/whatsapp.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill m-right-quarter"} %}<a href="{{ store.whatsapp }}">{{ store.whatsapp |trim('https://wa.me/') }}</a></li>
                    {% endif %}
                    {% if store.phone %}
                        <li class="m-bottom-half">
                            {% include "snipplets/svg/phone.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill m-right-quarter"} %}
                            {{ store.phone }}
                        </li>
                    {% endif %}
                    {% if store.email %}
                        <li class="m-bottom-half">
                            {% include "snipplets/svg/envelope.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill m-right-quarter"} %}
                            {{ store.email | mailto }}
                        </li>
                    {% endif %}
                </ul>
            {% endif %}
        {% else %}
            <form action="" method="post" class="col-sm-6 col-sm-offset-3 m-bottom">
                {% if failure %}
                    <div class="alert alert-danger">{{ 'Las contraseñas que escribiste no coinciden. Chequeá que sean iguales entre sí.' | translate }}</div>
                {% endif %}
                <div class="form-group">
                    <label for="password">{{ 'Contraseña' | translate }}</label>
                    <input class="form-control" type="password" name="password" id="password" autocomplete="off"/>
                </div>
                <div class="form-group">
                    <label for="password_confirm">{{ 'Confirmar Contraseña' | translate }}</label>
                    <input class="form-control" type="password" name="password_confirm" id="password_confirm" autocomplete="off"/>
                </div>
                <input class="btn btn-secondary full-width-xs m-bottom pull-right" type="submit" value="{{ (is_account_activation ? 'Activar cuenta' : 'Cambiar contraseña')  | translate }}" />
            </form>
        {% endif %}
    </div>
</div>