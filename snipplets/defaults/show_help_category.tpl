{# Products that work as examples #}

<div class="container">
    <div class="title-container row m-top">
        <h2 class="title h1 h5-xs">{{"Productos de ejemplo" | translate}}</h2>
    </div>
    <div class="row text-center-xs">
        <section id="grid" class="js-masonry-grid product-grid m-bottom">  
            <div class="js-masonry-grid"> 
                <div class="row">
                    {% include 'snipplets/defaults/help_item.tpl' with {'help_item_1': true, item_promotional_price: true} %}
                    {% include 'snipplets/defaults/help_item.tpl' with {'help_item_2': true} %}
                    {% include 'snipplets/defaults/help_item.tpl' with {'help_item_3': true, item_promotional_price: true} %}
                    {% include 'snipplets/defaults/help_item.tpl' with {'help_item_4': true} %}
                    {% include 'snipplets/defaults/help_item.tpl' with {'help_item_5': true} %}
                    {% include 'snipplets/defaults/help_item.tpl' with {'help_item_6': true} %}
                    {% include 'snipplets/defaults/help_item.tpl' with {'help_item_7': true, item_promotional_price: true} %}
                    {% include 'snipplets/defaults/help_item.tpl' with {'help_item_8': true} %}
                </div>
            </div>
        </section>
    </div>
</div>
