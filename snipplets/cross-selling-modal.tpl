<div id="js-cross-selling-modal" class="modal modal-xs modal-xs-bottom-sheet modal-zindex-top fade" tabindex="-1" role="dialog" q-hidden="true">
    <div class="modal-dialog modal-dialog-400px">
        <div class="js-close-modal-zindex-top modal-header p-top p-bottom p-left-half">
            <div class="h4">{{ '¡Descuento exclusivo!' | translate }}</div>
            <span class="btn btn-floating m-right-half m-top" data-dismiss="modal" aria-hidden="true">
                {% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa"} %}
            </span>
        </div>
        <div class="modal-content">
            <div class="modal-body modal-body-full-h p-bottom-xs">
                <div class="js-cross-selling-modal-body" style="display: none"></div>
            </div>
        </div>
    </div>
</div>
