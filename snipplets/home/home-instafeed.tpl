{# Home instafeed #}

{% if settings.show_instafeed and store.instagram %}
    <div class="container" data-store="home-instagram-feed">
	    <div class="row">
	        {% set instuser = store.instagram|split('/')|last %}
	        <div class="col-xs-12 text-center">
	        	<div class="title-container">
	            	<h2 class="subtitle">
	            		<a target="_blank" href="{{ store.instagram }}" aria-label="{{ 'Instagram de' | translate }} {{ store.name }}">
            				{% include "snipplets/svg/instagram.tpl" with {fa_custom_class: "svg-inline--fa m-right-quarter svg-text-fill"} %}
	            			@{{ instuser }}
	            		</a>
	            	</h2>
	        	</div>

	        	{# Instagram fallback info in case feed fails to load #}
				<div class="js-ig-fallback text-center m-bottom">
					<a target="_blank" href="{{ store.instagram }}" aria-label="{{ 'Ver perfil' | translate }}">
						{% include "snipplets/svg/instagram.tpl" with {fa_custom_class: "svg-inline--fa fa-4x m-right-quarter svg-primary-fill"} %}
						<div class="text-uppercase m-top-half m-bottom">{{ 'Nuestro Instagram' | translate }}</div>
						<span class="btn btn-secondary">{{ 'Ver perfil' | translate }}</span>
					</a>
				</div>
			</div>
		</div>

		{# Instagram feed #}

		{% if store.hasInstagramToken() %}
			<div class="js-ig-success instafeed-module text-center" data-store="instagram-feed" style="display: none;">
				<div class="row">
					<div id="instagram-feed"
						data-ig-feed
						data-ig-items-count="4"
						data-ig-item-class="instafeed-item col-md-3 col-xs-6 m-bottom p-left-half-xs p-right-half-xs"
						data-ig-link-class="instafeed-link"
						data-ig-image-class="instafeed-img img-responsive fade-in"
						data-ig-aria-label="{{ 'Publicación de Instagram de' | translate }} {{ store.name }}">
					</div>
				</div>
			</div>
		{% endif %}
    </div>
{% endif %}