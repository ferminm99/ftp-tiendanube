<div class="container">
    <div class="title-container" data-store="page-title">
        {% snipplet "breadcrumbs.tpl" %}
        <h1 class="title">{{ "Blog" | translate }}</h1>
    </div>
    <section class="m-top-half">
            {% for post in blog.posts %}
                {% if loop.index % 3 == 1 %}
                    <div class="row m-bottom-double m-bottom-none-xs">
                {% endif %}
                {{ component(
                    'blog/blog-post-item', {
                    image_lazy: true,
                    image_lazy_js: true,
                    post_item_classes: {
                        item: 'col-md-4 m-bottom-xs p-bottom-xs',
                        image_container: 'm-bottom',
                        image: 'img-absolute img-absolute-centered fade-in',
                        title: 'post-item-title m-bottom-half font-medium',
                        summary: 'm-bottom-half',
                        read_more: 'btn-link-small',
                        },
                    })
                }}
                {% if loop.index % 3 == 0 or loop.last %}
                    </div>
                {% endif %}
            {% endfor %}
    </section>
    {% include 'snipplets/pagination.tpl' with {'pages': blog.pages} %}
</div>
