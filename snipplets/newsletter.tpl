<div id="newsletter" class="m-bottom" style="margin-top: 15px;">
    {% if contact %}
        {% if contact.success %}
            <div class="alert alert-success" style="background: #fdfaf7; color: #4e342e; border: 1px solid #e0d0cc; padding: 18px; border-radius: 12px; font-size: 14px; line-height: 1.6; margin-bottom: 20px; box-shadow: 0 4px 12px rgba(78,52,46,0.05);">
                🎉 <strong>¡Suscripción confirmada!</strong> Tu regalo de bienvenida está listo: 
                <span style="display: inline-block; background: #4e342e; color: #fff; padding: 4px 10px; border-radius: 6px; font-weight: 900; font-family: monospace; margin: 5px 0; letter-spacing: 1px; font-size: 15px;">ELMENSUAL2000</span>
                <br><small style="display:block; margin-top: 5px; color: #757575;">Ingresá este código en tu carrito de compras antes de finalizar el pago para descontar los $2000 de regalo.</small>
            </div>
        {% else %}
            <div class="alert alert-danger" style="padding: 10px; border-radius: 6px; font-size: 13px; margin-bottom: 15px;">{{ "Ingrese su Email" | translate }}</div>
        {% endif %}
    {% endif %}

    <h4 class="footer-title" style="font-weight: 900; letter-spacing: 1px; color: #4e342e; font-size: 16px; margin: 0 0 6px 0; text-transform: uppercase;">Te regalamos $2000</h4>
    <p class="footer-text" style="font-size: 13px; color: #666; margin: 0 0 18px 0; line-height: 1.5; font-weight: 300;">Sumate a nuestro newsletter y recibí un cupón de descuento inmediato para tu primera compra.</p>

    <form role="form" method="post" action="/winnie-pooh" onsubmit="this.setAttribute('action', '');" data-store="newsletter-form">
        <div class="form-group" style="margin-bottom: 10px;">
            <input type="text" class="form-control" name="name" onfocus="if (this.value == '{{ "Nombre" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Nombre" | translate }}';}" value='{{ "Nombre" | translate }}' aria-label='{{ "Nombre" | translate }}' style="border-radius: 8px; border: 1px solid #e0e0e0; font-size: 13px; padding: 12px; height: auto; background: #fff; outline: none; transition: border 0.2s;" />
        </div>
        <div class="form-group" style="margin-bottom: 15px;">
            <input type="email" class="form-control" onfocus="if (this.value == '{{ "Tu E-mail" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Tu E-mail" | translate }}';}" value='{{ "Tu E-mail" | translate }}' name="email" aria-label='{{ "Tu E-mail" | translate }}' style="border-radius: 8px; border: 1px solid #e0e0e0; font-size: 13px; padding: 12px; height: auto; background: #fff; outline: none; transition: border 0.2s;">
        </div>
        <div class="form-group winnie-pooh hidden">
            <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
            <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
        </div>
        <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
        <input type="hidden" name="type" value="newsletter" />
        <input type="submit" name="contact" class="btn btn-secondary" value='Conseguir mi regalo' style="background: #4e342e; color: white; border: none; padding: 12px 25px; font-weight: bold; border-radius: 8px; font-size: 13px; cursor: pointer; text-transform: uppercase; letter-spacing: 0.5px; transition: background 0.3s; width: 100%;" />
    </form>
</div>