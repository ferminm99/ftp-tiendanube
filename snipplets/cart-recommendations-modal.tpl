<div id="related-products-notification" class="modal modal-xs modal-xs-bottom-sheet modal-zindex-top fade" tabindex="-1" role="dialog" q-hidden="true">
	<div class="modal-dialog modal-xs-dialog">
		<div class="js-close-modal-zindex-top modal-header p-all-half-xs" data-dismiss="modal" aria-hidden="true">
			<h5 class="m-top-half m-bottom-half">{{ '¡Agregado al carrito!' | translate }}</h5>
			<span class="btn btn-floating pull-right m-top-half m-right-half">
				{% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa fa-lg pull-left m-none"} %}
			</span>
		</div>
		<div class="modal-body">

			{# Product added info #}

			{% include "snipplets/notification-cart.tpl" with {related_products: true} %}

			{# Product added recommendations #}
			<div class="js-related-products-notification-container" style="display: none"></div>
		</div>
	</div>
</div>