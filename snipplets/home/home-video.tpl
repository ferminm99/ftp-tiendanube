{# Home video #}

{% if settings.video_embed %}
    <div class="container" data-store="home-video">
    	<div class="row">
    		<div class="col-xs-12">
    			{% include 'snipplets/video-item.tpl' %}
    		</div>
    	</div>
    </div>
{% endif %}