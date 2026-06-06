<div class="container banner-wrapper" data-store="home-banner-categories">
    <div class="row">

        {# Check if section is first when no main slider section is present #}
       
        {% set has_main_slider = settings.slider and settings.slider is not empty %}
	    {% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}
        {% set has_slider = has_main_slider or has_mobile_slider %}
        {% set section_first = not has_slider and settings.home_order_position_1 == 'categories' %}

        {% set num_banners = 0 %}
        {% set first_banner = true %}
        {% for banner in ['banner_01', 'banner_02', 'banner_03'] %}
            {% set banner_show = attribute(settings,"#{banner}_show") %}
            {% set banner_image = "#{banner}.jpg" | has_custom_image %}
            {% set banner_title = attribute(settings,"#{banner}_title") %}
            {% set banner_button_text = attribute(settings,"#{banner}_button") %}
            {% set has_banner =  banner_show and (banner_title or banner_description or banner_image) %}
            {% if has_banner %}
                {% set num_banners = num_banners + 1 %}
            {% endif %}
        {% endfor %}

        {% set priority_assigned = false %}

        {% for banner in ['banner_01', 'banner_02', 'banner_03'] %}
            {% set banner_show = attribute(settings,"#{banner}_show") %}
            {% set banner_image = "#{banner}.jpg" | has_custom_image %}
            {% set banner_title = attribute(settings,"#{banner}_title") %}
            {% set banner_description = attribute(settings,"#{banner}_description") %}
            {% set banner_button_text = attribute(settings,"#{banner}_button") %}
            {% set banner_url = attribute(settings,"#{banner}_url") %}
            {% set has_banner =  banner_show and (banner_title or banner_description or banner_image) %}
            {% set has_banner_text =  banner_title or banner_description or (banner_button_text and banner_url) %}

            {# Assign priority to the first banner (no matter banner order) #}

            {% set has_priority = has_banner and banner_image and not priority_assigned %}
            {% if has_priority %}
                {% set priority_assigned = true %}
            {% endif %}

            {% set apply_lazy_load = 
                not section_first 
                or not has_priority
            %}

            {% if apply_lazy_load %}
                {% set banner_src = 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==' %}
            {% else %}
                {% set banner_src = "#{banner}.jpg" | static_url | settings_image_url('large') %}
            {% endif %}

            {% if has_banner %}
                <div class="col-sm-{% if num_banners == 1 %}6 col-sm-offset-3{% elseif num_banners == 2 %}6{% elseif num_banners == 3 %}4{% endif %}">
                    <div class="textbanner">
                        {% if banner_url %}
                            <a class="textbanner-link" href="{{ banner_url | setting_url }}"{% if banner_title %} alt="{{ banner_title }}" title="{{ banner_title }}"{% endif %}>
                        {% endif %}
                        {% if banner_image %}
                            <div class="textbanner-image">
                                <img 
                                    {% if not apply_lazy_load %}fetchpriority="high"{% endif %}
                                    src="{{ banner_src }}"
                                    {% if apply_lazy_load %}data-{% endif %}srcset="{{ "#{banner}.jpg" | static_url | settings_image_url('large') }} 480w, {{ "#{banner}.jpg" | static_url | settings_image_url('huge') }} 640w" 
                                    {% if apply_lazy_load %}
                                    data-sizes="auto" 
                                    data-expand="-10" 
                                    {% endif %}
                                    class="textbanner-image-background {% if apply_lazy_load %}lazyautosizes lazyload fade-in{% endif %}" 
                                    {% if banner_title %}alt="{{ banner_title }}"{% else %}alt="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %} 
                                />
                            </div>
                        {% else %}
                            <div class="textbanner-image">
                                {% include "snipplets/svg/image.tpl" with {fa_custom_class: "svg-inline--fa fa-4x placeholder-icon"} %}
                            </div>
                        {% endif %}
                        {% if has_banner_text %}
                            <div class="textbanner-text">
                                <div class="textbanner-shape"></div>
                                {% if banner_title %}
                                    <h3 class="textbanner-title">{{ banner_title }}</h3>
                                {% endif %}
                                {% if banner_description %}
                                    <div class="textbanner-paragraph">{{ banner_description }}</div>
                                {% endif %}
                                {% if banner_url and banner_button_text %}
                                    <div class="textbanner-button btn btn-primary">{{ banner_button_text }}</div>
                                {% endif %}
                            </div>
                        {% endif %}
                        {% if banner_url %}
                            </a>
                        {% endif %}
                    </div>
                </div>
            {% set first_banner = false %}
            {% endif %}
        {% endfor %}
    </div>
</div>