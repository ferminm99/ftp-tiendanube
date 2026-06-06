<!-- Modal -->
<div id="news-popup"  class="modal fade news-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <span class="btn btn-floating pull-right hidden-xs" data-dismiss="modal" aria-label="Close">
            {% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa fa-lg pull-left m-none"} %}
        </span>
        <div class="row">
            <div class='{% if "newsletter_image.jpg" | has_custom_image %}col-md-6{% else %}col-md-12{% endif %}'>
                <div class="text-center m-top-half m-bottom-half">
                    <div class="logo-img-container {% if not has_logo %}hidden{% endif %}">
                        <img src="{{ 'img/empty-placeholder.png' | static_url }}" data-src="{{ store.logo('large') }}" class="lazyload logo-img m-auto">
                    </div>
                    <a class="logo-text {% if has_logo %} hidden {% endif %}" href="{{ store.url }}">{{ store.name }}</a>
                </div>
                {% if settings.news_popup_txt %}
                    <p class="text-center">{{ settings.news_popup_txt }}</p>
                {% else %}
                    <p class="text-center">{{ '¡Suscribite y recibí todas nuestras novedades!'  | translate }}</p>
                {% endif %}
                <div class="{% if "newsletter_image.jpg" | has_custom_image %}col-md-12 {% else %} col-md-8 col-md-offset-2{% endif %}">
                    <div id="news-popup-form-container">
                        <form id="news-popup-form" method="post" action="/winnie-pooh" data-store="newsletter-form-popup">
                            <div class="form-group">
                                <input type="text" class="js-mandatory-field form-control" name="name" onfocus="if (this.value == '{{ "Nombre" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Nombre" | translate }}';}" value='{{ "Nombre" | translate }}' aria-label='{{ "Nombre" | translate }}' />
                            </div>
                            <div class="form-group">
                                <input type="email" class="js-mandatory-field form-control" onfocus="if (this.value == '{{ "Tu E-mail" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Tu E-mail" | translate }}';}" value='{{ "Tu E-mail" | translate }}' name="email" aria-label='{{ "Tu E-mail" | translate }}'>
                            </div>
                            <div class="form-group winnie-pooh hidden">
                                <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
                                <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
                            </div>
                            <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
                            <input type="hidden" name="type" value="newsletter-popup" />
                            <input type="submit" name="contact" class="js-news-popup-submit btn btn-secondary center-block" value='{{ "Inscribirse" | translate }}' />
                        </form>
                        <div style='display: none;' class="js-news-spinner loading-modal text-center m-top">
                            {% include "snipplets/svg/circle-notch.tpl" with {fa_custom_class: "svg-inline--fa fa-circle-o-notch fa-spin svg-text-fill"} %}
                            {{ "Enviando suscripción..." | translate }}
                        </div>
                        <div style='display: none;' class="js-news-popup-success contact-ok alert alert-success m-top">{{ "Se inscribió al newsletter correctamente" | translate }}</div>
                        <div style='display: none;' class="js-news-popup-failed contact-error alert alert-danger m-top">{{ "Ingrese su Email" | translate }}</div>
                    </div>
                </div>
            </div>
            {% if "newsletter_image.jpg" | has_custom_image %}
                <div class="col-md-6 ">
                    <img class="lazyautosizes lazyload full-width img-responsive p-right" src="{{ 'img/empty-placeholder.png' | static_url }}" data-srcset='{{ "newsletter_image.jpg" | static_url | settings_image_url('large') }} 480w, {{ "newsletter_image.jpg" | static_url | settings_image_url('huge') }} 640w' data-sizes="auto" />
                </div>
            {% endif %}
        </div>
      </div>
    </div>
  </div>
</div>
