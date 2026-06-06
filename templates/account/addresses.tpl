<div class="container">
    <div class="title-container" data-store="page-title">
        {% snipplet "breadcrumbs.tpl" %}
        <h1 class="title">{{ "Mis direcciones" | translate }}</h1>
    </div>
    <div class="row visible-when-content-ready">
        {% for address in customer.addresses %}

            
            {% if loop.first %}
                {# User addresses listed - Main Address #}
                <div class="col-md-4 m-bottom">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <strong>{{ 'Principal' | translate }}</strong>
                        </div>
                        <div class="panel-body p-none font-small">

            {% elseif loop.index == 2 %}
                {# User addresses listed - Other Addresses #}
                <div class="col-md-4 m-bottom">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <strong>{{ 'Otras direcciones' | translate }}</strong>
                        </div>
                        <div class="panel-body p-none font-small">

            {% endif %}

                            <div class="panel-item">
                                <p>{{ address | format_address }}</p>
                                {{ 'Editar >' | translate | a_tag(store.customer_address_url(address), '', 'text-primary font-small') }}
                                {% if loop.first %} 
                                    <a class="btn btn-primary btn-small full-width m-top" href="{{ store.customer_new_address_url }}"> {{ 'Agregar una nueva dirección' | translate }}</a>
                                {% endif %}
                            </div>

            {% if loop.first %}
                        </div>
                    </div>
                </div>
            {% elseif loop.last %}
                        </div>
                    </div>
                </div>
            {% endif %}
        {% endfor %}
    </div>
</div>
