<div class="container">
    <div class="title-container" data-store="page-title">
        {% snipplet "breadcrumbs.tpl" %}
        <h1 class="title">{{ "Mi cuenta" | translate }}</h1>
    </div>
    <div class="row visible-when-content-ready">
        <div class="customer-box col-md-3 m-bottom">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-8">
                            <strong>{{ 'Mis datos' | translate }}</strong>
                        </div>
                        <div class="col-xs-4 text-right">
                            {{ 'Editar >' | translate | a_tag(store.customer_info_url, '', 'text-primary font-small') }}
                        </div>
                    </div>
                </div>
                <div class="panel-body p-none font-small">
                    <div class="panel-item">
                        {% include "snipplets/svg/user.tpl" with {fa_custom_class: "svg-inline--fa fa-w-20 svg-text-fill m-right-quarter"} %} <strong>{{customer.name}}</strong>
                    </div>
                    <div class="panel-item">
                        {% include "snipplets/svg/envelope.tpl" with {fa_custom_class: "svg-inline--fa fa-w-20 svg-text-fill m-right-quarter"} %} {{customer.email}}
                    </div>
                    {% if customer.cpf_cnpj %}
                        <div class="panel-item">
                            {% include "snipplets/svg/id-user.tpl" with {fa_custom_class: "svg-inline--fa fa-w-20 svg-text-fill m-right-quarter"} %} {{ customer.cpf_cnpj | format_id_number(customer.billing_country) }}
                        </div>
                    {% endif %}
                    {% if customer.business_name %}
                        <div class="panel-item p-left-double">
                            <strong>{{ 'Razón social' | translate }}:</strong> {{ customer.business_name }}
                        </div>
                    {% endif %}
                    {% if customer.trade_name %}
                        <div class="panel-item p-left-double">
                            <strong>{{ 'Nombre comercial' | translate }}:</strong> {{ customer.trade_name }}
                        </div>
                    {% endif %}
                    {% if customer.state_registration %}
                        <div class="panel-item p-left-double">
                            <strong>{{ 'Inscripción estatal' | translate }}:</strong> {{ customer.state_registration }}
                        </div>
                    {% endif %}
                    {% if customer.fiscal_regime %}
                        <div class="panel-item p-left-double">
                            <strong>{{ 'Régimen fiscal' | translate }}:</strong> {{ customer.fiscal_regime | format_fiscal_regime }}
                        </div>
                    {% endif %}
                    {% if customer.phone %}
                        <div class="panel-item">
                            {% include "snipplets/svg/phone.tpl" with {fa_custom_class: "svg-inline--fa fa-w-20 svg-text-fill m-right-quarter"} %} {{ customer.phone }}
                        </div>
                    {% endif %}
                </div>
            </div>
            {% if customer.default_address %}
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-8">
                                <strong>{{ 'Mis direcciones' | translate }}</strong>
                            </div>
                            <div class="col-xs-4 text-right">
                                {{ 'Editar >' | translate | a_tag(store.customer_addresses_url, '', 'text-primary font-small') }}
                            </div>
                        </div>
                    </div>
                    <div class="panel-body font-small">
                        {% include "snipplets/svg/map-marker.tpl" with {fa_custom_class: "svg-inline--fa fa-w-20 svg-text-fill m-right-quarter"} %} <strong>{{ 'Principal' | translate }}</strong>
                        <div class="m-left p-left-quarter">{{ customer.default_address | format_address_short }}</div>
                    </div>
                </div>
            {% endif %}
        </div>
        <div class="col-md-9">
            <div data-store="account-orders">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <strong>{{ 'Mis compras' | translate }}</strong>
                        {% if customer.ordersCount > 50 %}
                            <span class="font-small m-left-quarter">({{ 'últimas 50 órdenes' | translate }})</span>
                        {% endif %}
                    </div>
                    {% if customer.orders %}
                        <div class="panel-body p-none">
                            {% for order in customer.orders %} 
                                {% set add_checkout_link = order.pending %}
                                <div class="js-card-collapse panel-item" data-store="account-order-item-{{ order.id }}">
                                    <div class="row">
                                        <div class="col-xs-10">
                                            <a href="{{ store.customer_order_url(order) }}" class="text-primary">{{'Orden' | translate}} #{{order.number}}</a>
                                            <div class="font-small">{{ order.date | i18n_date('%d/%m/%Y') }}</div>
                                        </div>
                                        <div class="col-xs-2 text-right">
                                            <span class="js-card-collapse-toggle card-collapse-toggle d-inline-block m-top-quarter p-all-quarter{% if card_active %} active{% endif %}">
                                                {% include "snipplets/svg/chevron-down.tpl" with {'fa_custom_class' : 'svg-inline--fa svg-text-fill'} %}
                                            </span>
                                        </div>
                                    </div>
                                    <div class="js-card-body m-top"{% if not card_active %} style="display: none;"{% endif %}>
                                        <div class="row m-bottom-half">
                                            <div class="col-xs-5 col-md-2">
                                                <div class="card-img-square-container">
                                                    {% for item in order.items %}
                                                        {% if loop.first %} 
                                                            {% if loop.length > 1 %} 
                                                                <span class="card-img-pill label label-secondary p-all-quarter">{{ loop.length }} {{'Productos' | translate }}</span>
                                                            {% endif %}
                                                            {{ item.featured_image | product_image_url("") | img_tag(item.featured_image.alt, {class: 'card-img-square'}) }}
                                                        {% endif %}
                                                    {% endfor %}
                                                </div>
                                            </div>
                                            <div class="col-xs-7 col-md-6">
                                                <div class="row">
                                                    <div class="col-xs-12 col-md-6 p-top p-top-none-xs">
                                                        <div class="m-bottom-half font-small">
                                                            {{'Pago' | translate}}: <strong class="{{ order.payment_status }}">{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</strong>
                                                        </div>
                                                        <div class="m-bottom font-small">
                                                            {{'Envío' | translate}}: <strong>{{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}</strong>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-md-6 p-top p-top-none-xs">
                                                        <div class="m-bottom-quarter m-none-xs">
                                                            {{'Total' | translate}}: <strong>{{ order.total | money }}</strong>
                                                        </div>
                                                        <a class="text-primary font-small" href="{{ store.customer_order_url(order) }}">{{'Ver detalle >' | translate}}</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-md-4 m-top">
                                                {% if add_checkout_link %}
                                                    <a class="btn btn-primary btn-small full-width border-box" href="{{ order.checkout_url | add_param('ref', 'orders_list') }}" target="_blank">{{'Realizar pago' | translate}}</a>
                                                {% elseif order.order_status_url != null %}
                                                    <a class="btn btn-primary btn-small full-width border-box" href="{{ order.order_status_url | add_param('ref', 'orders_list') }}" target="_blank">{% if 'Correios' in order.shipping_name %}{{'Seguí la entrega' | translate}}{% else %}{{'Seguí tu orden' | translate}}{% endif %}</a>
                                                {% endif %}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {% endfor %}
                        </div>
                    {% else %}
                        <div class="panel-body text-center">
                            <p class="m-bottom-half">{{ '¡Hacé tu primera compra!' | translate }}</p>
                            {{ 'Ir a la tienda >' | translate | a_tag(store.url, '', 'text-primary font-small') }}
                        </div>
                    {% endif %}
                </div>
            </div>
        </div>
    </div>
</div>
