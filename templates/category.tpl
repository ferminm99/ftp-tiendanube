{% set has_filters_available = products and has_filters_enabled and (filter_categories is not empty or product_filters is not empty) %}

{% paginate by settings.category_quantity_products %}
{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
{% if not show_help %}

	{% if (category.images is not empty) or ("banner-products.jpg" | has_custom_image) %}
			{% include 'snipplets/category-banner.tpl' %}
	{% endif %}

	<div class="container">
		<div class="banner-services-category hidden-xs">
			{% if settings.banner_services_category %} 
				{% include 'snipplets/banner-services/banner-services.tpl' %}
			{% endif %} 
		</div>
		<div class="title-container" data-store="page-title">
			{% snipplet "breadcrumbs.tpl" %}
			<h1 class="title m-bottom-xs">{{ category.name }}</h1>
			{% if category.description %}
				<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<p class="m-bottom-double font-small-xs text-center">{{ category.description }}</p>
					</div>
				</div>
			{% endif %}
		</div>
		{% snipplet 'grid/filters-controls.tpl' %}
		<div class="row m-top m-top-none-xs">
			{% if has_filters_available %} 
				{% snipplet 'sidebar.tpl' %}
			{% endif %}
			{% snipplet 'grid/products-list.tpl'%}
		</div>
	</div>
{% else %}
	<div class="container">
			{% snipplet 'defaults/show_help_category.tpl' %}
	</div>
{% endif %}
{% if has_filters_available %}
    {% snipplet 'mobile-filters.tpl' %}
{% endif %}
