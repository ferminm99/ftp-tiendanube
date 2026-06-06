{% if products %}
 	<div class="row category-controls m-bottom-xs p-bottom-half-xs">
		{{ component(
			'sort-by',{
				sort_by_classes: {
				select_group: "col-xs-8 col-sm-7 text-right text-left-xs sort-by-container",
				select: "sort-by form-control full-width-xs",
				}
			}) 
		}}
    {% if has_filters_available %}	
			<a href="#" class="js-toggle-mobile-filters js-fullscreen-modal-open visible-xs col-xs-4 m-top p-top-half p-left-none text-right btn-link-secondary" data-modal-url="modal-fullscreen-filters" data-component="filter-button">
				<span>{{ 'Filtrar' | translate }}</span>
				{% include "snipplets/svg/caret-right.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %}
			</a>
    {% endif %}
  </div>

	<div class="visible-xs visible-when-content-ready">
		{% include "snipplets/filters.tpl" with {applied_filters: true} %}
	</div>
{% endif %}