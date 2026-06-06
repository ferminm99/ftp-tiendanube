window.tiendaNubeInstaTheme = (function(jQueryNuvem) {
	return {
		waitFor: function() {
			return [window.homeSlider];
		},
		handlers: function(instaElements) {
			return {
				logo: new instaElements.Logo({
					$storeName: jQueryNuvem('#no-logo'),
					$logo: jQueryNuvem('#logo')
				}),
				slider: new instaElements.GenericSlider(window.homeSlider),
				slider_auto: new instaElements.AutoSliderCheckbox({
					slider: 'slider'
				}),
				// ----- Section order -----
				home_order_position: new instaElements.Sections({
					container: '.js-home-sections-container',
					data_store: {
						'products': 'home-products-featured',
						'categories': 'home-banner-categories',
						'main_categories': 'home-categories-featured',
						'modules': 'home-image-text-module',
						'video': 'home-video',
						'sale': 'home-products-sale',
						'instafeed': 'home-instagram-feed',
						'promotional': 'home-banner-promotional',
						'newsletter': 'home-newsletter'
					}
				}),
			};
		}
	};})(jQueryNuvem);