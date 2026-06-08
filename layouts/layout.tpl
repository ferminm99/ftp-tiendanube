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
<div id="talles-modal" style="display:none; position:fixed; z-index:999999; left:0; top:0; width:100%; height:100%; background:rgba(0,0,0,0.6); align-items:center; justify-content:center;">
    <div style="background:white; padding:0; width:90%; max-width:500px; border-radius:12px; position:relative; max-height:85vh; display:flex; flex-direction:column; box-shadow: 0 10px 25px rgba(0,0,0,0.2); overflow:hidden;">
        
        <div style="background:#4e342e; color:white; padding:15px; text-align:center; position:relative;">
            <h3 style="margin:0; font-weight:900; font-size:18px;">Guía Oficial de Medidas</h3>
            <button onclick="document.getElementById('talles-modal').style.display='none'" style="position:absolute; right:15px; top:12px; border:none; background:none; font-size:24px; cursor:pointer; color:white;">&times;</button>
        </div>
        
        <div style="display:flex; justify-content:space-between; border-bottom:2px solid #f0f0f0; background:#fafafa;">
            <button id="btn-alto" onclick="abrirTabTalles('alto')" style="flex:1; border:none; border-bottom:3px solid #4e342e; background:none; padding:12px 5px; font-weight:bold; cursor:pointer; color:#4e342e; font-size:13px;">Tiro Alto</button>
            <button id="btn-bajo" onclick="abrirTabTalles('bajo')" style="flex:1; border:none; border-bottom:3px solid transparent; background:none; padding:12px 5px; font-weight:bold; cursor:pointer; color:#999; font-size:13px;">Tiro Bajo</button>
            <button id="btn-ninos" onclick="abrirTabTalles('ninos')" style="flex:1; border:none; border-bottom:3px solid transparent; background:none; padding:12px 5px; font-weight:bold; cursor:pointer; color:#999; font-size:13px;">Niños</button>
        </div>

        <div style="overflow-y:auto; padding:15px;">
            
            <details style="background: #fdfaf7; border: 1px solid #e0d0cc; border-radius: 8px; margin-bottom: 15px; padding: 12px; cursor: pointer;">
                <summary style="font-weight: bold; color: #4e342e; font-size: 13px; list-style: none; display: flex; align-items: center; justify-content: space-between; outline: none;">
                    <span style="display: flex; align-items: center; gap: 5px;">📐 ¿Cómo tomar tus medidas?</span>
                    <span style="font-size: 10px; color: #8d6e63;">Desplegar ▼</span>
                </summary>
                <div style="margin-top: 12px; font-size: 12.5px; color: #444; cursor: default; line-height: 1.4; border-top: 1px dashed #e0d0cc; padding-top: 10px;">
                    <div style="margin-bottom: 10px;">
                        <strong style="color: #4e342e;">• Cintura:</strong> Primero podés medir tu cintura a la altura del ombligo y usar esa medida. Si preferís, también podés apoyar un pantalón cerrado sobre una mesa, medir de punta a punta a la altura de la cintura y multiplicar por dos.
                    </div>
                    <div>
                        <strong style="color: #4e342e;">• Largo / Alto:</strong> Medí por el lateral externo de la pierna, desde la cintura hasta el borde inferior del dobladillo.
                    </div>
                </div>
            </details>
            
            <div id="tab-alto">
                <div style="background:#e8f4f8; color:#0277bd; padding:8px; border-radius:6px; font-size:12px; text-align:center; margin-bottom:15px;">
                    📏 <strong>Largos Especiales:</strong> Corto (-6cm) / Largo (+6cm)
                </div>
                <table style="width:100%; border-collapse:collapse; text-align:center; font-size:14px;">
                    <tr style="background:#f4f4f4; border-bottom:2px solid #ddd;">
                        <th style="padding:10px;">Talle</th><th style="padding:10px;">Cintura</th><th style="padding:10px;">Largo</th>
                    </tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">36</td><td>72 cm</td><td>100 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">38</td><td>76 cm</td><td>101 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">40</td><td>80 cm</td><td>103 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">42</td><td>84 cm</td><td>103 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">44</td><td>88 cm</td><td>104 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">46</td><td>92 cm</td><td>104 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">48</td><td>96 cm</td><td>104 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">50</td><td>100 cm</td><td>104 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">52</td><td>104 cm</td><td>105 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">54</td><td>108 cm</td><td>107 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">56</td><td>112 cm</td><td>107 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">58</td><td>116 cm</td><td>107 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">60</td><td>120 cm</td><td>107 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">62</td><td>124 cm</td><td>107 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">64</td><td>128 cm</td><td>107 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">66</td><td>132 cm</td><td>107 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">68</td><td>136 cm</td><td>107 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">70</td><td>140 cm</td><td>107 cm</td></tr>
                </table>
            </div>

            <div id="tab-bajo" style="display:none;">
                <div style="color:#666; font-size:13px; text-align:center; margin-bottom:15px; font-style:italic;">
                    En tiro bajo (Dama) los talles llegan hasta el 52.
                </div>
                <table style="width:100%; border-collapse:collapse; text-align:center; font-size:14px;">
                    <tr style="background:#f4f4f4; border-bottom:2px solid #ddd;">
                        <th style="padding:10px;">Talle</th><th style="padding:10px;">Cintura</th><th style="padding:10px;">Largo</th>
                    </tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">32</td><td>68 cm</td><td>96 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">34</td><td>72 cm</td><td>96 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">36</td><td>76 cm</td><td>97 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">38</td><td>80 cm</td><td>97 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">40</td><td>84 cm</td><td>100 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">42</td><td>88 cm</td><td>100 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">44</td><td>92 cm</td><td>100 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">46</td><td>96 cm</td><td>101 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">48</td><td>100 cm</td><td>101 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">50</td><td>104 cm</td><td>101 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">52</td><td>108 cm</td><td>102 cm</td></tr>
                </table>
            </div>

            <div id="tab-ninos" style="display:none;">
                <table style="width:100%; border-collapse:collapse; text-align:center; font-size:14px; margin-top:10px;">
                    <tr style="background:#f4f4f4; border-bottom:2px solid #ddd;">
                        <th style="padding:10px;">Talle</th><th style="padding:10px;">Cintura</th><th style="padding:10px;">Largo (Alto)</th>
                    </tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">0</td><td>52 cm</td><td>45 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">2</td><td>56 cm</td><td>51 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">4</td><td>58 cm</td><td>57 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">6</td><td>60 cm</td><td>62 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">8</td><td>62 cm</td><td>68 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">10</td><td>64 cm</td><td>74 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">12</td><td>66 cm</td><td>80 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">14</td><td>68 cm</td><td>85 cm</td></tr>
                    <tr style="border-bottom:1px solid #eee;"><td style="padding:8px; font-weight:bold; color:#4e342e;">16</td><td>70 cm</td><td>91 cm</td></tr>
                </table>
            </div>

        </div>
        
        <div style="padding:15px; border-top:1px solid #eee; background:#fff;">
            <button onclick="document.getElementById('talles-modal').style.display='none'" style="width:100%; padding:12px; background:#4e342e; color:white; border:none; border-radius:8px; font-weight:bold; cursor:pointer; font-size:15px;">Cerrar Tabla</button>
        </div>
    </div>
</div>

<script>
function abrirTabTalles(tab) {
    document.getElementById('tab-alto').style.display = 'none';
    document.getElementById('tab-bajo').style.display = 'none';
    document.getElementById('tab-ninos').style.display = 'none';
    
    document.getElementById('btn-alto').style.color = '#999';
    document.getElementById('btn-alto').style.borderBottomColor = 'transparent';
    document.getElementById('btn-bajo').style.color = '#999';
    document.getElementById('btn-bajo').style.borderBottomColor = 'transparent';
    document.getElementById('btn-ninos').style.color = '#999';
    document.getElementById('btn-ninos').style.borderBottomColor = 'transparent';
    
    document.getElementById('tab-' + tab).style.display = 'block';
    document.getElementById('btn-' + tab).style.color = '#4e342e';
    document.getElementById('btn-' + tab).style.borderBottomColor = '#4e342e';
}
</script>

<script>
// Lógica simple para manejar las pestañas del modal
function abrirTabTalles(tab) {
    // Ocultar todos los contenidos
    document.getElementById('tab-alto').style.display = 'none';
    document.getElementById('tab-bajo').style.display = 'none';
    document.getElementById('tab-ninos').style.display = 'none';
    
    // Resetear estilos de los botones
    document.getElementById('btn-alto').style.color = '#999';
    document.getElementById('btn-alto').style.borderBottomColor = 'transparent';
    document.getElementById('btn-bajo').style.color = '#999';
    document.getElementById('btn-bajo').style.borderBottomColor = 'transparent';
    document.getElementById('btn-ninos').style.color = '#999';
    document.getElementById('btn-ninos').style.borderBottomColor = 'transparent';
    
    // Activar el tab seleccionado
    document.getElementById('tab-' + tab).style.display = 'block';
    document.getElementById('btn-' + tab).style.color = '#4e342e';
    document.getElementById('btn-' + tab).style.borderBottomColor = '#4e342e';
}
</script>

{# --- SCRIPT DEFINITIVO V14: INTERFAZ MINIMALISTA + GUÍA DE TALLES INTEGRADA --- #}
<script type="text/javascript">
LS.ready.then(function(){
    
    if (document.body.classList.contains('template-product')) {
        var h1Nativo = document.querySelector('h1');
        
        if (h1Nativo) {
            var tituloCompleto = h1Nativo.textContent.trim();
            
            if (tituloCompleto.indexOf('-') !== -1) {
                var partes = tituloCompleto.split('-');
                var nombreBase = partes[0].trim();
                var colorActual = partes[1].trim().toLowerCase();
                
                // 1. Limpiamos el H1 para que solo quede el nombre base
                h1Nativo.textContent = nombreBase;
                
                // 2. Paleta con los códigos reales de tus telas
                var paletaColores = {
                    'marron': '#7c533c', 'marrón': '#7c533c',
                    'negro': '#1a1a1a',
                    'azul': '#1d3557',
                    'verde': '#2d4a3e',
                    'rojo': '#b22222',
                    'gris': '#6c757d'
                };

                // 3. Inyectamos la botonera de colores JUSTO debajo del título (Ultra minimalista)
                var htmlBotonera = '<div id="custom-color-box" style="margin: 15px 0 5px 0; display: block; clear: both;">' +
                                   '<div class="color-variants-holder" style="display:flex; gap:10px; flex-wrap: wrap; align-items: center;"></div>' +
                                   '</div>';
                h1Nativo.insertAdjacentHTML('afterend', htmlBotonera);

                function agregarBotonColor(nombreColor, urlDestino) {
                    var colorClean = nombreColor.toLowerCase().trim();
                    var contenedor = document.querySelector('.color-variants-holder');
                    if (!contenedor) return;
                    var tituloID = colorClean.replace('ó', 'o');
                    if (contenedor.querySelector('a[data-color="' + tituloID + '"]')) return;

                    var codigoColor = paletaColores[colorClean] || '#CCCCCC';
                    var esElActual = (colorClean === colorActual);
                    
                    // Círculos más chicos, sin bordes toscos ni fondos grises raros
                    var estiloCirculo = 'display:inline-block; width:28px; height:28px; border-radius:50%; background-color:' + codigoColor + '; border: 1px solid ' + (esElActual ? '#000' : '#e0e0e0') + '; box-shadow: ' + (esElActual ? '0 0 0 2px #fff, 0 0 0 3px #000' : 'none') + '; cursor:pointer; transition: transform 0.2s;';
                    
                    var botonHtml = '<a href="' + urlDestino + '" title="' + nombreColor + '" data-color="' + tituloID + '" style="' + estiloCirculo + '"></a>';
                    contenedor.insertAdjacentHTML('beforeend', botonHtml);
                }

                // Carga de hermanos (Niños / Adultos)
                if (tituloCompleto.toLowerCase().indexOf('niño') !== -1 || tituloCompleto.toLowerCase().indexOf('nino') !== -1) {
                    agregarBotonColor('Marrón', "/productos/bombacha-de-grafa-ninos-tiro-alto-marron/");
                    agregarBotonColor('Negro', "/productos/bombacha-de-grafa-ninos-tiro-alto-negro/");
                } else {
                    agregarBotonColor(partes[1].trim(), window.location.pathname);
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
                                                agregarBotonColor('Azul', href);
                                            } else if (href.indexOf('azul') === -1) {
                                                agregarBotonColor(colorNombre, href);
                                            }
                                        }
                                    });
                                }
                            });
                        });
                }

                // 4. Inyección de la Guía de Talles CORRECTA
                // Apuntamos estrictamente al formulario del producto, no al header
                var formProducto = document.querySelector('.js-product-form');
                if (formProducto) {
                    // Buscamos el contenedor exacto de los talles dentro del form
                    var contenedorTalles = formProducto.querySelector('.js-product-variants') || formProducto.querySelector('.js-variant-option');
                    
                    if (contenedorTalles) {
                        var htmlLinkTalles = '<div style="margin: 10px 0;">' +
                                             '<a href="#" onclick="document.getElementById(\'talles-modal\').style.display=\'flex\'; return false;" ' +
                                             'style="color:#5d4037; font-weight:700; text-decoration:underline; font-size:13px; cursor:pointer; display:inline-flex; align-items:center;">' +
                                             '<svg style="width:16px; height:16px; margin-right:5px; fill:currentColor;" viewBox="0 0 24 24"><path d="M2 4h20v16H2V4zm2 2v12h16V6H4zm2 2h2v8H6V8zm4 0h2v4h-2V8zm4 0h2v8h-2V8z"/></svg>' +
                                             'Ver tabla de medidas' +
                                             '</a></div>';
                        // Lo insertamos justo después de los circulitos de los talles
                        contenedorTalles.insertAdjacentHTML('beforeend', htmlLinkTalles);
                    }
                }

                // 5. TRUCO SEO: CANONICAL DINÁMICO
                // Le decimos a Google que si la URL termina en un color, indexe la versión genérica
                var tagCanonical = document.querySelector('link[rel="canonical"]');
                if (tagCanonical) {
                    var currentPath = window.location.pathname;
                    // Extraemos la última palabra de la URL
                    var ultimoSegmento = currentPath.split('-').pop().replace('/', '').toLowerCase();
                    
                    var coloresSEO = ['marron', 'negro', 'azul', 'verde', 'rojo', 'gris'];
                    
                    // Si la última palabra es un color, modificamos el href que lee Googlebot
                    if (coloresSEO.includes(ultimoSegmento)) {
                        var cleanUrl = window.location.origin + currentPath.replace('-' + ultimoSegmento + '/', '/');
                        tagCanonical.setAttribute('href', cleanUrl);
                        console.log("[SEO] Canonical unificado apuntando a: " + cleanUrl);
                    }
                }
            }
        }
    }

    // Ocultar repetidos en catálogo (Ruta 2 original)
    if (document.body.classList.contains('template-category') || document.body.classList.contains('template-search') || document.body.classList.contains('template-home')) {
        var productosVistos = {};
        var titulosCatalogo = document.querySelectorAll('.js-item-name, .item-name, .product-title, h3, h2');
        
        titulosCatalogo.forEach(function(elementoTitulo) {
            var textoCompleto = elementoTitulo.textContent.trim();
            if (textoCompleto.indexOf('-') !== -1) {
                var partesCat = textoCompleto.split('-');
                var nombreBaseCat = partesCat[0].trim();
                
                if (productosVistos[nombreBaseCat]) {
                    var tarjetaProducto = elementoTitulo.closest('.js-product-container, .js-item-product, .item, .col-xs-6, .col-sm-4, .product-cell, [data-store="product-item"]');
                    if (tarjetaProducto) {
                        tarjetaProducto.style.setProperty('display', 'none', 'important');
                    }
                } else {
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