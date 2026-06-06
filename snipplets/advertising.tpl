<div class="js-adbar section-advertising">
	<div class="container-fluid">
		{% if settings.ad_bar and settings.ad_text %}
			{% if settings.ad_url %}
				<a href="{{ settings.ad_url | setting_url }}">
			{% endif %}  
			{% if settings.ad_text %}
				{{ settings.ad_text }}
			{% endif %} 
			{% if settings.ad_url %}
				</a>
			{% endif %} 
		{% endif %}    
	</div>   	
</div>