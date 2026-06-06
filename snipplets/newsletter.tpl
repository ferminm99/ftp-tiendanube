<div id="newsletter" class="m-bottom">
	<p>{{ settings.newsletter_text }}</p>
    {% if contact %}
        {% if contact.success %}
            <div class="alert alert-success">{{ "Se inscribió al newsletter correctamente" | translate }}</div>
        {% else %}
            <div class="alert alert-danger">{{ "Ingrese su Email" | translate }}</div>
        {% endif %}
    {% endif %}
    <form role="form" method="post" action="/winnie-pooh" onsubmit="this.setAttribute('action', '');" data-store="newsletter-form">
		<div class="form-group">
			<input type="text" class="form-control" name="name" onfocus="if (this.value == '{{ "Nombre" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Nombre" | translate }}';}" value='{{ "Nombre" | translate }}' aria-label='{{ "Nombre" | translate }}' />
		</div>
		<div class="form-group">
			<input type="email" class="form-control" onfocus="if (this.value == '{{ "Tu E-mail" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Tu E-mail" | translate }}';}" value='{{ "Tu E-mail" | translate }}' name="email" aria-label='{{ "Tu E-mail" | translate }}'>
		</div>
        <div class="form-group winnie-pooh hidden">
            <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
            <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
        </div>
        <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
        <input type="hidden" name="type" value="newsletter" />
		<input type="submit" name="contact" class="btn btn-secondary center-block" value='{{ "Inscribirse" | translate }}' />
    </form>
</div>
