{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
<div class="js-404-page container" id="404">
	<div class="title-container m-top" data-store="page-title">
   		<h1 class="title">{{ "La página no existe" | translate }}</h1>
    </div>
	<div class="text-center">
		<div class="circle-box visible-when-content-ready">
			<p class="circle-title">404</p>
			<p class="circle-subtitle">oops!</p>
		</div>
		<p class="text-center">{{ "La página que estás buscando no existe." | translate }} {{ "Quizás te interesen los siguientes productos." | translate }}</p>
		{% set related_products = sections.primary.products | take(4) | shuffle %}
		{% if related_products | length > 1 %}
		<div class="row">
			<div class="col-md-12">
				<div class="title-container m-top">
			   		<h2 class="subtitle">{{"Productos recomendados" | translate}}</h2>
			    </div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 text-center">
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
	</div>
</div>
{# Here we will add an example as a help, you can delete this after you upload your products #}
{% if show_help %}
<div class="row-fluid" id="product-example">
    {% snipplet 'defaults/show_help_product.tpl' %}
</div>
{% endif %}
