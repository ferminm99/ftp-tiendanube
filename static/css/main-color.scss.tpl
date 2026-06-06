{#/*============================================================================

main-color.scss.tpl

    -This file contains all the theme styles related to settings defined by user from config/settings.txt
    -Rest of styling can be found in:
        -static/css/style.css --> For non critical styles witch will be loaded asynchronously
        -snipplets/css/critical-css.tpl --> For critical CSS rendered inline before the rest of the site

==============================================================================*/#}

{#/*============================================================================
  Table of Contents
  #Colors and fonts
    // Colors
    // Font families
    // Texts
  #Components
    // Mixins
    // Functions
    // Wrappers
    // SVG Icons
    // Placeholders
    // Breadcrumbs
    // Buttons
    // Links
    // Progress bar
    // Chips
    // Modals
    // Tabs
    // Panels
    // Dividers
    // Forms
    // Alerts and notifications
    // Badge
    // Tooltip card
    // Pagination
    // Sliders
    // Pills
    // Labels
    // Banners
    // Video
    // Tables
  #Social
    // Instafeed
  #Header and nav
    // Ad bar
    // Logo
    // Nav desktop
    // Search
    // Cart widget desktop
  #Product grid
    // Filters
    // Grid item
  #Product detail
  	// Image
    // Form and info
  #Footer
  #Contact page
  #Cart page
    // Cart table
    // Ajax cart
  #Media queries
    // Max width 767px
      //// Colors and fonts
      //// Components
      //// Header and nav
      //// Product grid
      //// Product detail

==============================================================================*/#}


{#/*============================================================================
  #Colors and fonts
==============================================================================*/#}

{# /* // Colors */ #}

$primary-color: {{ settings.primary_color }};
$secondary-color: {{ settings.secondary_color }};
{% if settings.accent_color_active %}
  $accent-color: {{ settings.accent_color }};
{% else %}
  $accent-color: {{ settings.primary_color }};
{% endif %}
$main-foreground: {{ settings.text_primary_color }};
$main-background: {{ settings.background_color }};
$line-color: {{ settings.line_color }};

{# /* // Font families */ #}

$font-headings: {{ settings.main_font | raw }};
$font-body: {{ settings.default_font | raw }};

{# /* // Texts */ #}

{# /* Headings */ #}

.title-container {
  clear: both;
}
.title{
  font-size: 28px;
}
.subtitle{
  font-size: 18px;
  text-transform: uppercase;
}
.title,
.subtitle{
  margin: 10px 0 30px 0;
  text-align: center;
  display: flex;
  flex-direction: row;
  justify-content: center;
  a {
    color: $main-foreground;
  }
  &:after,
  &:before{
    flex-grow: 1;
    height: 1px;
    content: '\a0';
    background-color: $line-color;
    position: relative;
    top: 0.5em;
  }
  &:before{
    margin-right:10px;
  }
  &:after{
    margin-left:10px;
  }
}

h1, .h1,
h2, .h2,
h3, .h3,
h4, .h4,
h5, .h5,
h6, .h6 {
  text-transform: uppercase;
  font-weight: bold;
  font-family: $font-headings;
  letter-spacing: 2px;
  small{
    color: $main-foreground;
  }
}

.box-title {
  float: left;
  width: 100%;
  padding-bottom: 10px;
  font-weight: bold;
}

{# /* Body */ #}

body {
  font-size: 14px;
}
.font-body {
  font-size: 14px!important;
}
.font-medium {
  font-size: 16px;
}
.font-small {
  font-size: 12px!important;
}
.font-small-extra {
  font-size: 10px!important;
}

{# /* Icons */ #}

.fa-min {
  font-size: 8px;
}
.fa-huge{
  font-size: 6em;
}

{# /* Weight */ #}

.weight-normal {
  font-weight: 400;
}
.weight-strong {
  font-weight: 700;
}
.weight-light {
  font-weight: 300;
}

.border-top{
  border-top: 1px solid $line-color!important;
}
.border-bottom{
  border-bottom: 1px solid $line-color;
}
.border-left{
  border-left: 1px solid $line-color;
}
.border-right{
  border-right: 1px solid $line-color;
}
.border-none {
  border: 0 !important;
}

{# /* Color */ #}

.text-foreground {
  color: $main-foreground !important;
}

.text-primary {
  color: $primary-color;
}

.text-secondary {
  color: $secondary-color;
}

.text-accent {
  color: $accent-color;
  fill: $accent-color;
}

{#/*============================================================================
  #Components
==============================================================================*/#}

{# /* // Mixins */ #}

@mixin text-decoration-none(){
  text-decoration: none;
  outline: 0;
  &:hover,
  &:focus{
    text-decoration: none;
    outline: 0;
  }
}

@mixin link-default(){
  color:$main-foreground;
  &:hover,
  &:focus{
    color:$main-foreground;
    text-decoration: underline;
  }
}

@mixin border-radius($radius) {
  border-radius: $radius;
}
@mixin background-gradient($gradient) {
	background: $gradient;
	background: -moz-linear-gradient(top, rgba($gradient, 0.7) 0%, rgba($gradient,.9) 100%);
	background: -webkit-linear-gradient(top, rgba($gradient, 0.7) 0%, rgba($gradient,.9) 100%);
	background: linear-gradient(to bottom, rgba($gradient, 0.7) 0%, rgba($gradient,.9) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='rgba($gradient,.7)', endColorstr='rgba($gradient,.9)',GradientType=0 );
}
@mixin background-gradient-hover($gradient) {
	background: $gradient;
	background: -moz-linear-gradient(top, rgba($gradient, 0.8) 0%, $gradient 100%);
	background: -webkit-linear-gradient(top, rgba($gradient, 0.8) 0%, gradient 100%);
	background: linear-gradient(to bottom, rgba($gradient, 0.8) 0%, $gradient 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='rgba($gradient,.8)', endColorstr='$gradient',GradientType=0 );
}

{# This mixin adds browser prefixes to a CSS property #}

@mixin prefix($property, $value, $prefixes: ()) {
  @each $prefix in $prefixes {
    #{'-' + $prefix + '-' + $property}: $value;
  }
   #{$property}: $value;
}

{# /* // Functions */ #}

@function set-foreground-color($bg-color, $foreground-color) {
  @if (lightness($bg-color) > 50) {
    @return $foreground-color; // Lighter backgorund, return dark color
  } @else {
    @return lighten($foreground-color, 15%); // Darker background, return light color
  }
}


{# /* // Wrappers */ #}

body {
  background-color: $main-background;
  color: $main-foreground;
  font-family: $font-body;
  {% if settings.background_pattern %}
    &.pattern-background{
      background-image: url( "{{ ("img/tramas/" ~ settings.background_pattern ~ ".png") | static_url }}" );
    }
  {% else %}
    &.user-background{
      background-image: url( "{{ ("default-background.jpg") | static_url }}" );
    }
  {% endif %}
}

.bg-no-repeat {
  background-repeat: no-repeat;
}

.box-container{
  float: left;
  width: 100%;
  box-sizing: border-box;
  margin-bottom: 20px;
  padding: 15px;
  border:1px solid rgba($main-foreground, 0.08);
  background-color: darken($main-background, 0.5%);
  @include border-radius(4px);
}

.circle-box{
  border: dashed $secondary-color 5px;
}

.container-with-border{
  margin-bottom: 20px;
  padding-bottom: 20px;
  border-bottom: 1px dashed $line-color;
}

{# /* // SVG Icons */ #}

.svg-primary-fill{
  fill:$primary-color;
}
.svg-accent-fill{
  fill:$accent-color;
}
.svg-secondary-fill{
  fill:$secondary-color;
}
.svg-text-fill{
  fill:$main-foreground;
}
.svg-back-fill{
  fill:$main-background;
}

{# /* // Placeholders */ #}

.placeholder-container{
  @include background-gradient($primary-color);
  opacity: 0.5;
}
.placeholder-icon{
  fill:rgba($primary-color, 0.5);
}
.placeholder-color{
  background-color:darken(rgba($primary-color, 0.75), 10%);
}
.placeholder-shine,
.placeholder-fade{
  background-color:rgba($main-background, 0.4);
}
.placeholder-empty-overlay {
  background-color: rgba($main-foreground, .8);
  opacity: 0;
}
.placeholder-info {
  color: $main-foreground;
  fill: $main-foreground;
  background-color: $main-background;
}

.spinner-bar {
  height: 10px;
  width: 60%;
  margin: 20px auto 40px auto;
  border-radius: 4px;
  background: -webkit-linear-gradient(right, $primary-color, lighten($primary-color, 50%), $primary-color);
  background: linear-gradient(270deg, $primary-color, lighten($primary-color, 50%), $primary-color);
  background-size: 400% 400%;
  -webkit-animation: spinner-bar 3s ease-in-out infinite;
  animation: spinner-bar 3s ease-in-out infinite;
}
   
@-webkit-keyframes spinner-bar { 
  0%{background-position: 0% 50%}
  50%{background-position: 100% 50%}
  100%{background-position: 0% 50%}
}

@keyframes spinner-bar { 
  0%{background-position: 0% 50%}
  50%{background-position: 100% 50%}
  100%{background-position: 0% 50%}
}


{# /* // Breadcrumbs */ #}

.breadcrumb{
  @extend .font-small;
  li{
    padding: 0;
  }
  &-crumb{
    color:rgba($main-foreground, .8);
  }
}

{# /* // Buttons */ #}

.btn{
  position: relative;
  height: 50px;
  padding: 14px 20px;
  background-color:transparent;
  @include border-radius(4px);
  font-size: 14px;
  letter-spacing: 2px;
  text-transform: uppercase;
  @include text-decoration-none();
}
.btn-circle{
  height: 50px;
  width: 50px;
  padding: 0; 
  border-radius: 50px;
  text-align:center;
  font-size: 24px;
  line-height: 46px;
  cursor: pointer;
  @include text-decoration-none();
  &:hover{
    opacity: 0.8;
  }
  &.btn-small {
    width: 30px;
    height: 30px;
  }
  &.btn-icon {
    font-size: 0;
    &:before {
      position: absolute;
      top: 4px;
      left: 12px;
      width: 20px;
      height: 15px;
    }
  }
}
.btn-primary{
  color:$main-background;
  fill:$main-background;
  border: none;
  border-bottom: 4px solid darken($secondary-color, 10%);
  @include background-gradient($secondary-color);
  &:hover{
    @include background-gradient-hover($secondary-color);
    color:$main-background;
    border: none;
    border-bottom: 0;
  }
  &:focus,
  &:active,
  &:active:hover,
  &[disabled],
  &.disabled,
  &[disabled]:hover,
  &.disabled:hover{
    @include background-gradient($secondary-color);
    color:$main-background;
    border: none;
    border-bottom: 0;
    outline: none;
    box-shadow: none;
  }
  &[disabled],
  &[disabled]:hover{
    opacity: 0.8;
  }
}
.btn-secondary{
  @include background-gradient($primary-color);
  color: $main-background;
  fill:$main-background;
  text-transform: uppercase;
  border: none;
  border-bottom: 4px solid darken($primary-color, 10%);
  &:hover{
    @include background-gradient-hover($primary-color);
    color: $main-background;
    border: none;
    border-bottom: 0;
  }
  &:focus,
  &:active,
  &:active:hover{
    @include background-gradient($primary-color);
    color: $main-background;
    border: none;
    border-bottom: 0;
  }
  &[disabled],
  &[disabled]:hover{
    background-color: #DDD;
    color:$main-background;
    border: none;
    border-bottom: 0;
  }
  &.btn-circle.chevron:before {
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="{{ settings.background_color |replace("#","%23") }}"><path d="M187.8 264.5L41 412.5c-4.7 4.7-12.3 4.7-17 0L4.2 392.7c-4.7-4.7-4.7-12.3 0-17L122.7 256 4.2 136.3c-4.7-4.7-4.7-12.3 0-17L24 99.5c4.7-4.7 12.3-4.7 17 0l146.8 148c4.7 4.7 4.7 12.3 0 17z"/></svg>');
  } 
}
.btn-tertiary{
  @extend .btn-secondary;
  background: rgba($primary-color, .2);
  color: $primary-color;
  fill:$primary-color;
  border-bottom: 4px solid rgba($primary-color, .4);
  &:hover,
  &:focus,
  &:active,
  &:active:hover{
    background: rgba($primary-color, .2);
    color: $primary-color;
    fill:$primary-color;
    border-bottom: 4px solid rgba($primary-color, .4);
  }
  &:hover {
    opacity: 0.6;
  }
  &:focus,
  &:active,
  &:active:hover{
    opacity: 0.8;
  }
  &[disabled],
  &[disabled]:hover{
    background: rgba($primary-color, .2);
    color: $primary-color;
    fill:$primary-color;
    border-bottom: 4px solid rgba($primary-color, .4);
    cursor: not-allowed;
    opacity: 0.6;
  }
}
.btn-default {
  color: $main-foreground;
  background-color: $main-background;
  border: 1px solid lighten($secondary-color, 30%);
  @include border-radius(4px);
  svg{
    fill: $main-foreground;
  }
  &:hover,
  &:focus{
    color: $main-foreground;
    background-color: $main-background;
    border-color: $line-color;
    opacity: 0.8;
  }
  &-icon{
    width: 18px;
    height: 20px;
    fill: rgba($main-foreground, .6);
    float: right;
  }
}
.transparent{
  background: transparent;
}

.btn-link{
  position: relative;
  color: $primary-color;
  fill: $primary-color;
  text-decoration: underline;
  text-transform: none;
  font-size: 18px;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  background: none;
  border: none;
  &:hover,
  &:focus{
    color: $primary-color;
    opacity: 0.8;
  }
  &-small{
    font-size: 14px;
  }
  &-small-extra{
    font-size: 12px;
  }
}
.btn-link-secondary{
  text-transform: uppercase;
  @extend .font-medium;
  font-weight: bold;
}
.btn-link-text{
  color: $main-foreground;
  fill: $main-foreground;
}
.btn-append{
  border-radius: 0;
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
}
.btn-small{
  height: 35px;
  padding:0 8px;
  font-size: 12px;
  line-height: 30px;
}
.btn-floating{
  position:absolute;
  top: 5px;
  right: 5px;
  height: auto;
  padding: 5px;
  opacity: 0.5;
  border: 0;
  z-index: 100;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  background: none;
  border: none;
  svg{
    fill: $main-foreground;
  }
  &:hover,
  &:focus {
    opacity: 0.8;
  }
  &.fixed-bottom {
    position: fixed;
    top: auto;
    bottom: 15px;
    right: 15px;
  }
}
.btn-whatsapp {
  color: white;
  background-color:#4dc247;
  box-shadow: 2px 2px 6px rgba(0,0,0,0.4);
  opacity: 1;
  border-radius: 50%;
  svg {
    width: 40px;
    height: 40px;
    padding: 5px 2px;
    fill: white;
    vertical-align:middle;
  }
}

{# /* // Links */ #}

a {
  color: rgba($main-foreground, .8);
  text-decoration: none;
	&:hover {
		color: $primary-color;
		text-decoration: none;
	}
  &:active,
  &:focus,
  &:hover {
    outline: 0;
    box-shadow: none;
  }
}

.link-module{
  border-bottom: 1px solid $line-color;
}

.link-module-icon {
  fill: $primary-color;
}
.link-module-icon-right{
  fill:$main-foreground;
}

{# /* // Progress bar */ #}

.bar-progress {
  background: rgba($main-foreground, 0.1);
  &-active {
    background-image: linear-gradient(-90deg, rgba($accent-color, 1), rgba($accent-color, .2));
  }
  &-check {
    background-color: $accent-color;
    fill: $main-background;
    border: 2px solid $main-background;
  }
}

{# /* // Chips */ #}

.chip {
  color: $secondary-color;
  background-color: rgba($main-foreground, .05);
  border: 1px dashed rgba($main-foreground, .2);

  &-remove-icon {
    fill: $main-background;
    background-color: $secondary-color;
  }
}

{# /* // Modals */ #}

.modal-header{
  background: $main-background;
  border-bottom:1px solid rgba($main-foreground, 0.1);
  .nav-tabs-container{
    border-bottom: 0;
  }
}

.modal-body{
  float: left;
  width: 100%;
  background: $main-background;
  color: $main-foreground;
  @include border-radius(0 0 6px 6px);
}
.modal-right,
.modal-content{
  background: $main-background;
  color: $main-foreground;
}

.modal-footer {
  background: $main-background;
  color: $main-foreground;
  border-top:1px solid rgba($main-foreground, 0.1);
  box-shadow:none;
}

{# /* // Tabs */ #}

.tab-group{
  border-bottom:1px solid rgba($main-foreground, 0.1);
  .tab{
    &-link{
      border: 1px solid transparent;
      color: $main-foreground;
    }
    &.active{
      .tab-link{
        color: $primary-color;;
        border-bottom:2px solid $primary-color;
      }
    }
  }
}


{# /* // Panels */ #}

.panel{
  background-color: $main-background;
  border:1px solid rgba($main-foreground, .2);
  &-heading{
    background-color: rgba($main-foreground, .1)!important;
    border-bottom:1px solid rgba($main-foreground, .2);
  }
  &-footer{
    background-color: $main-background;
    border-top:1px solid rgba($main-foreground, .2);
  }
  &-item{
    border-bottom:1px solid rgba($main-foreground, .2);
  }
}

{# /* // Badge */ #}

.badge {
	background: $primary-color;
	color: $main-background;
}

.badge-secondary {
  background: $secondary-color;
  color: $main-background;
  @extend .font-small;
  font-weight: bold;
}

{# /* // Tooltip */ #}

.tooltip {
  color: $primary-color;
  background: darken($main-background, 4%);
  border-bottom: 2px solid rgba($main-foreground, .6);
  box-shadow:  0 2px 2px 0 rgba($main-foreground, 0.15);
  a,
  svg {
    color: $primary-color;
    fill: $primary-color;
  }
  .tooltip-arrow{
    border-left: 10px solid transparent;
    border-right: 10px solid transparent;
    border-bottom: 10px solid darken($main-background, 4%);
  }
}

{# /* // Tooltip card */ #}

.tooltip-card {
    background: $main-background;
}

{# /* // Dividers */ #}

.divider{
  float: left;
  width: 100%;
  margin: 20px 0;
  border-bottom:1px solid rgba($main-foreground, .1);
}


hr {
  border-top-color: $line-color;
}

{# /* // Forms */ #}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  margin: 0;
  -webkit-appearance: none;
}

input[type=number] {
  -moz-appearance: textfield;
}

.form-control {
  position: relative;
  height: 42px;
  color: rgba($main-foreground, .8);
  background-color: $main-background;
  border: 1px solid $line-color;
  text-align: left;
  &-small{
    height: 35px;
  }
}

.form-control::-webkit-input-placeholder { 
  color: rgba($main-foreground, .3);
}
.form-control:-moz-placeholder {
  color: rgba($main-foreground, .3);
}
.form-control::-moz-placeholder {
  color: rgba($main-foreground, .3);
}
.form-control:-ms-input-placeholder {
  color: rgba($main-foreground, .3);
}

.form-select-options {
  color: rgba($main-foreground, .8);
  background-color: $main-background;
  border: 1px solid $line-color;
  @include prefix(box-shadow, 0 2px 2px 0 rgba(50, 50, 50, 0.15), webkit ms moz);
}

.form-select-options::-webkit-scrollbar {
  width: 7px;
}
.form-select-options::-webkit-scrollbar-track {
  background: rgba($main-foreground, .3);
  border-radius: 6px;
}

.form-select-options::-webkit-scrollbar-thumb {
  background: rgba($main-foreground, .3);
  border-radius: 6px;
}

 .form-select-option {
  border-bottom: 1px solid rgba($main-foreground, .1);
}

.form-select-options .form-select-option:last-child {
  border-bottom: none;
}

.form-select-option:hover,
.form-select-option:active,
.form-select-option.selected {
  background-color: rgba($main-foreground, .05);
}

.input-clear-content:before {
  content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="{{ settings.text_primary_color |replace("#","%23") }}"><path d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"/></svg>');
}

.dropdown-toggle{
  border: 0;
}
.dropdown-menu{
  background-color: $main-background;
  border: 1px solid rgba($main-foreground, .1);
  li a{
    color:$main-foreground;
    &:hover{
      background-color: rgba($main-foreground, .2);
    }
  }
}

select {
	border: 1px solid  rgba($main-foreground, .06);
	padding: 4px;
}

.select-container{
  &:before{
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" fill="%23{{ settings.text_primary_color |trim('#') }}"><path d="M207.029 381.476L12.686 187.132c-9.373-9.373-9.373-24.569 0-33.941l22.667-22.667c9.357-9.357 24.522-9.375 33.901-.04L224 284.505l154.745-154.021c9.379-9.335 24.544-9.317 33.901.04l22.667 22.667c9.373 9.373 9.373 24.569 0 33.941L240.971 381.476c-9.373 9.372-24.569 9.372-33.942 0z"/></svg>');
  }
}

.radio-button-container{
  .radio-button {
    &-content{
      background-color: $main-background;
      border: 1px solid rgba($main-foreground, .2);
      box-shadow: inset 0 -3px 1px rgba($main-foreground, .3);
      border-radius: 4px; 
    }
    input[type="radio"]{
      &:checked {
        + .radio-button-content{
          
          @include prefix(transition, all 0.2s , webkit ms moz o);
          .radio-button-icons-container {
            background-color: $primary-color;
            .unchecked {
              border: 2px solid $main-background;
            }
            .checked {
              background-color: $main-background;
              border: 3px solid $primary-color;
            }
          }
          .shipping-price{
            color: $primary-color;
            &.text-accent {
              color: $accent-color;
            }
          }
        }
      }

      & + .radio-button-content .unchecked{
        border: 2px solid $main-foreground;
      }
      & + .radio-button-content .checked{
        background-color: $primary-color;
      }
    }
  }
}

.checkbox-container{
  .checkbox {
    color:$main-foreground;
    fill:$main-foreground;
    background-color: $main-background;
    border: 2px solid rgba($main-foreground, .3);
    border-bottom: 4px solid rgba($main-foreground, .3);
    &-color {
      border: 1px solid rgba($main-foreground, .3);
    }
    &:hover {
      border: 2px solid $main-foreground;
      border-bottom: 4px solid $main-foreground;
    }
  }
  input:checked ~ .checkbox {
    border: 2px solid rgba($secondary-color, .8);
    border-bottom: 4px solid rgba($secondary-color, .8);
  }
}

{# /* Lists */ #}

.list-readonly {
  .list-unstyled{
    @extend .box-container;
  }
  .list-item {
    border-bottom: 1px solid rgba($main-foreground, 0.1);
    .radio-button-content{
      border: none;
      box-shadow: none;
      background-color: transparent;
    }
  }
  .shipping-extra-options .list-item:first-child {
    border-top: 1px solid rgba($main-foreground, 0.1);
    .radio-button-content{
      border-top: none;
    }
  }
  .list-item:only-child,
  .list-item:last-of-type {
    border-bottom: none;
  }
}

{# /* // Alerts and notifications */ #}

.alert{
  background: $main-background;
  &-primary {
    border-color: $secondary-color;
    color: $secondary-color;
    &:before {
      color: $secondary-color;
    }
  }
  &-danger,
  &-error{
    border-color: set-foreground-color($main-background, #cc4845);
    color: set-foreground-color($main-background, #cc4845);
    &:before {
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 192 512" fill="%23cc4845"><path d="M176 432c0 44.112-35.888 80-80 80s-80-35.888-80-80 35.888-80 80-80 80 35.888 80 80zM25.26 25.199l13.6 272C39.499 309.972 50.041 320 62.83 320h66.34c12.789 0 23.331-10.028 23.97-22.801l13.6-272C167.425 11.49 156.496 0 142.77 0H49.23C35.504 0 24.575 11.49 25.26 25.199z"/></svg>');
    }
  }
  &-warning{
    border-color: set-foreground-color($main-background, #fdb333);
    color: set-foreground-color($main-background, #cc8710);
    &:before {
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" fill="%23cc8710"><path d="M569.517 440.013C587.975 472.007 564.806 512 527.94 512H48.054c-36.937 0-59.999-40.055-41.577-71.987L246.423 23.985c18.467-32.009 64.72-31.951 83.154 0l239.94 416.028zM288 354c-25.405 0-46 20.595-46 46s20.595 46 46 46 46-20.595 46-46-20.595-46-46-46zm-43.673-165.346l7.418 136c.347 6.364 5.609 11.346 11.982 11.346h48.546c6.373 0 11.635-4.982 11.982-11.346l7.418-136c.375-6.874-5.098-12.654-11.982-12.654h-63.383c-6.884 0-12.356 5.78-11.981 12.654z"/></svg>');
    }
  }
  &-info{
    border-color: set-foreground-color($main-background, #3d9ccc);
    color: set-foreground-color($main-background, #3d9ccc);
    &:before {
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 192 512" fill="%233d9ccc"><path d="M20 424.229h20V279.771H20c-11.046 0-20-8.954-20-20V212c0-11.046 8.954-20 20-20h112c11.046 0 20 8.954 20 20v212.229h20c11.046 0 20 8.954 20 20V492c0 11.046-8.954 20-20 20H20c-11.046 0-20-8.954-20-20v-47.771c0-11.046 8.954-20 20-20zM96 0C56.235 0 24 32.235 24 72s32.235 72 72 72 72-32.235 72-72S135.764 0 96 0z"/></svg>');
    }
  }
  &-success{
    border-color: #3caf65;
    color: #3caf65;
    &:before {
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%233caf65"><path d="M173.898 439.404l-166.4-166.4c-9.997-9.997-9.997-26.206 0-36.204l36.203-36.204c9.997-9.998 26.207-9.998 36.204 0L192 312.69 432.095 72.596c9.997-9.997 26.207-9.997 36.204 0l36.203 36.204c9.997 9.997 9.997 26.206 0 36.204l-294.4 294.401c-9.998 9.997-26.207 9.997-36.204-.001z"/></svg>');
    }
  }
}

{# /* // Notification */ #}

.notification{
  &-primary {
    background: $main-background;
    border-color: $secondary-color;
    color: $secondary-color;
    border-top: 1px solid $line-color;
    &:before {
      color: $secondary-color;
      @include prefix(box-shadow, 0 0 2px rgba($main-foreground, .5), webkit ms moz);
    }
  }
  &-secondary{
    background: darken($main-background, 3%);
    border-top: 1px solid $line-color;
    color: rgba($main-foreground, .8);
    fill: rgba($main-foreground, .8);
    a {
      color: $secondary-color;
    }
  }
  &-danger {
    color: set-foreground-color($main-background, #cc4845);
    fill: set-foreground-color($main-background, #cc4845);
  }
}

.notification-centered {
  box-shadow: 0 2px 5px rgba($main-foreground, .3);
}

.notification-floating .notification {
  border: none;
  box-shadow: 0 2px 5px rgba($main-foreground, .3);
}

{# /* // Pagination */ #}

.pagination{
  &>li>a{
    background-color: $main-background;
    color:$main-foreground;
    margin-bottom: 5px;
  }
  &>li>a:hover{
    color: $main-foreground;
    background-color: darken($main-background, 10%);
    border-color: $line-color;
  }
  &>.active>a,
  &>.active>a:focus,
  &>.active>a:hover{
    color: $main-foreground;
    background-color: lighten($primary-color, 50%);
    border-color: $line-color;
  }
}

{# /* // Sliders */ #}

.swiper-pagination-bullet {
  background: rgba($main-foreground, .2);
  &:hover,
  &-active {
    background: $primary-color;
  }
}

.slider-arrow{
  fill: $main-foreground;
  &:hover{
    fill: $primary-color;
  }
}

{# /* // Pills */ #}

.pills-container{
  background-color: rgba($main-foreground, 0.03);
}
.pill-link{
  padding: 10px;
  color:$main-background;
  border: none;
  border-bottom: 4px solid darken($secondary-color, 10%);
  @include background-gradient($secondary-color);
  @include border-radius(4px);
  @extend .font-small;
  letter-spacing: 2px;
  text-transform: uppercase;
  &-small {
    margin: 0 5px 8px 0;
    padding: 8px;
    font-size: 10px;
  }
  &:hover,
  &:focus{
    color:$main-background;
    @include background-gradient-hover($secondary-color);
  }
}

{# /* // Labels */ #}

.label{
  color: $main-background;
  @include prefix(box-shadow, 1px 1px 2px 0 rgba(50, 50, 50, 0.30), webkit ms moz);
  &-secondary,
  &-accent{
    {% if settings.accent_color_active %}
      background: $accent-color;
    {% else %}
      background: $secondary-color;
    {% endif %}
  }
  &-primary{
    background: $primary-color;
  }
  &-primary-dark{
    background: darken($primary-color, 30%);
  }
}

{# /* // Tables */ #}

.table {
  tbody>tr:nth-child(odd) {
    >th,
    >td {
      background-color: rgba($main-foreground, .03);
    }
  }
  tbody.table-body-inverted>tr:nth-child(odd) {
    >th,
    >td {
      background-color: $main-background;
    }
  }
  tbody.table-body-inverted>tr:nth-child(even) {
    >th,
    >td {
      background-color: rgba($main-foreground, .03);
    }
  }
  >thead>tr>th{
    border-bottom:0;
  }
   >thead>tr>th,
  >tbody>tr>th,
  >tfoot>tr>th,
  >thead>tr>td,
  >tbody>tr>td,
  >tfoot>tr>td{
    border:0;
  }
}

{# /* // Banners */ #}

.service-link {
  color:$main-foreground;
}

.textbanner {
  &-text {
    color: $main-foreground;
    background-color: darken($main-background, 3%);
  }
  &-shape:before {
    border-color: transparent transparent darken($main-background, 3%) transparent;
  }
  &-image {
    background-color: darken($main-background, 6%);
    &:after {
      background: $primary-color;
    }
  }
}

.module-image {
  background-color: darken($main-background, 3%);
}

.module-text {
  color: $main-foreground;
  background-color: rgba($main-background, .9);
}

{# /* // Video */ #}

.video-container {
  margin: 20px 0;
  background-color: darken($main-background, 3%);
}

.product-video-container {
  background-color: rgba($main-foreground, .07);
}

.embed-responsive {
  background: $main-foreground;
}

{# /* // Background Diagonals */ #}

.shape-container {
  position: absolute;
  left: 0;
  z-index: -999;
  width: 100%;
  height: 470px;
  margin-top: -470px;
  overflow: hidden;
}

.background-shape {
  position: absolute;
  left: 0;
  bottom: 0;
  z-index: -999;
  width: 100%;
  height: 300px;
  background: darken($main-background, 2%);
  &:after {
    position: absolute;
    top: -170px;
    left: 0;
    border-style: solid;
    border-width: 0 0 170px 100vw;
    border-color: transparent transparent darken($main-background, 2%) transparent;
    content: '';
  }
}


{#/*============================================================================
  #Social
==============================================================================*/#}

{# /* // Instafeed */ #}

.instafeed-module {
  .instafeed-item {
    display: inline-block; 
    .instafeed-link {
      position: relative;
      display: block;
      padding-top: 100%;
      overflow: hidden;
    }
    .instafeed-img {
      position: absolute;
      top: 0;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
    .instafeed-info { 
      position: absolute;
      top: 8px;
      left: 8px;            
      padding: 0 5px;
      border-radius: 14px;
      font-size: 10px;
      background-color: $primary-color;
      color:$main-background;
      fill:$main-background;
        .instafeed-info-item {
          display: inline-block;
          margin: 5px;
        }
    }
  }
}

{# /* // Facebook */ #}

{% if has_logo %}
.fb-page-img-container{
  background: $main-background;
}
{% endif %}

{#/*============================================================================
  #Header and nav
==============================================================================*/#}


{# /* // Ad bar */ #}

{% if settings.ad_bar_background == 'background' %}
  $adbar-bg-color: $main-background;
  $adbar-fg-color: $main-foreground;
{% elseif settings.ad_bar_background == 'foreground' %}
  $adbar-bg-color: $main-foreground;
  $adbar-fg-color: $main-background;
{% elseif settings.ad_bar_background == 'secondary' %}
  $adbar-bg-color: $secondary-color;
  $adbar-fg-color: $main-background;
{% else %}
  $adbar-bg-color: $primary-color;
  $adbar-fg-color: $main-background;
{% endif %}

.section-advertising {
  color: $adbar-fg-color;
  background-color: $adbar-bg-color;
  a {
    color: $adbar-fg-color;
  }
}

{# /* // Logo */ #}

.logo-text{
	color: $primary-color;
	font-family: $font-headings;
}

{# /* // Nav desktop */ #}

{% set has_not_head_background_light = settings.head_background == 'primary' or settings.head_background == 'secondary' or settings.head_background == 'foreground' %}

{% if settings.head_background == 'secondary' %}
  $head-bg-color: $secondary-color;
  $head-fg-color: $main-background;
{% elseif settings.head_background == 'foreground' %}
  $head-bg-color: $main-foreground;
  $head-fg-color: $main-background;
{% elseif settings.head_background == 'primary' %}
  $head-bg-color: $primary-color;
  $head-fg-color: $main-background;
{% else %}
  $head-bg-color: $main-background;
  $head-fg-color: $main-foreground;
{% endif %}

.nav-head {
  background: $head-bg-color;
  color: $head-fg-color;
  a {
    color: $head-fg-color;
  }
  .svg-text-fill {
    fill: $head-fg-color;
  }
  @include prefix(box-shadow, 0 2px 2px 0 rgba(50, 50, 50, 0.15), webkit ms moz);
  &-top {
    border-bottom: 1px solid $line-color;
    @extend .font-small;
  }
}

.nav-head-fixed{
	background: $head-bg-color;
}

.desktop-nav {
  background-color: $head-bg-color;
  a {
    color: $head-fg-color;
  }
  &-arrow{
    fill: rgba($head-fg-color, .8);
  }
  &-item{
    background: $head-bg-color;

    &:hover > .desktop-nav-link {
      {% if has_not_head_background_light %}
        color:$head-fg-color;
      {% else %}
        color:$primary-color;
      {% endif %}
    }
    .desktop-nav-item {
      &:first-child {
        border-top:1px solid $line-color;
      }
      &:last-child {
        border-bottom:1px solid $line-color;
      }
      border-bottom: 1px solid $line-color;
      border-left: 1px solid $line-color;
      border-right: 1px solid $line-color;

      &:hover {
        {% if has_not_head_background_light %}
          background-color: $head-fg-color;
        {% else %}
          background-color: $head-fg-color;
          background-color: $primary-color;
        {% endif %}
      }

      &:hover > .desktop-nav-link{
        color: $head-bg-color;
        .desktop-nav-arrow{
          fill:$head-bg-color;
        }
      }
    }
  }
  &-item.selected > .desktop-nav-link {
    {% if settings.head_background == 'background' %}
      color:$primary-color;
    {% else %}
      color:$head-fg-color;
    {% endif %}
    font-weight: bold;
    .desktop-nav-arrow{
      {% if has_not_head_background_light %}
        fill:$head-fg-color;
      {% else %}
        fill:$primary-color;
      {% endif %}
    }
  }
  &-list {
    @include prefix(box-shadow, 0 6px 12px rgba(0,0,0,.175), webkit ms moz);
    background-color: $head-bg-color;
  }
}

{# /* // Search */ #}

.desktop-search-input{
  height: 28px
}
.desktop-search-icon{
	fill:rgba($main-foreground, .8);
}

{# /* // Search suggestions */ #}

.search-suggest{
  background-color: $main-background;
  &-name,
  &-link,
  &-icon,
  .installments{
    color: rgba($main-foreground, 0.8);
    fill: rgba($main-foreground, 0.8);
    &:hover,
    &:focus{
      color: rgba($main-foreground, 0.6);
      background-color: darken($main-background, 3%);
    }
  }
  &-price{
    color: $primary-color;
    font-weight: bold;
  }
  &-icon{
    color: rgba($main-foreground, 0.8);
  }
  &-all-link{
    background-color: darken($main-background, 3%);
  }
}

{# /* // Cart widget desktop */ #}

.cart-summary {
  @extend .font-small;
	color: rgba($main-foreground, .8);
}

{#/*============================================================================
  #Product grid
==============================================================================*/#}

{# /* // Filters */ #}

.filters-overlay {
  background-color: rgba($main-background, .85);
}

{# /* // Grid item */ #}


.item{
	background-color:$main-background;
  &-overlay{
    position: absolute;
    top: 0px;
    left: 0px;
    height: 100%;
    width: 100%;
    opacity:0;
    background:$primary-color;
    transition: opacity .15s ease-in-out;
    @include prefix(transition, opacity .15s ease-in-out, webkit ms moz);
    z-index: 2;
  }
  &:hover .item-overlay{
    opacity:0.6;
  }
  &-info-container{
    background-color: darken($main-background, 3%);
  }
  &-info{
    border-color: transparent transparent darken($main-background, 3%) transparent;
  }
  &-info:before{
    border-color: transparent transparent darken($main-background, 3%) transparent;
  }
  &-price{
    margin: 3px 0;
    font-size: 18px;
    letter-spacing: 2px;
    font-family: $font-headings;
  }
  &-price-compare{
    letter-spacing: 2px;
    font-family: $font-headings;
  }
  &-colors-bullet {
    border: 1px solid rgba($main-foreground, .5);
    &.selected {
      border: 2px solid $main-foreground;
    }
  }
}
.installments{
  text-transform: uppercase;
}

.item-quickshop-link{
  background-color:$main-background;
  opacity:0.9;
  a {
    color: $main-foreground; 
  }
}


{#/*============================================================================
  #Product detail
==============================================================================*/#}

{# /* // Image */ #}

.cloud-zoom-loading {
	background:$main-background;
	color:$main-foreground;
	@include border-radius(5px);
}

{# /* // Form and info */ #}

.price-compare {
  letter-spacing: 0;
  color: rgba($main-foreground,.6);
  text-decoration: line-through;
}

.product-price{
  letter-spacing: 0;
  font-weight: 400;
}

.product-selected-gateway{
  color: $main-foreground;
}

.product-variants{
  float: left;
  width: 100%;
  padding-top: 20px;
  border-top: 1px dashed rgba($main-foreground, .2);
  border-bottom: 1px dashed rgba($main-foreground, .2);
}

.variant-label{
  font-family: $font-headings;
}

.btn-variant { 
  color: $main-foreground;
  border: 2px solid rgba($main-foreground, 0.2); 
  &-custom{
    background: $main-background;
  }
  &:hover,
  &:focus{
    color: $main-foreground;
  }
  &.selected{
    border: 2px solid $primary-color;
  }
  &-no-stock {
    color: rgba($main-foreground, 0.5);
    border-color: rgba($main-foreground, 0.2);
    &:after {
      background: linear-gradient(to top left,transparent 49%,rgba($main-foreground, 0.5) ,transparent 52%);
    }
    &.selected:after {
      background: linear-gradient(to top left,transparent 49%,$main-foreground ,transparent 52%);
    }
    &.btn-variant-color:after {
      background: linear-gradient(-45deg,rgba($main-background, 0.3) calc(50% - .7px),rgba($main-foreground, 0.5) calc(50% - .7px),rgba($main-foreground, 0.5) 50%,rgba($main-foreground, 0.5) calc(50% + .7px),rgba($main-background, 0.3) calc(50% + .7px));
    }
  }
} 

.product-shipping-calculator{
  li input[type="radio"]:checked + .shipping-option{
    background: transparent;
    color: $main-foreground;
  }
  .radio-button-icons{
    display: none;
  }
}

{# /* // Kit products */ #}

.kit-products-item-wrap:not(:first-child) {
  border-top: 1px dashed rgba($main-foreground, .2);
}

{#/*============================================================================
  #Footer
==============================================================================*/#}

{% if settings.footer_background == 'secondary' %}
  $footer-bg-color: $secondary-color;
  $footer-fg-color: $main-background;
{% elseif settings.footer_background == 'foreground' %}
  $footer-bg-color: $main-foreground;
  $footer-fg-color: $main-background;
{% elseif settings.footer_background == 'primary' %}
  $footer-bg-color: $primary-color;
  $footer-fg-color: $main-background;
{% else %}
  $footer-bg-color: $main-background;
  $footer-fg-color: $main-foreground;
{% endif %}

.footer {
  background: $footer-bg-color;
  color: $footer-fg-color;
  border-bottom: 1px solid $line-color;
  a,
  svg {
    color: $footer-fg-color;
    fill: $footer-fg-color;
  }
}
.footer-legal {
  background: $footer-bg-color;
  color: $footer-fg-color;
  a {
    color: $footer-fg-color;
    fill: $footer-fg-color;
  }
  .powered-by-logo svg { 
    fill: $footer-fg-color; 
  }
}

{#/*============================================================================
  #Contact page
==============================================================================*/#}

.map {
	border-color: $line-color;
}

{#/*============================================================================
  #Cart page
==============================================================================*/#}

{# /* // Cart table */ #}

.cart-table-row {
  background: $main-background;
}
.cart-quantity-btn{
  color: rgba($main-foreground, .6); 
  fill: rgba($main-foreground, .6); 
  border:1px solid rgba($main-foreground, .6); 
}
.cart-quantity-input{
  border:0;
  border-top:1px solid rgba($main-foreground, .6); 
  border-bottom:1px solid rgba($main-foreground, .6); 
}
.cart-totals-container {
	background: $main-background;
}
.cart-total{
  color: $secondary-color;
  font-weight: bold;
}

{# /* // Ajax cart */ #}

.ajax-cart-table-header { 
  border-top: 1px solid rgba($secondary-color, 0.2);
  border-bottom: 1px solid rgba($secondary-color, 0.2);
}
.ajax-cart-item { 
  border-bottom: 1px solid rgba($secondary-color, 0.2); 
  background: rgba(150, 150, 150, 0.06); 
}

{#/*============================================================================
  #Media queries
==============================================================================*/#}

{# /* // Max width 767px */ #}

@media (max-width: 767px) {

  {# /* //// Colors and fonts */ #}

  {# /* Headings */ #}

  .title{
    font-size: 18px;
  }
  
  .h1-xs {
    font-size: 36px;
  }
  .h2-xs {
    font-size: 30px;
  }
  .h3-xs {
    font-size: 24px;
  }
  .h4-xs {
    font-size: 18px;
  }
  .h5-xs {
    font-size: 14px;
  }
  .h6-xs {
    font-size: 12px;
  }

  {# /* Body */ #}
  
  .font-body-xs {
    font-size: 14px;
  }
  .font-medium-xs {
    font-size: 16px;
  }
  .font-small-xs {
    font-size: 12px;
  }
  .font-small-extra-xs {
    font-size: 10px;
  } 

  .btn-small-xs {
    font-size: 10px;
    letter-spacing: 1px;
  } 
  
  {# /* Weight */ #}

  .weight-normal-xs {
    font-weight: 400;
  }
  .weight-strong-xs {
    font-weight: 700;
  }
  .weight-light-xs {
    font-weight: 300;
  }

	{# /* //// Components */ #}

  {# /* Wrappers */ #}

  .container-with-border-top-xs{
    margin-top: 20px;
    padding-top: 20px;
    border-top: 1px dashed $line-color;
  }

  {# /* Buttons and links */ #}

  .btn-module {
    color: $main-foreground;
    border: 1px solid rgba($main-foreground, .2);
    border-radius: 0;
    background: $main-background;
    font-family: $font-headings;
    &:hover
    &:focus{
      color: $main-foreground;
    }
    &-icon{
      fill:$primary-color;
    }
  }

  {# /* Modals */ #}

  .modal-xs{
    background-color:$main-background; 
    &-header{
      color: $main-foreground;
      fill: $main-foreground;
      &:active{
        background-color:$primary-color;
        color:$main-background;
        .modal-xs-header-icon{
          color:$main-background;
          fill:$main-background;
        }
      }
    }
  }

  .modal-xs-list-item{
    color: $main-foreground;
    border-bottom: 1px solid rgba($main-foreground, .25);
    &.darker{
      background-color:rgba($main-foreground, 0.02);
    }
    .modal-xs-list-icon{
      fill:$primary-color;
    }
    &:active{
      background-color:$primary-color;
      color:$main-background;
      .modal-xs-list-icon{
        color:$main-background;
        fill:$main-background;
      }
    }
    &.selected{
      color: $main-background;
      border-right: 0;
      border-left: 0;
      border-bottom: 0;
      background: $primary-color;
      .modal-xs-radio-icon {
        background: $main-background;
        svg{
          visibility: visible; 
          fill: $primary-color;
        }
      }
    }
    .modal-xs-radio-icon {
      background: rgba($primary-color, .4);
      color: $primary-color;
    }
    &.inverse{
      color:rgba($main-background, .8);
      border-bottom: 1px solid rgba($main-background, .05);
      .modal-xs-list-icon{
        fill:$main-background;
      }
    }
  }
  .modal-footer {
    border: 0;
  }


	{# /* Tables */ #}

	.table-responsive {
		border-color: $line-color;
	}

	{# /* Pagination */ #}

  .pagination{
    background:lighten($main-foreground, 70%);
    &>li>a,
    &>li>span,
    &>.active>a,
    &>.active>a:hover,
    &>li>a:hover{
      background-color: transparent;
      border:0;
    }
    &-input{
      color:$main-foreground;
    }
    &-icon{
      float: left;
      color:$main-foreground;
    }
  }
  	
	{# /* //// Header and nav */ #}

  {# /* Nav mobile */ #}

  .hamburger-panel{
    &-link:hover,
    &-link:focus{
        background: $primary-color;
        color: $main-background;
    }
    &-link.selected {
      .hamburger-panel-arrow{
        background-color: $primary-color;
      }
      svg{
        transform-origin: center;
        @include prefix(transform, rotate(180deg), webkit ms moz);
      }
    }
  }

  .mobile-nav{
    background-color:$head-bg-color;
    a,
    .mobile-nav-title {
      {% if has_not_head_background_light %}
        color: rgba($head-fg-color, .8);
      {% else %}
        color: $primary-color;  
      {% endif %}
    }
    &-first-row-icon{
      fill: $head-fg-color;
    }  
    &-tab:hover {
      color: $head-fg-color;
    }
    &-tab.selected{
      .mobile-nav-tab-icon{
        {% if has_not_head_background_light %}
          fill: $head-fg-color;
        {% else %}
          fill: $primary-color;
        {% endif %}
      }
      .mobile-nav-tab-text{
        {% if has_not_head_background_light %}
          color: $head-fg-color;
        {% else %}
          color: $primary-color;
        {% endif %}
      }
    }
    .mobile-nav-tab-icon{
      fill: rgba($head-fg-color, .8);
    }
    &.move-up {
      box-shadow: 2px 0px 5px rgba($main-foreground, .3);
    }
    .mobile-search-input-container {
      .svg-text-fill{
        fill: $head-fg-color; 
      }
      .mobile-search-input{
        background-color:$head-bg-color;
        color: $head-fg-color;
        &::placeholder {
          color: $head-fg-color;
        }
      }
    }
    
  }
  .mobile-nav-arrow-up {
    background-color: $head-bg-color;
    svg{
      fill: $head-fg-color;
    }
  }
  .mobile-nav-categories-container,
  .mobile-nav-subcategories-panel{
    background-color: $head-fg-color;
    color: $head-bg-color;
    box-shadow: 2px 0px 1px 1px rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
    .modal-xs-list-item {
      border-bottom: 1px solid rgba($head-bg-color, .08);
    }
    .modal-xs-list-item,
    .modal-xs-header{
      background-color: $head-fg-color;
      color: $head-bg-color;
      &:active {
        color: $main-background;
        background-color: $primary-color;
        .modal-xs-list-icon,
        .modal-xs-header-icon {
          fill: $main-background;
        }
      }
      .modal-xs-list-icon,
      .modal-xs-header-icon {
        fill: $head-bg-color;
      }
    }
  }

  .backdrop.search-backdrop{
    background-color: rgba($head-fg-color, .9);
  }

  {# /* //// Product grid */ #}

  .btn-filter{
    margin: 10px 10px 5px 0;
    padding: 5px 10px;
  }
  .item-price{
    font-weight: bold;
  }

  {# /* //// Product detail */ #}

  .product-price{
    font-size: 30px;
    &-small-xs {
      font-size: 20px;
    }
  }

  .mobile-zoom-panel{
    background:$main-background;
  }
}
