{# Single snipplet that work as credit cards example #}
<div class="example-payment-send col-md-4">
    <h4 class="footer-title">{{ 'Ejemplos de medios de pago' | translate }}</h4>
    <div class="align-pay-ship">
        {% if store.country == 'BR' %}
            {% for payment_method in [ 'visa','mastercard', 'amex', 'diners', 'pagseguro' ] %}
              {{ payment_method | payment_new_logo | img_tag('', {class : 'footer-payship-img card-img', height : 30}) }}
            {% endfor %}
        {% else %}
            {% for payment_method in [ 'visa','mastercard', 'amex', 'diners', 'mercadopago' ] %}
              {{ payment_method | payment_new_logo | img_tag('', {class : 'footer-payship-img card-img', height : 30}) }}
            {% endfor %}
            {% if store.country == 'AR' %}
                {% for payment_method in [ 'ar/pagofacil','ar/rapipago', 'ar/tarjeta-naranja' ] %}
                  {{ payment_method | payment_new_logo | img_tag('', {class : 'footer-payship-img card-img', height : 30}) }}
                {% endfor %}                                
            {% endif %}
        {% endif %}
    </div> 
    <h4 class="footer-title">{{ 'Ejemplos de formas de envío' | translate }}</h4>
    <div class="align-pay-ship">
        {% if store.country == 'BR' %}
            {% for shipping_method in [ 'br/correios' ] %}
              {{ shipping_method | shipping_logo | img_tag('', {class : 'footer-payship-img card-img', height : 30}) }}
            {% endfor %}
        {% else %}
            {% for shipping_method in [ 'fedex','ups' ] %}
              {{ shipping_method | shipping_logo | img_tag('', {class : 'footer-payship-img card-img', height : 30}) }}
            {% endfor %}
            {% if store.country == 'AR' %}
                {{ "ar/oca" | shipping_logo | img_tag('', {class : 'footer-payship-img card-img', height : 30}) }}
            {% endif %}
        {% endif %}
    </div> 
</div>
