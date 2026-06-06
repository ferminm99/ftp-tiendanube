{% if template == 'home' or template == 'product' %}

    {# Quick login form #}

    <div id="quick-login" class="js-modal-xs-centered modal modal-small modal-xs modal-xs-centered fade modal-zindex-top" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="js-close-modal-zindex-top" data-dismiss="modal" aria-hidden="true">
                    <span class="btn btn-floating pull-right">
                        {% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa fa-lg pull-left m-none"} %}
                    </span>
                </div>
                <div class="modal-body">
                    <div class="text-center">
                        <h4 class="h5-xs m-top m-right m-bottom-half m-left p-right-quarter">{{ '¡Que bueno verte de nuevo!' | translate }}</h4>
                        <p>{{ 'Iniciá sesión para comprar más rápido y ver todos tus pedidos.' | translate }}</p>
                    </div>
                    <form id="login-form" action="/account/login/" method="post" class="m-top" data-store="account-login">
                        <input type="hidden" class="hidden" name="from" value="quick-login">
                        <input type="hidden" class="hidden" autocorrect="off" autocapitalize="off" name="redirect_to" value="{{ current_url }}">
                        <div class="form-group">
                            <label for="email">{{ 'Email' | translate }}</label>
                            <input class="form-control" autocorrect="off" autocapitalize="off" type="email" name="email" value="{{ result.email }}" />
                        </div>
                        <div class="form-group">
                            <label for="password">{{ 'Contraseña' | translate }}</label>
                            <div class="p-relative">
                                <input class="js-password-input form-control" type="password" name="password" autocomplete="off"/>
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
                        <input class="btn btn-primary full-width-xs pull-right" type="submit" value="{{ 'Iniciar sesión' | translate }}" />
                    </form>
                </div>
            </div>
        </div>
    </div>
{% endif %}
