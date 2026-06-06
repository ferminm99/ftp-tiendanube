<div class="container">
    <div class="title-container" data-store="page-title">
        {% snipplet "breadcrumbs.tpl" %}
        <h1 class="title">{{ "Iniciar sesión" | translate }}</h1>
    </div>
    {# Page preloader #}
    <div class="page-loading-icon-container full-width hidden-when-content-ready">
        <div class="page-loading-icon svg-primary-fill opacity-80 rotate">
            {% include "snipplets/svg/spinner.tpl" %}
        </div>
    </div>
    <div class="row visible-when-content-ready">
        <div class="font-medium col-sm-6 col-sm-offset-3">
            {# Account validation #}
            {% if account_validation == 'success' %}
                {% set success_message = 'our_components.forms.login.account_validation.' ~ (customer_has_price_table ? 'success_with_price_table' : 'success') %}
                <div class="js-account-validation-success alert alert-success m-bottom">
                  <p>{{ success_message | tt }}</p>
                </div>
            {% elseif account_validation == 'expired' %}
                <div class="js-account-validation-expired alert alert-danger m-bottom">
                  <p>{{ "Tu link de validación expiró." | translate }}</p>
                </div>
                <div class="m-bottom-double text-center">
                  <span class="js-resend-validation-link btn-link btn-link-small-extra">{{ "Enviar link de nuevo >" | translate }}</span>
                </div>
            {% elseif account_validation == 'pending' %}
                <div class="js-account-validation-pending alert alert-danger m-bottom">
                  <p>{{ "Validá tu email usando el link que te enviamos a <strong>{1}</strong> cuando creaste tu cuenta." | t(customer_email) }}</p>
                </div>
                <div class="text-center font-small m-bottom">
                  <p class="font-small">{{ "¿No lo encontraste?" | translate }} <span class="js-resend-validation-link btn-link btn-link-small-extra">{{ "Enviar link de nuevo" | translate }}</span></p>
                </div>
            {% endif %}
            <div class="js-resend-validation-success alert alert-success" style="display:none">
                <p>{{ "¡El link fue enviado correctamente!" | translate }}</p>
            </div>
            <div class="js-resend-validation-error alert alert-danger" style="display:none">
                <p>{{ "No pudimos enviar el email, intentalo de nuevo en unos minutos." | translate }}</p>
            </div>
            <div class="js-too-many-attempts alert alert-danger" style="display:none">
                <p>
                    {{ "Superaste la cantidad de intentos permitidos. <br> Volvé a probar en" | translate }}
                    <span class="js-too-many-attempts-countdown"></span>
                </p>
            </div>
        </div>
        <form id="login-form" action="" method="post" class="col-sm-6 col-sm-offset-3 m-bottom" data-store="account-login">
            {% if result.invalid %}
                <div class="alert alert-danger">{{ 'Estos datos no son correctos. ¿Chequeaste que estén bien escritos?' | translate }}</div>
            {% endif %}
            <div class="form-group">
                <label for="email">{{ 'Email' | translate }}</label>
                <input class="form-control" autocorrect="off" autocapitalize="off" type="email" name="email" value="{{ result.email }}" required />
            </div>
            <div class="form-group">
                <label for="password">{{ 'Contraseña' | translate }}</label>
                <div class="p-relative">
                    <input class="js-password-input form-control" type="password" name="password" autocomplete="off" required />
                    <a aria-label="{{ 'Ver contraseña' | translate }}" class="js-password-view btn form-toggle-eye p-absolute">
                        <span class="js-eye-open" style="display: none;">
                            {% include "snipplets/svg/eye.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %}
                        </span>
                        <span class="js-eye-closed">
                            {% include "snipplets/svg/eye-closed.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %}
                        </span>
                    </a>
                </div>
                <div class="help-block"><a href="{{ store.customer_reset_password_url }}">{{ '¿Olvidaste tu contraseña?' | translate }}</a></div>
            </div>
            <input class="btn btn-primary full-width-xs pull-right m-bottom" type="submit" value="{{ 'Iniciar sesión' | translate }}" />
            {% if 'mandatory' not in store.customer_accounts %}
                <p class="m-bottom full-width-container text-right text-center-xs"> {{ "¿No tenés cuenta?" | translate }} {{ "Crear cuenta" | translate | a_tag(store.customer_register_url, '') }}</p>
            {% endif %}
        </form>
    </div>
</div>
