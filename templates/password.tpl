<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7">
<![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8">
<![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9">
<![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
    <link rel="preconnect" href="{{ store_resource_hints }}" />
    <link rel="dns-prefetch" href="{{ store_resource_hints }}" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>{{ page_title }}</title>
    <meta name="description" content="{{ page_description }}" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1">
    <link rel="preload" as="style" href="{{ [settings.main_font, settings.default_font] | google_fonts_url('300, 400, 700') }}" />
    <link rel="preload" href="{{ 'css/main-color.scss.tpl' | static_url }}" as="style" />
    
    {{ component('social-meta') }}

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

    {# Aynsc CSS for the non-critical stylesheets and Font Awesome CSS #}

    <link rel="stylesheet" href="{{ 'css/style.scss.tpl' | static_url }}" media="print" onload="this.media='all'">

    {# Store colors CSS #}
    
    {{ 'css/main-color.scss.tpl' | static_url | static_inline }}

    {% set nojquery = true %}
    {% set async_js = true %}

    {{ "//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" | script_tag(true) }}

    {% head_content %}

    {# Structured data to provide information for Google about the page content #}

    {{ component('structured-data') }}

    <!--[if lt IE 9]>
    {{ '//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv-printshiv.min.js' | script_tag }}
    <![endif]-->
    <style>
        {{ settings.css_code | raw }}
    </style>
</head>
{% if "default-background.jpg" | has_custom_image %}
<html class="user-background {% if not settings.bg_repeat %}bg-no-repeat{% endif %}" style="background-position-x:{{ settings.bg_position_x }};">
{% else %}
<body class="pattern-background {% if customer %}customer-logged-in{% endif %} template-{{ template | replace('.', '-') }}">
{% endif %}
<div class="visible-when-content-ready">
    <div class="nav-head pull-left full-width text-center">
        {{ component('logos/logo', {logo_size: 'large', container_classes: { logo_img_container: "mobile-logo-home m-top m-bottom-half"}, logo_img_classes: 'm-auto', logo_text_classes: 'h3'}) }}
    </div>
    <div class="container clear-both">
        <div class="circle-box circle-box-mid">
            <div class="circle-icon">
                {% include "snipplets/svg/construction.tpl" with {'animation-wiggle': true} %}
            </div>
        </div>
        <div class="col-sm-10 col-sm-offset-1 m-bottom">
            <span class="divider"></span>
            <h2 class="text-center h3-xs">{{ message }}</h2>
            <span></span>
        </div>
        {% if store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
            <div class="social-networks">
                <div class="title-container">
                    <h4 class="subtitle">{{"Seguinos" | translate}}</h4>
                </div>
                <ul class="text-center list-inline">
                    {% for sn in ['instagram', 'facebook', 'youtube', 'tiktok', 'twitter', 'pinterest'] %}
                        {% set sn_url = attribute(store,sn) %}
                        {% if sn_url %}
                            <li class="m-bottom-half">
                                <a class="btn btn-circle btn-primary" href="{{ sn_url }}" target="_blank">
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
        {% endif %}
    </div>
    <div class="footer">
        <div class="container">
            {% set has_seals = store.afip or ebit %}
            <div class="row">
                <form method="post" class="unlock-form col-sm-4 col-sm-offset-4 m-bottom m-top-xs">
                    <input type="password" class="form-control" name="password" class="span2"  placeholder="{{ 'Contraseña de acceso' | translate }}" autocomplete="off">
                    <input type="submit" name="unlock" class="btn btn-secondary btn-block" value='{{ "Desbloquear" | translate }}'>
                    {% if invalid_password == true %}
                        <div class="alert alert-danger">{{ 'La contraseña es incorrecta.' | translate }}</div>
                    {% endif %}
                </form>
                {% if store.phone or store.email or store.blog or store.address %}
                    <div class="col-md-{% if has_seals %}6 text-right{% else %}12 text-center{% endif %} contact-data">
                        <h4 class="footer-title">{{ 'Contactanos' | translate }}</h4>
                        <ul class="footer-list list-unstyled">
                            {% if store.phone %}
                                <li>
                                    {% include "snipplets/svg/phone.tpl" with {fa_custom_class: "svg-inline--fa fa-lg m-right-quarter svg-text-fill"} %}{{ store.phone }}
                                </li>
                            {% endif %}
                            {% if store.email %}
                                <li>
                                    {% include "snipplets/svg/envelope.tpl" with {fa_custom_class: "svg-inline--fa fa-lg m-right-quarter svg-text-fill"} %}{{ store.email | mailto }}
                                </li>
                            {% endif %}
                            {% if store.blog %}
                                <li>
                                    <a target="_blank" href="{{ store.blog }}">
                                        {% include "snipplets/svg/comments.tpl" with {fa_custom_class: "svg-inline--fa fa-lg m-right-quarter svg-text-fill"} %}{{ "Visita nuestro Blog!" | translate }}
                                    </a>
                                </li>
                            {% endif %}
                            {% if store.address %}
                                <li>
                                    {% include "snipplets/svg/map-marker.tpl" with {fa_custom_class: "svg-inline--fa fa-lg m-right-quarter svg-text-fill"} %}
                                    {{ store.address }}
                                </li>
                            {% endif %}
                        </ul>
                    </div>
                {% endif %}
                <div class="col-md-6 seals" {% if not (store.afip or ebit) %}style="display:none;"{% endif %}>
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
                </div>
            </div>
        </div>
    </div>
    <div class="footer-legal">
        <div class="container">
            <div class="row">
                <div class="col-md-6 copyright">
                    <p class="text-left text-center-xs m-bottom">{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}</p>
                </div>
                <div class="col-md-6 powered-by text-right text-center-xs font-small">
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
<!-- External JS: Plugins and libraries -->

<!-- without dependencies -->
{{ "js/external-no-dependencies.js" | static_url | script_tag }}

<!-- with dependencies -->
<script>
    LS.ready.then(function(){
        {% snipplet "js/external.js.tpl"  %}
    });
</script>
</body>
</html>
