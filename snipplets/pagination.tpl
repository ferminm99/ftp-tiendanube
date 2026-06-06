<div class="js-pagination-container pagination-container">
    <ul class="pagination mobile-pagination">
		{% if pages.numbers %}
			{% if pages.previous %}
				<li class="pagination-arrow-container pull-left">
		        	<a href="{{ pages.previous }}" aria-label="Previous" class="pagination-arrow-link m-bottom-quarter pull-left">
		        		<span aria-hidden="true" class="pagination-arrow-prev">
		        			{% include "snipplets/svg/chevron-left.tpl" with {fa_custom_class: "svg-inline--fa pagination-icon svg-text-fill"} %}
		        		</span>
		        	</a>
	        	</li>
		    {% endif %}
		    {% for page in pages.numbers %}
			 	{% if page.selected %}
			 		<li class="active hidden-xs">
				 		<a>
				 			{{ page.number }}
			 			</a>
				 	</li>
				 	<div class="js-page-link-{{ page.number }} visible-xs-inline-block pagination-input-container {% if not pages.previous %}pagination-input-container-wide{% endif %}">
				 		<span class="m-right-quarter"> 
							{{ 'Página' | t }}
						</span> 
			 			<input type="number" value="{{ page.number }}" pattern="\d*" class="js-mobile-paginator-input pagination-input text-center"/> 
			 			<span class="m-left-quarter"> 
							{{ 'de ' | t }} {{ pages.amount }}
						</span> 
					</div>
			 	{% elseif page.url %}
			 		<li class="hidden-xs">
			 			<a href="{{ page.url }}" class="js-page-link-{{ page.number }}">{{ page.number }}</a>
			 		</li>
			 	{% else %}
			 		<li class="hidden-xs">
			 			<a href="?page={{ page.number }}" class="js-page-link-{{ page.number }}">{{ page.number }}</a>
			 		</li>
			 	{% endif %}
			{% endfor %}
			{% if pages.next %}
				<li class="pagination-arrow-container pull-right">
			      <a href="{{ pages.next }}" aria-label="Next" class="pagination-arrow-link m-bottom-quarter pull-right">
			        <span aria-hidden="true" class="pagination-arrow-next">
			        	{% include "snipplets/svg/chevron-right.tpl" with {fa_custom_class: "svg-inline--fa pagination-icon svg-text-fill"} %}
			        </span>
			      </a>
			    </li>
			{% endif %}
		{% endif %}
    </ul>
</div>