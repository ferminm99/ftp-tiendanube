{#/*============================================================================
	#Specific store JS functions: product variants, cart, shipping, etc
==============================================================================*/#}

{#/*============================================================================
  
  Table of Contents

    #Lazy load
    #Accordions
    #Cards
    #Modals
    #Notifications
    #Header and nav
        // Mobile navigation tabs and search
        // Desktop fixed nav
        // Search suggestions
    #Home page
        // Newsletter popup
        // Home slider
        // Banner services slider
        // Products slider
        // Youtube or Vimeo video embed
    #Product grid
        // Sort by
        // Filters
        // Fixed category controls
        // Mobile pagination
        // Infinite scroll
        // Product color variations
        // Quickshop
        // Secondary image on mouseover
    #Product detail functions
        // Installments
        // Change Variant
        // Product labels on variant change
        // Color and size variations
        // Quickshop variant update
        // Pinterest sharing
        // Product slider
        // Product thumbs
        // Mobile zoom
        // Product mobile variants
        // Submit to contact
    #Cart
        // Free shipping bar
        // Cart quantitiy changes
        // Empty cart alert
        // Add to cart
        // Cart toggle
        // Go to checkout
    #Shipping calculator
        // Select and save shipping function
        // Toggle branches link
        // Shipping and branch click
        // Select shipping first option on results
        // Calculate shipping by submit
        // Calculate shipping function
        // Toggle more shipping options
        // Calculate shipping on page load
        // Calculate product detail shipping on page load
        // Change CP
        // Shipping provinces
        // Change store country
    #Forms
    #Footer

==============================================================================*/#}

// Move to our_content
window.urls = {
    "shippingUrl": "{{ store.shipping_calculator_url | escape('js') }}"
}

{#/*============================================================================
  #Lazy load
==============================================================================*/ #}

{# Lazy load horizontal for sliders #}

window.lazySizesConfig = window.lazySizesConfig || {};
lazySizesConfig.hFac = 0.1;

{# Masonry Grid #}
var grid = document.querySelector('.js-masonry-grid');
if (grid) {
    window.$masonry_grid = new Masonry( grid, {
        // options
        itemSelector: '.js-masonry-grid-item',
        transitionDuration: 0,
        horizontalOrder: true
    });

	imagesLoaded( grid ).on( 'progress', function() {
	  // layout Masonry after each image loads
	  $masonry_grid.layout();
	});
}

LS.ready.then(function() {

    $(document).ready(function(){

        {#/*============================================================================
            #Accordions
        ==============================================================================*/ #}

        $(document).on("click", ".js-accordion-toggle", function(e) {
            e.preventDefault();
            if($(this).hasClass("js-accordion-show-only")){
                $(this).hide();
            }else{
                $(this).find(".js-accordion-toggle-inactive").toggle();
                $(this).find(".js-accordion-toggle-active").toggle();
            }
            $(this).prev(".js-accordion-container").slideToggle();
        });

        {#/*============================================================================
        #Cards
        ==============================================================================*/ #}

        $(document).on("click", ".js-card-collapse-toggle", function(e) {
            e.preventDefault();
            $(this).toggleClass('active');
            $(this).closest(".js-card-collapse").toggleClass('active').find(".js-card-body").slideToggle("fast");
        });

        {#/*============================================================================
          #Modals
        ==============================================================================*/ #}

        {# Modals above all elements #}

        $(document).on("click", ".js-trigger-modal-zindex-top", function (e) {
            e.preventDefault();
            var modal_id = $(this).attr("href");
            $(modal_id).detach().insertAfter(".modal-backdrop");
            $(".modal-backdrop").addClass("modal-backdrop-zindex-top");
        });

        if ($(window).width() < 768) {

            {# Modals backdrop close on mobile for small popups #}
            
            $(document).on("click", ".modal-backdrop", function () {
                $(this).next(".js-modal-xs-centered").modal('toggle');
            });

            {# Full screen mobile modals back events #}

            {# Clean url hash function #}

            cleanURLHash = function(){
                const uri = window.location.toString();
                const clean_uri = uri.substring(0, uri.indexOf("#"));
                window.history.replaceState({}, document.title, clean_uri);
            };

            {# Go back 1 step on browser history #}

            goBackBrowser = function(){
                cleanURLHash();
                history.back();
            };

            {# Clean url hash on page load: All modals should be closed on load #}

            if(window.location.href.indexOf("modal-fullscreen") > -1) {
                cleanURLHash();
            }

            {# Open full screen modal and url hash #}

            $(document).on("click", ".js-fullscreen-modal-open", function(e) {
                e.preventDefault();
                var modal_url_hash = $(this).data("modal-url");            
                window.location.hash = modal_url_hash;
                $(".modal-backdrop").addClass("js-modal-backdrop-fullscreen");
            });

            {# Close full screen modal: Remove url hash #}

            $(document).on("click", ".js-fullscreen-modal-close, .js-modal-backdrop-fullscreen", function(e) {
                e.preventDefault();
                goBackBrowser();
            });

            {# Hide panels or modals on browser backbutton #}

            window.onhashchange = function() {
                if(window.location.href.indexOf("modal-fullscreen") <= -1) {
                    $("body").removeClass("overflow-none");

                    {# For custom modals #}

                    if($(".js-fullscreen-modal").hasClass("modal-xs-right-in")){
                        $(".js-fullscreen-modal.modal-xs-right-in").toggleClass("modal-xs-right-in modal-xs-right-out");
                        setTimeout(function() { 
                            $(".js-fullscreen-modal.modal-xs-right-in").hide();
                        }, 300);

                    {# For bootstrap modals #}

                    }else if($(".js-fullscreen-modal").hasClass("in")){
                        $(".js-fullscreen-modal.in").modal('hide');
                    }
                }
            }
        }

        {# Bottom sheet modal #}

        $('.js-sheet-bottom').on('show.bs.modal', function (e) {
            setTimeout(function(){
                $('.modal-backdrop').addClass('sheet-bottom-backdrop');
            });
        });

        {#/*============================================================================
          #Notifications
        ==============================================================================*/ #}

        {# Notifications variables #}

        var $notification_status_page = $(".js-notification-status-page");
        var $fixed_bottom_button = $(".js-btn-fixed-bottom");

        {# /* // Close notification */ #}

        $(".js-notification-close, .js-tooltip-close").on( "click", function(e) {
            e.preventDefault();
            $(this).closest(".js-notification, .js-tooltip").hide();
        });

        {# /* // Follow order status notification */ #}

        if ($notification_status_page.size() > 0){
            if (LS.shouldShowOrderStatusNotification($notification_status_page.data('url'))){
                $notification_status_page.show();
            };
            $(".js-notification-status-page-close").on( "click", function(e) {
                e.preventDefault();
                LS.dontShowOrderStatusNotificationAgain($notification_status_page.data('url'));
            });
        }

        {# /* // Quick Login tooltip */ #}

        {% if not customer and template == 'home' %}

            {# Show quick login messages if it is returning customer #}

            setTimeout(function(){
                if (cookieService.get('returning_customer') && LS.shouldShowQuickLoginNotification()) {
                    {% if store.country == 'AR' %}
                        $(".js-quick-login-badge").fadeIn();
                        $(".js-login-tooltip").show();
                        $(".js-login-tooltip-desktop").show().addClass("visible");
                    {% else %}
                        $(".js-notification-quick-login").fadeIn();
                    {% endif %}
                    return;
                }
                
            },500);

        {% endif %}

        {# Dismiss quick login notifications #}

        $(".js-dismiss-quicklogin").on( "click", function(e) {
            LS.dontShowQuickLoginNotification();
        });

        {% if customer and just_logged_in %}

            $(".js-quick-login-success").addClass("visible");
            
            setTimeout(function(){
                $(".js-quick-login-success").removeClass("visible").delay(800).fadeOut();
            },8000);

        {% endif %}

        {% if not params.preview %}

            {# /* // Legal footer visibility */ #}

            const footerLegal = $(".js-footer-legal");

            let footerOffset = 20;

            if (window.innerWidth > 768) {
                footerOffset = 0;
            }

            {# /* // Cookie banner notification */ #}

            restoreNotifications = function(){

                // Whatsapp button position
                if ($(window).width() < 768) {
                    $fixed_bottom_button.css({"margin-bottom": "10px"});
                }

                {# Restore notifications when Cookie Banner is closed #}

                footerLegal.removeAttr("style");
            };

            if (!window.cookieNotificationService.isAcknowledged()) {
                $(".js-notification-cookie-banner").show();

                {# Offset to show legal footer #}

                const cookieBannerHeight = $(".js-notification-cookie-banner").outerHeight();
                footerLegal.css("padding-bottom", cookieBannerHeight + footerOffset + "px");

                {# Whatsapp button position #}
                if ($(window).width() < 768) {
                    $fixed_bottom_button.css({"margin-bottom": "120px"});
                }else {
                    $fixed_bottom_button.css({"margin-bottom": "100px"});
                }
            }

            $(".js-acknowledge-cookies").on( "click", function(e) {
                window.cookieNotificationService.acknowledge();
                restoreNotifications();
            });

        {% endif %}
        
        {#/*============================================================================
          #Header and nav
        ==============================================================================*/ #}        

        {# /* // Mobile navigation tabs and search */ #}

        var $top_nav = $(".js-mobile-nav");
        var $page_main_content = $(".js-main-content");
        var $mobile_categories_btn = $(".js-toggle-mobile-categories");
        var $main_categories_mobile_container = $(".js-categories-mobile-container");
        var $search_backdrop = $(".js-search-backdrop");
        var $delete_search = $(".js-search-delete");
        var $search_suggest = $(".js-search-suggest");

        // Mobile search
        $(".js-toggle-mobile-search").click(function(e){
            e.preventDefault;
            var $mobile_tab_navigation = $(".js-mobile-nav-second-row");
            $(".js-mobile-first-row").toggle();
            $(".js-mobile-search-row").toggle();
            $mobile_tab_navigation.toggle();
            $(".js-search-input").val();
            $search_backdrop.toggle().toggleClass("search-open");
            if(!$("body").hasClass("mobile-categories-visible")){
                $("body").toggleClass("overflow-none");
            }else{
                $("body").removeClass("mobile-categories-visible");
            }
            $main_categories_mobile_container.hide();
            $(".js-mobile-nav-arrow").hide();
            if($page_main_content.hasClass("move-up")){
                $page_main_content.removeClass("move-up").addClass("move-down");
                $search_backdrop.removeClass("move-up").addClass("move-down");
                setTimeout(function() { 
                    $page_main_content.removeClass("move-down");
                }, 200);
            }else{
                $page_main_content.removeClass("move-down").addClass("move-up");
                $search_backdrop.removeClass("move-down").addClass("move-up");
            }
            if($mobile_categories_btn.hasClass("selected")){
                $mobile_categories_btn.removeClass("selected");
                $(".js-current-page").addClass("selected");
            }
        });


        var $mobile_search_input = $(".js-mobile-search-input");
        $(".js-toggle-mobile-search-open").click(function(e){
            e.preventDefault;
            $mobile_search_input.focus();
        });
        $(".js-search-back-btn").click(function(e){
          $(".js-search-suggest").hide();
          $mobile_search_input.val('');
        });

        $mobile_search_input.keyup(function(){
            $delete_search.show();
        });

        $mobile_search_input.focusout(function(){
            var val = $mobile_search_input.val();
            if(val == ''){
                $delete_search.hide();
            }else{
                $delete_search.show();
            }
        });
        
        $delete_search.click(function(e){
            e.preventDefault();
            $(this).hide();
            $mobile_search_input.val('').focus();
            $search_suggest.hide();
        });

        {# Mobile nav categories #}

        $top_nav.addClass("move-down").removeClass("move-up");
        $mobile_categories_btn.click(function(e){
            e.preventDefault();
            $("body").toggleClass("overflow-none mobile-categories-visible");
            $(".js-mobile-nav-arrow").toggle();
            if($mobile_categories_btn.hasClass("selected")){
                $mobile_categories_btn.removeClass("selected");
                $(".js-current-page").addClass("selected");
            }else{
                $mobile_categories_btn.addClass("selected");
                $(".js-current-page").removeClass("selected");
            }
            $main_categories_mobile_container.toggle();
            if($top_nav.hasClass("move-up")){
                $main_categories_mobile_container.toggleClass("move-list-up");
            }
        });

        {# Mobile nav subcategories #}

        $(".js-open-mobile-subcategory").click(function(e){
            e.preventDefault();
            var $this = $(this);
            var this_link_id_val = $this.data("target");
            var $subcategories_panel_to_be_visible = $this.closest($main_categories_mobile_container).find("#" + this_link_id_val);
            $subcategories_panel_to_be_visible.detach().insertAfter(".js-categories-mobile-container > .js-mobile-nav-subcategories-panel:last-child");
            $subcategories_panel_to_be_visible.addClass("modal-xs-right-out").show();
            setTimeout(function(){
                $subcategories_panel_to_be_visible.toggleClass("modal-xs-right-in modal-xs-right-out");
            },100);
        });

        $(".js-go-back-mobile-categories").click(function(e){
            e.preventDefault();
            var $this = $(this);
            var $subcategories_panel_to_be_closed = $this.closest(".js-mobile-nav-subcategories-panel");
            $(".js-mobile-nav-subcategories-panel").scrollTop(0);
            $subcategories_panel_to_be_closed.toggleClass("modal-xs-right-in modal-xs-right-out");
            setTimeout(function() { 
                $subcategories_panel_to_be_closed.removeClass("modal-xs-right-out").hide();
            },300);
        });

        {# Mobile nav hamburger subitems #}

        $(".js-toggle-hamburger-panel").click(function(e){
        e.preventDefault();
            $("body, .js-hamburger-overlay, .js-hamburger-panel, .js-main-content").toggleClass("hamburger-panel-animated");
        });

        $(".js-toggle-page-accordion").click(function (e) {
            e.preventDefault();
            $(this).toggleClass("selected").closest(".js-hamburger-panel-toggle-accordion").next(".js-pages-accordion").slideToggle(300);
        });

        // Show and hide part of nav depending scroll up or down
        var didScroll;
        var lastScrollTop = 0;
        var delta = 20;
        var navbarHeight = $('header').outerHeight();

        $(window).scroll(function(event){
            didScroll = true;
        });

        setInterval(function() {
            if (didScroll) {
                hasScrolled();
                didScroll = false;
            }
        }, 250);

        function hasScrolled() {
            var st = $(this).scrollTop();
            
            // Make sure they scroll more than delta
            if(Math.abs(lastScrollTop - st) <= delta)
                return;
            
            // If they scrolled down and are past the navbar, add class .move-up.
            if (st > lastScrollTop && st > navbarHeight){
                // Scroll Down
                    if(!$("body").hasClass("mobile-categories-visible")){
                        $top_nav.addClass("move-up").removeClass("move-down");
                    }
                    $(".backdrop").addClass("move-up").removeClass("move-down");
            } else {
                // Scroll Up
                if(st + $(window).height() < $(document).height()) {
                    if(!$("body").hasClass("mobile-categories-visible")){
                        $top_nav.removeClass("move-up").addClass("move-down");
                    }
                    $(".backdrop").removeClass("move-up").addClass("move-down");
                }
            }
            
            lastScrollTop = st;
        }

        {% if settings.ad_bar and settings.ad_text %}
            
            {# Mobile ad bar position #}

            var top_nav_height = $top_nav.outerHeight();
            var adbar_height = $(".js-adbar").outerHeight();                
            if ($(window).width() < 768) {
                $(".js-logo-container").css("padding-top" , adbar_height + top_nav_height);
                $(".js-categories-mobile-tabs, .js-mobile-nav-subcategories-panel").css("padding-top" , adbar_height);
                $top_nav.css("top" , adbar_height);
            }

            
        {% endif %}

        {# /* // Desktop fixed nav */ #}

        {% if settings.fixed_menu %}
            var menu = $('.js-nav-head-main');
            var pos = menu.offset();
            var fixedMenu = $('.js-nav-head-fixed');

            $(window).scroll(function(){
                if($(this).scrollTop() > pos.top + menu.height() && !fixedMenu.hasClass('fixed')){
                    fixedMenu.animate({top:'0'},200).addClass('fixed');
                } else if($(this).scrollTop() <= pos.top && fixedMenu.hasClass('fixed')){
                    fixedMenu.animate({top:'-140px'},200,function(){
                        $(this).removeClass('fixed');
                    });
                    $(".js-nav-head-fixed .js-search-suggest").hide();
                }
            });
        {% endif %}

        {# /* // Search suggestions */ #}

        LS.search($(".js-search-input"), function(html, count){
            $search_suggests = $(this).closest(".js-search-container").next(".js-search-suggest");
            if(count > 0){
                $search_suggests.html(html).show();
            }else{
                $search_suggests.hide();
            }
        }, {
            snipplet: 'navigation/search-results.tpl'
        });
        

        if ($(window).width() > 768) {

            {# Hide search suggestions if user click outside results #}

            $("body").click(function () {
                $(".js-search-suggest").hide();
            });

            {# Maintain search suggestions visibility if user click on links inside #}

            $(document).on("click", ".js-search-suggest a", function () {
                $(".js-search-suggest").show();
            });
        }
        
        $(".js-search-suggest").on("click", ".js-search-suggest-all-link", function(e){
            e.preventDefault();
            $this_closest_form = $(this).closest(".js-search-suggest").prev(".js-search-container").find(".js-search-form");
            $this_closest_form.submit();
        });

        {#/*============================================================================
          #Home page
        ==============================================================================*/ #}

        {# /* // Newsletter popup */ #}

        LS.newsletter_avoid_siteblindado_bot();

        {% if settings.show_news_box %}
            var $newspopup_mandatory_field = $('#news-popup-form').find(".js-mandatory-field");
        	$('#news-popup-form').submit(function(){
    	        $(".js-news-spinner").show();
    	        $newspopup_mandatory_field.removeClass("input-error");
                $(".js-news-popup-submit").prop("disabled", true);
                ga_send_event('contact', 'newsletter', 'popup');
    		});
            LS.newsletter('#news-popup-form-container', '#news-popup', '{{ store.contact_url | escape('js') }}', function(response){
                $(".js-news-spinner").hide();
                var selector_to_use = response.success ? '.js-news-popup-success' : '.js-news-popup-failed';
                $(this).find(selector_to_use).fadeIn(100).delay(4000).fadeOut(500);
                if ($(".js-news-popup-success").css("display") == "block") {
                    setTimeout(function () {
                        $("#news-popup").modal('hide');
                    }, 2500);
                } else {
                    $newspopup_mandatory_field.addClass("input-error");
                }
                $(".js-news-popup-submit").prop("disabled", false);
            });

            $(document).ready(function () {
                LS.newsletterPopup({
                    selector: "#news-popup"
                });
            });
        {% endif %}

        {# /* // Home slider */ #}

        var width = window.innerWidth;
        
        {% if settings.slider_auto %}
            if (width > 767) { 
                var slider_autoplay = {delay: 6000,};
            } else {
                var slider_autoplay = false;
            }
        {% else %}
            var slider_autoplay = false;
        {% endif %}

        {% if params.preview %}
            window.homeSlider = {
                getAutoRotation: function() {
                    return slider_autoplay;
                },
                updateSlides: function(slides) {
                    homeSwiper.removeAllSlides();
                    slides.forEach(function(aSlide){
                        homeSwiper.appendSlide(
                            '<div class="swiper-slide slide-container">' +
                                (aSlide.link ? '<a href="' + aSlide.link + '">' : '' ) +
                                    '<img src="' + aSlide.src + '" class="slide-img"/>' + 
                                (aSlide.link ? '</a>' : '' ) +
                            '</div>'
                        );
                    });

                    {% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}

                    if(!slides.length){
                        $(".js-home-main-slider-container").addClass("hidden");
                        $(".js-home-empty-slider-container").removeClass("hidden")
                        $(".js-home-mobile-slider-visibility").removeClass("visible-xs");
                        {% if has_mobile_slider %}
                            $(".js-home-main-slider-visibility").removeClass("hidden-xs");
                            homeMobileSwiper.update();
                        {% endif %}
                    }else{
                        $(".js-home-main-slider-container").removeClass("hidden");
                        $(".js-home-empty-slider-container").addClass("hidden");
                        $(".js-home-mobile-slider-visibility").addClass("visible-xs");
                        {% if has_mobile_slider %}
                            $(".js-home-main-slider-visibility").addClass("hidden-xs");
                        {% endif %}
                    }
                },
                changeAutoRotation: function(){

                },
            };
        {% endif %}

        var homeSwiper = null;
        createSwiper(
            '.js-home-slider',
            {
                preloadImages: false,
                lazy: true,
                {% if settings.slider | length > 1 %}
                    loop: true,
                {% endif %}
                {% if settings.slider_auto %}
                    autoplay: slider_autoplay,
                {% endif %}
                {% if settings.slider_speed == '2000' %}
                    delay: 2000,
                {% elseif  settings.slider_speed == '4000' %}
                    delay: 4000,
                {% elseif  settings.slider_speed == '8000' %}
                    delay: 8000,
                {% elseif  settings.slider_speed == '15000' %}
                    delay: 15000,
                {% else %}
                    delay: 30000,
                {% endif %}
                pagination: {
                    el: '.js-swiper-home-pagination',
                    clickable: true,
                },
                navigation: {
                    nextEl: '.js-swiper-home-next',
                    prevEl: '.js-swiper-home-prev',
                },
            },
            function(swiperInstance) {
                homeSwiper = swiperInstance;
            }
        );

        var homeMobileSwiper = null;
        createSwiper(
            '.js-home-slider-mobile',
            {
                preloadImages: false,
                lazy: true,
                {% if settings.slider_mobile | length > 1 %}
                    loop: true,
                {% endif %}
                autoplay: false,
                pagination: {
                    el: '.js-swiper-home-pagination-mobile',
                    clickable: true,
                },
                navigation: {
                    nextEl: '.js-swiper-home-next-mobile',
                    prevEl: '.js-swiper-home-prev-mobile',
                },
            },
            function(swiperInstance) {
                homeMobileSwiper = swiperInstance;
            }
        );

        {% if settings.slider | length == 1 %}
            $('.js-swiper-home .swiper-wrapper').addClass( "disabled" );
            {% if params.preview %}
                $('.js-swiper-home-control').hide();
            {% else %}
                $('.js-swiper-home-control').remove();
            {% endif %}
        {% endif %}

        {# /* // Banner services slider */ #}

        {% set has_banner_services = settings.banner_services or settings.banner_services_home or settings.banner_services_category %}

        {% if has_banner_services %}

            {# /* // Banner services slider */ #}

            var width = window.outerWidth;
            if (width < 767) {   
                createSwiper('.js-mobile-services', {
                    slidesPerView: 1,
                    watchOverflow: true,
                    centerInsufficientSlides: true,
                    pagination: {
                        el: '.js-mobile-service-pagination',
                        clickable: true,
                    },
                });
            }

        {% endif %}


        {% if template == 'home' %}

            {# /* // Products slider */ #}

            {% if sections.sale.products %}
                {% if settings.product_color_variants or settings.quick_view %}

                    {# Duplicate cloned slide elements for quickshop or colors forms #}

                    updateClonedItemsIDs = function(element){
                        $(element).each(function() {
                            var $this = $(this);
                            var slide_index = $this.attr("data-swiper-slide-index");
                            var clone_quick_id = $this.find(".js-quickshop-container").attr("data-quickshop-id");
                            var clone_product_id = $this.attr("data-product-id");
                            $this.attr("data-product-id" , clone_product_id + "-clone-" + slide_index);
                            $this.find(".js-quickshop-container").attr("data-quickshop-id" , clone_quick_id + "-clone-" + slide_index);
                        });
                    };

                {% endif %}
                createSwiper('.js-swiper-sale-products', {
                    lazy: true,
                    {% if sections.sale.products | length > 4 %}
                    loop: true,
                    {% endif %}
                    watchOverflow: true,
                    centerInsufficientSlides: true,
                    watchSlidesVisibility: true,
                    slideVisibleClass: 'js-swiper-slide-visible',
                    threshold: 5,
                    slidesPerView: 2,
                    slidesPerGroup: 2,
                    pagination: {
                        el: '.js-swiper-sale-products-pagination',
                        clickable: true,
                    },
                    navigation: {
                        nextEl: '.js-swiper-sale-products-next',
                        prevEl: '.js-swiper-sale-products-prev',
                    },
                    breakpoints: {
                        768: {
                            slidesPerView: 4,
                            slidesPerGroup: 4,
                        }
                    },
                    {% if settings.product_color_variants or settings.quick_view %}
                        on: {
                            init: function () {
                                updateClonedItemsIDs(".js-swiper-sale-products .js-item-slide.swiper-slide-duplicate");
                            },
                        }
                    {% endif %}
                });

            {% endif %}

        {% endif %}

        {# /* // Youtube or Vimeo video for home or each product */ #}

        {% if template == 'home' %}
            {% set video_url = settings.video_embed %}
        {% elseif template == 'product' and product.video_url %}
            {% set video_url = product.video_url %}
        {% endif %}

        {% if video_url %}
            LS.loadVideo('{{ video_url }}');

            {# Empty product video modal iframe on close #}

            $('#modal-product-video').on('hidden.bs.modal', function (e) {
                $(".js-product-video-modal").find(".js-video-iframe").empty().hide();
            });
        {% endif %}

        {#/*============================================================================
          #Product grid
        ==============================================================================*/ #}

        {# /* // Sort by */ #}

        $('.js-sort-by').change(function(){
            var params = LS.urlParams;
            params['sort_by'] = $(this).val();
            var sort_params_array = [];
            for (var key in params) {
                if ($.inArray(key, ['results_only', 'page']) == -1) {
                    sort_params_array.push(key + '=' + params[key]);
                }
            }
            var sort_params = sort_params_array.join('&');
            window.location = window.location.pathname + '?' + sort_params;
        });

        {# /* // Filters */ #}

        $(".js-toggle-mobile-filters").click(function (e) {
            e.preventDefault();
            $(".js-mobile-filters-panel").toggleClass("modal-xs-right-in modal-xs-right-out");
            $("body").toggleClass("overflow-none");
        });

        {# /* // Filter apply and remove */ #}

        $(document).on("click", ".js-apply-filter, .js-remove-filter", function(e) {
            e.preventDefault();
            var filter_name = $(this).data('filter-name');
            var filter_value = $(this).data('filter-value');
            if($(this).hasClass("js-apply-filter")){
                $(this).find("[type=checkbox]").prop("checked", true);
                LS.urlAddParam(
                    filter_name, 
                    filter_value, 
                    true
                );
            }else{
                $(this).find("[type=checkbox]").prop("checked", false);
                LS.urlRemoveParam(
                    filter_name, 
                    filter_value
                );   
            }
            {# Toggle class to avoid adding double parameters in case of double click and show applying changes feedback #}

            if ($(this).hasClass("js-filter-checkbox")){
                if ($(window).width() < 768) {
                    $(".js-filters-overlay").show();
                    if($(this).hasClass("js-apply-filter")){
                        $(".js-applying-filter").show();
                    }else{
                        $(".js-removing-filter").show();
                    }
                }
                $(this).toggleClass("js-apply-filter js-remove-filter");
            }
        });

        $(document).on("click", ".js-remove-all-filters", function(e) {
            e.preventDefault();
            LS.urlRemoveAllParams();
        });

        {# /* // Mobile pagination */ #}

        $(".js-mobile-paginator-input").focusout(function(e){
            e.preventDefault();
            LS.paginateMobile();
        });

        {# /* // Infinite scroll */ #}

        {% if settings.infinite_scrolling and (template == 'category' or template == 'search') %}
            $(function() {
                new LS.infiniteScroll({
                    afterSetup: function() {
                        $('.js-pagination-container').hide();
                    },
                    productGridClass: 'js-product-table',
                    productsPerPage: {{ settings.category_quantity_products }},
                    finishData: function() {
                        $('.js-load-more-btn').remove();
                    },
                    afterLoaded: function() {
                        // Reload masonry items after load more products
                        $masonry_grid.reloadItems();
                        imagesLoaded( grid ).on( 'progress', function() {
                            // layout Masonry after each image loads
                            $masonry_grid.layout();
                        });
                    },
                    bufferPx: 550
                });
            });
        {% endif %}

        {# /* // Product color variations */ #}

        {% if settings.product_color_variants %}

            {# Product color variations #}

            $(document).on("click", ".js-color-variant", function(e) {
                e.preventDefault();
                $this = $(this);

                var option_id = $this.data('option');
                $selected_option = $this.closest('.js-item-product').find('.js-variation-option option').filter(function() {
                    return this.value == option_id;
                });
                $selected_option.prop('selected', true).trigger('change');

                $this.closest('.js-item-product').find('.js-color-variant-bullet .js-insta-variation-label').html(option_id);
                $this.closest('.js-item-product').find('.js-color-variant-bullet .js-insta-variations').removeClass('selected');
                $this.closest('.js-item-product').find('.js-color-variant-bullet .js-insta-variations[data-option="'+option_id+'"]').addClass('selected');

                var available_variant = $(this).closest(".js-quickshop-container").data('variants');

                var available_variant_color = $(this).closest('.js-color-variant-active').data('option');

                for (var variant in available_variant) {
                    if (option_id == available_variant[variant]['option'+ available_variant_color ]) {
                        if (available_variant[variant]['stock'] == null || available_variant[variant]['stock'] > 0 ) {
                            var otherOptions = getOtherOptionNumbers(available_variant_color);
                            var otherOption = available_variant[variant]['option' + otherOptions[0]];
                            var anotherOption = available_variant[variant]['option' + otherOptions[1]];
                            changeSelect($(this), otherOption, otherOptions[0]);
                            changeSelect($(this), anotherOption, otherOptions[1]);
                            break;
                        }
                    }
                }

                $this.siblings().removeClass("selected");
                $this.addClass("selected");
            });

            function getOtherOptionNumbers(selectedOption) {
                switch (selectedOption) {
                    case 0:
                        return [1, 2];
                    case 1:
                        return [0, 2];
                    case 2:
                        return [0, 1];
                }
            }

            function changeSelect(element, optionToSelect, optionIndex) {
                if (optionToSelect != null) {
                    var selected_option_parent_id = element.closest('.js-item-product').data("product-id");
                    var selected_option_attribute = $('.js-item-product[data-product-id="'+selected_option_parent_id+'"]').find('.js-color-variant-available-' + (optionIndex + 1)).data('value');
                    var selected_option = $('.js-item-product[data-product-id="'+selected_option_parent_id+'"]').find('.js-variation-option[data-variant-id="'+selected_option_attribute+'"] option').filter(function() {
                        return this.value == optionToSelect;
                    });

                    selected_option.prop('selected', true).trigger('change');

                    $this.closest('.js-item-product').find('.js-product-variants .variation_' + (optionIndex + 1) +' .js-insta-variation-label').html(optionToSelect);
                    
                    $this.closest('.js-item-product').find('.js-product-variants .variation_' + (optionIndex + 1) +' .js-insta-variations').removeClass('selected');
                    $this.closest('.js-item-product').find('.js-product-variants .variation_' + (optionIndex + 1) +' .js-insta-variations[data-option="'+optionToSelect+'"]').addClass('selected');
                    
                }
            }
        {% endif %}

        {# /* // Quickshop */ #}

        {% if settings.quick_view or settings.product_color_variants %}
    
            {# Product quickshop for color variations #}

            LS.registerOnChangeVariant(function(variant){
                {# Show product image on color change #}
                
                var $item_to_update_image = $('.js-item-product[data-product-id^="'+variant.product_id+'"].js-swiper-slide-visible');
                var $item_to_update_image_cloned = $('.js-item-product[data-product-id^="'+variant.product_id+'"].js-swiper-slide-visible.swiper-slide-duplicate');

                {# If item is cloned from swiper change only cloned item #}

                if($item_to_update_image.hasClass("swiper-slide-duplicate")){
                    var slide_item_index = $item_to_update_image_cloned.attr("data-swiper-slide-index");
                    var current_image = $('.js-item-image', '.js-item-product[data-product-id="'+variant.product_id+'-clone-'+slide_item_index+'" ]');
                }else{
                    var slide_item_index = $item_to_update_image.attr("data-swiper-slide-index");
                    var current_image = $('.js-item-image', '.js-item-product[data-product-id="'+variant.product_id+'"]');
                }
                current_image.attr('srcset', variant.image_url);
                {% if settings.product_hover %}
                    {# Remove secondary feature on image updated from changeVariant #}
                    current_image.closest(".js-item-with-secondary-image").removeClass("item-with-two-images");
                {% endif %}
            });

            $(document).on("click", ".js-quickshop-modal-open", function (e) {
                e.preventDefault();
                var $this = $(this);
                if($this.hasClass("js-quickshop-slide")){
                    $("#quickshop-modal .js-item-product").addClass("js-swiper-slide-visible js-item-slide");
                }
                LS.fillQuickshop($this);

                {# Image dimensions #}
                if ($(window).width() < 768) {
                    var product_image_dimension = $(this).closest('.js-item-product').find('.js-item-image-container').attr("style");
                    $("#quickshop-modal .js-quickshop-img-padding").attr("style", product_image_dimension);
                }

            });

        {% endif %}

        {% if settings.quick_view %}
            restoreQuickshopForm = function(){

                {# Clean quickshop modal #}

                $("#quickshop-modal .js-item-product").removeClass("js-swiper-slide-visible js-item-slide");
                $("#quickshop-modal .js-quickshop-container").attr( { 'data-variants' : '' , 'data-quickshop-id': '' } );
                $("#quickshop-modal .js-item-product").attr('data-product-id', '');

                {# Wait for modal to become invisible before removing form #}

                setTimeout(function(){
                    var $quickshop_form = $("#quickshop-form").find('.js-product-form');
                    var $item_form_container = $(".js-quickshop-opened").find(".js-item-variants");
                    
                    $quickshop_form.detach().appendTo($item_form_container);
                    $(".js-quickshop-opened").removeClass("js-quickshop-opened");
                },350);

            };

            {# Restore form to item when quickshop closes #}

            $('#quickshop-modal').on('hidden.bs.modal', function (event) {
                restoreQuickshopForm();
            });

            {# Product quantity #}

            $(document).on("click", ".js-quantity-up", function () {
                $quantity_input = $(this).closest(".js-quantity").find(".js-quantity-input");
                $quantity_input.val( parseInt($quantity_input.val(), 10) + 1);
            });

            $(document).on("click", ".js-quantity-down", function () {
                $quantity_input = $(this).closest(".js-quantity").find(".js-quantity-input");
                quantity_input_val = $quantity_input.val();
                if (quantity_input_val>1) { 
                    $quantity_input.val( parseInt($quantity_input.val(), 10) - 1);
                }
            });

        {% endif %}

        {# /* // Secondary image on mouseover */ #}

        {% if settings.product_hover %}
            if (window.innerWidth > 767) {
                $(document).on("mouseover", ".js-item-with-secondary-image:not(.item-with-two-images)", function(e) {
                    var secondary_image_to_show = $(this).find(".js-item-image-secondary");
                    secondary_image_to_show.show();
                    secondary_image_to_show.on('lazyloaded', function(e){
                        $(this).closest(".js-item-with-secondary-image").addClass("item-with-two-images");
                    });
                });
            }
        {% endif %}

        {#/*============================================================================
          #Product detail functions
        ==============================================================================*/ #}

        {# /* // Installments */ #}

        {# Installments without interest #}

        function get_max_installments_without_interests(number_of_installment, installment_data, max_installments_without_interests) {
            if (parseInt(number_of_installment) > parseInt(max_installments_without_interests[0])) {
                if (installment_data.without_interests) {
                    return [number_of_installment, installment_data.installment_value.toFixed(2)];
                }
            }
            return max_installments_without_interests;
        }

        {# Installments with interest #}

        function get_max_installments_with_interests(number_of_installment, installment_data, max_installments_with_interests) {
            if (parseInt(number_of_installment) > parseInt(max_installments_with_interests[0])) {
                if (installment_data.without_interests == false) {
                    return [number_of_installment, installment_data.installment_value.toFixed(2)];
                }
            }
            return max_installments_with_interests;
        }

        {# Updates installments on payment popup for native integrations #}

        function refreshInstallmentv2(price){
            $(".js-modal-installment-price" ).each(function( index ) {
                const installment = Number($(this).data('installment'));
                $(this).text(LS.currency.display_short + (price/installment).toLocaleString('de-DE', {maximumFractionDigits: 2, minimumFractionDigits: 2}));
            });
        }

        {# /* // Change variant */ #}

        {# Updates price, installments, labels and CTA on variant change #}

        function changeVariant(variant){
            $(".js-product-detail .js-shipping-calculator-response").hide();
            $("#shipping-variant-id").val(variant.id);
            var parent = $("body");
            if (variant.element){
                parent = $(variant.element);
            }

            var sku = parent.find('#sku');
            if(sku.length) {
                sku.text(variant.sku).show();
            }

            {% if settings.product_stock or settings.latest_products_available %}
                var stock = parent.find('.js-product-stock');
                const stock_qty = variant.stock ?? '';
                stock.text(stock_qty).show();
            {% endif %}

            {# Updates installments on list item and inside payment popup for Payments Apps #}

            var installment_helper = function($element, amount, price){
                $element.find('.js-installment-amount').text(amount);
                $element.find('.js-installment-price').attr("data-value", price);
                $element.find('.js-installment-price').text(LS.currency.display_short + parseFloat(price).toLocaleString('de-DE', { minimumFractionDigits: 2 }));
                if(variant.price_short && Math.abs(variant.price_number - price * amount) < 1) {
                    $element.find('.js-installment-total-price').text((variant.price_short).toLocaleString('de-DE', { minimumFractionDigits: 2 }));
                } else {
                    $element.find('.js-installment-total-price').text(LS.currency.display_short + (price * amount).toLocaleString('de-DE', { minimumFractionDigits: 2 }));
                }
            };

            if (variant.installments_data) {
                var variant_installments = JSON.parse(variant.installments_data);
                var max_installments_without_interests = [0,0];
                var max_installments_with_interests = [0,0];

                {# Hide all installments rows on payments modal #}
                $('.js-payment-provider-installments-row').hide();

                $.each(variant_installments, function(payment_method, installments) {

                    {# Identifies the minimum installment value #}
                    var paymentMethodId = '#installment_' + payment_method.replace(" ", "_") + '_1';
                    var minimumInstallmentValue = $(paymentMethodId).closest('.js-info-payment-method').attr("data-minimum-installment-value");

                    $.each(installments, function(number_of_installment, installment_data) {
                        max_installments_without_interests = get_max_installments_without_interests(number_of_installment, installment_data, max_installments_without_interests);
                        max_installments_with_interests = get_max_installments_with_interests(number_of_installment, installment_data, max_installments_with_interests);
                        var installment_container_selector = '#installment_' + payment_method.replace(" ", "_") + '_' + number_of_installment;

                        {# Shows installments rows on payments modal according to the minimum value #}
                        if(minimumInstallmentValue <= installment_data.installment_value) {
                            $(installment_container_selector).show();
                        }
                    
                        if(!parent.hasClass("js-quickshop-container")){
                            installment_helper($(installment_container_selector), number_of_installment, installment_data.installment_value.toFixed(2));
                        }
                    });
                });
                var $installments_container = $(variant.element + ' .js-max-installments-container .js-max-installments');
                var $installments_modal_link = $(variant.element + ' #btn-installments');
                var $payments_module = $(variant.element + ' .js-product-payments-container');
                var $installmens_card_icon = $(variant.element + ' .js-installments-credit-card-icon');

                {% if product.has_direct_payment_only %}
                var installments_to_use = max_installments_without_interests[0] >= 1 ? max_installments_without_interests : max_installments_with_interests;

                if(installments_to_use[0] <= 0 ) {
                {%  else %}
                var installments_to_use = max_installments_without_interests[0] > 1 ? max_installments_without_interests : max_installments_with_interests;

                if(installments_to_use[0] <= 1 ) {
                {% endif %}
                    $installments_container.hide();
                    $installments_modal_link.hide();
                    $payments_module.hide();
                    $installmens_card_icon.hide();
                } else {
                    $installments_container.show();
                    $installments_modal_link.show();
                    $payments_module.show();
                    $installmens_card_icon.show();
                    installment_helper($installments_container, installments_to_use[0], installments_to_use[1]);
                }
            }

            if (variant.contact) {
                $payments_module.hide();
            }

            if(!parent.hasClass("js-quickshop-container")){
                $('#installments-modal .js-installments-one-payment').text(variant.price_short).attr("data-value", variant.price_number);
            }


            if (variant.price_short){

                var variant_price_clean = variant.price_short.replace('$', '').replace('R', '').replace(',', '').replace('.', '');
                var variant_price_raw = parseInt(variant_price_clean, 10);

                parent.find('.js-price-display').text(variant.price_short).show();
                parent.find('.js-price-display').attr("content", variant.price_number).data('product-price', variant_price_raw);
            } else {
                parent.find('.js-price-display').hide();
            }

            if ((variant.compare_at_price_short) && !(parent.find(".js-price-display").css("display") == "none")) {
                parent.find('.js-compare-price-display').text(variant.compare_at_price_short).show();

                if(variant.compare_at_price_number > variant.price_number){
                    const saved_compare_price_money = variant.compare_at_price_number - variant.price_number;
                    parent.find('.js-offer-saved-money').text(LS.formatToCurrency(saved_compare_price_money));
                    parent.find(".js-saved-money-message").show();
                }else {
                    parent.find(".js-saved-money-message").hide();
                }
            } else {
                parent.find('.js-compare-price-display, .js-saved-money-message').hide();
            }

            var button = parent.find('.js-addtocart');

            {% set has_colors_and_quickshop = settings.product_color_variants and settings.quick_view %}

            {% if has_colors_and_quickshop %}
                var $quickshop_link = parent.find('.js-quickshop-modal-open');
            {% endif %}

            button.removeClass('cart').removeClass('contact').removeClass('nostock');
            {% if not store.is_catalog %}
            var $shipping_calculator_form = parent.find("#product-shipping-container");
            if (!variant.available){
                button.val('{{ settings.no_stock_text | escape('js') }}');
                button.addClass('nostock');
                button.attr('disabled', 'disabled');
                {% if has_colors_and_quickshop %}
                    $quickshop_link.hide();
                {% endif %}
                $shipping_calculator_form.hide();
            } else if (variant.contact) {
                button.val('{{ "Consultar precio" | translate }}');
                button.addClass('contact');
                button.removeAttr('disabled');
                {% if has_colors_and_quickshop %}
                    $quickshop_link.hide();
                {% endif %}
                $shipping_calculator_form.hide();
            } else {
                button.val('{{ "Agregar al carrito" | translate }}');
                button.addClass('cart');
                button.removeAttr('disabled');
                {% if has_colors_and_quickshop %}
                    $quickshop_link.show();
                {% endif %}
                $shipping_calculator_form.show();
            }
            {% endif %}

            {% if template == 'product' %}
                const base_price = Number($("#price_display").attr("content"));
                refreshInstallmentv2(base_price);

                {% if settings.last_product and product.variations %}
                    if(variant.stock == 1) {
                        $('.js-last-product').show();
                    } else {
                        $('.js-last-product').hide();
                    }
                    {% if settings.latest_products_available %}
                        const stock_limit = $(".js-latest-products-available").attr("data-limit");
                        if(variant.stock < stock_limit && variant.stock != null && variant.stock != 1 && variant.stock != 0) {
                            $('.js-latest-products-available').show();
                        } else {
                            $('.js-latest-products-available').hide();
                        }
                    {% endif %}
                {% endif %}
            {% endif %}

            {# Update shipping on variant change #}

            LS.updateShippingProduct();

            zipcode_on_changevariant = $("#product-shipping-container .js-shipping-input").val();
            $("#product-shipping-container .js-shipping-calculator-current-zip").text(zipcode_on_changevariant);

            {% if cart.free_shipping.min_price_free_shipping.min_price %}
                {# Updates free shipping bar #}

                LS.freeShippingProgress(true, parent);

            {% endif %}

        }

        {# /* // Product labels on variant change */ #}

        {# Stock, Offer and discount labels update #}

        $(document).on("change", ".js-variation-option", function(e) {

            var $parent = $(this).closest(".js-product-variants");
            var $variants_group = $(this).closest(".js-product-variants-group");
            var $quickshop_parent_wrapper = $(this).closest(".js-quickshop-container");

            {# If quickshop is used from modal, use quickshop-id from the item that opened it #}

            if($quickshop_parent_wrapper.hasClass("js-quickshop-modal")){
                var quick_id = $(".js-quickshop-opened .js-quickshop-container").data("quickshop-id");
            }else{
                var quick_id = $quickshop_parent_wrapper.data("quickshop-id");
            }

            if($parent.hasClass("js-product-quickshop-variants")){

                var $quickshop_parent = $(this).closest(".js-item-product");

                {# Target visible slider item if necessary #}
                
                if($quickshop_parent.hasClass("js-item-slide")){
                    var $quickshop_variant_selector = '.js-swiper-slide-visible .js-quickshop-container[data-quickshop-id="'+quick_id+'"]';
                }else{
                    var $quickshop_variant_selector = '.js-quickshop-container[data-quickshop-id="'+quick_id+'"]';
                }

                LS.changeVariant(changeVariant, $quickshop_variant_selector);

                {% if settings.product_color_variants %}
                    {# Match selected color variant with selected quickshop variant #}

                    if(($variants_group).hasClass("js-color-variants-container")){
                        var selected_option_id = $(this).find("option:selected").val();
                        if($quickshop_parent.hasClass("js-item-slide")){
                            var $color_parent_to_update = $('.js-swiper-slide-visible .js-quickshop-container[data-quickshop-id="'+quick_id+'"]');
                        }else{
                            var $color_parent_to_update = $('.js-quickshop-container[data-quickshop-id="'+quick_id+'"]');
                        }
                        $color_parent_to_update.find('.js-color-variant').removeClass("selected");
                        $color_parent_to_update.find('.js-color-variant[data-option="'+selected_option_id+'"]').addClass("selected");
                    }
                {% endif %}
            } else {
                LS.changeVariant(changeVariant, '#single-product');
            }

            {# Offer and discount labels update #}

            var $this_product_container = $(this).closest(".js-product-container");

            if($this_product_container.hasClass("js-quickshop-container")){
                var this_quickshop_id = $this_product_container.attr("data-quickshop-id");
                var $this_product_container = $('.js-product-container[data-quickshop-id="'+this_quickshop_id+'"]');
            }
            var $this_compare_price = $this_product_container.find(".js-compare-price-display");
            var $this_price = $this_product_container.find(".js-price-display");
            var $installment_container = $this_product_container.find(".js-product-payments-container");
            var $installment_text = $this_product_container.find(".js-max-installments-container");
            var $this_add_to_cart = $this_product_container.find(".js-prod-submit-form");

            // Get the current product discount percentage value
            var current_percentage_value = $this_product_container.find(".js-offer-percentage");

            // Get the current product price and promotional price
            var compare_price_value = $this_compare_price.html();
            var price_value = $this_price.html();

            // Calculate new discount percentage based on difference between filtered old and new prices
            const percentageDifference = window.moneyDifferenceCalculator.percentageDifferenceFromString(compare_price_value, price_value);
            if(percentageDifference){
                $this_product_container.find(".js-offer-percentage").text(percentageDifference);
                $this_product_container.find(".js-offer-label").css("display" , "inline-flex");
            }

            if ($this_compare_price.css("display") == "none" || !percentageDifference) {
                $this_product_container.find(".js-offer-label").hide();
            }
            if ($this_add_to_cart.hasClass("nostock")) {
                $this_product_container.find(".js-stock-label").show();
            }
            else {
                $this_product_container.find(".js-stock-label").hide();
            }
            if ($this_price.css('display') == 'none'){
                $installment_container.hide();
                $installment_text.hide();
            }else{
                $installment_text.show();
            }
        });

        {# /* // Color and size variations */ #}

        $(document).on("click", ".js-insta-variations", function(e) {
            e.preventDefault();
            $this = $(this);
            $this.siblings().removeClass("selected");
            $this.addClass("selected");

            var option_id = $this.data('option');
            $selected_option = $this.closest('.js-product-variants').find('.js-variation-option option').filter(function() {
                return this.value == option_id;
            });
            $selected_option.prop('selected', true).trigger('change');

            $this.closest("[class^='variation']").find('.js-insta-variation-label').html(option_id);

            {% if settings.product_color_variants %}

                {# Sync quickshop color links with item color item color links #}

                var quickshop_id = $this.closest(".js-item-product").data("product-id");

                $('#quick-item' + quickshop_id).find('.js-color-variant').removeClass("selected");
                $('#quick-item' + quickshop_id).find('.js-color-variant[data-option="'+option_id+'"]').addClass("selected");
            {% endif %}
        });

        {# /* // Quickshop variant update */ #}

        LS.registerOnChangeVariant(function(variant){
            $('img', ".js-product-thumb-zoom[data-image="+variant.image+"]").click();
        });

        {% if template == "product" %}

            {# /* // Pinterest sharing */ #}

            {# Pinterest sharing #}
            $('.js-pinterest-share').click(function(e){
                e.preventDefault();
                $(".pinterest-hidden a")[0].click();
            });

            {# /* // Product slider */ #}

            function productSliderNav(){
                var productSwiper = null;
                createSwiper(
                    '.js-swiper-product',
                    {
                        lazy: true,
                        loop: false,
                        slideActiveClass: 'js-product-active-image',
                        pagination: {
                            el: '.js-swiper-product-pagination',
                            clickable: true,
                        },
                        navigation: {
                            nextEl: '.js-swiper-product-next',
                            prevEl: '.js-swiper-product-prev',
                        },
                        on: {
                            init: function () {
                                $(".js-product-slider-placeholder, .js-product-detail-loading-icon").hide();
                                $(".js-swiper-product").css({"visibility" : "visible" , "height" : "auto"});
                                {% if product.video_url %}
                                    productSwiperHeight = $(".js-swiper-product").height();
                                    $(".js-product-video-slide").height(productSwiperHeight);
                                {% endif %}
                            },
                            {% if product.video_url %}
                                slideChangeTransitionEnd: function () {
                                    if($(".js-product-video-slide").hasClass("js-product-active-image")){
                                        $(".js-labels-group, .js-open-mobile-zoom").fadeOut(100);
                                    }else{
                                        $(".js-labels-group, .js-open-mobile-zoom").fadeIn(100);
                                    }
                                    $('.js-video').show();
                                    $('.js-video-iframe').hide().find("iframe").remove();
                                },
                            {% endif %}
                        },
                    },
                    function(swiperInstance) {
                        productSwiper = swiperInstance;
                    }
                );

                {% if product.images_count > 1 or video_url %}
                    LS.registerOnChangeVariant(function(variant){
                        var liImage = $('.js-swiper-product').find("[data-image='"+variant.image+"']");
                        var selectedPosition = liImage.data('image-position');
                        var slideToGo = parseInt(selectedPosition);
                        productSwiper.slideTo(slideToGo);
                        $(".js-product-slide-img").removeClass("js-active-variant");
                        liImage.find(".js-product-slide-img").addClass("js-active-variant");
                    });
                    
                    $(".js-product-thumb").click(function(e){
                        e.preventDefault();
                        var current_thumb_index = $(this).attr("data-slide-index");
                        var match_thumb_image = $('.js-swiper-product').find("[data-image-position='"+current_thumb_index+"']");
                        var selectedPosition = match_thumb_image.attr("data-image-position");
                        var slideToGo = parseInt(selectedPosition);
                        productSwiper.slideTo(slideToGo);        
                    });
                {% endif %}
            }
            productSliderNav ()

            {# /* // Mobile zoom */ #}

            //Save scrolling position for fixed body on Mobile Zoom opened
            var scrollPos = $(document).scrollTop();
            $(window).scroll(function(){
                scrollPos = $(document).scrollTop();
            });
            var savedScrollPos = scrollPos;

            // Add tap class to product image
            if ($(window).width() < 768) {
                $(".js-image-open-mobile-zoom").addClass("js-open-mobile-zoom");
            }

            // Mobile zoom open event
            $(".js-open-mobile-zoom").click(function(e){
                e.preventDefault();
                savedScrollPos = scrollPos;
                $('body').css({
                    position: 'fixed',
                    top: -scrollPos
                });
                LS.openMobileZoom();
            });

            // Mobile zoom close event
            $(".js-close-mobile-zoom").click(function(e){
                e.preventDefault();
                LS.closeMobileZoom(180);
            });

            {# /* // Product mobile variants */ #}

            $(document).on("click", ".js-mobile-vars-btn", function(e) {
                $(this).next(".js-mobile-vars-panel").removeClass('js-var-panel modal-xs-right-out').addClass('js-var-panel modal-xs-right-in');
                    $(this).closest(".modal").scrollTop(0), "fast";
                $("body").addClass("overflow-none");
            });
            function closeVarPanel() {
            setTimeout(function(){ 
                $('.js-var-panel').removeClass('js-var-panel modal-xs-right-in').addClass('js-var-panel modal-xs-right-out')}, 300);
                $("body").removeClass("overflow-none");
            };
            $(document).on("click", ".js-close-panel", function(e) {
                closeVarPanel();
            });
            $(".js-quickshop-mobile-vars-property").on( "click", function() {
                $(this).closest(".modal").scrollTop($(this).closest(".js-mobile-vars").find(".js-mobile-vars-btn").offset().top);
                closeVarPanel();
            });
            $(".js-mobile-vars-property").on( "click", function() {
                var selectedoption = $(this).data("option");
                var varname = $(this).closest(".js-mobile-vars-panel").data("custom");
                $(this).closest(".js-mobile-vars").find(".js-mobile-vars-selected-label").html(selectedoption);
                $(this).closest(".js-product-detailr").scrollTop($(this).closest(".js-mobile-vars").find(".js-mobile-vars-btn").offset().top);
                closeVarPanel();
            });
            $(document).on("click", ".js-mobile-vars-property", function(e) {
                e.preventDefault();
                $this = $(this);
                $this.siblings().removeClass("selected");
                $this.addClass("selected");
                var option_id = $this.data('option');
                $selected_option = $this.closest('.js-mobile-variations-container').find('.js-variation-option option[value="'+option_id+'"]');
                $selected_option.prop('selected', true).trigger('change');
            });

        {% endif %}

        {% if show_help %}

            $(".show-help-social .soc-foot").click(function(){
                return false;
            });

            {# 404 handling to show the example product #}
            if ( window.location.pathname === "/product/example/" ) {
                document.title = "{{ "Producto de ejemplo" | translate | escape('js') }}";
                $("#404").hide();
                $("#product-example").show();
            } else {
                $("#product-example").hide();
            }

        {% endif %}

        {# /* // Submit to contact */ #}

        $("#product_form").submit(function(e){
            var button = $(this).find(':submit');
            button.attr('disabled', 'disabled');
            if (button.hasClass('cart')){
                button.val('{{ "Agregando..." | translate }}');
            }
            if(($(this).find('input.contact').length) || ($(this).find('input.catalog').length)) {
                e.preventDefault();
                window.location = "{{ store.contact_url | escape('js') }}?product=" + LS.product.id;
            }
        });

        {#/*============================================================================
            #Cart
        ==============================================================================*/ #}

        {# /* // Free shipping bar */ #}

        {% if cart.free_shipping.min_price_free_shipping.min_price %}

            {# Updates free progress on page load #}

            LS.freeShippingProgress(true);

        {% endif %}

        {# /* // Cart quantitiy changes */ #}

        $(document).on("keypress", ".js-cart-quantity-input", function (e) {
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                return false;
            }
        });

        $(document).on("focusout", ".js-cart-quantity-input", function (e) {
            var itemID = $(this).attr("data-item-id");
            var itemVAL = $(this).val();
            if (itemVAL == 0) {
                var r = confirm("{{ '¿Seguro que quieres borrar este artículo?' | translate }}");
                if (r == true) {
                    LS.removeItem(itemID, true);
                } else {
                    $(this).val(1);
                }
            } else {
                LS.changeQuantity(itemID, itemVAL, true);
            }
        });

        {# /* // Empty cart alert */ #}

         $(".js-hide-alert").click(function(e){
            e.preventDefault();
            $(this).closest(".alert").hide();
        });
            
        $(".js-trigger-empty-cart-alert").click(function(e){
            e.preventDefault();
            $(".js-mobile-nav-empty-cart-alert").fadeIn(100).delay(1500).fadeOut(500);
        });

        {# /* // Add to cart */ #}

        $(document).on("click", ".js-addtocart:not(.js-addtocart-placeholder)", function (e) {

            {# Button variables for transitions on add to cart #}

            var $productContainer = $(this).closest('.js-product-container');
            var $productButton = $productContainer.find("input[type='submit'].js-addtocart");
            var $productButtonPlaceholder = $productContainer.find(".js-addtocart-placeholder");
            var $productButtonText = $productButtonPlaceholder.find(".js-addtocart-text");
            var $productButtonAdding = $productButtonPlaceholder.find(".js-addtocart-adding");
            var $productButtonSuccess = $productButtonPlaceholder.find(".js-addtocart-success");

            {# Define if event comes from quickshop or product page #}

            var isQuickShop = $productContainer.hasClass('js-quickshop-container');

            if (!$(this).hasClass('contact')) {

                {% if settings.ajax_cart %}
                    e.preventDefault();
                {% endif %}

                {# Hide real button and show button placeholder during event #}

                $productButton.hide();
                $productButtonPlaceholder.css('display' , 'inline-block');
                $productButtonText.fadeOut('fast');
                $productButtonAdding.addClass("active");

                {% if settings.ajax_cart %}

                    var callback_add_to_cart = function(){

                        {# Show button placeholder with transitions #}

                        $productButtonAdding.removeClass("active");
                        $productButtonSuccess.addClass("active");
                        setTimeout(function(){
                            $productButtonSuccess.removeClass("active");
                            setTimeout(function(){
                                $productButtonText.fadeIn();
                            },100);                            
                        },2000);
                            
                        setTimeout(function(){
                            $productButtonPlaceholder.removeAttr("style").hide();
                            $productButton.css('display' , 'inline-block');
                        },3000);

                        if ($(window).width() < 768) {
                            mobileToggleAjaxCart();

                            {# Add hash parameter on cart opened #}
                            window.location.hash = "modal-fullscreen-cart";
                        }else{

                            {# Lock body scroll on cart visible #}
                            if($(".js-ajax-cart-panel").css('display') == 'none'){
                                $("body").addClass("overflow-none");
                            }
                            $(".js-ajax-backdrop").toggle();
                            ajax_cart_panel.toggle();
                        }    

                        $productContainer.find(".js-addtocart").removeClass("m-bottom");

                        $productContainer.find(".js-added-to-cart-product-message").slideDown();

                        if (isQuickShop && ($(".js-prod-submit-form").hasClass("js-variant-addtocart")) && $(window).width() < 768) {
                            cleanURLHash();
                            window.location.hash = "modal-fullscreen-cart";
                        }

                        {# Update shipping input zipcode on add to cart #}

                        {# Use zipcode from input if user is in product page, or use zipcode cookie if is not #}

                        if ($("#product-shipping-container .js-shipping-input").val()) {
                            zipcode_on_addtocart = $("#product-shipping-container .js-shipping-input").val();
                            $("#cart-shipping-container .js-shipping-input").val(zipcode_on_addtocart);
                            $(".js-shipping-calculator-current-zip").text(zipcode_on_addtocart);
                        } else if (cookieService.get('calculator_zipcode')){
                            var zipcode_from_cookie = cookieService.get('calculator_zipcode');
                            $('.js-shipping-input').val(zipcode_from_cookie);
                            $(".js-shipping-calculator-current-zip").text(zipcode_from_cookie);
                        }
                    }
                    var callback_error = function(){
                        
                        {# Restore real button visibility in case of error #}

                        $productButtonAdding.removeClass("active");
                        $productButtonText.fadeIn();
                        $productButtonPlaceholder.removeAttr("style").hide();
                        $productButton.css('display' , 'inline-block');
                    }
                    $prod_form = $(this).closest("form");
                    LS.addToCartEnhanced(
                        $prod_form,
                        '{{ "Agregar al carrito" | translate }}',
                        '{{ "Agregando..." | translate }}',
                        '{{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito." | translate }}',
                        {{ store.editable_ajax_cart_enabled ? 'true' : 'false' }},
                        callback_add_to_cart,
                        callback_error
                    );
                {% endif %}
            }
        });

        {% if settings.ajax_cart %}

            {# /* // Cart toggle */ #}

            const ajax_cart_panel = $(".js-ajax-cart-panel");

            mobileToggleAjaxCart = function(){

                if(!$("body").hasClass("mobile-categories-visible")){
                    $("body").toggleClass("overflow-none");
                }

                if(ajax_cart_panel.hasClass("modal-xs-right-in")){
                    ajax_cart_panel.toggleClass("modal-xs-right-in modal-xs-right-out");
                    setTimeout(function() { 
                        ajax_cart_panel.hide();
                    }, 300);
                }else{
                    ajax_cart_panel.show();
                    setTimeout(function() { 
                        ajax_cart_panel.toggleClass("modal-xs-right-in modal-xs-right-out");
                    }, 300);
                }
            };

            $(document).on("click", ".js-toggle-cart", function (e) {
                e.preventDefault();
                if ($(window).width() < 768) {
                    mobileToggleAjaxCart();
                }else{
                    $(".js-ajax-backdrop").toggle();
                    ajax_cart_panel.toggle();
                    $("body").toggleClass("overflow-none");
                }            
            });
        
        {% endif %}

        {#/*============================================================================
          #Shipping calculator
        ==============================================================================*/ #}

        {# /* // Select and save shipping function */ #}

        selectShippingOption = function(elem, save_option) {
            $(".js-shipping-method, .js-branch-method").removeClass('js-selected-shipping-method');
            $(elem).addClass('js-selected-shipping-method');
            if (save_option) {
                LS.saveCalculatedShipping(true);
            }
            if($(elem).hasClass("js-shipping-method-hidden")){

                {# Toggle other options visibility depending if they are pickup or delivery for cart and product at the same time #}

                if($(elem).hasClass("js-pickup-option")){
                    $(".js-other-pickup-options, .js-show-other-pickup-options .js-shipping-see-less").show();
                    $(".js-show-other-pickup-options .js-shipping-see-more").hide();

                }else{
                    $(".js-other-shipping-options, .js-show-more-shipping-options .js-shipping-see-less").show();
                    $(".js-show-more-shipping-options .js-shipping-see-more").hide()
                }          
            }
        };

        {# Apply zipcode saved by cookie if there is no zipcode saved on cart from backend #}

        if (cookieService.get('calculator_zipcode')) {

            {# If there is a cookie saved based on previous calcualtion, add it to the shipping input to trigger automatic calculation #}

            var zipcode_from_cookie = cookieService.get('calculator_zipcode');

            {% if settings.ajax_cart %}

                {# If ajax cart is active, target only product input to avoid extra calulation on empty cart #}

                $('#product-shipping-container .js-shipping-input').val(zipcode_from_cookie);

            {% else %}

                {# If ajax cart is inactive, target the only input present on screen #}

                $('.js-shipping-input').val(zipcode_from_cookie);
                
            {% endif %}

            {# Fill zipcode message #}

            $(".js-shipping-calculator-current-zip").text(zipcode_from_cookie);

            {# Hide the shipping calculator and show spinner  #}

            $(".js-shipping-calculator-head").addClass("with-zip").removeClass("with-form");
            $(".js-shipping-calculator-with-zipcode").addClass("transition-up-active");
            $(".js-shipping-calculator-spinner").show();
        } else {

            {# If there is no cookie saved, show calcualtor #}

            $(".js-shipping-calculator-form").addClass("transition-up-active");
        }

        {# Remove shipping suboptions from DOM to avoid duplicated modals #}

        removeShippingSuboptions = function(){
            var shipping_suboptions_id = $(".js-modal-shipping-suboptions").attr("id");
            $("#" + shipping_suboptions_id).remove();
            $('.js-modal-overlay[data-modal-id="#' + shipping_suboptions_id + '"').remove();
        };

        {# /* // Toggle branches link */ #}

        $(document).on("click", ".js-toggle-branches", function (e) {
            e.preventDefault();
            $(".js-store-branches-container").slideToggle("fast");
            $(".js-see-branches, .js-hide-branches").toggle();;
        });

        {# /* // Shipping and branch click */ #}

        $(document).on("change", ".js-shipping-method, .js-branch-method", function () {
            selectShippingOption(this, true);
            $(".js-shipping-method-unavailable").hide();
        });

        {# /* // Select shipping first option on results */ #}

        $('.js-shipping-method:checked').livequery(function () {
            let shippingPrice = $(this).attr("data-price");
            LS.addToTotal(shippingPrice);

            let total = (LS.data.cart.total / 100) + parseFloat(shippingPrice);
            $(".js-cart-widget-total").html(LS.formatToCurrency(total));

            selectShippingOption(this, false);
        });

        {# /* // Calculate shipping by submit */ #}

        $(".js-shipping-input").keydown(function(e) {
            var key = e.which ? e.which : e.keyCode;
            var enterKey = 13;
            if (key === enterKey) {
                e.preventDefault();
                $(this).closest(".js-shipping-calculator-form").find(".js-calculate-shipping").click();
                $(this).blur();
            }
        });

        {# /* // Calculate shipping function */ #}

        $(".js-calculate-shipping").click(function(e) {
            e.preventDefault();

            {# Take the Zip code to all shipping calculators on screen #}
            let shipping_input_val = $(this).closest(".js-shipping-calculator-form").find(".js-shipping-input").val();

            $(".js-shipping-input").val(shipping_input_val);

            {# Calculate on page load for both calculators: Product and Cart #}


            {% if template == 'product' %}
                if (!vanillaJS) {
                    LS.calculateShippingAjax(
                        $('#product-shipping-container').find(".js-shipping-input").val(),
                        '{{store.shipping_calculator_url | escape('js')}}',
                        $("#product-shipping-container").closest(".js-shipping-calculator-container") );
                }
            {% endif %}

            if ($(".js-cart-item").length) {
                LS.calculateShippingAjax(
                    $('#cart-shipping-container').find(".js-shipping-input").val(), 
                    '{{store.shipping_calculator_url | escape('js')}}',
                    $("#cart-shipping-container").closest(".js-shipping-calculator-container") );
            }

            $(".js-shipping-calculator-current-zip").html(shipping_input_val);
            removeShippingSuboptions();

        });

        {# /* // Toggle more shipping options */ #}

        $(document).on("click", ".js-toggle-more-shipping-options", function(e) {
            e.preventDefault();

            {# Toggle other options depending if they are pickup or delivery for cart and product at the same time #}

            if($(this).hasClass("js-show-other-pickup-options")){
                $(".js-other-pickup-options").slideToggle(600);
                $(".js-show-other-pickup-options .js-shipping-see-less, .js-show-other-pickup-options .js-shipping-see-more").toggle();
            }else{
                $(".js-other-shipping-options").slideToggle(600);
                $(".js-show-more-shipping-options .js-shipping-see-less, .js-show-more-shipping-options .js-shipping-see-more").toggle();
            }
        });

        {# /* // Calculate shipping on page load */ #}

        {# Only shipping input has value, cart has saved shipping and there is no branch selected #}

        calculateCartShippingOnLoad = function(){

            {# Triggers function when a zipcode input is filled #}

            if($("#cart-shipping-container .js-shipping-input").val()){

                // If user already had calculated shipping: recalculate shipping

                setTimeout(function() { 
                    LS.calculateShippingAjax(
                        $('#cart-shipping-container').find(".js-shipping-input").val(), 
                        '{{store.shipping_calculator_url | escape('js')}}',
                        $("#cart-shipping-container").closest(".js-shipping-calculator-container") );
                        removeShippingSuboptions();
                }, 100);
            } 

            if($(".js-branch-method").hasClass('js-selected-shipping-method')){
                {% if store.branches|length > 1 %}
                    $(".js-store-branches-container").slideDown("fast");
                    $(".js-see-branches").hide();
                    $(".js-hide-branches").show();
                {% endif %}
            }
        };

        {% if cart.has_shippable_products %}
            calculateCartShippingOnLoad();
        {% endif %}

        {% if template == 'product' %}

            {# /* // Calculate product detail shipping on page load */ #}
            if (!vanillaJS) {
                if($('#product-shipping-container').find(".js-shipping-input").val()){
                    setTimeout(function() {
                        LS.calculateShippingAjax(
                            $('#product-shipping-container').find(".js-shipping-input").val(),
                            '{{store.shipping_calculator_url | escape('js')}}',
                            $("#product-shipping-container").closest(".js-shipping-calculator-container") );

                        removeShippingSuboptions();
                    }, 100);
                }
            }

            {# /* // Pitch login instead of zipcode helper if is returning customer */ #}

            {% if not customer %}
                if (cookieService.get('returning_customer') && LS.shouldShowQuickLoginNotification()) {
                    $('.js-product-quick-login').show();
                } else {
                    $('.js-shipping-zipcode-help').show();
                }
            {% endif %}

        {% endif %}

        {# /* // Change CP */ #}

        $(document).on("click", ".js-shipping-calculator-change-zipcode", function(e) {
            e.preventDefault();
            $(".js-shipping-calculator-response").fadeOut(100);
            $(".js-shipping-calculator-head").addClass("with-form").removeClass("with-zip");
            $(".js-shipping-calculator-with-zipcode").removeClass("transition-up-active");
            $(".js-shipping-calculator-form").addClass("transition-up-active");
        }); 


        {# /* // Change store country: From invalid zipcode message */ #}

        $(document).on("click", ".js-save-shipping-country", function(e) {

            e.preventDefault();

            {# Change shipping country #}

            var selected_country_url = $(this).closest(".js-modal-shipping-country").find(".js-shipping-country-select option:selected").attr("data-country-url");
            location.href = selected_country_url; 

            $(this).text('{{ "Aplicando..." | translate }}').addClass("disabled");
        });

        {#/*============================================================================
            #Forms
        ==============================================================================*/ #}
        
        {# Show the success or error message when resending the validation link #}

        {% if template == 'account.register' or template == 'account.login' %}
            $(".js-resend-validation-link").click(function(e){
                window.accountVerificationService.resendVerificationEmail('{{ customer_email }}');
            });
        {% endif %}

        $('.js-password-view').click(function () {
            $(this).toggleClass('password-view');

            if($(this).hasClass('password-view')){
                $(this).parent().find(".js-password-input").attr('type', '');
                $(this).find(".js-eye-open, .js-eye-closed").toggle();
            } else {
                $(this).parent().find(".js-password-input").attr('type', 'password');
                $(this).find(".js-eye-open, .js-eye-closed").toggle();
            }
        });

        {% if store.country == 'AR' and template == 'home' %}

            if (cookieService.get('returning_customer') && LS.shouldShowQuickLoginNotification()) {
                {# Make login link toggle quick login modal #}

                $(".js-login").removeAttr("href").attr({"href" : "#quick-login" , "data-toggle" : "modal"}).addClass("js-trigger-modal-zindex-top");
            }
        {% endif %}

        {#/*============================================================================
          #Footer
        ==============================================================================*/ #}

        {# Legal info #}

        {# Add alt attribute to external AFIP logo to improve SEO #}

        {% if store.afip %}
            $('img[src*="www.afip.gob.ar"]').attr('alt', '{{ "Logo de AFIP" | translate }}');
        {% endif %}

    });
});


{% if store.live_chat %}
	
	{# Begin olark code #}

	/*{literal}<![CDATA[*/
	window.olark||(function(c){var f=window,d=document,l=f.location.protocol=="https:"?"https:":"http:",z=c.name,r="load";var nt=function(){f[z]=function(){(a.s=a.s||[]).push(arguments)};var a=f[z]._={},q=c.methods.length;while(q--){(function(n){f[z][n]=function(){f[z]("call",n,arguments)}})(c.methods[q])}a.l=c.loader;a.i=nt;a.p={0:+new Date};a.P=function(u){a.p[u]=new Date-a.p[0]};function s(){a.P(r);f[z](r)}f.addEventListener?f.addEventListener(r,s,false):f.attachEvent("on"+r,s);var ld=function(){function p(hd){hd="head";return["<",hd,"></",hd,"><",i,' onl' + 'oad="var d=',g,";d.getElementsByTagName('head')[0].",j,"(d.",h,"('script')).",k,"='",l,"//",a.l,"'",'"',"></",i,">"].join("")}var i="body",m=d[i];if(!m){return setTimeout(ld,100)}a.P(1);var j="appendChild",h="createElement",k="src",n=d[h]("div"),v=n[j](d[h](z)),b=d[h]("iframe"),g="document",e="domain",o;n.style.display="none";m.insertBefore(n,m.firstChild).id=z;b.frameBorder="0";b.id=z+"-loader";if(/MSIE[ ]+6/.test(navigator.userAgent)){b.src="javascript:false"}b.allowTransparency="true";v[j](b);try{b.contentWindow[g].open()}catch(w){c[e]=d[e];o="javascript:var d="+g+".open();d.domain='"+d.domain+"';";b[k]=o+"void(0);"}try{var t=b.contentWindow[g];t.write(p());t.close()}catch(x){b[k]=o+'d.write("'+p().replace(/"/g,String.fromCharCode(92)+'"')+'");d.close();'}a.P(2)};ld()};nt()})({loader: "static.olark.com/jsclient/loader0.js",name:"olark",methods:["configure","extend","declare","identify"]});
	/* custom configuration goes here (www.olark.com/documentation) */
	olark.identify('{{store.live_chat | escape('js')}}');/*]]>{/literal}*/
{% endif %}
