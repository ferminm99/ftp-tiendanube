{# Main banners that work as examples #}

<div class="js-{{ banner_name }}-banner-placeholder" data-store="home-banner-{{ section_id }}">
    <div class="{{ banners_container_classes }}">
        <div class="row">
            {% for i in 1..banners_amount %}
                <div class="{{ banner_column_classes }}">
                    <div class="{{ banner_container_classes }}">
                        <div class="{{ banner_image_container_classes }}">
                        </div>
                        <div class="{{ banner_text_container_classes }}">
                            {% if banner_shape %}
                                <div class="textbanner-shape"></div>
                            {% endif %}
                            <h3 class="{{ banner_title_classes }}">{{ banner_title }}</h3>
                        </div>
                        <div class="placeholder-empty-overlay placeholder-slider transition-soft">
                            <div class="placeholder-info">
                                {% include "snipplets/svg/edit.tpl" with {fa_custom_class: "svg-inline--fa fa-3x svg-text-fill"} %}
                                <div class="placeholder-description font-small-xs">
                                    {{ banner_help_text }} <strong>"{{ banner_help_section }}"</strong>
                                </div>
                                {% if not params.preview %}
                                    <a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small">{{ "Editar" | translate }}</a>
                                {% endif %}
                            </div>
                        </div>
                    </div>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
