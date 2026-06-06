{# Video that work as examples #}

<div class="container m-top m-bottom" data-store="home-video">
	<div class="row">
		<div class="col-xs-12">
			<div class="home-video embed-responsive embed-responsive-16by9">
				{{ component('placeholders/video-placeholder')}}
				<div class="placeholder-empty-overlay transition-soft">
					<div class="placeholder-info">
						{% include "snipplets/svg/edit.tpl" with {fa_custom_class: "svg-inline--fa fa-3x svg-text-fill"} %}
						<div class="placeholder-description font-small-xs">
							{{ "Podés subir tu video de YouTube desde" | translate }} <strong>"{{ "Video" | translate }}"</strong>
						</div>
						{% if not params.preview %}
							<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small">{{ "Editar" | translate }}</a>
						{% endif %}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>