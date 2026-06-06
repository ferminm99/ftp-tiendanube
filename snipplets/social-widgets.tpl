{# Mobile Sharing #}
<div class="social-widgets-mobile clear-both p-top-half p-bottom-half">
	<h5 class="p-top-quarter">{{ "Compartir" | translate }}:</h5>
	{# 	Whatsapp button #}
	<a class="js-mobile-social-share btn-social-mobile btn-social-mobile_whatsapp product-share-button bg-whatsapp d-inline-block-xs m-right-half" data-network="whatsapp" target="_blank"
	 href="whatsapp://send?text={{ product.social_url }}" title="{{ 'Compartir en WhatsApp' | translate }}" aria-label="{{ 'Compartir en WhatsApp' | translate }}">{% include "snipplets/svg/whatsapp.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill"} %}</a>
	{#  Facebook button #}
	<a class="js-mobile-social-share btn-social-mobile btn-social-mobile_facebook product-share-button bg-facebook d-inline-block m-right-half" data-network="facebook" target="_blank"
	 href="https://www.facebook.com/sharer/sharer.php?u={{ product.social_url }}"
	 title="{{ 'Compartir en Facebook' | translate }}" aria-label="{{ 'Compartir en Facebook' | translate }}">{% include "snipplets/svg/facebook.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill"} %}</a>
	{# Twitter button #}
	<a class="js-mobile-social-share btn-social-mobile btn-social-mobile_twitter product-share-button bg-twitter d-inline-block m-right-half" data-network="twitter" target="_blank"
	 href="https://twitter.com/share?url={{ product.social_url }}"
	 title="{{ 'Compartir en Twitter' | translate }}" aria-label="{{ 'Compartir en Twitter' | translate }} ">{% include "snipplets/svg/twitter.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill"} %}</a>
	{# Pinterest button that triggers real pin button hidden with CSS #}
    <a class="js-product-share btn-social-mobile js-pinterest-share btn-social-mobile btn-social-mobile_pinterest product-share-button bg-pinterest d-inline-block m-right-half" href="#" target="_blank" title="{{ 'Compartir en Pinterest' | translate }}" aria-label="{{ 'Compartir en Pinterest' | translate }}">{% include "snipplets/svg/pinterest.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill"} %}</a>
     <div class="pinterest-hidden hidden" data-network="pinterest">{{product.social_url | pin_it('http:' ~ product.featured_image | product_image_url('original'))}}</div>
</div>
