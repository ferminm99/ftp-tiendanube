<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="{% for language in languages %}{% if language.active %}{{ language.lang }}{% endif %}{% endfor %}"> <!--<![endif]-->
    <head>
		<link rel="preconnect" href="{{ store_resource_hints }}" />
		<link rel="dns-prefetch" href="{{ store_resource_hints }}" />
		<link rel="preconnect" href="https://fonts.googleapis.com" />
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>{{ page_title }}</title>
        <meta name="description" content="{{ page_description }}" />
    	<meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="preload" as="style" href="{{ [settings.main_font, settings.default_font] | google_fonts_url('300, 400, 700') }}" />
		<link rel="preload" href="{{ 'css/main-color.scss.tpl' | static_url }}" as="style" />

		{# Preload LCP home, category and product page elements #}

		{% snipplet 'preload-images.tpl' %}

		{{ component('social-meta') }}

        {# load fonts #}

		{# Critical CSS needed to show first elements of store while CSS async is loading #}

		<style>

			{# Font families #}

			{{ component(
				'fonts',{
					font_weights: '300, 400, 700',
					font_settings: 'settings.main_font, settings.default_font'
				})
			}}

			{% snipplet 'css/critical-css.tpl' %}
		</style>

		{# Load async styling not mandatory for first meaningfull paint #}

		<link rel="stylesheet" href="{{ 'css/style.scss.tpl' | static_url }}" media="print" onload="this.media='all'">

		{# Colors and fonts used from settings.txt and defined on theme customization #}

		{{ 'css/main-color.scss.tpl' | static_url | static_inline }}

		<style>
			{{ settings.css_code | raw }}
		</style>

		{# Defines if async JS will be used by using script_tag(true) #}

		{% set async_js = true %}

		{# Defines the usage of jquery loaded below, if nojquery = true is deleted it will fallback to jquery 1.5 #}

		{% set nojquery = true %}

		{# Jquery async by adding script_tag(true) #}

		{% if load_jquery %}

			{{ "//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" | script_tag(true) }}

		{% endif %}

		{# Loads private Tiendanube JS #}

		{% head_content %}

		{# Structured data to provide information for Google about the page content #}

		{{ component('structured-data-organization') }}
		{{ component('structured-data') }}

    </head>
    {# Only remove this if you want to take away the theme onboarding advices #}
	{% set show_help = not has_products %}
    {% if "default-background.jpg" | has_custom_image %}
	<body class="{% if customer %}customer-logged-in{% endif %} template-{{ template | replace('.', '-') }} user-background {% if not settings.bg_repeat %}bg-no-repeat{% endif %}" style="background-position-x:{{ settings.bg_position_x }};">
	{% else %}
	<body class="{% if customer %}customer-logged-in{% endif %} template-{{ template | replace('.', '-') }} pattern-background">
	{% endif %}

	{{ component('nubesdk-slot', { type: "before_main_content" }) }}

	{# Social JS Twitter home widgets and Facebook comments on product page #}

	{% if template == 'home' %}

	    {# Twitter profile feed JS #}
	    {% if settings.twitter_widget %}
	        {{ tw_js }}
	    {% endif %}

	{% endif %}

	{% if template == 'product' %}

	    {# Facebook comment box JS #}
	    {% if settings.show_product_fb_comment_box %}
	        {{ fb_js }}
	    {% endif %}

	    {# Pinterest share button JS #}
	    {{ pin_js }}

	{% endif %}

	{# Hamburger panel #}

	<nav class="hamburger-panel js-hamburger-panel">
        {% snipplet "navigation/navigation-hamburger-panel.tpl" %}
    </nav>

	{# Overlays #}

	<div class="js-hamburger-overlay js-toggle-hamburger-panel hamburger-overlay backdrop"></div>

	<div class="js-search-backdrop js-toggle-mobile-search search-backdrop backdrop container-fluid full-width" style="display: none;"></div>

    <!--[if lt IE 7]>
        <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
    <![endif]-->
    <div class="p-relative visible-xs">

    	{# Ad bar mobile #}

        {% if settings.ad_bar and settings.ad_text %}
        	<div class="p-relative" data-store="head-adbar">
            	{% snipplet "advertising.tpl" %}
            </div>
        {% endif %}

        {# Mobile nav #}

    	{% snipplet "navigation/navigation-mobile.tpl" %}
    </div>

	{# Add notification for quick login cancellation #}

	{% if template == 'home' or template == 'product' %}
		{% include "snipplets/notification.tpl" with {show_quick_login: true} %}
	{% endif %}

	{% include "snipplets/notification.tpl" with {show_cookie_banner: true} %}

    <div class="js-main-content main-content">
		<div class="js-nav-head nav-head" data-store="head-desktop">

			{# Ad bar desktop #}

	        {% if settings.ad_bar and settings.ad_text %}
	            <div class="hidden-xs">
	                {% snipplet "advertising.tpl" %}
	            </div>
	        {% endif %}

			{% if settings.fixed_menu %}
				<div class="js-nav-head-fixed nav-head-fixed header-bar-fixed hidden-xs">
					<div class="container display-when-content-ready">
						<div class="nav-head-main">
							<div class="logo-container">
								{% if "fixed_menu_logo.jpg" | has_custom_image %}
									<div class="logo-img-container">
										{{ "fixed_menu_logo.jpg" | static_url | img_tag(store.name, {alt: store.name, class: 'logo-img logo-fixed'}) | a_tag(store.url) }}
									</div>
								{% else %}
									<div class="logo-img-container {% if not has_logo %}hidden{% endif %}">
										{{ store.logo('large') | img_tag(store.name, {class: 'logo-img logo-fixed', width: logoWidth, height: logoHeight}) | a_tag(store.url) }}
									</div>
									<a href="{{ store.url }}" class="logo-text {% if has_logo %} hidden {% endif %}">{{ store.name }}</a>
								{% endif %}
							</div>
							<ul class="js-desktop-nav hidden-xs desktop-nav" data-store="navigation" data-component="menu">
								{% snipplet "navigation/navigation.tpl" %}
							</ul>
							<div class="d-flex">
								<div class="desktop-search">
									<div class="js-search-container">
										<form action="{{ store.search_url }}" class="js-search-form" method="get" role="form">
											<div class="form-group">
												<input class="js-search-input form-control desktop-search-input" type="search" autocomplete="off" name="q" placeholder="{{ 'Buscar' | translate }}"  aria-label="{{ 'Buscador' | translate }}"/>
												<button class="desktop-search-submit submit-button" type="submit" aria-label="{{ 'Buscar' | translate }}">
													<div class="desktop-search-icon">
										                {% include "snipplets/svg/search.tpl"  with {fa_custom_class: "svg-inline--fa svg-search-icon"} %}
										            </div>
												</button>
											</div>
										</form>
									</div>
									<div class="js-search-suggest search-suggest">
			                            {# AJAX container for search suggestions #}
			                        </div>
								</div>
								{% if not store.is_catalog and template != 'cart' %}
									{% if settings.ajax_cart %}
										{% snipplet "cart-widget-ajax.tpl" as "cart" %}
									{% else %}
										{% snipplet "cart.tpl" as "cart" %}
									{% endif %}
								{% endif %}
							</div>
						</div>
					</div>
				</div>
			{% endif %}
			<div class="nav-head-top header-bar-top hidden-xs">
				<div class="js-nav-container container">
					<div class="row">
						<div class="col-sm-6 text-left">
							<ul class="list-unstyled list-inline m-none">
								{% if languages | length > 1 %}
								<li class="p-left-none dropdown">
									{% for language in languages %}
									{% if language.active %}
									<a  class="dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
									{{ language.country | flag_url | img_tag(language.name) }}
									<span class="caret"></span>
									</a>
									{% endif %}
									{% endfor %}
									<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
										{% for language in languages %}
										<li role="presentation">
											<a role="menuitem" tabindex="-1" href="{{ language.url }}" class="{{ class }}">
												<img class="lazyload" src="{{ 'img/empty-placeholder.png' | static_url }}" data-src="{{ language.country | flag_url }}" alt="{{ language.name }}" />
												<span>&nbsp{{ language.name }}</span>
											</a>
										</li>
										{% endfor %}
									</ul>
								</li>
								{% endif %}
								{% if store.phone %}
									<li class="phone {% if store.email %} border-right {% endif %}">
										{{ store.phone }}
									</li>
								{% endif %}
								{% if store.email %}
									<li class="mail">{{ store.email | mailto }}</li>
								{% endif %}
							</ul>
						</div>
						<div class="col-sm-6 text-right" data-store="account-links">
						{% if store.has_accounts %}
							<ul class="list-unstyled list-inline m-none">
								{% if not customer %}
									{% if 'mandatory' not in store.customer_accounts %}
									<li class="border-right">
										{{ "Crear cuenta" | translate | a_tag(store.customer_register_url) }}
									</li>
									{% endif %}
									<li class="p-relative">
										{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, '', 'js-login') }}
										{% include "snipplets/tooltip-login.tpl" with {desktop: "true"} %}
									</li>
								{% else %}
									<li class="border-right p-right-half">
										{% include "snipplets/svg/user-alt.tpl" with {fa_custom_class: "svg-inline--fa font-medium svg-text-fill align-top m-right-quarter"} %}
										{% set customer_short_name = customer.name|split(' ')|slice(0, 1)|join %}
										<strong>{{ "¡Hola, {1}!" | t(customer_short_name) | a_tag(store.customer_home_url) }}</strong>
									</li>
									<li>
										{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url) }}
									</li>
								{% endif %}
							</ul>
						{% endif %}
						</div>
					</div>
				</div>
			</div>
			<div class="js-nav-head-main container">
				<div class="nav-head-main">
					<div class="js-logo-container logo-container">
						{% set logo_size_class = settings.logo_size == 'small' ? 'logo-img-small' : settings.logo_size == 'medium' ? 'logo-img-medium' : settings.logo_size == 'big' ? 'logo-img-big' %}
	                    {{ component('logos/logo', {logo_size: 'large', container_classes: { logo_img_container: "mobile-logo-home"}, logo_img_classes: logo_size_class, logo_text_classes: 'h3'}) }}
					</div>
					<ul class="js-desktop-nav hidden-xs desktop-nav" data-store="navigation" data-component="menu">
						{% snipplet "navigation/navigation.tpl" %}
					</ul>
					<div class="d-flex hidden-xs">
						<div class="desktop-search">
							<div class="js-search-container">
								<form action="{{ store.search_url }}" class="js-search-form" method="get" role="form">
									<div class="form-group">
										<input class="js-search-input form-control desktop-search-input" type="search" autocomplete="off" name="q" placeholder="{{ 'Buscar' | translate }}" aria-label="{{ 'Buscador' | translate }}"/>
										<button class="desktop-search-submit submit-button" type="submit" aria-label="{{ 'Buscar' | translate }}">
											<div class="desktop-search-icon">
								                {% include "snipplets/svg/search.tpl"  with {fa_custom_class: "svg-inline--fa svg-search-icon"} %}
								            </div>
										</button>
									</div>
								</form>
							</div>
							<div class="js-search-suggest search-suggest">
	                            {# AJAX container for search suggestions #}
	                        </div>
						</div>
						{% if not store.is_catalog and template != 'cart' %}
							{% if settings.ajax_cart %}
								{% snipplet "cart-widget-ajax.tpl" as "cart" %}
							{% else %}
								{% snipplet "cart.tpl" as "cart" %}
							{% endif %}
						{% endif %}
					</div>
				</div>
			</div>

			{{ component('nubesdk-slot', { type: "after_header" }) }}

			{% include 'snipplets/notification.tpl' with {order_notification: true} %}
		</div>

		{% include 'snipplets/notification.tpl' with {add_to_cart: true} %}

		{% template_content %}
		{% if store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
		<div class="container visible-when-content-ready">
			<div class="row social-networks m-top">
				<div class="col-md-12">
					<div class="title-container">
				   		<h2 class="subtitle">{{"Seguinos" | translate}}</h2>
				    </div>
                    <ul class="text-center list-inline">
                        {% for sn in ['instagram', 'facebook', 'youtube', 'tiktok', 'twitter', 'pinterest'] %}
                            {% set sn_url = attribute(store,sn) %}
                            {% if sn_url %}
                                <li class="m-bottom-half">
                                    <a class="btn btn-circle btn-primary" href="{{ sn_url }}" target="_blank" aria-label="{{ sn }} {{ store.name }}">
                                        {% if sn == "facebook" %}
                                            {% set social_network = sn ~ '-f' %}
                                        {% else %}
                                            {% set social_network = sn %}
                                        {% endif %}
                                        {% include "snipplets/svg/" ~ social_network ~ ".tpl" with {fa_custom_class: "svg-inline--fa"} %}
                                    </a>
                                </li>
                            {% endif %}
                        {% endfor %}
                    </ul>
				</div>
			</div>
		</div>
		{% endif %}
        {% set has_only_category_banner_service = settings.banner_services_category and not settings.banner_services and template == 'category' %}
        {% if settings.banner_services or has_only_category_banner_service %}
        <div class="container {% if has_only_category_banner_service %} visible-xs {% endif %}">
        	{% include 'snipplets/banner-services/banner-services.tpl' with {'footer': true} %}
     	</div>
        {% endif %}
		{% if template == 'home' %}
        	<div class="shape-container">
				<div class="background-shape"></div>
			</div>
		{% endif %}

		{{ component('nubesdk-slot', { type: "before_footer" }) }}

		<div data-store="footer">
			<div class="footer footer-main">
				<div class="container visible-when-content-ready">
					{% set has_seals = store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
					<div class="row">
						<div class="col-md-{% if has_seals %}3{% else %}4{% endif %} m-bottom-xs">
							<h4 class="footer-title">{{ settings.footer_menu_title }}</h4>
							<ul class="footer-list list-unstyled">
								{% snipplet "navigation/navigation-foot.tpl" %}
							</ul>
						</div>
						{% set has_shipping_payment_logos = settings.payments or settings.shipping %}
						{% if not (has_products or has_shipping_payment_logos) %}
							{# This is a snipplet to show the user the payment and send methods the first time they visit the store #}
							{% snipplet "defaults/show_help_footer.tpl" %}
						{% elseif has_shipping_payment_logos%}
							<div class="payment-send col-md-{% if has_seals %}3{% else %}4{% endif %} m-bottom-xs">
								{% if settings.payments %}
									<h4 class="footer-title">{{ 'Medios de pago' | translate }}</h4>
										<div class="text-center-xs">
										{% for payment in settings.payments %}
											<img src="{{ 'img/empty-placeholder.png' | static_url }}" data-src="{{ payment | payment_new_logo }}" class="lazyload js-lazy-loading footer-payship-img card-img" alt="{{ payment }}" width="48" height="30"/>
										{% endfor %}
									</div>
								{% endif %}
								{% if settings.shipping %}
									<h4 class="footer-title">{{ 'Formas de envío' | translate }}</h4>
									<div class="text-center-xs">
										{% for shipping in settings.shipping %}
											<img src="{{ 'img/empty-placeholder.png' | static_url }}" data-src="{{ shipping | shipping_logo }}" class="lazyload js-lazy-loading footer-payship-img card-img" alt="{{ shipping }}" width="48" height="30"/>
										{% endfor %}
									</div>
								{% endif %}
							</div>
						{% endif %}
						{% if store.phone or store.email or store.blog or store.address %}
							<div class="col-md-{% if has_seals %}3{% else %}4{% endif %} contact-data">
								<h4 class="footer-title">{{ 'Contactanos' | translate }}</h4>
								<ul class="footer-list list-unstyled">
								{% if store.phone %}
									<li>
										{% include "snipplets/svg/phone.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill m-right-quarter"} %}{{ store.phone }}
									</li>
								{% endif %}
								{% if store.email %}
									<li>
										{% include "snipplets/svg/envelope.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill m-right-quarter"} %}{{ store.email | mailto }}
									</li>
								{% endif %}
								{% if store.blog %}
									<li>
										<a target="_blank" href="{{ store.blog }}">
											{% include "snipplets/svg/comments.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill m-right-quarter"} %}{{ "Visita nuestro Blog!" | translate }}
										</a>
									</li>
								{% endif %}
								{% if store.address %}
									<li>
										{% include "snipplets/svg/map-marker.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill m-right-quarter"} %}{{ store.address }}
									</li>
								{% endif %}
								</ul>
							</div>
						{% endif %}
						{% if has_seals %}
							<div class="col-md-3 seals">
								<h4 class="footer-title">{{ 'Información legal' | translate }}</h4>
								{% if store.afip %}
									<div class="afip m-top-quarter m-bottom-quarter">
										{{ store.afip | raw }}
									</div>
								{% endif %}
								{% if ebit %}
									<div class="ebit m-top-quarter m-bottom-quarter">
										{{ ebit }}
									</div>
								{% endif %}
								{% if "seal_img.jpg" | has_custom_image or settings.custom_seal_code %}
		                            <div class="seals-container text-center">
		                                {% if "seal_img.jpg" | has_custom_image %}
	                                        <div class="custom-seal custom-seal-img">
	                                            {% if settings.seal_url != '' %}
	                                                <a href="{{ settings.seal_url | setting_url }}" target="_blank">
	                                            {% endif %}
	                                                <img src="{{ 'img/empty-placeholder.png' | static_url }}" data-src="{{ "seal_img.jpg" | static_url }}" class="lazyload js-lazy-loading" alt="{{ 'Sello de' | translate }} {{ store.name }}" />
	                                            {% if settings.seal_url != '' %}
	                                                </a>
	                                            {% endif %}
	                                        </div>
	                                    {% endif %}
		                                {% if settings.custom_seal_code %}
		                                    <div class="custom-seal custom-seal-code">
		                                        {{ settings.custom_seal_code | raw }}
		                                    </div>
		                                {% endif %}
		                            </div>
		                        {% endif %}
							</div>
						{% endif %}
					</div>
				</div>
			</div>
		</div>
		<div class="js-footer-legal footer-legal footer-bottom">
			<div class="container visible-when-content-ready">
				<div class="row">
					<div class="col-md-9 copyright">
						<p class="text-left text-center-xs m-bottom-xs m-bottom-quarter">
							{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}

							{{ component('claim-info', {
									container_classes: "text-left text-center-xs m-bottom-xs font-small d-block m-top-quarter",
									divider_classes: "m-left-quarter m-right-quarter",
									link_classes: {
										link_consumer_defense: "weight-strong",
										link_order_cancellation: "weight-strong",
									},
								})
							}}
						</p>
					</div>
					<div class="col-md-3 powered-by text-right text-center-xs font-small">
						{#
						La leyenda que aparece debajo de esta linea de código debe mantenerse
						con las mismas palabras y con su apropiado link a Tiendanube;
						como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
						Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
						tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.
						Os créditos que aparece debaixo da linha de código deverá ser mantida com as mesmas
						palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
						http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
						e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
						manter visivél e com um link funcionando.
						#}
						{{ new_powered_by_link }}
					</div>
				</div>
			</div>
		</div>
	</div>
	
	{# AJAX Cart Panel #}
	{% if not store.is_catalog and template != 'cart' and settings.ajax_cart %}

		{% snipplet "cart-panel-ajax.tpl" %}
		{# Add to cart recommendations #}

		{% if settings.add_to_cart_recommendations %}
			{% snipplet "cart-recommendations-modal.tpl" %}
		{% endif %}

		{# Cross selling promotion notification on add to cart #}
    	{% snipplet "cross-selling-modal.tpl" %}
	{% endif %}
	
	{# Quickshop modal #}
	{% snipplet "quick-shop.tpl" %}

	{# Quick login #}
	{% snipplet "quick-login.tpl" %}

	{# Whatsapp chat button #}
	{% if store.whatsapp %}
        <a href="{{ store.whatsapp }}" target="_blank" class="js-btn-fixed-bottom btn-whatsapp btn-floating fixed-bottom visible-when-content-ready" aria-label="{{ 'Comunicate por WhatsApp' | translate }}">
            {% include "snipplets/svg/whatsapp.tpl" %}
        </a>
    {% endif %}

	{% if cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}

		{# Minimum used for free shipping progress messages. Located on header so it can be accesed everywhere with shipping calculator active or inactive #}

		<span class="js-ship-free-min hidden" data-pricemin="{{ cart.free_shipping.min_price_free_shipping.min_price_raw }}"></span>
        <span class="js-free-shipping-config hidden" data-config="{{ cart.free_shipping.allFreeConfigurations }}"></span>
		<span class="js-cart-subtotal hidden" data-priceraw="{{ cart.subtotal }}"></span>
		<span class="js-cart-discount hidden" data-priceraw="{{ cart.promotional_discount_amount }}"></span>
	{% endif %}

{# Javascript used in the store #}

<script type="text/javascript">

	{# Libraries that do NOT depend on other libraries, e.g: Jquery #}

	{% include "static/js/external-no-dependencies.js.tpl" %}

	{# LS.ready.then function waits to Jquery and private Tiendanube JS to be loaded before executing what´s inside #}

	LS.ready.then(function(){

		{# Libraries that requires Jquery to work #}

		{% snipplet "js/external.js.tpl"  %}

		{# Specific store JS functions: product variants, cart, shipping, etc #}

		{% if store.useStoreJsV2() %}
			{% include "static/js/store-v2.js.tpl" %}
		{% else %}
			{% include "static/js/store.js.tpl" %}
		{% endif %}
	});
</script>

{# Google reCAPTCHA on register page #}
{% if template == 'account.register' %}
	{% if not store.hasContactFormsRecaptcha() %}
	    {{ '//www.google.com/recaptcha/api.js' | script_tag(true) }}
	{% endif %}
    <script type="text/javascript">
        var recaptchaCallback = function() {
            jQueryNuvem('.js-recaptcha-button').prop('disabled', false);
        };
    </script>
{% endif %}

{# Google survey JS for Tiendanube/Nuvemshop Survey #}

{{ component('google-survey') }}

{# Store external codes added from admin #}

{% if store.assorted_js %}
<script>
    LS.ready.then(function() {
        var trackingCode = jQueryNuvem.parseHTML('{{ store.assorted_js| escape("js") }}', document, true);
        jQueryNuvem('body').append(trackingCode);
    });
</script>
{% endif %}

{# --- SCRIPT PERSONALIZADO V12: BOTONERA + OCULTAR REPETIDOS EN CATÁLOGO --- #}
<script type="text/javascript">
LS.ready.then(function(){
    
    // ----------------------------------------
    // RUTA 1: DETALLE DE PRODUCTO (Mantiene lo que ya funciona)
    // ----------------------------------------
    if (document.body.classList.contains('template-product')) {
        var h1Nativo = document.querySelector('h1');
        if (h1Nativo) {
            var tituloCompleto = h1Nativo.textContent.trim();
            if (tituloCompleto.indexOf('-') !== -1) {
                var partes = tituloCompleto.split('-');
                var nombreBase = partes[0].trim();
                var colorActual = partes[1].trim().toLowerCase();
                
                h1Nativo.textContent = nombreBase;
                
                var paletaColores = {
                    'marron': '#8B4513', 'marrón': '#8B4513',
                    'negro': '#000000',
                    'azul': '#0000FF',
                    'verde': '#008000',
                    'rojo': '#FF0000',
                    'gris': '#808080'
                };

                var htmlBotonera = '<div id="custom-color-box" style="margin: 20px 0; padding: 12px; background: #f9f9f9; border: 1px dashed #ccc; display: block !important; clear: both;">' +
                                   '<p style="font-weight:700; margin-bottom:8px; font-size:14px; color:#333; text-transform: uppercase;">COLOR DISPONIBLE:</p>' +
                                   '<div class="color-variants-holder" style="display:flex; gap:12px; flex-wrap: wrap;"></div>' +
                                   '</div>';
                
                h1Nativo.insertAdjacentHTML('afterend', htmlBotonera);

                function agregarBotonColorNativo(nombreColor, urlDestino) {
                    var colorClean = nombreColor.toLowerCase().trim();
                    var contenedor = document.querySelector('.color-variants-holder');
                    if (!contenedor) return;
                    var tituloID = colorClean.replace('ó', 'o');
                    if (contenedor.querySelector('a[data-color="' + tituloID + '"]')) return;

                    var codigoColor = paletaColores[colorClean] || '#CCCCCC';
                    var esElActual = (colorClean === colorActual);
                    
                    var estiloCirculo = 'display:inline-block; width:35px; height:35px; border-radius:50%; background-color:' + codigoColor + '; border: 2px solid ' + (esElActual ? '#333' : '#ddd') + '; box-shadow: ' + (esElActual ? '0 0 0 2px #fff, 0 0 4px rgba(0,0,0,0.4)' : 'none') + '; cursor:pointer; margin-right:5px; transition: transform 0.2s;';
                    
                    var botonHtml = '<a href="' + urlDestino + '" title="' + nombreColor + '" data-color="' + tituloID + '" style="' + estiloCirculo + '"></a>';
                    contenedor.insertAdjacentHTML('beforeend', botonHtml);
                }

                if (tituloCompleto.toLowerCase().indexOf('niño') !== -1 || tituloCompleto.toLowerCase().indexOf('nino') !== -1) {
                    var urlMarronNinos = "/productos/bombacha-de-grafa-ninos-tiro-alto-marron/";
                    var urlNegroNinos = "/productos/bombacha-de-grafa-ninos-tiro-alto-negro/";
                    agregarBotonColorNativo('Marrón', urlMarronNinos);
                    agregarBotonColorNativo('Negro', urlNegroNinos);
                } else {
                    agregarBotonColorNativo(partes[1].trim(), window.location.pathname);
                    var palabraClaveBusqueda = nombreBase.split(' ')[0];
                    if(nombreBase.split(' ')[1]) palabraClaveBusqueda += ' ' + nombreBase.split(' ')[1];
                    
                    window.fetch('/buscar/?q=' + encodeURIComponent(palabraClaveBusqueda))
                        .then(function(res) { return res.text(); })
                        .then(function(htmlTexto) {
                            var parser = new DOMParser();
                            var docBuscado = parser.parseFromString(htmlTexto, 'text/html');
                            docBuscado.querySelectorAll('a').forEach(function(enlace) {
                                var href = enlace.getAttribute('href');
                                var textoLink = enlace.textContent.trim().toLowerCase();
                                if (href && href.indexOf('/productos/') !== -1 && href.indexOf('ninos') === -1 && href.indexOf('niño') === -1) {
                                    Object.keys(paletaColores).forEach(function(colorNombre) {
                                        if (href.indexOf(colorNombre) !== -1 || textoLink.indexOf(colorNombre) !== -1) {
                                            if (href.indexOf('azul') !== -1 && href.indexOf('todo') !== -1) {
                                                agregarBotonColorNativo('Azul', href);
                                            }
                                        }
                                    });
                                }
                            });
                        });
                }
            }
        }
    }

    // ----------------------------------------
    // RUTA 2: OCULTAR REPETIDOS EN EL CATÁLOGO (ACTUALIZADO)
    // ----------------------------------------
    if (document.body.classList.contains('template-category') || document.body.classList.contains('template-search') || document.body.classList.contains('template-home')) {
        console.log("[CATALOGO] Buscando productos repetidos para ocultar...");
        var productosVistos = {};

        // Recorremos todos los elementos de título del catálogo en Trend
        var titulosCatalogo = document.querySelectorAll('.js-item-name, .item-name, .product-title, h3, h2');
        
        titulosCatalogo.forEach(function(elementoTitulo) {
            var textoCompleto = elementoTitulo.textContent.trim();
            
            // Si el título contiene un guión, analizamos si es una variante
            if (textoCompleto.indexOf('-') !== -1) {
                var partesCat = textoCompleto.split('-');
                var nombreBaseCat = partesCat[0].trim();
                
                if (productosVistos[nombreBaseCat]) {
                    // SI YA LO VIMOS: Buscamos la tarjeta contenedora del producto en Trend y la ocultamos por completo
                    var tarjetaProducto = elementoTitulo.closest('.js-product-container, .js-item-product, .item, .col-xs-6, .col-sm-4, .product-cell, [data-store="product-item"]');
                    if (tarjetaProducto) {
                        tarjetaProducto.style.setProperty('display', 'none', 'important');
                        console.log("[CATALOGO] Ocultado repetido de:", nombreBaseCat);
                    }
                } else {
                    // SI ES EL PRIMERO: Lo registramos como el "Padre" visible y le limpiamos el "- Color" para que quede estético
                    productosVistos[nombreBaseCat] = true;
                    elementoTitulo.textContent = nombreBaseCat;
                }
            }
        });
    }
});
</script>
{# --- FIN SCRIPT PERSONALIZADO --- #}
</body>
</html>