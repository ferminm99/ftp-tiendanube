{# Main categories that work as examples #}

<section class="pills-container home-categories horizontal-container pills-container container-fluid" data-store="home-categories-featured">
	<h2 class="h4 text-center hidden-xs ">{{ "Categorías principales" | translate }}</h2>
	<ul class="list-inline p-none m-none text-center text-left-xs">
		{% for i in 1..4 %}
			<li data-item="{{ loop.index }}" class="pill {% if loop.first %} m-left-half {% endif %} {% if loop.last %} p-right-half {% endif %}">
            	<span class="pill-link">{{ 'Categoría de ejemplo' | translate }}</span>
            </li>
		{% endfor %}
	</ul>
</section>
