{% if template == 'home' %}
    {{ "Inicio" | translate }}
{% elseif template == 'category' %}
    {{ category.name }}
{% elseif template == 'page' %}
    {{ page.name }}
{% elseif template == 'product' %}
    {{ product.name }}
{% elseif template == 'cart' %}
    {{ "Carrito de compras" | translate }}
{% elseif template == 'contact' %}
    {{ "Contacto" | translate }}
{% elseif template == 'search' %}
    {{ "Resultados de búsqueda" | translate }}
{% elseif template == '404' %}
    {{ "La página no existe" | translate }}
{% elseif template == 'account.login' %}
    {{ "Iniciar sesión" | translate }}
{% elseif template == 'account.register' %}
    {{ "Crear cuenta" | translate }}
{% elseif template == 'account.reset' %}
    {{ "Cambiar Contraseña" | translate }}
{% elseif template == 'account.orders' or template == 'account.info' %}
    {{ "Mi cuenta" | translate }}
{% elseif template == 'account.address' %}
    {{ "Dirección" | translate }}
{% elseif template == 'account.addresses' %}
    {{ "Mis direcciones" | translate }}
{% elseif template == 'account.order' %}
    {{ "Orden {1}" | translate(order.number) }}
{% endif %}