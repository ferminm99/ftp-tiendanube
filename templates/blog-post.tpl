<div class="container container-narrow">
    <div class="title-container" data-store="page-title">
        {% snipplet "breadcrumbs.tpl" %}
        <h1 class="title">{{ post.title }}</h1>
    </div>
    <div class="m-top-half">
        {{ component(
            'blog/blog-post-content', {
                image_lazy: true,
                image_lazy_js: true,
                post_content_classes: {
                    date: 'm-bottom font-small',
                    image: 'img-fluid fade-in m-bottom',
                    content: 'm-bottom',
                },
            })
        }}
    </div>
</div>
