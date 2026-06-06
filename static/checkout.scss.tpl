{% if store.allows_checkout_styling %}

{#/*============================================================================
checkout.scss.tpl

    -This file contains all the theme styles related to the checkout based on settings defined by user from config/settings.txt
    -Rest of styling can be found in:
        -static/css/custom-styles.scss.tpl --> For color and font styles related to config/settings.txt
        -static/css/style.scss.tpl --> For the rest of the theme styles

==============================================================================*/#}

{#/*============================================================================
  Global
==============================================================================*/#}

{# /* // Colors */ #}

$primary-brand-color: {{ settings.primary_color | default('rgb(77, 190, 207)' | raw ) }};
$accent-brand-color: {{ settings.secondary_color | default('rgb(77, 190, 207)' | raw ) }};
$foreground-color: {{ settings.text_primary_color | default('rgb(102, 102, 102)' | raw ) }};
$background-color: {{  settings.background_color | default('rgb(252, 252, 252)' | raw ) }};

{# /* // Font */ #}

$heading-font: {{ settings.main_font | default('Roboto') | raw }};
$body-font: {{ settings.default_font | default('Roboto') | raw }};
$logo-font: {{ settings.default_font | default('Roboto') | raw }};

{# /* // Box */ #}

$box-radius: 4px;
$box-background: lighten($background-color, 5%);

$box-border-color: rgba($foreground-color, .3);
$box-background: lighten($background-color, 10%);
$box-shadow: null;
@if lightness($background-color) > 50% {
  $box-shadow: 0 0 4px 0 rgba(0, 0, 0, .1), 0 1px 2px 0 rgba(0, 0, 0, .2);
} @else {
  $box-shadow: 0 0 4px 0 rgba(0, 0, 0, .2), 0 1px 2px 0 rgba(0, 0, 0, .3);
}

{# /* // Functions */ #}

@function set-background-color($background-color) {
  @if lightness($background-color) > 95% {
    @return lighten($background-color, 10%);
  } @else {
    @return desaturate(lighten($background-color, 7%), 5%);
  }
}

@function set-input-color($background-color, $foreground-color) {
  @if lightness($background-color) > 70% {
    @return desaturate(lighten($foreground-color, 5%), 80%);
  } @else {
    @return desaturate(lighten($background-color, 5%), 80%);
  }
}

{#/*============================================================================
  React
==============================================================================*/#}

{# /* // Box */ #}

$box-background: lighten($background-color, 10%);
$box-text-shadow: null;
@if lightness($foreground-color) > 95% {
  $box-text-shadow: 0 2px 1px rgba(darken($foreground-color, 80%), 0.1);
} @else {
  $box-text-shadow: 0 2px 1px rgba(lighten($foreground-color, 80%), 0.1);
}

$base-red: #c13a3a;

$xs: 0;
$sm: 576px;
$md: 768px;
$lg: 992px;
$xl: 1200px;

{#/*============================================================================
  # Checkout tokens
==============================================================================*/#}
:root {
  {#### Color tokens #}

  {% set primary_color = settings.primary_color %}
  {% set accent_color = settings.secondary_color %}
  {% set main_foreground = settings.text_primary_color %}
  {% set main_background = settings.background_color %}

  {# Auxiliar opacity hex levels #}
  {% set opacity_05 = '0D' %}
  {% set opacity_10 = '1A' %}
  {% set opacity_20 = '33' %}
  {% set opacity_30 = '4D' %}
  {% set opacity_50 = '80' %}
  {% set opacity_60 = '99' %}
  {% set opacity_80 = 'CC' %}

  {# Accent color #}
  --accent-color: {{ accent_color }};
  --accent-color-opacity-05: {{ accent_color }}{{ opacity_05 }};
  --accent-color-opacity-10: {{ accent_color }}{{ opacity_10 }};
  --accent-color-opacity-20: {{ accent_color }}{{ opacity_20 }};
  --accent-color-opacity-30: {{ accent_color }}{{ opacity_30 }};
  --accent-color-opacity-50: {{ accent_color }}{{ opacity_50 }};
  --accent-color-opacity-60: {{ accent_color }}{{ opacity_60 }};
  --accent-color-opacity-80: {{ accent_color }}{{ opacity_80 }};

  {# Foreground color #}
  --main-foreground: {{ main_foreground }};
  --main-foreground-opacity-05: {{ main_foreground }}{{ opacity_05 }};
  --main-foreground-opacity-10: {{ main_foreground }}{{ opacity_10 }};
  --main-foreground-opacity-20: {{ main_foreground }}{{ opacity_20 }};
  --main-foreground-opacity-30: {{ main_foreground }}{{ opacity_30 }};
  --main-foreground-opacity-50: {{ main_foreground }}{{ opacity_50 }};
  --main-foreground-opacity-60: {{ main_foreground }}{{ opacity_60 }};
  --main-foreground-opacity-80: {{ main_foreground }}{{ opacity_80 }};

  {# Background color #}
  --main-background: {{ main_background }};
  --main-background-opacity-05: {{ main_background }}{{ opacity_05 }};
  --main-background-opacity-10: {{ main_background }}{{ opacity_10 }};
  --main-background-opacity-20: {{ main_background }}{{ opacity_20 }};
  --main-background-opacity-30: {{ main_background }}{{ opacity_30 }};
  --main-background-opacity-50: {{ main_background }}{{ opacity_50 }};
  --main-background-opacity-60: {{ main_background }}{{ opacity_60 }};
  --main-background-opacity-80: {{ main_background }}{{ opacity_80 }};

  {#### Component tokens #}

  {# General #}
  --border-radius: 4px;
  --box-border-radius: var(--border-radius);
  --border-color: var(--main-foreground-opacity-30);
  --box-border-color: var(--main-foreground-opacity-10);
  --input-border-color: var(--border-color);

  {# Buttons #}
  --button-foreground: var(--main-background);
  --button-background: var(--accent-color);
  --button-border-color: var(--accent-color);
  --button-border-radius: var(--border-radius);

  {# Labels #}
  --label-foreground: var(--main-background);
  --label-background: var(--accent-color);

  {# Header #}
  --header-foreground: {{ primary_color }};
  --header-background: var(--main-background);
  --header-logo-max-width: 100%;
  --header-logo-max-height: 40px;

  {# Footer #}
  --footer-foreground: {{
    settings.footer_background == 'secondary' or
    settings.footer_background == 'foreground' or
    settings.footer_background == 'primary' ? 'var(--main-background)' :
    'var(--main-foreground)'
  }};
  --footer-background: {{
    settings.footer_background == 'secondary' ? 'var(--accent-color)' :
    settings.footer_background == 'foreground' ? 'var(--main-foreground)' :
    settings.footer_background == 'primary' ? primary_color :
    'var(--main-background)'
  }};

  {#### Typography #}

  {# Headings #}
  --heading-font: {{ settings.main_font | default('Roboto') | raw }};
  --heading-font-weight: bold;
  --heading-text-transform: uppercase;
  --heading-letter-spacing: 2px;

  {# Header #}
  --header-logo-font: var(--heading-font);
  --header-logo-font-size: 24px;
  --header-logo-font-weight: 700;
  --header-logo-text-transform: uppercase;
  --header-logo-letter-spacing: normal;
}

body {
  font-family: $body-font;
  color: $foreground-color;
  background-color: $background-color;
}
a {
  color: $accent-brand-color;
  text-decoration: none;

  &:hover, &:focus {
    color: darken($accent-brand-color, 20%);

    svg {
      fill: darken($accent-brand-color, 20%);
    }
  }

  svg {
    fill: $accent-brand-color;
  }
}

{# /* // Text */ #}

.title {
  color: $foreground-color;
}

{# /* // Header */ #}

.header { 
  background-color: lighten($background-color, 10%);
  border-color: $accent-brand-color;
}
.security-seal {
  color: $foreground-color;
}

{# /* // Headbar */ #}

.headbar {
  background: $background-color;
  box-shadow: 0 2px 2px 0 rgba(50, 50, 50, 0.15);

  .row {
    -ms-flex-align: center;
    align-items: center;
  }
}

.headbar-logo-img {
  max-width: 100%;
  max-height: 40px;
}

.headbar-logo-text {
  float: none;
  font-family: $heading-font;
  font-size: 24px;
  color: $primary-brand-color;
  text-transform: uppercase;

  &:hover {
    color: $primary-brand-color;
    opacity: .8;
  }

  &:focus {
    color: $background-color;
  }
}

.headbar-continue {
  margin: 0 !important;
  font-weight: 400;
  color: $accent-brand-color;
  &:hover,
  &:focus {
    color: $accent-brand-color;
    opacity: .8;

    .headbar-continue-icon {
      fill: $accent-brand-color;
    }
  }
  &-icon {
    margin-left: 5px;
    fill: $accent-brand-color;
  }
}

{# /* // Form */ #}

.form-control {
  border-color: $box-border-color;
  background: $background-color;
  color: $foreground-color;
  font-family: $body-font;
  border-radius: $box-radius;

  &:focus {
    border-color: $accent-brand-color;
    outline: none;    
  }
}
.form-options-content {
  font-size: 12px;
  line-height: 20px;
  color: rgba($foreground-color, .6);
  border: 0;
}
.form-group-error .form-control {
  border-color: $base-red;

  &:focus {
    border-color: $base-red;
  }
}
.form-group input[type="radio"] + .form-options-content .unchecked {
  fill: darken($background-color, 10%);
}
.form-group input[type="radio"] + .form-options-content .checked {
  fill: $accent-brand-color;
}
.form-group input[type="radio"]:checked + .form-options-content {
  border: 1px solid $accent-brand-color;
  border-color: darken($background-color, 10%);
  
  + .form-options-accordion {
    border-color: darken($background-color, 10%);
  }
  
  .checked {
    fill: $accent-brand-color;
  }
}
.form-group input[type="checkbox"]:checked + .form-options-content .checked {
  fill: $foreground-color;
}
.form-group input[disabled] + .form-options-content {
  border-color: darken($background-color, 10%) !important;
  
  .form-options-label {
    color: $foreground-color !important;
  }
  .checked {
    fill: $foreground-color !important;
  }
}
.form-group input[type="checkbox"] + .form-options-content .unchecked {
  width: 13px;
  fill: $foreground-color;
}

{# /* // Input */ #}

.has-float-label>span,
.has-float-label label {
  padding: 1px 0 0 7px;
  font-weight: 400;
}

.input-label {
  color: $foreground-color;
}

.select-icon {
  fill: $foreground-color;
}

{# /* // Buttons */ #}

.btn-primary {
  color: $background-color;
  background: $accent-brand-color;

  &:hover,
  &:focus,
  &:active {
    color: $background-color;
    background: $accent-brand-color;
    opacity: 0.9;
  }
}
.btn-secondary {
  color: $background-color;
  text-transform: uppercase;
  letter-spacing: 1px;
  background: $accent-brand-color;
  border-color: $accent-brand-color;
  border-radius: $box-radius;

  &:hover,
  &:focus,
  &:active,
  &:active:focus {
    color: $background-color;
    background: darken($accent-brand-color, 5%);
    border-color: darken($accent-brand-color, 12%);

    .btn-icon-right {
      fill: $background-color;
    }
  }
  .btn-icon-right {
    fill: $background-color;
  }
}
.btn-transparent {
  color: $accent-brand-color;
  text-decoration: underline;

  &:hover {
    color: $accent-brand-color;
    opacity: .8;
    
    .btn-icon-right {
      fill: $accent-brand-color;
    }
  }

  .btn-icon-right {
    fill: $accent-brand-color;
  }
}

.btn-link {
  color: $foreground-color;
  text-decoration: none;

  &:hover {
    color: $accent-brand-color;

    svg {
      fill: $accent-brand-color;
    }
  }
}

.btn-picker {
  border-color: $box-border-color;
  border-radius: $box-radius;
}

.login-info {
  margin: 10px 0 0;
  font-size: 12px;
}

{# /* // Breadcrumb */ #}

.breadcrumb {
  max-width: 66%;
  display: inline-block;
  margin: 20px 0 0 0;
  text-align: center;

  li {
    display: inline-block;

    .breadcrumb-step {
      margin: 0;
      font-size: 12px;
      color: rgba($foreground-color, .6);
      background: none;
      text-transform: none;

      &.active {
        font-weight: 700;
        color: $foreground-color;
        background: none;

        &:before,
        &:after {
          position: relative;
          margin: 0 10px;
          font-weight: 400;
          border: 0;
          content: ">";
          opacity: .6;
        }
      }

      &.visited {
        color: rgba($foreground-color, .6);
        background: none;
      }
    }
    &:first-child .breadcrumb-step,
    &:last-child .breadcrumb-step {
      padding: 0;
    }
  }
}


{# /* // Accordion */ #}

.accordion {
  color: $foreground-color;
  background-color: $background-color;
  border-radius: $box-radius;
  border-color: rgba($foreground-color, .1);
}

.accordion-section-header-icon {
  fill: $foreground-color;
}

.accordion-rotate-icon {
  fill: $foreground-color;
}

{# /* // Summary */ #}

.mobile-discount-coupon_btn {
  border-radius: $box-radius;
  border-color: darken($background-color, 10%);
  color: lighten($foreground-color, 20%);

  .icon {
    color: lighten($foreground-color, 20%);
  }
}
.summary-details {
  background: $background-color;
}
.summary-container {
  background: $background-color;
  border-bottom: 1px solid rgba($foreground-color, .1);
  box-shadow: none;
}
.summary-total {
  padding: 2px 0;
  font-size: 16px;
  font-weight: 700;
  color: $accent-brand-color;
  background: $background-color;
}
.summary-img-thumb {
  background: none;
  border-radius: 0;
}
.summary-arrow-rounded {
  background: $accent-brand-color;
}
.summary-arrow-icon {
  fill: $foreground-color;
}
.summary-title {
  font-size: 12px;
  color: $accent-brand-color;
  text-transform: uppercase;
}

.summary-coupon {
  margin-top: -1px;
  padding-right: 0;
  padding-left: 0;
}

{# /* // Radio */ #}

.radio-group {
  border-radius: $box-radius;

  &.radio-group-accordion {
    border-color: $box-border-color;
    overflow: hidden;

    .radio {
      border-color: lighten($box-border-color, 2%);
      &.active {
        color: $background-color;
        background: $accent-brand-color;
        .description {
          color: $background-color;
        }
        & + .radio-content {
          border: 1px solid $accent-brand-color;
        }
        .payment-item-discount {
          color: $background-color;
        }
      }
      .label {
        font-size: 16px;
        font-weight: 700;
      }
      .description {
        width: calc(100% - 35px);
        margin-left: 35px;
        font-weight: 400;
      }
      &-content:last-child {
        border-radius: 0 0 $box-radius $box-radius;
      }
    }
  }
}

.radio input:checked + .selector:before {
  background-image: radial-gradient(circle, $background-color 0%, $background-color 40%, transparent 50%, transparent 100%);
  border-color: $background-color;
}
.radio input:disabled:checked + .selector:before {
  background-image: radial-gradient(circle, rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0.5) 50%, transparent 50%, transparent 100%);
}

.radio .selector:before {
  width: 20px;
  height: 20px;
  margin: 2px 15px 0 0;
  border: 2px solid rgba($foreground-color, 0.5);
}

.radio-content {
  background: $background-color;
  border: 0;
  box-shadow: none;
}
.shipping-option {
  position: relative;
  margin-bottom: -1px;
  padding-left: 55px;
  border-radius: 0;
  border-color: $box-border-color;

  &:first-child {
    border-radius: $box-radius $box-radius 0 0;
  }
  &:last-child {
    border-radius: 0 0 $box-radius $box-radius;
  }
  &:only-child {
    border-radius: $box-radius;
  }
  &.active {
    border: 1px solid $accent-brand-color;
    border-left-width: 0;

    .selector {
      background: $accent-brand-color;
    }
    .shipping-method-item-price {
      color: $accent-brand-color;
    }
  }
  .selector {
    position: absolute;
    top: 0;
    left: 0;
    width: 45px;
    height: 100%;
    margin: 0;
    text-align: center;
    &:before {
      margin: 15px 0 0 0;
    }
  }
}

{# /* // Panel */ #}

.panel {
  padding: 0;
  color: lighten($foreground-color, 8%);
  background-color: $background-color;
  border-radius: $box-radius;
  box-shadow: none;
  border: 0;

  &.panel-with-header {
    position: relative;
    padding-top: 0;
    p {
      margin-top: 0;
      text-align: center;
      &.text-small-extra {
        text-align: left;
      }
    }
  }
  .panel-subheader:before {
    display: inline-block;
    width: 20px;
    margin: 0 14px 0 2px;
    vertical-align: middle;
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.text_primary_color |trim('#') }}"><path d="M256 288c79.5 0 144-64.5 144-144S335.5 0 256 0 112 64.5 112 144s64.5 144 144 144zm128 32h-55.1c-22.2 10.2-46.9 16-72.9 16s-50.6-5.8-72.9-16H128C57.3 320 0 377.3 0 448v16c0 26.5 21.5 48 48 48h416c26.5 0 48-21.5 48-48v-16c0-70.7-57.3-128-128-128z"/></svg>');
  }
  .panel-submodule:last-child .panel-subheader:before,
  .shipping-options .panel-subheader:before {
    width: 18px;
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" fill="%23{{ settings.text_primary_color |trim('#') }}"><path d="M172.268 501.67C26.97 291.031 0 269.413 0 192 0 85.961 85.961 0 192 0s192 85.961 192 192c0 77.413-26.97 99.031-172.268 309.67-9.535 13.774-29.93 13.773-39.464 0zM192 272c44.183 0 80-35.817 80-80s-35.817-80-80-80-80 35.817-80 80 35.817 80 80 80z"/></svg>');
  }
  .new-shipping-flow .panel-subheader-ship:before {
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 400" fill="%23{{ settings.text_color |trim('#') }}"><path d="M226.8 94.6H0V63.8h242.2c8.5 0 15.4 6.9 15.4 15.4v41.6h70.1c4.7 0 9.1 2.1 12 5.8l57 71.2c2.2 2.7 3.4 6.1 3.4 9.6v85.5c0 8.5-6.9 15.4-15.4 15.4h-30.1c-6.2 16.6-22.3 28.5-41.1 28.5-24.2 0-43.9-19.6-43.9-43.9 0-24.2 19.6-43.9 43.9-43.9 18.8 0 34.9 11.8 41.1 28.5h14.7v-64.7l-49-61.2h-62.7v141.3c0 8.5-6.9 15.4-15.4 15.4h-85.5v-30.8h70.1V94.6zm-70.1 56.9H28.5v-30.8h128.2v30.8zm-28.5 57H0v-30.8h128.2v30.8zm-42.7 71.2c-7.2 0-13.1 5.9-13.1 13.1 0 7.2 5.9 13.1 13.1 13.1 7.2 0 13.1-5.9 13.1-13.1 0-7.2-5.9-13.1-13.1-13.1zm-43.9 13.2c0-24.2 19.6-43.9 43.9-43.9s43.9 19.6 43.9 43.9c0 24.2-19.6 43.9-43.9 43.9s-43.9-19.7-43.9-43.9zm271.8-13.2c-7.2 0-13.1 5.9-13.1 13.1 0 7.2 5.9 13.1 13.1 13.1 7.2 0 13.1-5.9 13.1-13.1 0-7.2-5.9-13.1-13.1-13.1z"/></svg>');
  }
  .new-shipping-flow .panel-subheader-pickup:before {
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 400" fill="%23{{ settings.text_color |trim('#') }}"><path d="M198.3 0c-82.5 0-150 67.5-150 150 0 60 20 77.5 135 242.5 3.8 5 9.4 7.5 15 7.5s11.3-2.5 15-7.5c115-165 135-182.5 135-242.5 0-82.5-67.5-150-150-150zm0 348.5c-11.3-16.1-21.5-30.6-30.8-43.7C93.9 200.4 85.8 187.7 85.8 150c0-62 50.5-112.5 112.5-112.5S310.8 88 310.8 150c0 37.7-8.1 50.4-81.7 154.8-9.3 13.1-19.5 27.6-30.8 43.7z"/></svg>');
  }

  .shipping-address-container .panel-subheader:before {
    display: none;
  }
}
.panel-header {
  display: flex;
  flex-direction: row;
  margin: 0;
  font-family: $heading-font;
  font-size: 23px;
  font-weight: bold;
  color: $foreground-color;
  border: 0;
  text-shadow: none;
  text-transform: uppercase;
  letter-spacing: 2px;
  justify-content: center;

  &:after,
  &:before {
    position: relative;
    top: 0.5em;
    flex-grow: 1;
    height: 1px;
    margin-top: 1px;
    background-color: rgba($foreground-color, .1);
    content: '';
  }
  &:before {
    margin-right: 10px;
  }
  &:after {
    margin-left: 10px;
  }
}
.panel-header-tooltip {
  position: absolute;
  top: 6px;
  right: 0;
  z-index: 9;
  text-transform: none;
  letter-spacing: 0;
}
.panel-header-sticky {
  background-color: $background-color;
}
.panel-footer {
  border-bottom-right-radius: $box-radius;
  border-bottom-left-radius: $box-radius;
  background: darken($background-color, 2%);
  &-wa {
    border-color: darken($background-color, 5%);
  }
}
.panel-footer-form {
  input {
    border-color: $foreground-color;
  }
  .input-group-addon {
    background: $background-color;
    border-color: $foreground-color;
  }
  .disabled {
    background: darken($background-color, 15%) !important;
  }
}

{# /* // Table */ #}

.table-footer {
  display: block;
  margin-top: 15px;
  font-size: 22px;
  font-weight: 700;
  color: $accent-brand-color;
  border-top: 1px solid rgba($foreground-color, 0.1);
  border-bottom: 1px solid rgba($foreground-color, 0.1);

  .text-semi-bold {
    font-weight: 700;
  }
}

.table-subtotal {
  margin: 0;
  padding: 15px 0 0;
  border-color: rgba($foreground-color, 0.1);
  border-width: 1px;

  td {
    padding: 3px 0;
  }
  .table tr {
    display: block;
    padding: 0 15px;
  }
  .table-footer td {
    padding: 20px 0;
  }
}

.table.table-scrollable {
  padding: 0;
  background: rgba($foreground-color, 0.1);

  tr {
    border-bottom: 1px solid rgba($foreground-color, 0.1);
    &:last-child {
      border: 0;
    }
  }
  td {
    padding: 15px 0;
  }
  .summary-img-wrap {
    padding: 15px;
  }
  .table-price {
    padding-right: 15px;
  }
}
.table .table-discount-coupon,
.table .table-discount-promotion {
  color: $accent-brand-color;
  border: 0;
}

{# /* // Shipping Options */ #}

.shipping-options {
  color: lighten($foreground-color, 7%);

  .radio-group {
    border-radius: $box-radius;
    overflow: hidden;
    padding-bottom: 1px;
  }

  .btn {
    margin: 0;
  }
}

.shipping-method-item > span {
  width: 100%;
}

.shipping-method-item-desc,
.shipping-method-item-name {
  max-width: 70%;
  color: desaturate(lighten($foreground-color, 10%), 80%)
}

.shipping-method-item-price {
  float: right;
  font-size: 16px;
  color: $foreground-color;
}

.price-striked {
  display: block;
  margin: 5px 0 0 !important;
  font-size: 14px;
  color: rgba($foreground-color, .6);
  text-align: right;
}

{# /* // Discount Coupon */ #}

.box-discount-coupon button {
  @if lightness($foreground-color) < 90% {
    color: lighten($foreground-color, 80%);
  } @else {
    color: $foreground-color;
  }
  background: $accent-brand-color;

  &:hover {
    background: lighten($accent-brand-color, 15%) radial-gradient(circle,transparent 1%, lighten($accent-brand-color, 15%) 1%) center/15000%;
  }
}

.box-discount-coupon-applied {
  color: $accent-brand-color;
  background: none;
  border-radius: $box-radius;

  .coupon-icon {
    fill: $foreground-color;
  }
}

{# /* // Order Status */ #}

.orderstatus {
  border: 1px solid rgba($foreground-color, .1); 
}

{# /* // Destination */ #}

.destination {
  border-color: rgba($foreground-color, 0.1);
  &-icon svg {
    fill: $accent-brand-color;
  }
}

{# /* // User Detail */ #}

.user-detail-icon svg {
  fill: $accent-brand-color;
}

{# /* // History */ #}

.history-item-done .history-item-title {
  color: $accent-brand-color;
}
.history-item-failure .history-item-title {
  color: $base-red;
}
.history-item-progress-icon svg {
  @if lightness($background-color) > 50% {
    fill: darken($background-color, 10%);  
  } @else {
    fill: $background-color;
  }
}
.history-item-progress-icon:after {
  @if lightness($background-color) > 50% {
    fill: darken($background-color, 10%);
    border-color: darken($background-color, 10%);
  } @else {
    fill: $background-color;
    border-color: $background-color;
  }
}
.history-item-progress-icon-failure svg {
  fill: $base-red;
}
.history-item-progress-icon-success svg {
  fill: $accent-brand-color;
}
.history-item-progress-icon-success:after {
  border-color: $accent-brand-color;
}

{# /* // HIstory Cancelled */ #}

.history-canceled {
  border-top-right-radius: $box-radius;
  border-top-left-radius: $box-radius;
  
  &-round {
    border-bottom-right-radius: $box-radius;
    border-bottom-left-radius: $box-radius;
  }
}
.history-canceled-header {
  border-color: rgba($box-border-color, 0.7);
  border-top-left-radius: $box-radius;
  border-top-right-radius: $box-radius;
}
.history-canceled-icon svg {
  fill: darken($background-color, 45%);
}

{# /* // Offline Payment */ #}

.ticket-coupon {
  background: darken($background-color, 4%);
  border-color: $box-border-color;
}

{# /* // Status */ #}

.status {
  border: 1px solid rgba($foreground-color, .1);
  padding: 25px 0;
  &-icon svg {
    fill: $accent-brand-color;
  }
}

{# /* // Tracking */ #}

.tracking-item-time {
  color: $foreground-color;
}

{# /* // WhatsApp Opt-in */ #}

.whatsapp-form input, 
.whatsapp-form .input-group-addon {
  border-color: $accent-brand-color;
}

{# /* // Helpers */ #}

.border-top {
  border-color: rgba($box-border-color, .4);
}

{# /* // Errors */ #}

.general-error {
  background: $base-red;
  border-color: lighten($base-red, 10%);
}

{# /* // Badge */ #}

.badge {
  border: 0;
}

{# /* // Payment */ #}

.payment-item-discount {
  color: $accent-brand-color;
}

.payment-option {
  border-radius: $box-radius;
  color: $foreground-color;
  background-color: $background-color;
  border-color: rgba($foreground-color, .1);
}

.radio-content.payment-option-content {
  background: darken($background-color, 2%);
  border: 1px solid rgba($foreground-color, .1);
  border-top: 0;
  border-bottom-right-radius: $box-radius;
  border-bottom-left-radius: $box-radius;
}

{# /* // Overlay */ #}

.overlay {
  background: rgba(darken($background-color, 10%), 0.6);
}
.overlay-title {
  color: rgba($foreground-color, .7);
}

{# /* // List Picker */ #}

.list-picker .unchecked {
  fill: $foreground-color;
}
.list-picker li {
  border-color: $box-border-color;
  background: lighten($background-color, 10%);

  &:hover {
    color: $accent-brand-color;
  }

  &.active {
    background: $background-color;
    color: $accent-brand-color;

    .checked {
      fill: $accent-brand-color;
    }
  }
}

.list-picker-content {
  background: lighten($background-color, 10%);
  border-color: $box-border-color;
}

{# /* // Loading */ #}

.loading {
  background: rgba(darken($background-color, 2%), 0.5);
  color: $accent-brand-color;
}
.loading-spinner {
  color: $accent-brand-color;
}
.loading-skeleton-radio {
  margin: 0 0 -1px 0;
  border-color: rgba($foreground-color, .1);
  border-radius: 0;
  &:first-child {
    border-radius: $box-radius $box-radius 0 0;
  }
  &:last-child {
    border-radius: 0 0 $box-radius $box-radius;
  }
  &:not(:first-child) {
    border-top: 0;
  }
}

{# /* // Spinner */ #}

.round-spinner {
  border-color: $accent-brand-color;
  border-left-color: darken($accent-brand-color, 5%);

  &:after {
    border-color: $accent-brand-color;
    border-left-color: darken($accent-brand-color, 5%);
  }
}

.spinner > .spinner-elem {
  background: $accent-brand-color;
}

.spinner-inverted > .spinner-elem {
  background: $background-color;
}

{# /* // Sign Up */ #}

.signup {
  border: 1px solid rgba($foreground-color, .1); 
  padding: 25px 0;
  &-icon svg {
    fill: $accent-brand-color;
  }
}

{# /* // Modal */ #}

.modal-dialog,
.modal .modal-dialog {
  background: $background-color;
}

{# /* // List */ #}

.list-group-item {
  border-color: rgba($foreground-color, .1);
}

{# /* // Announcement */ #}

.announcement {
  color: darken($primary-brand-color, 10%);

  &-bg {
    background: $primary-brand-color;
    box-shadow: 0px 3px 5px -1px rgba(darken($primary-brand-color, 20%), 0.35);
    border-radius: $box-radius;
  }

  &-close {
    color: $primary-brand-color;
  }
}

{# /* // Alert */ #}

.alert-info {
  background-color: rgba($accent-brand-color, .2);
  border-color: rgba($accent-brand-color, .3);
  color: desaturate(darken($accent-brand-color, 10%), 30%);

  .alert-icon {
    fill: desaturate(darken($accent-brand-color, 10%), 30%);
  }
}

{# /* // Chip */ #}

.chip {
  background-color: rgba($accent-brand-color, .2);
  color: desaturate(darken($accent-brand-color, 10%), 30%);
}

{# /* // Alert */ #}

.alert-info {
  background-color: rgba($accent-brand-color, .2);
  border-color: rgba($accent-brand-color, .3);
  color: desaturate(darken($accent-brand-color, 10%), 30%);

  .alert-icon {
    fill: desaturate(darken($accent-brand-color, 10%), 30%);
  }
}

{# /* // Tooltip */ #}

.tooltip-icon {
  fill: $foreground-color;
}

{# /* // Review Block Detailed  */ #}
.price--display__free {
  color: $accent-brand-color;
}

.review-block-detailed-item {
  border-bottom: 1px solid rgba($foreground-color, .1);
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
  &:last-child{
    border-radius: 0 0 4px 4px;
  }
}

.review-block-detailed {
  border: 1px solid rgba($foreground-color, .1);
  border-radius: 4px;
  background-color: $background-color;
}

{# /* // Tabs */ #}

.tabs-wrapper {
  border-top-right-radius: $box-radius;
  border-top-left-radius: $box-radius;
  background: $background-color;
  border-bottom-color: darken($background-color, 10%);
}

.tab-item.active {
  color: $accent-brand-color;
  font-weight: bold;
}

.tab-indicator {
  background-color: $accent-brand-color;
}

{#/*============================================================================
  #Media queries
==============================================================================*/ #}

{# /* // Max width 576px */ #}

@media (max-width: $sm) {

  .security-seal {
    color: #000000;

    .d-inline-block:first-child {
      position: absolute;
      top: 1px;
      left: 50%;
      margin-left: -13px;
    }
    p {
      display: inline-block;
      &.text-semi-bold {
        margin-right: 50px !important;
      }
    }
    &-badge {
      margin: 0;
    }
  }

  .headbar .row .col {
    text-align: center !important;
    flex-basis: auto;
    &.text-left {
      order: 2;
    }
    &.text-right {
      margin: -12px 0 15px 0;
      background: #aac67b;
    }
  }

  .headbar-logo-text {
    display: inline-block;
    margin: 8px 0;
  }

  .breadcrumb {
    max-width: 100%;
  }

  .summary .panel {
    border: 0;
  }

  .panel-header {
    font-size: 17px;
  }

  .table.table-scrollable td {
    padding: 15px;
  }

  .orderstatus-footer {
    background: $background-color;
  }

}

{# /* // Min width 768px */ #}

@media (min-width: $md) {

  .status,
  .signup {
    padding: 40px 0;
  }

}

{# /* // Max width 0px */ #}

@media (max-width: $xs) {

  .modal-xs {
    background: $background-color;
  }

}

{% endif %}
