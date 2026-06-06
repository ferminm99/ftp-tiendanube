{% if products and pages.is_last %}
	<div class="last-page" style="display:none;"></div>
{% endif %}
{% for product in products %}
	{% if loop.index % 4 == 1 %}
    	<div class="row">
    {% endif %}
    {% include 'snipplets/single_product.tpl' %}
    {% if loop.index % 4 == 0 or loop.last %}
        </div>
    {% endif %}    
{% endfor %}