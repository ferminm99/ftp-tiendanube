<div class="container">
    <div class="title-container" data-store="page-title">
        {% snipplet "breadcrumbs.tpl" %}
        <h1 class="title">{{ "Mi cuenta" | translate }}</h1>
    </div>
    <div class="row visible-when-content-ready">
        <form action="" method="post" class="col-sm-6 col-sm-offset-3 m-bottom">
            <div class="form-group">
                <label  for="name">{{ 'Nombre (alias)' | translate }}</label>
                <input class="form-control" type="text" name="name" id="name" value="{{ result.name | default(address.name) }}" placeholder="{{ 'ej.: Trabajo' | translate }}"/>
            </div>
            {% if result.errors.name %}
                <div class="alert alert-danger">{{ 'Necesitamos saber tu nombre para actualizar tu información.' | translate }}</div>
            {% endif %}

            {% if current_language.country == 'BR' %}
                {% set address_placeholder = 'ej.: Av. Pueyrredón' | translate %}
            {% else %}
                {% set address_placeholder = 'ej.: Av. Pueyrredón 1234, CABA' | translate %}
            {% endif %}
            
            <div class="form-group">
                <label for="address">{{ 'Dirección' | translate }}</label>
                <input class="form-control" type="text" name="address" id="address" value="{{ result.address | default(address.address) }}" placeholder="{{ address_placeholder | translate }}"/>
            </div>
            {% if result.errors.address %}
                <div class="alert alert-danger">{{ 'Necesitamos saber tu dirección para actualizar tu información.' | translate }}</div>
            {% endif %}
            {% if current_language.country == 'BR' %}
                <div class="form-group">
                    <label for="number">{{ 'Número' | translate }}</label>
                    <input class="form-control" type="text" name="number" id="number" value="{{ result.number | default(address.number) }}" placeholder="{{ 'ej.: 1234' | translate }}"/>
                </div>
                {% if result.errors.number %}
                    <div class="alert alert-danger">{{ 'Necesitamos saber tu número para actualizar tu información.' | translate }}</div>
                {% endif %}
                <div class="form-group">
                    <label for="floor">{{ 'Piso' | translate }}</label>
                    <input class="form-control" type="text" name="floor" id="floor" value="{{ result.floor | default(address.floor) }}" />
                </div>
                {% if result.errors.floor %}
                    <div class="alert alert-danger">{{ 'Necesitamos saber tu piso para actualizar tu información.' | translate }}</div>
                {% endif %}
                <div class="form-group">
                    <label for="locality">{{ 'Localidad' | translate }}</label>
                    <input class="form-control" type="text" name="locality" id="locality" value="{{ result.locality | default(address.locality) }}" placeholder="{{ 'ej.: CABA' | translate }}"/>
                </div>
                {% if result.errors.locality %}
                    <div class="alert alert-danger">{{ 'Necesitamos saber tu localidad para actualizar tu información.' | translate }}</div>
                {% endif %}
            {% endif %}
            <div class="form-group">
                <label for="zipcode">{{ 'Código Postal' | translate }}</label>
                <input class="form-control" type="text" name="zipcode" id="zipcode" value="{{ result.zipcode | default(address.zipcode) }}" placeholder="{{ 'ej.: 1429' | translate }}"/>
            </div>
            {% if result.errors.zipcode %}
                <div class="alert alert-danger">{{ 'Necesitamos saber tu código postal para actualizar tu información.' | translate }}</div>
            {% endif %}
            <div class="form-group">
                <label for="city">{{ 'Ciudad' | translate }}</label>
                <input class="form-control" type="text" name="city" id="city" value="{{ result.city | default(address.city) }}" placeholder="{{ 'ej.: CABA' | translate }}"/>
            </div>
            {% if result.errors.city %}
                <div class="alert alert-danger">{{ 'Necesitamos saber tu ciudad para actualizar tu información.' | translate }}</div>
            {% endif %}
            <div class="form-group">
                <label for="province">{{ 'Provincia' | translate }}</label>
                <input class="form-control" type="text" name="province" id="province" value="{{ result.province | default(address.province) }}" placeholder="{{ 'ej.: CABA' | translate }}"/>
            </div>
            {% if result.errors.province %}
                <div class="alert alert-danger">{{ 'Necesitamos saber tu provincia para actualizar tu información.' | translate }}</div>
            {% endif %}
            <div class="form-group">
                <label for="country">{{ 'País' | translate }}</label>
                <select class="js-on-steroids form-control on-steroids" name="country" id="country">{{ country_options }}</select>
            </div>
            {% if result.errors.country %}
                <div class="alert alert-danger">{{ 'Necesitamos saber tu país para actualizar tu información.' | translate }}</div>
            {% endif %}
            <div class="form-group">
                <label for="phone">{{ 'Teléfono' | translate }}</label>
                <input class="form-control" type="text" name="phone" id="phone" value="{{ result.phone | default(address.phone) }}" placeholder="{{ 'ej.: 1123445567' | translate }}"/>
            </div>
            {% if result.errors.phone %}
                <div class="alert alert-danger">{{ 'Necesitamos saber tu teléfono para actualizar tu información.' | translate }}</div>
            {% endif %}
            <input class="btn btn-primary full-width-xs pull-right" type="submit" value="{{ 'Guardar cambios' | translate }}" />
        </form>
    </div>
</div>
