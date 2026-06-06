{% if template == 'home' %}

	{# Preload home LCP image of slider and banner section #}

	{% set has_main_slider = settings.slider and settings.slider is not empty %}
	{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}

	{% if has_mobile_slider %}
		{% set slider = settings.slider_mobile %}
	{% else %}
		{% set slider = settings.slider %}
	{% endif %}

	{% set has_slider = has_main_slider or has_mobile_slider %}

	{% if has_main_slider or has_mobile_slider %}
		{% for slide in slider %}
			{% if loop.first %}
				{% if slide.width and slide.height %}
					<link rel="preload" fetchpriority="high" as="image" href="{{ slide.image | static_url | settings_image_url('large') }}" imagesrcset="{{ slide.image | static_url | settings_image_url('large') }} 480w, {{ slide.image | static_url | settings_image_url('huge') }} 640w, {{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w">
				{% else %}
					<link rel="preload" fetchpriority="high" as="image" href="{{ slide.image | static_url | settings_image_url('large') }}">
				{% endif %}
			{% endif %}
		{% endfor %}
	{% endif %}

	{% if not has_slider and settings.home_order_position_1 == 'categories' %}
		{% set priority_assigned = false %}

		{% for banner in ['banner_01', 'banner_02', 'banner_03'] %}
			{% set banner_show = attribute(settings,"#{banner}_show") %}
			{% set banner_image = "#{banner}.jpg" | has_custom_image %}
			{% set banner_image_src = "#{banner}.jpg" | static_url %}
			{% if banner_show and banner_image and not priority_assigned %}
                {% set priority_assigned = true %}
				<link rel="preload" fetchpriority="high" as="image" href="{{ banner_image_src | settings_image_url('large') }}" imagesrcset="{{ banner_image_src | settings_image_url('large') }} 480w, {{ banner_image_src | settings_image_url('huge') }} 640w">  
			{% endif %}
		{% endfor %}
	{% endif %}

	{% if not has_slider and settings.home_order_position_1 == 'promotional' %}
		{% set priority_assigned = false %}

		{% for banner in ['banner_promotional_01', 'banner_promotional_02', 'banner_promotional_03'] %}
			{% set banner_show = attribute(settings,"#{banner}_show") %}
			{% set banner_image = "#{banner}.jpg" | has_custom_image %}
			{% set banner_image_src = "#{banner}.jpg" | static_url %}
			{% if banner_show and banner_image and not priority_assigned %}
                {% set priority_assigned = true %}
				<link rel="preload" fetchpriority="high" as="image" href="{{ banner_image_src | settings_image_url('large') }}" imagesrcset="{{ banner_image_src | settings_image_url('large') }} 480w, {{ banner_image_src | settings_image_url('huge') }} 640w">  
			{% endif %}
		{% endfor %}
	{% endif %}

	{% if not has_slider and settings.home_order_position_1 == 'modules' %}
		{% set priority_assigned = false %}

		{% for module in ['module_01', 'module_02'] %}
			{% set module_show = attribute(settings,"#{module}_show") %}
			{% set module_image = "#{module}.jpg" | has_custom_image %}
			{% set module_image_src = "#{module}.jpg" | static_url %}
			{% if module_show and module_image and not priority_assigned %}
                {% set priority_assigned = true %}
				<link rel="preload" fetchpriority="high" as="image" href="{{ module_image_src | settings_image_url('large') }}" imagesrcset="{{ module_image_src | settings_image_url('large') }} 480w, {{ module_image_src | settings_image_url('huge') }} 640w">  
			{% endif %}
		{% endfor %}
	{% endif %}

	{% if not has_slider and settings.home_order_position_1 == 'horizontal' %}
		<link rel="preload" fetchpriority="high" as="image" href="{{ "banner-home.jpg" | static_url | settings_image_url('large') }}" imagesrcset="{{ "banner-home.jpg" | static_url | settings_image_url('large') }} 480w, {{ "banner-home.jpg" | static_url | settings_image_url('huge') }} 640w, {{ "banner-home.jpg" | static_url | settings_image_url('original') }} 1024w, {{ "banner-home.jpg" | static_url | settings_image_url('1080p') }} 1920w">  
	{% endif %}

{% elseif template == 'product' %}

    {# Preload product LCP image or native video thumbnail #}

    {% for media in product.media %}
        {% if loop.first %}
            {% if media.isImage %}
                <link rel="preload" fetchpriority="high" as="image" href="{{ media | product_image_url('large') }}" imagesrcset="{{ media | product_image_url('large') }} 480w, {{ media | product_image_url('huge') }} 640w, {{ media | product_image_url('original') }} 1024w">
            {% else %}
                {# Native video thumbnail #}
                <link rel="preload" fetchpriority="high" as="image" href="{{ media.thumbnail }}">
            {% endif %}
        {% endif %}
    {% endfor %}

{% elseif template == 'category' %}

    {# Preload category LCP image #}

    {% set category_banner = (category.images is not empty) or ("banner-products.jpg" | has_custom_image) %}
    
    {% if category_banner %}

        {% set image_sizes = ['large', 'huge', 'original', '1080p'] %}
        {% set category_images = [] %}
        {% set has_category_images = category.images is not empty %}

        {% for size in image_sizes %}
            {% if has_category_images %}
                {# Define images for admin categories #}
                {% set category_images = category_images|merge({(size):(category.images | first | category_image_url(size))}) %}
            {% else %}
                {# Define images for general banner #}
                {% set category_images = category_images|merge({(size):('banner-products.jpg' | static_url | settings_image_url(size))}) %}
            {% endif %}
        {% endfor %}

        <link rel="preload" fetchpriority="high" as="image" href="{{ category_images['large'] }}" imagesrcset="{{ category_images['large'] }} 480w, {{ category_images['huge'] }} 640w, {{ category_images['original'] }} 1024w, {{ category_images['1080p'] }} 1920w">

    {% endif %}

{% endif %}