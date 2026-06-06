<div class="col-sm-2 visible-when-content-ready p-right-none hidden-xs">
	{% if filter_categories is not empty %}
		{% include "snipplets/categories.tpl" %}
	{% endif %}
	{% if product_filters is not empty %}
		<div class="full-width-container">
			{% include "snipplets/filters.tpl" with {applied_filters: true} %}
			<h4 class="m-bottom">{{ "Filtros" | translate }}</h4>
			{% snipplet "filters.tpl" %}
		</div>
	{% endif %}
</div>
