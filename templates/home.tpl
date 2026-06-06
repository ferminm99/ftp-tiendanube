{# Detect presence of features that remove empty placeholders #}

{% set has_main_slider = settings.slider and settings.slider is not empty %}
{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}
{% set has_category_banners =  settings.banner_01_show or settings.banner_02_show or settings.banner_03_show %}
{% set has_image_text_modules = settings.module_01_show or settings.module_02_show %}
{% set has_video = settings.video_embed %}
{% set has_instafeed = store.instagram and settings.show_instafeed and store.hasInstagramToken() %}
{% set has_main_categories = categories and settings.home_main_categories %}
{% set has_promotional_banners = settings.banner_promotional_01_show or settings.banner_promotional_02_show or settings.banner_promotional_03_show %}
{% set has_facebook_like_module = settings.show_footer_fb_like_box and store.facebook %}
{% set has_twitter_feed = settings.twitter_widget and store.twitter %}

{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not (has_main_slider or has_mobile_slider or has_category_banners or has_image_text_modules or has_video or has_instafeed or has_main_categories or has_promotional_banners or has_facebook_like_module or has_twitter_feed) and not has_products %}

{% set show_component_help = params.preview %}

{% if not params.preview %}
    {% set admin_link = is_theme_draft ? '/admin/themes/settings/draft/' : '/admin/themes/settings/active/' %}
{% endif %}

{% set newArray = [] %}

<div class="js-home-sections-container">

    {#  **** Home slider ****  #}
    
    <section data-store="home-slider">
        {% if show_help or (show_component_help and not (has_main_slider or has_mobile_slider)) %}
            {% snipplet 'defaults/home/slider_help.tpl' %}
        {% else %}
            {% include 'snipplets/home/home-slider.tpl' %}
            {% if has_mobile_slider %}
                {% include 'snipplets/home/home-slider.tpl' with {mobile: true} %}
            {% endif %}
        {% endif %}
    </section>

    {#  **** Banner services located below slider ****  #}
    {% if settings.banner_services_home %} 
        {% include 'snipplets/banner-services/banner-services.tpl' %}
    {% endif %}

    {% for i in 1..9 %}
        {% set section = 'home_order_position_' ~ i %}
        {% set section_select = attribute(settings, section) %}

        {% if section_select not in newArray %}
            {% include 'snipplets/home/home-section-switch.tpl' %}
            {% set newArray = newArray|merge([section_select]) %}
        {% endif %}

    {% endfor %}

    {#  **** Hidden Sections ****  #}
    {% if show_component_help %}
        <div style="display:none">
            {% for section_select in ['products', 'categories', 'main_categories', 'modules', 'video', 'sale', 'instafeed', 'promotional', 'newsletter'] %}
                {% if section_select not in newArray %}
                    {% include 'snipplets/home/home-section-switch.tpl' %}
                {% endif %}
            {% endfor %}
        </div>
    {% endif %}
</div>

{% if settings.show_news_box %}
    {% include 'snipplets/newsletter-popup.tpl' %}
{% endif %}
