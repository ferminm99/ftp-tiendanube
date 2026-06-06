{% if section_select == 'products' %}

    {#  **** Featured products ****  #}
    {% if show_help or (show_component_help and not has_products) %}
        {% include 'snipplets/defaults/home/featured_products_help.tpl' with { products_title: 'Destacados' | translate, section_id: 'featured', highlighted_products_setting_name: 'featured' }  %}
    {% else %}
        {% include 'snipplets/home/home-featured-products.tpl' %}
    {% endif %}

{% elseif section_select == 'categories' %}

    {#  **** Categories banners ****  #}
    {% if show_help or (show_component_help and not has_category_banners) %}
        {% include 'snipplets/defaults/home/banners_help.tpl' with {
            banners_container_classes: 'container banner-wrapper', 
            banner_column_classes: 'col-sm-4', 
            banner_container_classes: 'textbanner', 
            banner_image_container_classes: 'textbanner-image textbanner-image-empty textbanner-image-empty-vertical', 
            banner_text_container_classes: 'textbanner-text',
            banner_title_classes: 'textbanner-title',
            banner_title: 'Categoría' | translate,
            banner_help_text: 'Podés destacar categorías de tu tienda desde' | translate,
            banner_help_section: 'Banners de categorías' | translate,
            banner_shape: true,
            section_id: 'categories',
            banners_amount: 3} 
        %}
    {% else %}
        {% include 'snipplets/home/home-banners.tpl' %}
    {% endif %}

{% elseif section_select == 'main_categories' %}

    {% if show_help or (show_component_help and not has_main_categories) %}
        {% snipplet 'defaults/home/main_categories_help.tpl' %}
    {% else %}
        {% include 'snipplets/home/home-categories.tpl' %}
    {% endif %}

{% elseif section_select == 'modules' %}

    {#  **** Modules with images and text ****  #}
    {% if show_help or (show_component_help and not has_image_text_modules) %}
        {% include 'snipplets/defaults/home/image_text_modules_help.tpl' %}
    {% else %}
        {% include 'snipplets/home/home-modules.tpl' %}
    {% endif %}

{% elseif section_select == 'video' %}

    {#  **** Video embed ****  #}
    {% if show_help or (show_component_help and not has_video) %}
        {% snipplet 'defaults/home/video_help.tpl' %}
    {% else %}
        {% include 'snipplets/home/home-video.tpl' %}
    {% endif %}

{% elseif section_select == 'sale' %}

    {#  **** Sale products ****  #}
    {% if show_help or (show_component_help and not has_products) %}
        {% include 'snipplets/defaults/home/featured_products_help.tpl' with { products_title: 'Ofertas' | translate, section_id: 'sale', slider: true }  %}
    {% else %}
        {% include 'snipplets/home/home-sale-products.tpl' %}
    {% endif %}

{% elseif section_select == 'instafeed' %}

    {#  **** Instafeed ****  #}
    {% if show_help or (show_component_help and not has_instafeed) %}
        {% snipplet 'defaults/home/instafeed_help.tpl' %}
    {% else %}
        {% include 'snipplets/home/home-instafeed.tpl' %}
    {% endif %}

{% elseif section_select == 'promotional' %}

    {#  **** Promotional banners ****  #}
    {% if show_help or (show_component_help and not has_promotional_banners) %}
        {% include 'snipplets/defaults/home/banners_help.tpl' with {
            banners_container_classes: 'module-wrapper-promotional container', 
            banner_column_classes: 'col-sm-6', 
            banner_container_classes: 'm-bottom-double p-bottom-none p-relative', 
            banner_image_container_classes: 'textbanner-image textbanner-image-empty textbanner-image-empty-vertical', 
            banner_text_container_classes: 'module-text module-text-promotional',
            banner_title_classes: 'module-text-title',
            banner_title: 'Promoción' | translate,
            banner_help_text: 'Podés mostrar tus promociones desde' | translate,
            banner_help_section: 'Banners promocionales' | translate,
            section_id: 'promotional',
            banners_amount: 2} 
        %}
    {% else %}
        {% include 'snipplets/home/home-promotional-banners.tpl' %}
    {% endif %}

{% elseif section_select == 'newsletter' %}

    {#  **** Newsletter ****  #}
    {% include 'snipplets/home/home-social.tpl' %}

{% endif %}