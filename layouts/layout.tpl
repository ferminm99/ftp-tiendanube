<!DOCTYPE html>
<html class="no-js" lang="{% for language in languages %}{% if language.active %}{{ language.lang }}{% endif %}{% endfor %}"> <head>
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
			{{ component(
				'fonts',{
					font_weights: '300, 400, 700',
					font_settings: 'settings.main_font, settings.default_font'
				})
			}}
			{% snipplet 'css/critical-css.tpl' %}
            
            /* REGLAS DE DISEÑO EXCLUSIVAS MARCA PREMIUM */
            .js-item-product, .item, [data-store="product-item"] {
                border: 1px solid #f5f5f5 !important;
                border-radius: 8px !important;
                padding: 12px !important;
                transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out !important;
                background: #fff !important;
            }
            .js-item-product:hover, .item:hover, [data-store="product-item"]:hover {
                transform: translateY(-4px) !important;
                box-shadow: 0 10px 25px rgba(0,0,0,0.03) !important;
            }
            .color-variants-holder a:hover {
                transform: scale(1.1);
            }
            
            /* OCULTAR PAGOS NATIVOS DEL PRODUCTO - SIN TOCAR TALLES NI CARRITO */
			body.template-product .product-promotions,
			body.template-product .js-installments-element,
			body.template-product .js-max-installments-container,
			body.template-product .js-product-detail-installments,
			body.template-product .js-payment-discount-price-product,
			body.template-product .js-payment-discount-price-product-container,
			body.template-product .js-installments-container,
			body.template-product .js-product-installments,
			body.template-product [data-component="installments"],
			body.template-product [data-store="product-installments"] {
				display: none !important;
			}

            body.template-product #custom-minimal-prices {
				margin: 14px 0 12px 0;
				padding: 16px 0 8px 0;
				clear: both;
				font-family: inherit;
				color: #2f2f2f;
				border-top: 1px solid #e6ded8;
				border-bottom: 0 !important;
			}

			body.template-product #custom-minimal-prices .em-price-row {
				display: flex;
				align-items: center;
				justify-content: space-between;
				gap: 18px;
				padding: 8px 0;
				line-height: 1.25;
			}

			body.template-product #custom-minimal-prices .em-price-label {
				font-size: 15.5px;
				color: #333;
				font-weight: 600;
			}

			body.template-product #custom-minimal-prices .em-price-label small {
				font-size: 15.5px;
				color: #4e342e;
				font-weight: 800;
				margin-left: 6px;
			}

			body.template-product #custom-minimal-prices .em-price-amount {
				font-size: 21px;
				color: #4e342e;
				font-weight: 800;
				white-space: nowrap;
				letter-spacing: -0.2px;
			}

			body.template-product #custom-minimal-prices .em-price-note {
				margin-top: 8px;
				padding-top: 8px;
				border-top: 1px solid #f0ebe7;
				font-size: 13px;
				color: #6b6b6b;
				line-height: 1.4;
			}

            body.template-product #custom-share-after-info {
                margin: 16px 0 0 0;
                padding-top: 14px;
                clear: both;
                border-top: 1px solid #eeeeee;
                font-size: 13.5px;
                color: #666;
            }
            body.template-product #custom-share-after-info a {
                color: #4e342e;
                font-weight: 700;
                text-decoration: none;
            }
            body.template-product #custom-share-after-info a:hover {
                text-decoration: underline;
            }
            @media (max-width: 767px) {
                body.template-product #custom-minimal-prices .em-price-row {
                    display: block;
                    padding: 7px 0;
                }
                body.template-product #custom-minimal-prices .em-price-amount {
                    display: block;
                    margin-top: 2px;
                }
            }

            /* HACK DE DESARROLLADOR: FORZAR CARRUSEL DE INICIO A ANCHO COMPLETO (FULL-WIDTH) */
            @media (min-width: 768px) {
                body.template-home .js-home-slider, 
                body.template-home .home-slider,
                body.template-home .section-slider,
                body.template-home .carrusel-home {
                    width: 100vw !important;
                    position: relative !important;
                    left: 50% !important;
                    right: 50% !important;
                    margin-left: -50vw !important;
                    margin-right: -50vw !important;
                }
            }

            /* AJUSTE V28 - producto: informacion debajo del boton sin tocar el resto */
            body.template-product #em-product-info-after-buy {
                margin: 22px 0 0 0;
                clear: both;
                font-family: inherit;
                color: #333333;
                max-width: 100%;
            }
            body.template-product #em-product-info-after-buy .em-product-description {
                margin: 0 0 18px 0;
                padding: 0 0 16px 0;
                border-bottom: 1px solid #eeeeee;
            }
            body.template-product #em-product-info-after-buy .em-product-description-title {
                margin: 0 0 8px 0;
                font-size: 13px;
                font-weight: 700;
                letter-spacing: 1.4px;
                text-transform: uppercase;
                color: #333333;
            }
            body.template-product #em-product-info-after-buy .em-product-description-content {
                font-size: 14px;
                line-height: 1.6;
                color: #555555;
            }
            body.template-product #em-product-info-after-buy .em-product-description-content p:last-child {
                margin-bottom: 0;
            }
            body.template-product #em-product-info-after-buy .em-product-options {
                border-top: 1px solid #eeeeee;
                border-bottom: 1px solid #eeeeee;
            }
            body.template-product #em-product-info-after-buy details {
                margin: 0;
                padding: 0;
                border-bottom: 1px solid #eeeeee;
            }
            body.template-product #em-product-info-after-buy details:last-child {
                border-bottom: 0;
            }
            body.template-product #em-product-info-after-buy summary {
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 16px;
                padding: 15px 0;
                cursor: pointer;
                list-style: none;
                font-size: 13px;
                font-weight: 700;
                letter-spacing: 1.5px;
                text-transform: uppercase;
                color: #333333;
                outline: none;
            }
            body.template-product #em-product-info-after-buy summary::-webkit-details-marker {
                display: none;
            }
            body.template-product #em-product-info-after-buy summary:after {
                content: "+";
                font-size: 18px;
                font-weight: 300;
                line-height: 1;
                color: #333333;
            }
            body.template-product #em-product-info-after-buy details[open] summary:after {
                content: "-";
            }
            body.template-product #em-product-info-after-buy .em-option-content {
                padding: 0 0 15px 0;
                font-size: 13.5px;
                line-height: 1.55;
                color: #555555;
            }
            body.template-product #em-product-info-after-buy .em-option-content p,
            body.template-product #em-product-info-after-buy .em-option-content ul {
                margin-top: 0;
                margin-bottom: 8px;
            }
            body.template-product #em-product-info-after-buy .em-option-content ul {
                padding-left: 18px;
            }
            body.template-product #em-product-info-after-buy .em-option-content li {
                margin-bottom: 4px;
            }
            body.template-product #em-product-info-after-buy #custom-share-after-info {
                margin: 15px 0 0 0;
                padding: 0;
                border-top: 0;
                font-size: 13.5px;
                color: #666666;
            }
            body.template-product #em-product-info-after-buy #custom-share-after-info a {
                color: #4e342e;
                font-weight: 700;
                text-decoration: none;
            }
            body.template-product #em-product-info-after-buy #custom-share-after-info a:hover {
                text-decoration: underline;
            }

            /* AJUSTE V28 - home: carrusel realmente full width sin deformar la imagen */
            body.template-home .js-main-content,
            body.template-home .main-content {
                overflow-x: hidden !important;
            }
            body.template-home .js-home-slider,
            body.template-home .home-slider,
            body.template-home .section-slider,
            body.template-home .carrusel-home,
            body.template-home [data-store="home-slider"],
            body.template-home [data-store="slider"] {
                width: 100vw !important;
                max-width: 100vw !important;
                min-width: 100vw !important;
                position: relative !important;
                left: 50% !important;
                right: auto !important;
                margin-left: -50vw !important;
                margin-right: 0 !important;
                padding-left: 0 !important;
                padding-right: 0 !important;
                overflow: hidden !important;
                box-sizing: border-box !important;
            }
            body.template-home .js-home-slider .container,
            body.template-home .home-slider .container,
            body.template-home .section-slider .container,
            body.template-home .carrusel-home .container,
            body.template-home [data-store="home-slider"] .container,
            body.template-home [data-store="slider"] .container {
                width: 100% !important;
                max-width: none !important;
                padding-left: 0 !important;
                padding-right: 0 !important;
                margin-left: 0 !important;
                margin-right: 0 !important;
            }
            body.template-home .js-home-slider img,
            body.template-home .home-slider img,
            body.template-home .section-slider img,
            body.template-home .carrusel-home img,
            body.template-home [data-store="home-slider"] img,
            body.template-home [data-store="slider"] img {
                width: 100vw !important;
                max-width: 100vw !important;
                min-width: 100vw !important;
                height: auto !important;
                max-height: none !important;
                display: block !important;
                object-fit: contain !important;
                object-position: center center !important;
                margin: 0 auto !important;
            }
            body.template-home .js-home-slider picture,
            body.template-home .home-slider picture,
            body.template-home .section-slider picture,
            body.template-home .carrusel-home picture,
            body.template-home [data-store="home-slider"] picture,
            body.template-home [data-store="slider"] picture {
                display: block !important;
                width: 100vw !important;
                max-width: 100vw !important;
            }
            body.template-home .js-home-slider .slick-slide,
            body.template-home .home-slider .slick-slide,
            body.template-home .section-slider .slick-slide,
            body.template-home .carrusel-home .slick-slide,
            body.template-home [data-store="home-slider"] .slick-slide,
            body.template-home [data-store="slider"] .slick-slide,
            body.template-home .js-home-slider .swiper-slide,
            body.template-home .home-slider .swiper-slide,
            body.template-home .section-slider .swiper-slide,
            body.template-home .carrusel-home .swiper-slide,
            body.template-home [data-store="home-slider"] .swiper-slide,
            body.template-home [data-store="slider"] .swiper-slide {
                overflow: hidden !important;
            }
            body.template-home .js-home-slider [style*="background-image"],
            body.template-home .home-slider [style*="background-image"],
            body.template-home .section-slider [style*="background-image"],
            body.template-home .carrusel-home [style*="background-image"],
            body.template-home [data-store="home-slider"] [style*="background-image"],
            body.template-home [data-store="slider"] [style*="background-image"] {
                width: 100vw !important;
                max-width: 100vw !important;
                background-size: 100% auto !important;
                background-repeat: no-repeat !important;
                background-position: center center !important;
            }

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
	{% set show_help = not has_products %}
    {% if "default-background.jpg" | has_custom_image %}
	<body class="{% if customer %}customer-logged-in{% endif %} template-{{ template | replace('.', '-') }} user-background {% if not settings.bg_repeat %}bg-no-repeat{% endif %}" style="background-position-x:{{ settings.bg_position_x }};">
	{% else %}
	<body class="{% if customer %}customer-logged-in{% endif %} template-{{ template | replace('.', '-') }} pattern-background">
	{% endif %}

	{{ component('nubesdk-slot', { type: "before_main_content" }) }}

	{% if template == 'home' %}
	    {% if settings.twitter_widget %}
	        {{ tw_js }}
	    {% endif %}
	{% endif %}

	{% if template == 'product' %}
	    {% if settings.show_product_fb_comment_box %}
	        {{ fb_js }}
	    {% endif %}
	    {{ pin_js }}
	{% endif %}

	<nav class="hamburger-panel js-hamburger-panel">
        {% snipplet "navigation/navigation-hamburger-panel.tpl" %}
    </nav>

	<div class="js-hamburger-overlay js-toggle-hamburger-panel hamburger-overlay backdrop"></div>

	<div class="js-search-backdrop js-toggle-mobile-search search-backdrop backdrop container-fluid full-width" style="display: none;"></div>

    <div class="p-relative visible-xs">
        {% if settings.ad_bar and settings.ad_text %}
        	<div class="p-relative" data-store="head-adbar">
            	{% snipplet "advertising.tpl" %}
            </div>
        {% endif %}
    	{% snipplet "navigation/navigation-mobile.tpl" %}
    </div>

	{% if template == 'home' or template == 'product' %}
		{% include "snipplets/notification.tpl" with {show_quick_login: true} %}
	{% endif %}

	{% include "snipplets/notification.tpl" with {show_cookie_banner: true} %}

    <div class="js-main-content main-content">
		<div class="js-nav-head nav-head" data-store="head-desktop">

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
									<div class="js-search-suggest search-suggest"></div>
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
							<div class="js-search-suggest search-suggest"></div>
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
						{{ new_powered_by_link }}
					</div>
				</div>
			</div>
		</div>
	</div>
	
	{% if not store.is_catalog and template != 'cart' and settings.ajax_cart %}
		{% snipplet "cart-panel-ajax.tpl" %}
		{% if settings.add_to_cart_recommendations %}
			{% snipplet "cart-recommendations-modal.tpl" %}
		{% endif %}
    	{% snipplet "cross-selling-modal.tpl" %}
	{% endif %}
	
	{% snipplet "quick-shop.tpl" %}
	{% snipplet "quick-login.tpl" %}

	{% if store.whatsapp %}
        <a href="{{ store.whatsapp }}" target="_blank" class="js-btn-fixed-bottom btn-whatsapp btn-floating fixed-bottom visible-when-content-ready" aria-label="{{ 'Comunicate por WhatsApp' | translate }}">
            {% include "snipplets/svg/whatsapp.tpl" %}
        </a>
    {% endif %}

	{% if cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}
		<span class="js-ship-free-min hidden" data-pricemin="{{ cart.free_shipping.min_price_free_shipping.min_price_raw }}"></span>
        <span class="js-free-shipping-config hidden" data-config="{{ cart.free_shipping.allFreeConfigurations }}"></span>
		<span class="js-cart-subtotal hidden" data-priceraw="{{ cart.subtotal }}"></span>
		<span class="js-cart-discount hidden" data-priceraw="{{ cart.promotional_discount_amount }}"></span>
	{% endif %}

<script type="text/javascript">
	{% include "static/js/external-no-dependencies.js.tpl" %}
	LS.ready.then(function(){
		{% snipplet "js/external.js.tpl"  %}
		{% if store.useStoreJsV2() %}
			{% include "static/js/store-v2.js.tpl" %}
		{% else %}
			{% include "static/js/store.js.tpl" %}
		{% endif %}
	});
</script>

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

{{ component('google-survey') }}

{% if store.assorted_js %}
<script>
    LS.ready.then(function() {
        var trackingCode = jQueryNuvem.parseHTML('{{ store.assorted_js| escape("js") }}', document, true);
        jQueryNuvem('body').append(trackingCode);
    });
</script>
{% endif %}

<div id="welcome-popup-overlay" style="display:none; position:fixed; z-index:999999; left:0; top:0; width:100%; height:100%; background:rgba(0,0,0,0.6); align-items:center; justify-content:center; opacity:0; transition: opacity 0.4s ease;">
    <div style="background:white; width:90%; max-width:420px; border-radius:16px; position:relative; box-shadow: 0 20px 45px rgba(0,0,0,0.2); overflow:hidden; text-align:center; padding:35px 25px; box-sizing: border-box;">
        <button onclick="cerrarPopupBienvenida()" style="position:absolute; right:15px; top:12px; border:none; background:none; font-size:24px; cursor:pointer; color:#aaa; line-height:1; outline:none;">&times;</button>
        
        <div id="popup-initial-content">
            <span style="font-size:32px;">🎁</span>
            <h3 style="margin:12px 0 6px 0; font-weight:900; font-size:21px; color:#4e342e; text-transform:uppercase; letter-spacing:0.5px; font-family:inherit;">¡Te regalamos $2000!</h3>
            <p style="margin:0 0 22px 0; font-size:13.5px; color:#666; font-weight:300; line-height:1.5;">Dejanos tu email para sumarte al newsletter y llevate un cupón de regalo inmediato para tu primera compra.</p>
            <input type="email" id="popup-subscriber-email" placeholder="Tu correo electrónico" style="width:100%; padding:14px; border:1px solid #ddd; border-radius:8px; font-size:14px; margin-bottom:12px; outline:none; text-align:center; box-sizing:border-box; background:#fafafa;">
            <button onclick="enviarNewsletterPopup()" style="width:100%; padding:14px; background:#4e342e; color:white; border:none; border-radius:8px; font-weight:bold; font-size:13.5px; cursor:pointer; text-transform:uppercase; letter-spacing:0.5px; transition: background 0.2s;">Conseguir mi regalo</button>
        </div>
        
        <div id="popup-success-content" style="display:none;">
            <span style="font-size:32px;">🎉</span>
            <h3 style="margin:12px 0 6px 0; font-weight:900; font-size:21px; color:#4e342e; font-family:inherit;">¡Tu código está listo!</h3>
            <p style="margin:0 0 15px 0; font-size:13.5px; color:#555; font-weight:300;">Ingresá este cupón en tu carrito antes de finalizar el pago:</p>
            <div style="background:#fdfaf7; border:2px dashed #e0d0cc; padding:14px; border-radius:10px; font-size:19px; font-weight:900; color:#4e342e; font-family:monospace; letter-spacing:1px; margin-bottom:22px; box-sizing: border-box;">ELMENSUAL2000</div>
            <button onclick="cerrarPopupBienvenida()" style="width:100%; padding:12px; background:#4e342e; color:white; border:none; border-radius:8px; font-weight:bold; font-size:13.5px; cursor:pointer; text-transform:uppercase;">Empezar a comprar</button>
        </div>
    </div>
</div>

<script>
function cerrarPopupBienvenida() {
    var overlay = document.getElementById('welcome-popup-overlay');
    if (overlay) {
        overlay.style.opacity = '0';
        setTimeout(function() { overlay.style.display = 'none'; }, 400);
    }
    localStorage.setItem('popup_bienvenida_elmensual_v1', 'true');
}

function enviarNewsletterPopup() {
    var email = document.getElementById('popup-subscriber-email').value.trim();
    if (email && email.indexOf('@') !== -1) {
        fetch('https://tu-backend-railway.up.railway.app/api/alertas-stock', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ contacto: email, sku: 'NEWSLETTER-POPUP' })
        }).catch(function(){});

        document.getElementById('popup-initial-content').style.display = 'none';
        document.getElementById('popup-success-content').style.display = 'block';
        localStorage.setItem('popup_bienvenida_elmensual_v1', 'true');
    } else {
        alert('Por favor, ingresá un correo electrónico válido.');
    }
}
</script>

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

{# --- SCRIPT DEFINITIVO V28 --- #}
<script type="text/javascript">
LS.ready.then(function(){

    function emTextoPlano(elemento) {
        if (!elemento) return '';
        var texto = (elemento.textContent || '').replace(/\s+/g, ' ').trim().toLowerCase();
        if (texto.normalize) {
            texto = texto.normalize('NFD').replace(/[\u0300-\u036f]/g, '');
        }
        return texto;
    }

    function emEscapeHTML(texto) {
        return String(texto || '').replace(/[&<>"]/g, function(caracter) {
            return {
                '&': '&amp;',
                '<': '&lt;',
                '>': '&gt;',
                '"': '&quot;'
            }[caracter];
        });
    }

    function emPrecioDesdeTexto(texto) {
        var limpio = (texto || '').replace(/[^0-9,\.]/g, '');
        if (!limpio) return 0;

        var ultimaComa = limpio.lastIndexOf(',');
        var ultimoPunto = limpio.lastIndexOf('.');

        if (ultimaComa > ultimoPunto) {
            limpio = limpio.replace(/\./g, '').replace(',', '.');
        } else {
            limpio = limpio.replace(/,/g, '');
        }

        var numero = parseFloat(limpio);
        return isNaN(numero) ? 0 : numero;
    }

    function emDentroDeBloquePropio(elemento) {
        return !!(elemento && elemento.closest && (
            elemento.closest('#custom-minimal-prices') ||
            elemento.closest('#custom-share-after-info') ||
            elemento.closest('#em-product-info-after-buy')
        ));
    }

    function emBloqueSeguro(elemento) {
        if (!elemento || emDentroDeBloquePropio(elemento)) return null;

        var actual = elemento;
        while (actual && actual !== document.body) {
            if (emDentroDeBloquePropio(actual)) return null;
            if (actual.classList && actual.classList.contains('js-product-form')) {
                return elemento;
            }
            var texto = emTextoPlano(actual);
            if (texto && texto.length <= 380) {
                return actual;
            }
            actual = actual.parentElement;
        }
        return elemento;
    }

    function emOcultar(elemento) {
        var bloque = emBloqueSeguro(elemento);
        if (bloque && bloque.style) {
            bloque.style.setProperty('display', 'none', 'important');
            bloque.setAttribute('data-em-hidden', 'true');
        }
    }

    function emOcultarBloqueYVecinosChicos(elemento) {
        var bloque = emBloqueSeguro(elemento);
        if (!bloque || !bloque.style) return;

        bloque.style.setProperty('display', 'none', 'important');
        bloque.setAttribute('data-em-hidden', 'true');

        var vecino = bloque.nextElementSibling;
        var pasos = 0;
        while (vecino && pasos < 4) {
            var textoVecino = emTextoPlano(vecino);
            var debeOcultar =
                textoVecino.indexOf('tus datos cuidados') !== -1 ||
                textoVecino.indexOf('compra protegida') !== -1 ||
                textoVecino.indexOf('pago protegido') !== -1 ||
                textoVecino.indexOf('si no te gusta') !== -1 ||
                textoVecino === 'cambios y devoluciones';

            if (!debeOcultar || emDentroDeBloquePropio(vecino)) break;

            vecino.style.setProperty('display', 'none', 'important');
            vecino.setAttribute('data-em-hidden', 'true');
            vecino = vecino.nextElementSibling;
            pasos++;
        }
    }

    function emCrearBloquePagos() {
        var contenedorPrecio = document.querySelector('body.template-product .js-price-display, body.template-product .product-price, body.template-product #price_display');
        if (!contenedorPrecio) return;

        var precioLimpio = emPrecioDesdeTexto(contenedorPrecio.textContent);
        if (!precioLimpio || precioLimpio <= 0) return;

        var formatoMoneda = new Intl.NumberFormat('es-AR', {
            style: 'currency',
            currency: 'ARS',
            minimumFractionDigits: 0,
            maximumFractionDigits: 0
        });

        var precioTransferencia = precioLimpio * 0.85;
        var precioEfectivoRetiro = precioLimpio * 0.80;
        var cuotaTres = precioLimpio / 3;

        var cajaVieja = document.getElementById('custom-minimal-prices');
        if (cajaVieja) cajaVieja.remove();

        var htmlTablaPagos = '' +
            '<div id="custom-minimal-prices" aria-label="Opciones de pago">' +
                '<div class="em-price-row">' +
                    '<span class="em-price-label">Transferencia <small>15% off</small></span>' +
                    '<strong class="em-price-amount">' + formatoMoneda.format(precioTransferencia) + '</strong>' +
                '</div>' +
                '<div class="em-price-row">' +
                    '<span class="em-price-label">Efectivo con punto de retiro <small>20% off</small></span>' +
                    '<strong class="em-price-amount">' + formatoMoneda.format(precioEfectivoRetiro) + '</strong>' +
                '</div>' +
                '<div class="em-price-row">' +
                    '<span class="em-price-label">Hasta 3 cuotas sin inter&eacute;s</span>' +
                    '<strong class="em-price-amount">' + formatoMoneda.format(cuotaTres) + ' c/u</strong>' +
                '</div>' +
                '<div class="em-price-note">Precio de f&aacute;brica: llevando 7 prendas o m&aacute;s obten&eacute;s descuento mayorista autom&aacute;tico.</div>' +
            '</div>';

        if (contenedorPrecio.parentElement) {
            contenedorPrecio.parentElement.insertAdjacentHTML('beforeend', htmlTablaPagos);
        }
    }

    function emLimpiarNativosProducto() {
		if (!document.body.classList.contains('template-product')) return;

		var selectoresSeguros = [
			'.product-promotions',
			'.js-installments-element',
			'.js-max-installments-container',
			'.js-product-detail-installments',
			'.js-payment-discount-price-product',
			'.js-payment-discount-price-product-container',
			'.js-installments-container',
			'.js-product-installments',
			'[data-component="installments"]',
			'[data-store="product-installments"]'
		];

		selectoresSeguros.forEach(function(selector) {
			document.querySelectorAll('body.template-product ' + selector).forEach(function(elemento) {
				if (!emDentroDeBloquePropio(elemento) && !elemento.closest('.js-product-form')) {
					elemento.style.setProperty('display', 'none', 'important');
					elemento.setAttribute('data-em-hidden', 'true');
				}
			});
		});

		document.querySelectorAll('body.template-product a, body.template-product button, body.template-product span, body.template-product p, body.template-product div').forEach(function(elemento) {
			if (emDentroDeBloquePropio(elemento)) return;

			var texto = emTextoPlano(elemento);
			if (!texto || texto.length > 220) return;

			var esPagoNativo =
				texto === 'ver medios de pago' ||
				texto.indexOf('mercado pago') !== -1 ||
				texto.indexOf('hasta 6 cuotas') !== -1 ||
				texto.indexOf('6 cuotas fijas') !== -1 ||
				texto.indexOf('cuotas fijas') !== -1 ||
				texto.indexOf('descuento pagando con') !== -1 ||
				texto.indexOf('20% de descuento') !== -1 ||
				texto.indexOf('15% de descuento') !== -1 ||
				texto.indexOf('pagando con efectivo') !== -1 ||
				texto.indexOf('pagando con transferencia') !== -1;

			var esProteccionOCambioNativo =
				texto.indexOf('compra protegida') !== -1 ||
				texto.indexOf('pago protegido') !== -1 ||
				texto.indexOf('tus datos cuidados') !== -1 ||
				texto.indexOf('tus datos siempre protegidos') !== -1 ||
				texto.indexOf('si no te gusta') !== -1 ||
				texto.indexOf('podes cambiarlo') !== -1 ||
				texto.indexOf('podés cambiarlo') !== -1 ||
				texto.indexOf('podes devolverlo') !== -1 ||
				texto.indexOf('podés devolverlo') !== -1 ||
				texto.indexOf('cambiarlo por otro') !== -1 ||
				texto === 'cambios y devoluciones';

			var esCompartirViejo =
				texto.indexOf('compartir pilcha') !== -1;

			if (esPagoNativo || esProteccionOCambioNativo || esCompartirViejo) {
				elemento.style.setProperty('display', 'none', 'important');
				elemento.setAttribute('data-em-hidden', 'true');

				var candidato = elemento.parentElement;
				var pasos = 0;

				while (candidato && candidato !== document.body && pasos < 4) {
					if (
						candidato.closest('.js-product-form') ||
						emDentroDeBloquePropio(candidato)
					) {
						break;
					}

					var textoCandidato = emTextoPlano(candidato);

					if (
						textoCandidato.length < 520 &&
						(
							textoCandidato.indexOf('compra protegida') !== -1 ||
							textoCandidato.indexOf('pago protegido') !== -1 ||
							textoCandidato.indexOf('tus datos cuidados') !== -1 ||
							textoCandidato.indexOf('si no te gusta') !== -1 ||
							textoCandidato.indexOf('cambios y devoluciones') !== -1 ||
							textoCandidato.indexOf('descuento pagando con') !== -1 ||
							textoCandidato.indexOf('mercado pago') !== -1 ||
							textoCandidato.indexOf('cuotas fijas') !== -1
						)
					) {
						candidato.style.setProperty('display', 'none', 'important');
						candidato.setAttribute('data-em-hidden', 'true');
					}

					candidato = candidato.parentElement;
					pasos++;
				}
			}
		});
	}

    function emDescripcionProducto() {
        var selectoresDescripcion = [
            '[data-store*="product-description"]',
            '.js-product-description',
            '.product-description',
            '.product-detail-description',
            '#product-description',
            '.description',
            '.user-content'
        ];

        var candidato = null;
        var mejorLongitud = 0;

        selectoresDescripcion.forEach(function(selector) {
            document.querySelectorAll('body.template-product ' + selector).forEach(function(elemento) {
                if (candidato && mejorLongitud > 120) return;
                if (!elemento || emDentroDeBloquePropio(elemento)) return;
                if (elemento.closest('form, header, footer, nav, .footer, .nav-head, .js-product-form, .social-networks, .product-sharing, .share-links')) return;

                var texto = emTextoPlano(elemento);
                if (!texto || texto.length < 25 || texto.length > 5000) return;
                if (texto.indexOf('formas de pago') !== -1 || texto.indexOf('envios y retiros') !== -1 || texto.indexOf('cambios y devoluciones') !== -1) return;
                if (texto.indexOf('productos similares') !== -1 || texto.indexOf('inicio productos contacto') !== -1) return;
                if (texto.indexOf('transferencia') !== -1 && texto.indexOf('cuotas') !== -1) return;

                if (texto.length > mejorLongitud) {
                    candidato = elemento;
                    mejorLongitud = texto.length;
                }
            });
        });

        if (candidato) {
            var clon = candidato.cloneNode(true);
            clon.querySelectorAll('script, style, iframe, form, input, button, select, textarea').forEach(function(nodo) {
                nodo.parentNode.removeChild(nodo);
            });
            var html = clon.innerHTML.replace(/\s+/g, ' ').trim();
            if (html) {
                candidato.style.setProperty('display', 'none', 'important');
                candidato.setAttribute('data-em-description-source', 'true');
                return html;
            }
        }

        var metaDescripcion = document.querySelector('meta[name="description"]');
        if (metaDescripcion && metaDescripcion.getAttribute('content')) {
            var contenido = metaDescripcion.getAttribute('content').trim();
            if (contenido.length > 25) {
                return '<p>' + emEscapeHTML(contenido) + '</p>';
            }
        }

        return '';
    }

    function emPuntoInsercionInfoProducto() {
		var formCompra = document.querySelector('body.template-product .js-product-form');
		if (formCompra) return formCompra;

		var botonCompra = document.querySelector('body.template-product .js-add-to-cart-btn, body.template-product button[type="submit"], body.template-product input[type="submit"], body.template-product [data-component="add-to-cart"]');
		if (botonCompra) return botonCompra.parentElement;

		return document.getElementById('custom-minimal-prices');
	}

    function emInsertarInfoProducto() {
        if (document.getElementById('em-product-info-after-buy')) return;

        var puntoInsercion = emPuntoInsercionInfoProducto();
        if (!puntoInsercion || !puntoInsercion.insertAdjacentHTML) return;

        var tituloProducto = document.querySelector('h1') ? document.querySelector('h1').textContent.trim() : document.title;
        var textoWhatsApp = encodeURIComponent(tituloProducto + ' - ' + window.location.href);
        var urlWhatsApp = 'https://wa.me/?text=' + textoWhatsApp;
        var descripcionHtml = emDescripcionProducto();

        var bloqueDescripcion = descripcionHtml ?
            '<div class="em-product-description">' +
                '<h3 class="em-product-description-title">Descripci&oacute;n</h3>' +
                '<div class="em-product-description-content">' + descripcionHtml + '</div>' +
            '</div>' : '';

        var htmlInfo = '' +
            '<div id="em-product-info-after-buy">' +
                bloqueDescripcion +
                '<div class="em-product-options" aria-label="Informaci&oacute;n del producto">' +
                    '<details>' +
                        '<summary>Formas de pago</summary>' +
                        '<div class="em-option-content">' +
                            '<ul>' +
                                '<li>Hasta 3 cuotas sin inter&eacute;s con tarjeta.</li>' +
                                '<li>15% off por transferencia.</li>' +
                                '<li>20% off en efectivo con punto de retiro.</li>' +
                            '</ul>' +
                        '</div>' +
                    '</details>' +
                    '<details>' +
                        '<summary>Env&iacute;os y retiros</summary>' +
                        '<div class="em-option-content">' +
                            '<p>Hacemos env&iacute;os a todo el pa&iacute;s. Tambi&eacute;n pod&eacute;s coordinar retiro por punto de retiro.</p>' +
                        '</div>' +
                    '</details>' +
                    '<details>' +
                        '<summary>Cambios y devoluciones</summary>' +
                        '<div class="em-option-content">' +
                            '<p>Para cambios o devoluciones, escribinos y coordinamos la gesti&oacute;n. La prenda debe estar sin uso y en el mismo estado en que fue entregada.</p>' +
                        '</div>' +
                    '</details>' +
                '</div>' +
            '</div>';

        puntoInsercion.insertAdjacentHTML('afterend', htmlInfo);
    }

	function emAgregarWhatsappANativo() {
		if (!document.body.classList.contains('template-product')) return;
		if (document.getElementById('em-share-whatsapp-native')) return;

		var shareBox = null;

		document.querySelectorAll('body.template-product div, body.template-product ul').forEach(function(el) {
			if (shareBox) return;

			var texto = emTextoPlano(el);
			if (
				texto.indexOf('compartir') !== -1 &&
				(
					el.querySelector('a[href*="facebook"]') ||
					el.querySelector('a[href*="twitter"]') ||
					el.querySelector('a[href*="pinterest"]') ||
					el.querySelector('.svg-inline--fa')
				)
			) {
				shareBox = el;
			}
		});

		if (!shareBox) return;

		var tituloProducto = document.querySelector('h1') ? document.querySelector('h1').textContent.trim() : document.title;
		var urlWhatsApp = 'https://wa.me/?text=' + encodeURIComponent(tituloProducto + ' - ' + window.location.href);

		var link = document.createElement('a');
		link.id = 'em-share-whatsapp-native';
		link.href = urlWhatsApp;
		link.target = '_blank';
		link.rel = 'noopener';
		link.setAttribute('aria-label', 'Compartir por WhatsApp');
		link.style.display = 'inline-flex';
		link.style.alignItems = 'center';
		link.style.justifyContent = 'center';
		link.style.marginLeft = '8px';
		link.style.verticalAlign = 'middle';
		link.innerHTML = '<svg width="17" height="17" viewBox="0 0 32 32" aria-hidden="true" style="display:block;"><path fill="currentColor" d="M16.04 3C9.4 3 4 8.4 4 15.04c0 2.12.55 4.18 1.6 6L4 29l8.16-1.52c1.15.62 2.48.95 3.88.95 6.64 0 12.04-5.4 12.04-12.04S22.68 3 16.04 3zm0 22.9c-1.22 0-2.4-.32-3.43-.94l-.25-.15-4.83.9.92-4.7-.17-.27a9.5 9.5 0 0 1-1.47-5.08c0-5.1 4.15-9.25 9.25-9.25s9.25 4.15 9.25 9.25-4.15 10.24-9.27 10.24zm5.06-6.92c-.28-.14-1.64-.8-1.9-.9-.25-.1-.44-.14-.63.14-.18.27-.72.9-.88 1.08-.16.18-.32.2-.6.07-.28-.14-1.18-.43-2.25-1.38-.83-.74-1.4-1.66-1.56-1.94-.16-.28-.02-.43.12-.57.13-.13.28-.32.42-.48.14-.16.18-.28.28-.46.1-.18.05-.35-.02-.49-.07-.14-.63-1.52-.86-2.08-.23-.55-.46-.47-.63-.48h-.54c-.18 0-.49.07-.74.35-.25.28-.97.95-.97 2.32s.99 2.7 1.13 2.88c.14.18 1.95 2.98 4.73 4.18.66.28 1.18.45 1.58.58.66.21 1.27.18 1.75.11.53-.08 1.64-.67 1.87-1.32.23-.65.23-1.2.16-1.32-.07-.12-.25-.19-.53-.33z"/></svg>';

		var ul = shareBox.querySelector('ul');
		if (ul) {
			var li = document.createElement('li');
			li.style.display = 'inline-block';
			li.style.marginLeft = '6px';
			li.appendChild(link);
			ul.appendChild(li);
		} else {
			shareBox.appendChild(link);
		}
	}

    function emAjustarCarruselHome() {
        if (!document.body.classList.contains('template-home')) return;

        var selectoresSlider = [
            '.js-home-slider',
            '.home-slider',
            '.section-slider',
            '.carrusel-home',
            '[data-store="home-slider"]',
            '[data-store="slider"]'
        ];

        selectoresSlider.forEach(function(selector) {
            document.querySelectorAll(selector).forEach(function(slider) {
                slider.style.setProperty('width', '100vw', 'important');
                slider.style.setProperty('max-width', '100vw', 'important');
                slider.style.setProperty('min-width', '100vw', 'important');
                slider.style.setProperty('left', '50%', 'important');
                slider.style.setProperty('margin-left', '-50vw', 'important');
                slider.style.setProperty('padding-left', '0', 'important');
                slider.style.setProperty('padding-right', '0', 'important');
                slider.style.setProperty('overflow', 'hidden', 'important');

                slider.querySelectorAll('img').forEach(function(img) {
                    img.style.setProperty('width', '100vw', 'important');
                    img.style.setProperty('max-width', '100vw', 'important');
                    img.style.setProperty('min-width', '100vw', 'important');
                    img.style.setProperty('height', 'auto', 'important');
                    img.style.setProperty('object-fit', 'contain', 'important');
                    img.style.setProperty('display', 'block', 'important');
                });
            });
        });
    }

    // DETECTOR PARA LEVANTAR EL POPUP DE BIENVENIDA A LOS 3 SEGUNDOS
    if (!localStorage.getItem('popup_bienvenida_elmensual_v1')) {
        setTimeout(function() {
            var overlayPopup = document.getElementById('welcome-popup-overlay');
            if (overlayPopup) {
                overlayPopup.style.display = 'flex';
                setTimeout(function() { overlayPopup.style.opacity = '1'; }, 50);
            }
        }, 3000);
    }

    if (document.body.classList.contains('template-product')) {

		
        emCrearBloquePagos();
        emInsertarInfoProducto();
        emLimpiarNativosProducto();

        var intentosLimpiezaProducto = 0;
        var limpiezaProducto = setInterval(function() {
			emCrearBloquePagos();
			emInsertarInfoProducto();
			emLimpiarNativosProducto();
			intentosLimpiezaProducto++;
			if (intentosLimpiezaProducto > 40) clearInterval(limpiezaProducto);
		}, 250);

		var emObserverProducto = new MutationObserver(function() {
			emLimpiarNativosProducto();
			emAgregarWhatsappANativo();
		});

		emObserverProducto.observe(document.body, {
			childList: true,
			subtree: true
		});

        // 1. ASESINO DE VARIANTES SEGURO Y COMPACTO
        var intentos = 0;
        var matarVariante = setInterval(function() {
            var labels = document.querySelectorAll('.js-product-variants label, .form-group label, .variant-label, .js-variant-name');
            labels.forEach(function(label) {
                var texto = emTextoPlano(label);
                if (texto.indexOf('color') !== -1) {
                    var caja = label.closest('.js-variant-option') || label.closest('.js-product-variants-group') || label.parentElement;
                    if (caja) {
                        caja.style.setProperty('display', 'none', 'important');
                    }
                }
            });
            intentos++;
            if (intentos > 40) clearInterval(matarVariante);
        }, 100);

        var h1Nativo = document.querySelector('h1');

        if (h1Nativo) {
            var tituloCompleto = h1Nativo.textContent.trim();

            if (tituloCompleto.indexOf('-') !== -1) {
                var partes = tituloCompleto.split('-');
                var nombreBase = partes[0].trim();
                var colorActual = partes[1].trim().toLowerCase();
                var nombreBaseLower = nombreBase.toLowerCase();

                h1Nativo.textContent = nombreBase;

                // 2. PALETA GLOBAL
                var paletaColores = {
                    'azul': '#1d3557',
                    'negro': '#1a1a1a',
                    'marron': '#7c533c', 'marr\u00f3n': '#7c533c',
                    'chocolate': '#3d2314',
                    'verde': '#2d4a3e',
                    'bordo': '#58111a', 'bord\u00f3': '#58111a', 'bordeaux': '#58111a',
                    'beige': '#ede6d6', 'bege': '#ede6d6',
                    'gris': '#8a8a8a',
                    'blanco': '#ffffff'
                };

                // 3. MAPEO DE TELAS CORREGIDO AL DETALLE
                var coloresAInyectar = [];

                if (nombreBaseLower.indexOf('grafa') !== -1) {
                    coloresAInyectar = ['verde', 'negro', 'azul', 'marron'];
                }
                else if (nombreBaseLower.indexOf('poplin') !== -1 || nombreBaseLower.indexOf('popl\u00edn') !== -1) {
                    coloresAInyectar = ['gris', 'verde', 'azul', 'negro', 'marron', 'beige'];
                }
                else if (nombreBaseLower.indexOf('corderoy') !== -1) {
                    coloresAInyectar = ['azul', 'verde', 'negro', 'marron', 'chocolate', 'gris'];
                }
                else if (nombreBaseLower.indexOf('alpargata') !== -1) {
                    coloresAInyectar = ['azul', 'negro', 'bordo'];
                }
                else {
                    coloresAInyectar = [colorActual];
                }

                if (!coloresAInyectar.includes(colorActual)) {
                    coloresAInyectar.push(colorActual);
                }

                // 4. RENDER DE BOTONERA INSTANTANEA
                if (!document.getElementById('custom-color-box')) {
                    var htmlBotonera = '<div id="custom-color-box" style="margin: 15px 0 5px 0; display: block; clear: both;">' +
                                       '<div class="color-variants-holder" style="display:flex; gap:10px; flex-wrap: wrap; align-items: center;"></div>' +
                                       '</div>';
                    h1Nativo.insertAdjacentHTML('afterend', htmlBotonera);
                }

                var contenedor = document.querySelector('.color-variants-holder');

                if (contenedor && !contenedor.getAttribute('data-em-ready')) {
                    var currentPath = window.location.pathname;
                    var regexColor = new RegExp('-' + colorActual + '/?$');
                    var urlBase = currentPath.replace(regexColor, '');

                    coloresAInyectar.forEach(function(color) {
                        var codigoColor = paletaColores[color] || '#CCCCCC';
                        var esElActual = (color === colorActual);

                        var nombreMostrar = color.charAt(0).toUpperCase() + color.slice(1);
                        if (nombreMostrar === 'Marron') nombreMostrar = 'Marr\u00f3n';
                        if (nombreMostrar === 'Bordo') nombreMostrar = 'Bord\u00f3';

                        var urlDestino = urlBase + '-' + color + '/';

                        var estiloCirculo = 'display:inline-block; width:28px; height:28px; border-radius:50%; background-color:' + codigoColor + '; border: 1px solid ' + (esElActual ? '#000' : '#e0e0e0') + '; box-shadow: ' + (esElActual ? '0 0 0 2px #fff, 0 0 0 3px #000' : 'none') + '; cursor:pointer; transition: transform 0.2s;';

                        var botonHtml = '<a href="' + urlDestino + '" title="' + nombreMostrar + '" data-color="' + color + '" style="' + estiloCirculo + '"></a>';
                        contenedor.insertAdjacentHTML('beforeend', botonHtml);
                    });
                    contenedor.setAttribute('data-em-ready', 'true');
                }

                // 5. Inyeccion de la tabla de medidas
                var formProducto = document.querySelector('.js-product-form');
                if (formProducto && !document.getElementById('custom-size-guide-link')) {
                    var contenedorTalles = formProducto.querySelector('.js-product-variants') || formProducto.querySelector('.js-variant-option');
                    if (contenedorTalles) {
                        var htmlLinkTalles = '<div id="custom-size-guide-link" style="margin: 8px 0 12px 0; clear:both;">' +
                                             '<a href="#" onclick="document.getElementById(\'talles-modal\').style.display=\'flex\'; return false;" ' +
                                             'style="color:#8d6e63; font-weight:400; text-decoration:underline; font-size:12.5px; cursor:pointer; display:inline-flex; align-items:center; gap:4px;">' +
                                             '&#128208; Ver tabla de medidas e instrucciones' +
                                             '</a></div>';
                        contenedorTalles.insertAdjacentHTML('afterend', htmlLinkTalles);
                    }
                }

                // 6. Normalizacion del canonical
                var tagCanonical = document.querySelector('link[rel="canonical"]');
                if (tagCanonical) {
                    var cleanPath = currentPath.replace(regexColor, '/');
                    tagCanonical.setAttribute('href', window.location.origin + cleanPath);
                }
            }
        }

        // 7. DETECTOR DE FALTA DE STOCK (AUTOMATICO COMPACTO)
        var formCompra = document.querySelector('.js-product-form');
        if (formCompra && !document.getElementById('custom-stock-alert')) {
            var botonCompra = formCompra.querySelector('.js-add-to-cart-btn, [type="submit"]');
            var textoBoton = botonCompra ? emTextoPlano(botonCompra) + ' ' + String(botonCompra.value || '').toLowerCase() : '';
            if (botonCompra && (botonCompra.disabled || botonCompra.classList.contains('disabled') || textoBoton.indexOf('stock') !== -1)) {

                var htmlAlertaStock = '<div id="custom-stock-alert" style="margin-top: 20px; padding: 15px; background: #fafafa; border: 1px solid #eee; border-radius: 8px; clear: both;">' +
                                      '<p style="margin: 0 0 10px 0; font-size: 13px; font-weight: bold; color: #4e342e;">&#128208; No encontras tu talle? Dejanos tu contacto y te avisamos apenas salga del taller:</p>' +
                                      '<div style="display: flex; gap: 8px;">' +
                                      '<input type="email" id="stock-alert-email" placeholder="Tu email o WhatsApp" style="flex: 1; padding: 10px; border: 1px solid #ddd; border-radius: 6px; font-size: 13px; outline: none; background: #fff;">' +
                                      '<button id="btn-stock-alert" style="padding: 10px 15px; background: #4e342e; color: white; border: none; border-radius: 6px; font-weight: bold; font-size: 13px; cursor: pointer; transition: background 0.2s;">Avisame</button>' +
                                      '</div>' +
                                      '<span id="stock-alert-msg" style="display:none; font-size: 12px; margin-top: 8px; color: #4e342e; font-weight: bold;">Perfecto, agendado para darte aviso.</span>' +
                                      '</div>';

                formCompra.insertAdjacentHTML('beforeend', htmlAlertaStock);

                document.getElementById('btn-stock-alert').addEventListener('click', function(e) {
                    e.preventDefault();
                    var contacto = document.getElementById('stock-alert-email').value;
                    var titleText = document.querySelector('h1') ? document.querySelector('h1').textContent.trim() : 'Producto';
                    var selectedVariantLabel = document.querySelector('.js-sku-value') ? document.querySelector('.js-sku-value').textContent.trim() : 'General';
                    var skuActual = titleText + ' - ' + selectedVariantLabel;

                    if (contacto) {
                        fetch('https://tu-backend-railway.up.railway.app/api/alertas-stock', {
                            method: 'POST',
                            headers: { 'Content-Type': 'application/json' },
                            body: JSON.stringify({ contacto: contacto, sku: skuActual })
                        }).then(function() {
                            document.getElementById('stock-alert-email').style.display = 'none';
                            document.getElementById('btn-stock-alert').style.display = 'none';
                            document.getElementById('stock-alert-msg').style.display = 'block';
                        }).catch(function(){});
                    }
                });
            }
        }
    }

    if (document.body.classList.contains('template-home')) {
        emAjustarCarruselHome();
        var intentosHome = 0;
        var fixHome = setInterval(function() {
            emAjustarCarruselHome();
            intentosHome++;
            if (intentosHome > 30) clearInterval(fixHome);
        }, 300);
    }

    // 8. Ocultar duplicados en TODO EL SITIO (Catalogo, Home y Productos Similares)
    var productosVistos = {};
    var tarjetasProductos = document.querySelectorAll('.js-product-container, .js-item-product, .item, [data-store="product-item"], .product-container');

    tarjetasProductos.forEach(function(tarjeta) {
        if(document.body.classList.contains('template-product') && tarjeta.classList.contains('js-product-container')) {
            return;
        }

        var elementoTitulo = tarjeta.querySelector('.js-item-name, .item-name, .product-title, h3, h2');
        if (elementoTitulo) {
            var textoCompleto = elementoTitulo.textContent.trim();

            if (textoCompleto.indexOf('-') !== -1) {
                var partesCat = textoCompleto.split('-');
                var nombreBaseCat = partesCat[0].trim().toLowerCase();

                if (productosVistos[nombreBaseCat]) {
                    tarjeta.style.setProperty('display', 'none', 'important');
                } else {
                    productosVistos[nombreBaseCat] = true;
                    elementoTitulo.textContent = partesCat[0].trim();
                }
            }
        }
    });
});
</script>
</body>
</html>