<div class="container">
    <div class="title-container" data-store="page-title">
        {% snipplet "breadcrumbs.tpl" %}
        <h1 class="title">{{ 'Orden {1}' | translate(order.number) }}</h1>
    </div>
    <div class="row visible-when-content-ready" data-store="account-order-detail-{{ order.id }}">
        <div class="col-md-3 m-bottom">
            {% if log_entry %}
                <h4 class="h5-xs">{{ 'Estado actual del envío' | translate }}:</h4>{{ log_entry }}
            {% endif %}
            <div class="panel panel-default">
                <div class="panel-heading">
                    <strong>{{ 'Detalles' | translate }}</strong>
                </div>
                <div class="panel-body p-none font-small">
                    <div class="panel-item">
                        {% include "snipplets/svg/calendar-alt.tpl" with {fa_custom_class: "svg-inline--fa fa-w-20 svg-text-fill m-right-quarter"} %}
                        {{'Fecha' | translate}}: <strong>{{ order.date | i18n_date('%d/%m/%Y') }}</strong>
                    </div>
                    <div class="panel-item">
                        {% include "snipplets/svg/info-circle.tpl" with {fa_custom_class: "svg-inline--fa fa-w-20 svg-text-fill m-right-quarter"} %}
                        {{'Estado' | translate}}: <strong>{{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : 'Cancelada')) | translate }}</strong>
                    </div>
                    <div class="panel-item">
                        {% include "snipplets/svg/receipt.tpl" with {fa_custom_class: "svg-inline--fa fa-w-20 svg-text-fill m-right-quarter"} %}
                        {{'Pago' | translate}}: <strong>{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</strong>
                    </div>
                    <div class="panel-item">
                        {% include "snipplets/svg/money-bill.tpl" with {fa_custom_class: "svg-inline--fa fa-w-20 svg-text-fill m-right-quarter"} %}
                        {{'Medio de pago' | translate}}: <strong>{{ order.payment_name }}</strong>
                    </div>
                    {% if order.address %}
                        <div class="panel-item">
                            {% include "snipplets/svg/truck.tpl" with {fa_custom_class: "svg-inline--fa fa-w-20 svg-text-fill m-right-quarter"} %}
                            {{'Envío' | translate}}: <strong>{{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}</strong>
                        </div>
                        <div class="panel-item">
                            {% include "snipplets/svg/map-marker.tpl" with {fa_custom_class: "svg-inline--fa fa-w-20 svg-text-fill m-right-quarter"} %}
                            {{ 'Dirección de envío' | translate }}:
                            <div class="m-left p-left-quarter">
                                {{ order.address | format_address }}
                            </div>
                        </div>
                    {% endif %}
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="order-detail">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-7">
                                <strong>{{ 'Productos' | translate }}</strong>
                            </div>
                            <div class="col-md-5">
                                <div class="row text-center hidden-xs">
                                    <div class="col-md-4">
                                        <strong>{{ 'Precio' | translate }}</strong>
                                    </div>
                                    <div class="col-md-4">
                                        <strong>{{ 'Cantidad' | translate }}</strong>
                                    </div>
                                    <div class="col-md-4">
                                        <strong>{{ 'Total' | translate }}</strong>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body p-none">
                        {% for item in order.items %}
                            <div class="panel-item">
                                <div class="row">
                                    <div class="col-xs-5 col-md-2">
                                        <div class="card-img-square-container">
                                            {{ item.featured_image | product_image_url("small") | img_tag(item.featured_image.alt, {class: 'card-img-square'}) }}
                                        </div>
                                    </div>
                                    <div class="col-xs-7 col-md-10">
                                        <div class="row">
                                            <div class="col-xs-12 col-md-6 p-top-double p-top-half-xs">
                                                {{ item.name }}
                                            </div>
                                            <div class="col-xs-12 col-md-2 p-top-double p-top-none-xs text-center text-left-xs hidden-xs">
                                                {{ item.unit_price | money }}
                                            </div>
                                            <div class="col-xs-12 col-md-2 p-top-double p-top-none-xs text-center text-left-xs">
                                                x{{ item.quantity }}
                                            </div>
                                            <div class="col-xs-12 col-md-2 p-top-double p-top-none-xs text-center text-left-xs">
                                                <strong>{{ item.subtotal | money }}</strong>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>     
                        {% endfor %}
                    </div>
                </div>
                <div class="p-top-half p-right text-right">
                    {% if order.shipping or order.discount %}
                        <p class="cart-subtotal">
                            <strong>{{ 'Subtotal' | translate }}: {{ order.subtotal | money }}</strong>
                        </p>
                    {% endif %}
                    {% if order.show_shipping_price %}                
                        <p>
                            {{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:
                            {% if order.shipping == 0  %}
                                {{ 'Gratis' | translate }}
                            {% else %}
                                {{ order.shipping | money }}
                            {% endif %}
                        </p>
                    {% else %}
                        <p>
                            {{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:
                            {{ 'A convenir' | translate }}
                        </p>
                    {% endif %}
                    {% if order.discount %}
                        <p>
                           {{ 'Descuento ({1})' | translate(order.coupon) }}:
                            - {{ order.discount | money }}
                        </p>
                    {% endif %}  
                    <p class="cart-total m-none">
                        <strong>{{ 'Total' | translate }}: {{ order.total | money }}</strong>
                    </p>
                </div>
                {% if order.pending %}
                    <div class="row">
                        <div class="col-md-6 col-md-offset-6 text-right">
                            <a class="btn btn-primary full-width m-top m-bottom" href="{{ order.checkout_url | add_param('ref', 'orders_details') }}" target="_blank">{{'Realizar pago' | translate}}</a>
                        </div>
                    </div>
                {% endif %}
            </div>  
        </div>
    </div>
</div>
