{# Slider that work as example #}

<div class="js-home-slider-placeholder" data-store="home-slider">
	<div class="js-home-empty-slider home-slider swiper-container m-bottom m-bottom-half-xs swiper-container-horizontal">
		<div class="swiper-wrapper">
			<div class="swiper-slide slide-container">
				{{ component('placeholders/banner-placeholder')}}
			</div>
			<div class="swiper-slide slide-container">
				{{ component('placeholders/banner-placeholder')}}
			</div>
			<div class="swiper-slide slide-container">
				{{ component('placeholders/banner-placeholder')}}
			</div>
		</div>
		<div class="placeholder-empty-overlay placeholder-slider transition-soft">
			<div class="placeholder-info">
				{% include "snipplets/svg/edit.tpl" with {fa_custom_class: "svg-inline--fa fa-3x svg-text-fill"} %}
				<div class="placeholder-description font-small-xs">
					{{ "Podés subir imágenes principales desde" | translate }} <strong>"{{ "Carrusel de imágenes" | translate }}"</strong>
				</div>
				{% if not params.preview %}
					<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small">{{ "Editar" | translate }}</a>
				{% endif %}
			</div>
		</div>
		<div class="js-swiper-home-empty-pagination swiper-pagination swiper-pagination-bullets d-block">
			<span class="swiper-pagination-bullet"></span>
			<span class="swiper-pagination-bullet"></span>
			<span class="swiper-pagination-bullet"></span>
		</div>
		<div class="js-swiper-home-empty-control js-swiper-home-prev swiper-button-prev hidden-xs">{% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "slider-arrow"} %}</div>
		<div class="js-swiper-home-empty-control js-swiper-home-next swiper-button-next hidden-xs">{% include "snipplets/svg/angle-right.tpl" with {fa_custom_class: "slider-arrow"} %}</div>
	</div>
</div>