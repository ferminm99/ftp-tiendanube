<div class="container">
    <div class="title-container" data-store="page-title">
        {% snipplet "breadcrumbs.tpl" %}
        <h1 class="title">{{ "Crear cuenta" | translate }}</h1>
    </div>
    <div class="page-loading-icon-container full-width hidden-when-content-ready">
        <div class="page-loading-icon svg-primary-fill opacity-80 rotate">
            {% include "snipplets/svg/spinner.tpl" %}
        </div>
    </div>
    <div class="row visible-when-content-ready">
        <div class="col-sm-6 col-sm-offset-3 m-bottom">

            {{ component('nubesdk-slot', { type: "before_register_form" }) }}

            <p class="font-medium text-center m-bottom-double">{{ 'Comprá más rápido y llevá el control de tus pedidos, <strong>¡en un solo lugar!</strong>'| translate }}</p>

            {# Account validation #}
            {% if account_validation == 'pending' %}

                <div class="js-account-validation-pending alert alert-primary p-all text-center">
                    {% include "snipplets/svg/envelope.tpl" with {fa_custom_class: "svg-medium m-bottom-half svg-secondary-fill"} %}
                    <h4 class="weight-strong m-top-half">{{ "¡Estás a un paso de crear tu cuenta!" | translate }}</h4>
                    <p class="font-small m-bottom-half">{{ "Te enviamos un link a <strong>{1}</strong> para que valides tu email." | t(customer_email) }} </p>
                </div>
                <div class="m-bottom font-small text-center">
                    <p>{{ "¿Todavía no lo recibiste?" | translate }} <span class="js-resend-validation-link btn-link btn-link-small-extra">{{ "Enviar link de nuevo" | translate }}</span></p>
                </div>
                <div class="js-resend-validation-success alert alert-success" style="display:none">
                    <p>{{ "¡El link fue enviado correctamente!" | translate }}</p>
                </div>
                <div class="js-resend-validation-error alert alert-danger" style="display:none">
                    <p>{{ "No pudimos enviar el email, intentalo de nuevo en unos minutos." | translate }}</p>
                </div>

            {% else %}
                <form id="login-form" action="" method="post" data-store="account-register">
                    <div class="form-group">
                        <label for="name">{{ 'Nombre' | translate }}</label>
                        <input class="form-control" type="text" name="name" id="name" value="{{ result.name }}" placeholder="{{ 'ej.: María Perez' | translate }}"/>
                    </div>
                    {% if result.errors.name %}
                        <div class="notification-danger">
                            {% include "snipplets/svg/exclamation-circle.tpl" with {fa_custom_class: "svg-inline--fa"} %}
                            {{ 'Usamos tu nombre para identificar tus pedidos.' | translate }}
                        </div>
                    {% endif %}
                    <div class="form-group">
                        <label for="email">{{ 'Email' | translate }}</label>
                        <input class="form-control" autocorrect="off" autocapitalize="off" type="email" name="email" id="email" value="{{ result.email }}" placeholder="{{ 'ej.: tunombre@email.com' | translate }}"/>
                    </div>
                    {% if result.errors.email == 'exists' %}
                        <div class="notification-danger">
                            {% include "snipplets/svg/exclamation-circle.tpl" with {fa_custom_class: "svg-inline--fa"} %}
                            {{ 'Encontramos otra cuenta que ya usa este email. Intentá usando otro o iniciá sesión.' | translate }}
                        </div>
                    {% elseif result.errors.email %}
                        <div class="notification-danger">
                            {% include "snipplets/svg/exclamation-circle.tpl" with {fa_custom_class: "svg-inline--fa"} %}
                            {{ 'Necesitamos un email válido para crear tu cuenta.' | translate }}
                        </div>
                    {% endif %}
                    <div class="form-group">
                        <label for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                        <input class="form-control" type="text" name="phone" id="phone" value="{{ result.phone }}" placeholder="{{ 'ej.: 1123445567' | translate }}"/>
                    </div>
                    <div class="form-group">
                        <label for="password">{{ 'Contraseña' | translate }}</label>
                        <div class="p-relative">
                            <input class="js-password-input form-control" type="password" name="password" id="password" autocomplete="off"/>
                            <a aria-label="{{ 'Ver contraseña' | translate }}" class="js-password-view btn form-toggle-eye p-absolute">
                                <span class="js-eye-open" style="display: none;">
                                    {% include "snipplets/svg/eye.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %}
                                </span>
                                <span class="js-eye-closed">
                                    {% include "snipplets/svg/eye-closed.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %}
                                </span>
                            </a>
                        </div>
                    </div>
                    {% if result.errors.password == 'required' %}
                        <div class="notification-danger">
                            {% include "snipplets/svg/exclamation-circle.tpl" with {fa_custom_class: "svg-inline--fa"} %}
                            {{ 'Necesitamos una contraseña para registrarte.' | translate }}
                        </div>
                    {% endif %}
                    <div class="form-group">
                        <label for="password_confirmation">{{ 'Confirmar Contraseña' | translate }}</label>
                        <div class="p-relative">
                            <input class="js-password-input form-control" type="password" name="password_confirmation" id="password_confirmation" autocomplete="off"/>
                            <a aria-label="{{ 'Ver contraseña' | translate }}" class="js-password-view btn form-toggle-eye p-absolute">
                                <span class="js-eye-open" style="display: none;">
                                    {% include "snipplets/svg/eye.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %}
                                </span>
                                <span class="js-eye-closed">
                                    {% include "snipplets/svg/eye-closed.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %}
                                </span>
                            </a>
                        </div>
                    </div>
                    {% if result.errors.password == 'confirmation' %}
                        <div class="notification-danger">
                            {% include "snipplets/svg/exclamation-circle.tpl" with {fa_custom_class: "svg-inline--fa"} %}
                            {{ 'Las contraseñas que escribiste no coinciden. Chequeá que sean iguales entre sí.' | translate }}
                        </div>
                    {% endif %}
                    {# Google reCAPTCHA #}
                    <div class="g-recaptcha" data-sitekey="{{recaptchaSiteKey}}" data-callback="recaptchaCallback"></div>
                    <input class="js-recaptcha-button btn btn-primary full-width-xs pull-right" type="submit" value="{{ 'Crear cuenta' | translate }}" disabled/>
                    <p class="m-top m-bottom full-width-container text-right text-center-xs"> {{ '¿Ya tenés una cuenta?' | translate }} {{ "Iniciá sesión" | translate | a_tag(store.customer_login_url) }}
                    </p>
                </form>
            {% endif %}

            <div class="full-width-container">
                {{ component('nubesdk-slot', { type: "after_register_form" }) }}
            </div>

        </div>
    </div>
</div>
