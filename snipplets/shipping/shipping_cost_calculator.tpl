{# Check if store has free shipping without regions or categories #}

{% set has_free_shipping = cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}

{# Free shipping visibility variables #}

{% set free_shipping_messages_visible = (product_detail and has_free_shipping) or (not product_detail and has_free_shipping and cart.free_shipping.min_price_free_shipping.min_price_raw == 0) %}

{% if product_detail %}
	{% set cart_zipcode = false %}
{% else %}
	{% set cart_zipcode = cart.shipping_zipcode %}
{% endif %}

<div class="shipping-calculator {% if ajax_cart %}row{% else %}full-width{% endif %} visible-when-content-ready {% if product_detail %} product-shipping-calculator {% endif %} m-bottom-none" data-store="shipping-calculator">
    
    <div class="js-shipping-calculator-head shipping-calculator-head p-relative transition-soft {% if cart_zipcode %}with-zip{% else %}with-form{% endif %} {% if free_shipping_messages_visible %}with-free-shipping{% endif %}">
        <div class="js-shipping-calculator-with-zipcode {% if cart_zipcode %}js-cart-saved-zipcode transition-up-active{% else %} p-absolute {% endif %} transition-up container-fluid full-width">
            <div class="container-fluid">
				<div class="row-flex align-items-center">
					<span class="col p-right-none">
						<span class="d-table">
							<span>{{ "Entregas para el CP:" | translate }}</span>
							<strong class="js-shipping-calculator-current-zip m-left-quarter">{{ cart_zipcode }}</strong>
						</span>
					</span>
					<div class="col-auto p-left-none">
						<a class="js-shipping-calculator-change-zipcode btn btn-secondary btn-small" href="#">{{ "Cambiar CP" | translate }}</a>
					</div>
				</div>
			</div>
        </div>
	    <div class="js-shipping-calculator-form shipping-calculator-form {% if product_detail %} col-sm-7{% endif %} col-xs-12 transition-up p-absolute" {% if shipping_calculator_variant and not shipping_calculator_variant.available %}style="display: none;" {% endif %}>
	    	<div class="row">
	            <p class="col-xs-12">
	                {% include "snipplets/svg/truck.tpl" with {fa_custom_class: "shipping-truck m-right-quarter svg-text-fill"} %}
	                <span>
						{{ 'Medios de envío' | translate }}
	                </span>
	            </p>
		   		<div class="col-xs-6 col-sm-6 p-right-none">
				    <input type="tel" placeholder="{{ 'Tu código postal' | translate }}" aria-label="{{ 'Tu código postal' | translate }}" name="zipcode" autocorrect="off" autocomplete="postal-code" class="js-shipping-input form-control form-control-small input-prepend shipping-zipcode" value="{{ cart_zipcode }}">
				</div>
			    <div class="col-xs-6 col-sm-6 p-left-none">
				    <button class="js-calculate-shipping btn btn-secondary btn-append btn-small btn-block" aria-label="{{ 'Calcular envío' | translate }}">
				    	<span class="js-calculate-shipping-wording">{{ "Calcular" | translate }}</span>
			    		<span class="js-calculating-shipping-wording" style="display: none;">{{ "Calculando" | translate }}</span>
					</button>
				</div>
				{% set zipcode_help_countries = ['BR', 'AR', 'MX'] %}
				{% if store.country in zipcode_help_countries %}
					{% set zipcode_help_ar = 'https://www.correoargentino.com.ar/formularios/cpa' %}
					{% set zipcode_help_br = 'http://www.buscacep.correios.com.br/sistemas/buscacep/' %}
					{% set zipcode_help_mx = 'https://www.correosdemexico.gob.mx/SSLServicios/ConsultaCP/Descarga.aspx' %}
					<div class="col-xs-12 m-top-quarter text-left">
						{% if product_detail and not customer %}
							<a href="#quick-login" data-toggle="modal" class="js-trigger-modal-zindex-top js-product-quick-login btn-link btn-link-small-extra text-foreground m-left-quarter" style="display: none;">{{ '<strong>Iniciá sesión</strong> y usá tus datos de entrega' | translate }}</a>
						{% endif %}
						<a class="{% if product_detail %}js-shipping-zipcode-help{% endif %} btn-link btn-link-small-extra text-foreground m-left-quarter" href="{% if store.country == 'AR' %}{{ zipcode_help_ar }}{% elseif store.country == 'BR' %}{{ zipcode_help_br }}{% elseif store.country == 'MX' %}{{ zipcode_help_mx }}{% endif %}" target="_blank" {% if product_detail and not customer %}style="display: none;"{% endif %}>{{ "No sé mi código postal" | translate }}</a>
					</div>
				{% endif %}
			    {% if shipping_calculator_variant %}
			    <input type="hidden" name="variant_id" id="shipping-variant-id" class="form-control" value="{{ shipping_calculator_variant.id }}">
			    {% endif %}
			</div>
			<div class="row">
				<div class="col-xs-12 m-top-half">
				    <div class="js-ship-calculator-error invalid-zipcode alert alert-danger" style="display: none;">
				    	{# Specific error message considering if store has multiple languages #}

						{% for language in languages %}
							{% if language.active %}
								{% if languages | length > 1 %}
									{% set wrong_zipcode_wording = ' para ' | translate ~ language.country_name ~ '. Podés intentar con otro o' | translate %}
								{% else %}
									{% set wrong_zipcode_wording = '. ¿Está bien escrito?' | translate %}
								{% endif %}
								{{ "No encontramos este código postal{1}" | translate(wrong_zipcode_wording) }}

								{% if languages | length > 1 %}
									<a href="#{% if product_detail %}product{% else %}cart{% endif %}-shipping-country" data-toggle="modal" class="js-trigger-modal-zindex-top btn-link btn-link-small-extra text-uppercase">
										{{ 'cambiar tu país de entrega' | translate }}
									</a>
								{% endif %}
							{% endif %}
						{% endfor %}
				    </div>
					<div class="js-ship-calculator-error js-ship-calculator-common-error alert alert-danger" style="display: none;">{{ "Ocurrió un error al calcular el envío. Por favor intentá de nuevo en unos segundos." | translate }}</div>
					<div class="js-ship-calculator-error js-ship-calculator-external-error alert alert-danger" style="display: none;">{{ "El calculo falló por un problema con el medio de envío. Por favor intentá de nuevo en unos segundos." | translate }}</div>
				</div>
			</div>
		</div>
    </div>
    <div class="js-shipping-calculator-spinner pull-left shipping-calculator-spinner full-width transition-soft {% if ajax_cart %}p-top-xs p-bottom-xs{% endif %} m-top-half m-bottom-half" style="display: none;">
        <div class="spinner-bar opacity-50 m-all {% if ajax_cart %}m-auto-xs{% endif %}"></div>
    </div>
	<div class="js-shipping-calculator-response shipping-calculator-response col-xs-12 m-top-half" style="display: none;"></div>
</div>

{# Shipping country modal #}

{% if languages | length > 1 %}
	<div id="{% if product_detail %}product{% else %}cart{% endif %}-shipping-country" class="js-modal-shipping-country js-modal-xs-centered modal modal-xs modal-xs-centered fade modal-zindex-top modal-small" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="js-close-modal-zindex-top modal-header" data-dismiss="modal" aria-hidden="true">
					<span class="btn btn-floating pull-right">
				  		{% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa fa-lg pull-left m-none"} %}
					</span>
					<h3>{{ 'País de entrega' | translate }}</h3>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="store-country">{{ 'País donde entregaremos tu compra' | t }}</label>
						<div class="select-container">
							<select id="store-country" class="js-shipping-country-select form-control select">
								{% for language in languages %}
									<option value="{{ language.country }}" data-country-url="{{ language.url }}" {% if language.active %}selected{% endif %}>{{ language.country_name }}</option>
								{% endfor %}
							</select>
						</div>
					</div>
				</div>
				<div class="modal-footer modal-footer clear-both p-top-half">
					<a href="#" class="js-save-shipping-country btn btn-primary pull-right">{{ 'Aplicar' | translate }}</a>
				</div>
			</div>
		</div>
	</div>
{% endif %}
