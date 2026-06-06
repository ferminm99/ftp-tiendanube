{{ component('nubesdk-slot', { type: 'before_section_newsletter' }) }}

<div class="container" data-store="home-newsletter">
	<div class="row home-widgets m-top-double">
		{% set blocksCount = 1%}
		{% if settings.show_footer_fb_like_box and store.facebook %}
			{% set blocksCount = blocksCount + 1 %}
		{% endif %}
		{% if settings.twitter_widget %}
			{% set blocksCount = blocksCount + 1 %}
		{% endif %}
		
		<div class="{% if blocksCount == 1 %}col-md-4 col-md-offset-4{% elseif blocksCount == 2 %}col-md-6{% else %}col-md-4{% endif %} p-bottom-xs">
			<div class="title-container">
		   		<h2 class="subtitle h5-xs">{{"Nuestro Newsletter" | translate}}</h2>
		    </div>
			{% snipplet "newsletter.tpl" %}
		</div>
		{% if settings.show_footer_fb_like_box and store.facebook %}
    		<div class="{% if blocksCount == 2 %}col-md-6{% else %}col-md-4{% endif %}" data-store="home-facebook-page">
    			<div class="title-container">
    		   		<h2 class="subtitle h5-xs">{{"Estamos en Facebook" | translate}}</h2>
    		    </div>
                <div class="followus-container">
                    <div class="fb-page">
                        <div class="fb-page-head p-all-half">
                            <div class="d-flex">
                                <div class="fb-page-img-container m-right-half text-center">
    		                        {% if has_logo %}
    		                            <img src="{{ 'img/empty-placeholder.png' | static_url }}" class="fb-page-img lazyload" data-src="{{ store.logo('thumb')}}"/>
    		                        {% else %}
    		                        	{% include "snipplets/svg/facebook.tpl" with {fa_custom_class: "svg-inline--fa fa-3x fb-page-icon"} %}
    		                        {% endif %}
    		                    </div>
                                <div>
                                    <div class="fb-page-title h4 m-top-none weight-normal">{{ store.name }}</div>
                                    <div class="m-top-half">
                                        <a href="{{ store.facebook }}" target="_blank" class="fb-like weight-strong">
                                            {% include "snipplets/svg/thumbs-up.tpl" with {fa_custom_class: "svg-inline--fa m-right-quarter"} %}
                                            {{ 'Me gusta' | translate }}
                                        </a>
                                	</div>
                            	</div>
                        	</div>
                        </div>
                        <div class="fb-page-footer p-all-half">
                            <div class="fb-page-box">
                                <a href="{{ store.facebook }}" target="_blank" class="fb-page-link">
                                    <span class="weight-strong opacity-80">{{ 'Visitá nuestra página' | translate }}</span>
                                    {% include "snipplets/svg/facebook.tpl" with {fa_custom_class: "svg-inline--fa fa-lg m-left-quarter"} %}
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
    		</div>
		{% endif %}
		{% if settings.twitter_widget %}
    		<div class="{% if blocksCount == 2 %}col-md-6{% else %}col-md-4{% endif %}" data-store="home-twitter-feed">
    			<div class="title-container">
    		   		<h2 class="subtitle h5-xs">{{"Estamos en Twitter" | translate}}</h2>
    		    </div>
    			{{ settings.twitter_widget | raw }}
    		</div>
		{% endif %}
	</div>
</div>

{{ component('nubesdk-slot', { type: 'after_section_newsletter' }) }}
