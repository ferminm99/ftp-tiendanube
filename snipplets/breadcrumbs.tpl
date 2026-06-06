<ul class="breadcrumb list-inline">
	<li>
		<a class="breadcrumb-crumb" href="{{ store.url }}" title="{{ store.name }}">{{ "Inicio" | translate }}</a>
	</li>
    {% if template == 'cart' %}
    <li>
        <span class="breadcrumb-divider">></span>
        <span class="breadcrumb-crumb"><strong>{{ "Carrito de Compras" | translate }}</strong></span>
    </li>
    {% elseif template == 'page' %}
    <li>
        <span class="breadcrumb-divider">></span>
        <span class="breadcrumb-crumb"><strong>{{ page.name }}</strong></span>
    </li>
    {% elseif template == 'search' %}
    <li>
        <span class="breadcrumb-divider">></span>
        <span class="breadcrumb-crumb"><strong>{{ "Resultados de búsqueda" | translate }}</strong></span>
    </li>
    {% elseif template == 'blog' %}
    <li>
        <span class="breadcrumb-divider">></span>
        <span class="breadcrumb-crumb"><strong>{{ "Blog" | translate }}</strong></span>
    </li>
    {% elseif template == 'blog-post' %}
    <li>
        <span class="breadcrumb-divider">></span>
        <a class="breadcrumb-crumb" href="{{ store.blog_url }}">{{ "Blog" | translate }}</a>
    </li>
    {% endif %}
	{% for crumb in breadcrumbs %}
	<li>
		<span class="breadcrumb-divider">></span>
		{% if crumb.last %}
		<span class="breadcrumb-crumb"><strong>{{ crumb.name }}</strong></span>
		{% else %}
		<a class="breadcrumb-crumb" href="{{ crumb.url }}" title="{{ crumb.name }}">{{ crumb.name }}</a>
		{% endif %}
	</li>
	{% endfor %}
</ul>
