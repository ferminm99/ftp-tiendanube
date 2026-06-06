<div class="js-addtocart js-addtocart-placeholder btn btn-primary btn-block d-inline-block btn-transition disabled {{ custom_class }}" style="display: none;">
    <div class="d-inline-block">
        <span class="js-addtocart-text btn-transition-start transition-container active">
            {{ 'Agregar al carrito' | translate }}
        </span>
        <span class="js-addtocart-success transition-container btn-transition-success">
            <span class="m-left">
                {{ '¡Listo!' | translate }}
            </span>
            <span class="pull-right m-right">
                {% include "snipplets/svg/check.tpl" with {fa_custom_class: "svg-inline--fa fa-lg"} %}
            </span>
        </span>
        <div class="js-addtocart-adding transition-container btn-transition-progress">
            <span class="js-addtocart-adding-text m-left">
                {{ 'Agregando...' | translate }}
            </span>
            <span class="pull-right m-right">
                {% include "snipplets/svg/circle-notch.tpl" with {fa_custom_class: "svg-inline--fa fa-spin fa-lg"} %}
            </span>
        </div>
    </div>
</div>