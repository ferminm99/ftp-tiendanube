{# Image and text module work as examples #}

<div class="container" data-store="home-image-text-module">
    <div class="module-wrapper">
        <div class="row">
            <div class="col-sm-12 overflow-none">
                <div class="module-image module-image-placeholder">
                    <div class="textbanner-image-background">
                        {{ component('placeholders/banner-placeholder')}}
                     </div>
                    <div class="module-text pull-right">
                        <h3 class="module-text-title">{{ 'Módulo de imagen y texto' | translate }}</h3>
                        <div class="module-text-paragraph">{{ 'Usá este texto para compartir información de tu negocio, dar la bienvenida a tus clientes o para contar lo increíble que son tus productos.' | translate }}</div>
                    </div>
                </div>
                <div class="placeholder-empty-overlay transition-soft">
                    <div class="placeholder-info">
                        {% include "snipplets/svg/edit.tpl" with {fa_custom_class: "svg-inline--fa fa-3x svg-text-fill"} %}
                        <div class="placeholder-description font-small-xs">
                            {{ "Podés contar más sobre tu tienda desde" | translate }} <strong>"{{ "Módulos de imagen y texto" | translate }}"</strong>
                        </div>
                        {% if not params.preview %}
                            <a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small">{{ "Editar" | translate }}</a>
                        {% endif %}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="shape-container">
        <div class="background-shape"></div>
    </div>
</div>