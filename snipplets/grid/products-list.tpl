{% set list_data_store = template == 'category' ? 'category-grid-' ~ category.id : 'search-grid' %}

<div {% if has_filters_available %}class="col-sm-10 text-center-xs"{% else %}class="col-sm-12 text-center-xs"{% endif %} data-store="{{ list_data_store }}"> 
	{% if products %}
		<div class="{% if settings.infinite_scrolling and not pages.is_last and products%}js-product-table{% endif %} js-masonry-grid product-grid">
			{% include 'snipplets/product_grid.tpl' %}
		</div>
		{% if settings.infinite_scrolling and not pages.is_last and products%}
			<div class="load-more-container clear-both m-bottom text-center">
				<a class="js-load-more-btn btn btn-secondary m-top m-bottom full-width-xs">
					{{ 'Mostrar más productos' | t }}
					<span class="js-load-more-spinner pull-left m-right-quarter" style="display:none;">{% include "snipplets/svg/circle-notch.tpl" with {fa_custom_class: "svg-inline--fa fa-spin"} %}</span>
				</a>
			</div>
		{% endif %}
		<div class="visible-when-content-ready" {% if settings.infinite_scrolling %}style="display:none;"{% endif %}>
			{% snipplet "pagination.tpl" %}
		</div>
	{% else %}
		{% if template == 'category' or (template == 'search' and has_filters_enabled and has_applied_filters) %}
			<div class="filters-msg" data-component="filter.message">
			  <h4>{{(has_filters_enabled ? "No tenemos resultados para tu búsqueda. Por favor, intentá con otros filtros." : "Próximamente") | translate}}</h4>
			</div>
	  {% else %}
      <p class="text-secondary text-center">{{ "No hubo resultados para tu búsqueda" | translate }}</p>
			<p class="text-center">{{ "A continuación te sugerimos algunos productos que podrían interesarte" | translate }}</p>
			{% set related_products = sections.primary.products | take(4) | shuffle %}
			{% if related_products | length > 1 %}
				<div class="row">
					<div class="col-xs-12">
						<div class="title-container m-top">
								<h2 class="subtitle">{{"Productos recomendados" | translate}}</h2>
							</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<section id="grid" class="grid clearfix">
							<div class="js-masonry-grid">
								{% for related in related_products %}
									{% include 'snipplets/single_product.tpl' with {product : related} %}
								{% endfor %}
							</div>
						</section>
					</div>
				</div>
		  {% endif %}
		{% endif %}
	{% endif %}
</div>