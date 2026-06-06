<div class="container">
    <div class="title-container" data-store="page-title">
	    {% snipplet "breadcrumbs.tpl" %}
   		<h1 class="title">
			{% if is_order_cancellation %}
				{% set form_title = "Pedí la cancelación de tu última compra" | translate %}
			{% else %}
				{% set form_title = "Contacto" | translate %}
			{% endif %}
			{{ form_title }}
		</h1>
    </div>
	<div class="row">
		{% set contact_info = store.email or store.phone or store.blog or store.address %}
		{% set is_order_cancellation_without_id = params.order_cancellation_without_id == 'true' %}
		{% set contactColCount = 2 %}
		{% if store.contact_intro or contact_info or settings.show_map_on_contact %}
			{% set contactColCount = 2 %}
		{% else %}
			{% set contactColCount = 1 %}
		{% endif %}

		{% if is_order_cancellation %}
			<div class="col-xs-12">
				<div class="text-center m-bottom-double">
					<p class="m-none" data-component="order-cancellation-disclaimer">{{ "Si te arrepentiste, podés pedir la cancelación enviando este formulario. Tenés como máximo hasta 10 días corridos desde que recibiste el producto." | translate }} </p>
					<a class="btn" href="{{ status_page_url_regret }}"><strong>{{'Ver detalle de la compra >' | translate}}</strong></a>
				</div>
			</div>
		{% endif %}
		{% if contactColCount == 2 %}
			<div class="col-md-6">

				{% if (store.contact_intro or contact_info) and not is_order_cancellation %}
					<h2 class="h4">{{ "Contactanos" | translate }}</h2>
				{% endif %}

				{% if store.contact_intro and not is_order_cancellation %}
					<p class="m-bottom">{{ store.contact_intro }}</p>
				{% elseif is_order_cancellation and contact_info %}
					<p class="m-bottom">{{ 'Si tenés problemas con otra compra, contactanos:' | translate }}</p>
				{% endif %}

				<ul class="contact-info list-unstyled">
					{% if store.phone %}
						<li class="m-bottom">
							{% include "snipplets/svg/phone.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill m-right-quarter"} %}
							{{ store.phone }}
						</li>
					{% endif %}
					{% if store.email %}
						<li class="m-bottom">
							{% include "snipplets/svg/envelope.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill m-right-quarter"} %}
							{{ store.email | mailto }}
						</li>
					{% endif %}
					{% if store.blog %}
						<li class="m-bottom">
							<a target="_blank" href="{{ store.blog }}">
								{% include "snipplets/svg/comments.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill m-right-quarter"} %}
								{{ "Visita nuestro Blog!" | translate }}
							</a>
						</li>
					{% endif %}
					{% if store.address and not is_order_cancellation %}
						<li class="m-bottom">
							{% include "snipplets/svg/map-marker.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill m-right-quarter"} %}
							{{ store.address }}
						</li>
					{% endif %}								
				</ul>
				{% set show_map = settings.show_map_on_contact and store.address %}
				{% if show_map %}
			 		<iframe id="gmap_canvas" class="map m-bottom" src="https://maps.google.com/maps?q={{ store.address }}&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0">
                	</iframe>
				{% endif %}
			</div>
		{% endif %}
		{% if contactColCount == 2 %}
		<div class="col-md-6">
		{% else %}
		<div class="col-md-12">
		{% endif %}
			{% if product %}  
				<div class="m-bottom"> 
					<p>{{ "Usted está consultando por el siguiente producto:" | translate }} </br> {{ product.name | a_tag(product.url) }}</p>
					<img src="{{ product.featured_image | product_image_url('thumb') }}" title="{{ product.name }}" alt="{{ product.name }}" />
				</div>
			{% endif %}		
			{% if contact %}
				{% if contact.success %}
					{% if is_order_cancellation %}
						<div class="alert alert-success" data-component="order-cancellation-success-message">{{ "¡Tu pedido de cancelación fue enviado!" | translate }} {{ "Vamos a ponernos en contacto con vos apenas veamos tu mensaje." | translate }} 
						<br> 
						<strong>{{ "Tu código de trámite es" | translate }} #{{ last_order_id }}</strong></div>
					{% else %}
						<div class="alert alert-success" data-component="contact-success-message">{{ "¡Gracias por contactarnos! Vamos a responderte apenas veamos tu mensaje." | translate }}</div>
					{% endif %}
				{% else %}
					<div class="alert alert-danger">{{ "Necesitamos tu nombre y un email para poder responderte." | translate }}</div>
				{% endif %}
			{% endif %}	

			{% if is_order_cancellation_without_id %}
				<p class="m-bottom" data-component="order-cancellation-disclaimer">{{ "Si te arrepentiste de una compra, podés pedir la cancelación enviando este formulario <strong>con tu número de orden.</strong> Tenés como máximo hasta 10 días corridos desde que recibiste el producto." | translate }}</p>
			{% endif %}
			<form class="contact-form" action="/winnie-pooh" method="post" onsubmit="this.setAttribute('action', '');" data-store="contact-form">
				<input type="hidden" value="{{ product.id }}" name="product"/>
				{% if is_order_cancellation or is_order_cancellation_without_id %}
                	<input type="hidden" name="type" value="order_cancellation" />
                {% else %}
                	<input type="hidden" name="type" value="contact" />
                {% endif %}
				<div class="form-group">
					<label for="name">{{ "Nombre" | translate }}:</label>
					<input type="text" class="form-control" id="name" name="name">
				</div>
				<div class="form-group">
					<label for="email">{{ "Email" | translate }}:</label>
					<input type="email" class="form-control" id="email"  name="email">
				</div>
				<div class="form-group winnie-pooh hidden">
					<label for="winnie-pooh">{{ "No completar este campo" | translate }}:</label>
					<input type="text" class="form-control" id="winnie-pooh" name="winnie-pooh">
				</div>
				{% if not is_order_cancellation %}
					<div class="form-group">
						<label for="phone">{{ "Teléfono" | translate }} ({{ "Opcional" | translate }}):</label>
						<input type="text" class="form-control" id="phone" name="phone">
					</div>
					<div class="form-group">
						<label for="message">{{ "Mensaje" | translate }} ({{ "Opcional" | translate }}):</label>
						<textarea id="message" name="message" class="form-control" rows="7"></textarea>
					</div>
				{% endif %}
				<input type="submit" class="btn btn-secondary full-width-xs pull-right" value="{{ 'Enviar' | translate }}" name="contact"/>
			</form>
		</div>
	</div>
</div>
