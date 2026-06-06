{# Instagram feed that work as examples #}

<div class="container p-relative" data-store="home-instagram-feed">
	<div class="row">
		<div class="col-xs-12 text-center">
			<div class="title-container">
				<h2 class="subtitle">
					{% include "snipplets/svg/instagram.tpl" with {fa_custom_class: "svg-inline--fa m-right-quarter svg-text-fill"} %}
					{{ 'Instagram' | translate }}
				</h2>
			</div>
		</div>
	</div>
	<div class="js-ig-success instafeed-module text-center" data-store="instagram-feed">
		<div class="row">
			<div id="instagram-feed" class="p-relative">
				{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
				{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
				{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
				{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
			</div>
		</div>
	</div>
	<div class="placeholder-empty-overlay transition-soft">
		<div class="placeholder-info">
			{% include "snipplets/svg/edit.tpl" with {fa_custom_class: "svg-inline--fa fa-3x svg-text-fill"} %}
			<div class="placeholder-description font-small-xs">
				{{ "Podés mostrar tus últimas novedades desde" | translate }} <strong>"{{ "Publicaciones de Instagram" | translate }}"</strong>
			</div>
			{% if not params.preview %}
				<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small">{{ "Editar" | translate }}</a>
			{% endif %}
		</div>
	</div>
</div>