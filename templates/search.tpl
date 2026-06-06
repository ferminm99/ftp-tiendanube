{% set has_filters_available = products and has_filters_enabled and product_filters is not empty %}

<div class="container">
	<div class="title-container" data-store="page-title">
		{% snipplet "breadcrumbs.tpl" %}
		<h1 class="title">{{ "Resultados de búsqueda" | translate }}</h1>
  </div>
	{% snipplet 'grid/filters-controls.tpl' %}
	<div class="row m-top m-top-none-xs">
		{% if has_filters_available %}
				{% snipplet 'sidebar.tpl' %}
		{% endif %}
		{% snipplet 'grid/products-list.tpl' %}
	</div>
</div>
{% if has_filters_available %}
	{% snipplet 'mobile-filters.tpl' %}
{% endif %}