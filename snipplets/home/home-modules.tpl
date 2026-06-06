<div class="container" data-store="home-image-text-module">

    {# Check if section is first when no main slider section is present #}
       
    {% set has_main_slider = settings.slider and settings.slider is not empty %}
    {% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}
    {% set has_slider = has_main_slider or has_mobile_slider %}
    {% set section_first = not has_slider and settings.home_order_position_1 == 'modules' %}

    {% set num_modules = 0 %}
    {% for module in ['module_01', 'module_02'] %}
        {% set module_show = attribute(settings,"#{module}_show") %}
        {% set module_image = "#{module}.jpg" | has_custom_image %}
        {% set module_title = attribute(settings,"#{module}_title") %}
        {% set module_text = attribute(settings,"#{module}_text") %}
        {% set module_button_text = attribute(settings,"#{module}_button") %}
        {% set has_module =  module_show and (module_title or module_text or module_image) %}
        {% if has_module %}
            {% set num_modules = num_modules + 1 %}
        {% endif %}
    {% endfor %}

    {% set priority_assigned = false %}

    {% if num_modules > 0 %}
        <div class="module-wrapper">
    {% endif %}
    {% for module in ['module_01', 'module_02'] %}
        {% set module_show = attribute(settings,"#{module}_show") %}
        {% set module_image = "#{module}.jpg" | has_custom_image %}
        {% set module_title = attribute(settings,"#{module}_title") %}
        {% set module_text = attribute(settings,"#{module}_text") %}
        {% set module_button_text = attribute(settings,"#{module}_button") %}
        {% set module_url = attribute(settings,"#{module}_url") %}
        {% set module_align = attribute(settings,"#{module}_align") %}
        {% set has_module =  module_show and (module_title or module_text or module_image) %}
        {% set has_module_text =  module_title or module_text or (module_url and module_button_text) %}

        {# Assign priority to the first banner (no matter banner order) #}

        {% set has_priority = has_module and module_image and not priority_assigned %}
        {% if has_priority %}
            {% set priority_assigned = true %}
        {% endif %}

        {% set apply_lazy_load = 
            not section_first 
            or not has_priority
        %}

        {% if apply_lazy_load %}
            {% set module_src = 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==' %}
        {% else %}
            {% set module_src = "#{module}.jpg" | static_url | settings_image_url('large') %}
        {% endif %}

        {% if has_module %}
            <div class="row">
                <div class="col-sm-12">
                    <div class="module-image">
                        {% if module_image %}
                            <img 
                                {% if not apply_lazy_load %}fetchpriority="high"{% endif %}
                                src="{{ module_src }}"
                                {% if apply_lazy_load %}data-{% endif %}srcset='{{ "#{module}.jpg" | static_url | settings_image_url('large') }} 480w, {{ "#{module}.jpg" | static_url | settings_image_url('huge') }} 640w, {{ "#{module}.jpg" | static_url | settings_image_url('original') }} 1024w, {{ "#{module}.jpg" | static_url | settings_image_url('1080p') }} 1920w' 
                                {% if apply_lazy_load %}data-sizes="auto"{% endif %}
                                class="textbanner-image-background {% if apply_lazy_load %}lazyautosizes lazyload fade-in{% endif %}" 
                                {% if module_title %}alt="{{ module_title }}"{% else %} alt="{{ 'Módulo de' | translate }} {{ store.name }}"{% endif %}
                            />
                            {% if apply_lazy_load %}
                                <div class="placeholder-overlay placeholder-container">
                                </div>
                            {% endif %}
                        {% endif %}
                        {% if module_url %}
                            <a href="{{ module_url | setting_url }}"{% if module_title %} alt="{{ module_title }}" title="{{ module_title }}"{% endif %}>
                        {% endif %}
                        {% if has_module_text %}
                            <div class="module-text{% if module_align == 'left' %} pull-left{% elseif module_align == 'center' %} module-center pull-left{% elseif module_align == 'right' %} pull-right{% endif %}">
                                {% if module_title %}
                                    <h3 class="module-text-title">{{ module_title }}</h3>
                                {% endif %}
                                {% if module_text %}
                                    <div class="module-text-paragraph">{{ module_text }}</div>
                                {% endif %}
                                {% if module_url and module_button_text %}
                                    <div class="module-text-button btn btn-primary">{{ module_button_text }}</div>
                                {% endif %}
                            </div>
                        {% endif %}
                        {% if module_url %}
                            </a>
                        {% endif %}
                    </div>
                </div>
            </div>
        {% endif %}
    {% endfor %}
    {% if num_modules > 0 %}
        </div>{#  **** This close the module-wrapper ****  #}
        <div class="shape-container">
            <div class="background-shape"></div>
        </div>
    {% endif %}
</div>