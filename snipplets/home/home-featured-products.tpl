{# Home featured products #}

{% if sections.primary.products %}
    <div class="container" data-store="home-products-featured">
    	<div class="title-container row m-top">
       		<h2 class="title h1 h5-xs">{{"Destacados" | translate}}</h2>
        </div>
    	<div class="row text-center-xs">
    		<section id="grid" class="js-masonry-grid grid clearfix">
    			<div class="js-masonry-grid" >
    				{% for product in sections.primary.products %}
    					{% include 'snipplets/single_product.tpl' %}
    				{% endfor %}
    			</div>
    		</section>
    	</div>
        <div class="row">
            <div class="text-center p-left-half p-right-half full-width d-inline-block m-bottom m-top">
    	        <a href="{{ store.products_url }}" class="btn btn-secondary col-xs-12 col-sm-4 col-sm-offset-4 col-md-4 col-md-offset-4">{{ "Ver todos los productos" | translate }}</a>
    	    </div>
        </div>
    </div>
{% endif %}