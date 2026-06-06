<div class="container">
    <div class="title-container" data-store="page-title">
        {% snipplet "breadcrumbs.tpl" %}
        <h1 class="title">{{ "Cambiar Contraseña" | translate }}</h1>
    </div>
    <div class="row visible-when-content-ready">
        <p class="col-sm-6 col-sm-offset-3">{{ 'Vamos a enviarte un email para que puedas cambiar tu contraseña.' | translate }}</p>
        <form id="resetpass-form" action="" method="post" class="col-sm-6 col-sm-offset-3 m-bottom">
            {% if failure %}
                <div class="alert alert-danger">{{ 'No encontramos ninguna cuenta registrada con este email. Intentalo nuevamente chequeando que esté bien escrito.' | translate }}</div>
            {% elseif success %}
                <div class="alert alert-success">{{ '¡Listo! Te enviamos un email a {1}' | translate(email) }}</div>
            {% endif %}
            <div class="form-group">
                <label for="email">{{ 'Email' | translate }}</label>
                <input class="form-control" autocorrect="off" autocapitalize="off" type="email" name="email" id="email" value="{{ email }}" />
            </div>
            <input class="btn btn-primary full-width-xs pull-right" type="submit" value="{{ 'Enviar email' | translate }}" />
        </form>
    </div>
</div>
