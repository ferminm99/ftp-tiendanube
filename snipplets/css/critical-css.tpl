{% raw %}@charset "UTF-8":


{#/*============================================================================
critical-css.tpl

    -This file contains all the theme critical styles wich will be loaded inline before the rest of the site
    -Rest of styling can be found in:
      -static/css/style.css --> For non critical styles witch will be loaded asynchronously
        -static/css/main-colors.scss.tpl --> For color and font styles related to config/settings.txt

==============================================================================*/#}

{#/*============================================================================
  Table of Contents

  #External CSS libraries and plugins
    // Critical part of Bootstrap v3.2.0
    // Swiper 4.4.2
  #Critical path utilities classes
  #Components
    // Animations
    // Placeholders and preloaders
    // Wrappers
    // SVG Icons
    // Images
    // Breadcrumbs
    // Pills
    // Labels
    // Sliders
    // Banners
    // Video
  #Header and nav
    // Ad bar
    // Nav desktop
    // Nav mobile
    // Search desktop
    // Logo
    // Cart widget desktop
  #Product grid
    // Grid
    // Grid item
  #Product detail
    // Image
    // Form and info
  #Cart detail
  #Blog
  #Media queries
    // Min width 767px
    // Min width 1368px
      //// Components
    // Max width 1200px
      //// Components
  	// Max width 767px
  		//// Components
  		//// Header and nav
  		//// Product grid
  		//// Product detail
  #Utilities classes

==============================================================================*/#}

{#/*============================================================================
  #External CSS libraries and plugins
==============================================================================*/#}

{# /* // Critical part of Bootstrap v3.2.0 */ #}

html{font-family:sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%}body{margin:0}article,aside,details,figcaption,figure,footer,header,hgroup,main,nav,section,summary{display:block}audio,canvas,progress,video{display:inline-block;vertical-align:baseline}audio:not([controls]){display:none;height:0}[hidden],template{display:none}a{background:0 0}a:active,a:hover{outline:0}abbr[title]{border-bottom:1px dotted}b,strong{font-weight:700}dfn{font-style:italic}h1{margin:.67em 0;font-size:2em}mark{color:#000;background:#ff0}small{font-size:80%}sub,sup{position:relative;font-size:75%;line-height:0;vertical-align:baseline}sup{top:-.5em}sub{bottom:-.25em}img{border:0}svg:not(:root){overflow:hidden}figure{margin:1em 40px}hr{height:0;-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box}pre{overflow:auto}code,kbd,pre,samp{font-family:monospace,monospace;font-size:1em}button,input,optgroup,select,textarea{margin:0;font:inherit;color:inherit}button{overflow:visible}button,select{text-transform:none}button,html input[type=button],input[type=reset],input[type=submit]{-webkit-appearance:button;cursor:pointer}button[disabled],html input[disabled]{cursor:default}button::-moz-focus-inner,input::-moz-focus-inner{padding:0;border:0}input{line-height:normal}input[type=checkbox],input[type=radio]{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;padding:0}input[type=number]::-webkit-inner-spin-button,input[type=number]::-webkit-outer-spin-button{height:auto}input[type=search]{-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;-webkit-appearance:textfield}input[type=search]::-webkit-search-cancel-button,input[type=search]::-webkit-search-decoration{-webkit-appearance:none}fieldset{padding:.35em .625em .75em;margin:0 2px;border:1px solid silver}legend{padding:0;border:0}textarea{overflow:auto}optgroup{font-weight:700}table{border-spacing:0;border-collapse:collapse}td,th{padding:0}@media print{*{color:#000!important;text-shadow:none!important;background:transparent!important;-webkit-box-shadow:none!important;box-shadow:none!important}a,a:visited{text-decoration:underline}a[href]:after{content:" (" attr(href) ")"}abbr[title]:after{content:" (" attr(title) ")"}a[href^="javascript:"]:after,a[href^="#"]:after{content:""}pre,blockquote{border:1px solid #999;page-break-inside:avoid}thead{display:table-header-group}tr,img{page-break-inside:avoid}img{max-width:100%!important}p,h2,h3{orphans:3;widows:3}h2,h3{page-break-after:avoid}select{background:#fff!important}.navbar{display:none}.table td,.table th{background-color:#fff!important}.btn>.caret,.dropup>.btn>.caret{border-top-color:#000!important}.label{border:1px solid #000}.table{border-collapse:collapse!important}.table-bordered th,.table-bordered td{border:1px solid #ddd!important}}*{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}:before,:after{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}html{font-size:10px;-webkit-tap-highlight-color:rgba(0,0,0,0)}body{font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;font-size:14px;line-height:1.42857143;color:#333;background-color:#fff}input,button,select,textarea{font-family:inherit;font-size:inherit;line-height:inherit}a{color:#428bca;text-decoration:none}a:hover,a:focus{color:#2a6496;text-decoration:underline}a:focus{outline:thin dotted;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}figure{margin:0}img{vertical-align:middle}.img-responsive,.thumbnail>img,.thumbnail a>img,.carousel-inner>.item>img,.carousel-inner>.item>a>img{display:block;width:100% \9;max-width:100%;height:auto}.img-rounded{border-radius:6px}.img-thumbnail{display:inline-block;width:100% \9;max-width:100%;height:auto;padding:4px;line-height:1.42857143;background-color:#fff;border:1px solid #ddd;border-radius:4px;-webkit-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;transition:all .2s ease-in-out}.img-circle{border-radius:50%}hr{margin-top:20px;margin-bottom:20px;border:0;border-top:1px solid #eee}.sr-only{position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);border:0}.sr-only-focusable:active,.sr-only-focusable:focus{position:static;width:auto;height:auto;margin:0;overflow:visible;clip:auto}h1,h2,h3,h4,h5,h6,.h1,.h2,.h3,.h4,.h5,.h6{font-family:inherit;font-weight:500;line-height:1.1;color:inherit}h1 small,h2 small,h3 small,h4 small,h5 small,h6 small,.h1 small,.h2 small,.h3 small,.h4 small,.h5 small,.h6 small,h1 .small,h2 .small,h3 .small,h4 .small,h5 .small,h6 .small,.h1 .small,.h2 .small,.h3 .small,.h4 .small,.h5 .small,.h6 .small{font-weight:400;line-height:1;color:#777}h1,.h1,h2,.h2,h3,.h3{margin-top:20px;margin-bottom:10px}h1 small,.h1 small,h2 small,.h2 small,h3 small,.h3 small,h1 .small,.h1 .small,h2 .small,.h2 .small,h3 .small,.h3 .small{font-size:65%}h4,.h4,h5,.h5,h6,.h6{margin-top:10px;margin-bottom:10px}h4 small,.h4 small,h5 small,.h5 small,h6 small,.h6 small,h4 .small,.h4 .small,h5 .small,.h5 .small,h6 .small,.h6 .small{font-size:75%}h1,.h1{font-size:36px}h2,.h2{font-size:30px}h3,.h3{font-size:24px}h4,.h4{font-size:18px}h5,.h5{font-size:14px}h6,.h6{font-size:12px}p{margin:0 0 10px}.lead{margin-bottom:20px;font-size:16px;font-weight:300;line-height:1.4}@media (min-width:768px){.lead{font-size:21px}}small,.small{font-size:85%}cite{font-style:normal}mark,.mark{padding:.2em;background-color:#fcf8e3}.text-left{text-align:left}.text-right{text-align:right}.text-center{text-align:center}.text-justify{text-align:justify}.text-nowrap{white-space:nowrap}.text-lowercase{text-transform:lowercase}.text-uppercase{text-transform:uppercase}.text-capitalize{text-transform:capitalize}.text-muted{color:#777}.text-primary{color:#428bca}a.text-primary:hover{color:#3071a9}.text-success{color:#3c763d}a.text-success:hover{color:#2b542c}.text-info{color:#31708f}a.text-info:hover{color:#245269}.text-warning{color:#8a6d3b}a.text-warning:hover{color:#66512c}.text-danger{color:#a94442}a.text-danger:hover{color:#843534}.bg-primary{color:#fff;background-color:#428bca}a.bg-primary:hover{background-color:#3071a9}.bg-success{background-color:#dff0d8}a.bg-success:hover{background-color:#c1e2b3}.bg-info{background-color:#d9edf7}a.bg-info:hover{background-color:#afd9ee}.bg-warning{background-color:#fcf8e3}a.bg-warning:hover{background-color:#f7ecb5}.bg-danger{background-color:#f2dede}a.bg-danger:hover{background-color:#e4b9b9}.page-header{padding-bottom:9px;margin:40px 0 20px;border-bottom:1px solid #eee}ul,ol{margin-top:0;margin-bottom:10px}ul ul,ol ul,ul ol,ol ol{margin-bottom:0}.list-unstyled{padding-left:0;list-style:none}.list-inline{padding-left:0;margin-left:-5px;list-style:none}.list-inline>li{display:inline-block;padding-right:5px;padding-left:5px}.container{padding-right:15px;padding-left:15px;margin-right:auto;margin-left:auto}@media (min-width:768px){.container{width:750px}}@media (min-width:992px){.container{width:970px}}@media (min-width:1200px){.container{width:1170px}}.container-fluid{padding-right:15px;padding-left:15px;margin-right:auto;margin-left:auto}.row{margin-right:-15px;margin-left:-15px}.col-xs-1,.col-sm-1,.col-md-1,.col-lg-1,.col-xs-2,.col-sm-2,.col-md-2,.col-lg-2,.col-xs-3,.col-sm-3,.col-md-3,.col-lg-3,.col-xs-4,.col-sm-4,.col-md-4,.col-lg-4,.col-xs-5,.col-sm-5,.col-md-5,.col-lg-5,.col-xs-6,.col-sm-6,.col-md-6,.col-lg-6,.col-xs-7,.col-sm-7,.col-md-7,.col-lg-7,.col-xs-8,.col-sm-8,.col-md-8,.col-lg-8,.col-xs-9,.col-sm-9,.col-md-9,.col-lg-9,.col-xs-10,.col-sm-10,.col-md-10,.col-lg-10,.col-xs-11,.col-sm-11,.col-md-11,.col-lg-11,.col-xs-12,.col-sm-12,.col-md-12,.col-lg-12{position:relative;min-height:1px;padding-right:15px;padding-left:15px}.col-xs-1,.col-xs-2,.col-xs-3,.col-xs-4,.col-xs-5,.col-xs-6,.col-xs-7,.col-xs-8,.col-xs-9,.col-xs-10,.col-xs-11,.col-xs-12{float:left}.col-xs-12{width:100%}.col-xs-11{width:91.66666667%}.col-xs-10{width:83.33333333%}.col-xs-9{width:75%}.col-xs-8{width:66.66666667%}.col-xs-7{width:58.33333333%}.col-xs-6{width:50%}.col-xs-5{width:41.66666667%}.col-xs-4{width:33.33333333%}.col-xs-3{width:25%}.col-xs-2{width:16.66666667%}.col-xs-1{width:8.33333333%}.col-xs-pull-12{right:100%}.col-xs-pull-11{right:91.66666667%}.col-xs-pull-10{right:83.33333333%}.col-xs-pull-9{right:75%}.col-xs-pull-8{right:66.66666667%}.col-xs-pull-7{right:58.33333333%}.col-xs-pull-6{right:50%}.col-xs-pull-5{right:41.66666667%}.col-xs-pull-4{right:33.33333333%}.col-xs-pull-3{right:25%}.col-xs-pull-2{right:16.66666667%}.col-xs-pull-1{right:8.33333333%}.col-xs-pull-0{right:auto}.col-xs-push-12{left:100%}.col-xs-push-11{left:91.66666667%}.col-xs-push-10{left:83.33333333%}.col-xs-push-9{left:75%}.col-xs-push-8{left:66.66666667%}.col-xs-push-7{left:58.33333333%}.col-xs-push-6{left:50%}.col-xs-push-5{left:41.66666667%}.col-xs-push-4{left:33.33333333%}.col-xs-push-3{left:25%}.col-xs-push-2{left:16.66666667%}.col-xs-push-1{left:8.33333333%}.col-xs-push-0{left:auto}.col-xs-offset-12{margin-left:100%}.col-xs-offset-11{margin-left:91.66666667%}.col-xs-offset-10{margin-left:83.33333333%}.col-xs-offset-9{margin-left:75%}.col-xs-offset-8{margin-left:66.66666667%}.col-xs-offset-7{margin-left:58.33333333%}.col-xs-offset-6{margin-left:50%}.col-xs-offset-5{margin-left:41.66666667%}.col-xs-offset-4{margin-left:33.33333333%}.col-xs-offset-3{margin-left:25%}.col-xs-offset-2{margin-left:16.66666667%}.col-xs-offset-1{margin-left:8.33333333%}.col-xs-offset-0{margin-left:0}@media (min-width:768px){.col-sm-1,.col-sm-2,.col-sm-3,.col-sm-4,.col-sm-5,.col-sm-6,.col-sm-7,.col-sm-8,.col-sm-9,.col-sm-10,.col-sm-11,.col-sm-12{float:left}.col-sm-12{width:100%}.col-sm-11{width:91.66666667%}.col-sm-10{width:83.33333333%}.col-sm-9{width:75%}.col-sm-8{width:66.66666667%}.col-sm-7{width:58.33333333%}.col-sm-6{width:50%}.col-sm-5{width:41.66666667%}.col-sm-4{width:33.33333333%}.col-sm-3{width:25%}.col-sm-2{width:16.66666667%}.col-sm-1{width:8.33333333%}.col-sm-pull-12{right:100%}.col-sm-pull-11{right:91.66666667%}.col-sm-pull-10{right:83.33333333%}.col-sm-pull-9{right:75%}.col-sm-pull-8{right:66.66666667%}.col-sm-pull-7{right:58.33333333%}.col-sm-pull-6{right:50%}.col-sm-pull-5{right:41.66666667%}.col-sm-pull-4{right:33.33333333%}.col-sm-pull-3{right:25%}.col-sm-pull-2{right:16.66666667%}.col-sm-pull-1{right:8.33333333%}.col-sm-pull-0{right:auto}.col-sm-push-12{left:100%}.col-sm-push-11{left:91.66666667%}.col-sm-push-10{left:83.33333333%}.col-sm-push-9{left:75%}.col-sm-push-8{left:66.66666667%}.col-sm-push-7{left:58.33333333%}.col-sm-push-6{left:50%}.col-sm-push-5{left:41.66666667%}.col-sm-push-4{left:33.33333333%}.col-sm-push-3{left:25%}.col-sm-push-2{left:16.66666667%}.col-sm-push-1{left:8.33333333%}.col-sm-push-0{left:auto}.col-sm-offset-12{margin-left:100%}.col-sm-offset-11{margin-left:91.66666667%}.col-sm-offset-10{margin-left:83.33333333%}.col-sm-offset-9{margin-left:75%}.col-sm-offset-8{margin-left:66.66666667%}.col-sm-offset-7{margin-left:58.33333333%}.col-sm-offset-6{margin-left:50%}.col-sm-offset-5{margin-left:41.66666667%}.col-sm-offset-4{margin-left:33.33333333%}.col-sm-offset-3{margin-left:25%}.col-sm-offset-2{margin-left:16.66666667%}.col-sm-offset-1{margin-left:8.33333333%}.col-sm-offset-0{margin-left:0}}@media (min-width:992px){.col-md-1,.col-md-2,.col-md-3,.col-md-4,.col-md-5,.col-md-6,.col-md-7,.col-md-8,.col-md-9,.col-md-10,.col-md-11,.col-md-12{float:left}.col-md-12{width:100%}.col-md-11{width:91.66666667%}.col-md-10{width:83.33333333%}.col-md-9{width:75%}.col-md-8{width:66.66666667%}.col-md-7{width:58.33333333%}.col-md-6{width:50%}.col-md-5{width:41.66666667%}.col-md-4{width:33.33333333%}.col-md-3{width:25%}.col-md-2{width:16.66666667%}.col-md-1{width:8.33333333%}.col-md-pull-12{right:100%}.col-md-pull-11{right:91.66666667%}.col-md-pull-10{right:83.33333333%}.col-md-pull-9{right:75%}.col-md-pull-8{right:66.66666667%}.col-md-pull-7{right:58.33333333%}.col-md-pull-6{right:50%}.col-md-pull-5{right:41.66666667%}.col-md-pull-4{right:33.33333333%}.col-md-pull-3{right:25%}.col-md-pull-2{right:16.66666667%}.col-md-pull-1{right:8.33333333%}.col-md-pull-0{right:auto}.col-md-push-12{left:100%}.col-md-push-11{left:91.66666667%}.col-md-push-10{left:83.33333333%}.col-md-push-9{left:75%}.col-md-push-8{left:66.66666667%}.col-md-push-7{left:58.33333333%}.col-md-push-6{left:50%}.col-md-push-5{left:41.66666667%}.col-md-push-4{left:33.33333333%}.col-md-push-3{left:25%}.col-md-push-2{left:16.66666667%}.col-md-push-1{left:8.33333333%}.col-md-push-0{left:auto}.col-md-offset-12{margin-left:100%}.col-md-offset-11{margin-left:91.66666667%}.col-md-offset-10{margin-left:83.33333333%}.col-md-offset-9{margin-left:75%}.col-md-offset-8{margin-left:66.66666667%}.col-md-offset-7{margin-left:58.33333333%}.col-md-offset-6{margin-left:50%}.col-md-offset-5{margin-left:41.66666667%}.col-md-offset-4{margin-left:33.33333333%}.col-md-offset-3{margin-left:25%}.col-md-offset-2{margin-left:16.66666667%}.col-md-offset-1{margin-left:8.33333333%}.col-md-offset-0{margin-left:0}}@media (min-width:1200px){.col-lg-1,.col-lg-2,.col-lg-3,.col-lg-4,.col-lg-5,.col-lg-6,.col-lg-7,.col-lg-8,.col-lg-9,.col-lg-10,.col-lg-11,.col-lg-12{float:left}.col-lg-12{width:100%}.col-lg-11{width:91.66666667%}.col-lg-10{width:83.33333333%}.col-lg-9{width:75%}.col-lg-8{width:66.66666667%}.col-lg-7{width:58.33333333%}.col-lg-6{width:50%}.col-lg-5{width:41.66666667%}.col-lg-4{width:33.33333333%}.col-lg-3{width:25%}.col-lg-2{width:16.66666667%}.col-lg-1{width:8.33333333%}.col-lg-pull-12{right:100%}.col-lg-pull-11{right:91.66666667%}.col-lg-pull-10{right:83.33333333%}.col-lg-pull-9{right:75%}.col-lg-pull-8{right:66.66666667%}.col-lg-pull-7{right:58.33333333%}.col-lg-pull-6{right:50%}.col-lg-pull-5{right:41.66666667%}.col-lg-pull-4{right:33.33333333%}.col-lg-pull-3{right:25%}.col-lg-pull-2{right:16.66666667%}.col-lg-pull-1{right:8.33333333%}.col-lg-pull-0{right:auto}.col-lg-push-12{left:100%}.col-lg-push-11{left:91.66666667%}.col-lg-push-10{left:83.33333333%}.col-lg-push-9{left:75%}.col-lg-push-8{left:66.66666667%}.col-lg-push-7{left:58.33333333%}.col-lg-push-6{left:50%}.col-lg-push-5{left:41.66666667%}.col-lg-push-4{left:33.33333333%}.col-lg-push-3{left:25%}.col-lg-push-2{left:16.66666667%}.col-lg-push-1{left:8.33333333%}.col-lg-push-0{left:auto}.col-lg-offset-12{margin-left:100%}.col-lg-offset-11{margin-left:91.66666667%}.col-lg-offset-10{margin-left:83.33333333%}.col-lg-offset-9{margin-left:75%}.col-lg-offset-8{margin-left:66.66666667%}.col-lg-offset-7{margin-left:58.33333333%}.col-lg-offset-6{margin-left:50%}.col-lg-offset-5{margin-left:41.66666667%}.col-lg-offset-4{margin-left:33.33333333%}.col-lg-offset-3{margin-left:25%}.col-lg-offset-2{margin-left:16.66666667%}.col-lg-offset-1{margin-left:8.33333333%}.col-lg-offset-0{margin-left:0}}label{display:inline-block;max-width:100%;margin-bottom:5px;font-weight:700}input[type=search]{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}input[type=radio],input[type=checkbox]{margin:4px 0 0;margin-top:1px \9;line-height:normal}input[type=file]{display:block}input[type=range]{display:block;width:100%}select[multiple],select[size]{height:auto}input[type=file]:focus,input[type=radio]:focus,input[type=checkbox]:focus{outline:thin dotted;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}output{display:block;padding-top:7px;font-size:14px;line-height:1.42857143;color:#555}.form-control{display:block;width:100%;height:34px;padding:6px 12px;font-size:14px;line-height:1.42857143;color:#555;background-color:#fff;background-image:none;border:1px solid #ccc;border-radius:4px;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075);-webkit-transition:border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;-o-transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s;transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s}.form-control:focus{border-color:#66afe9;outline:0;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)}.form-control::-moz-placeholder{color:#777;opacity:1}.form-control:-ms-input-placeholder{color:#777}.form-control::-webkit-input-placeholder{color:#777}.form-control[disabled],.form-control[readonly],fieldset[disabled] .form-control{cursor:not-allowed;background-color:#eee;opacity:1}textarea.form-control{height:auto}input[type=search]{-webkit-appearance:none}input[type=date],input[type=time],input[type=datetime-local],input[type=month]{line-height:34px;line-height:1.42857143 \0}input[type=date].input-sm,input[type=time].input-sm,input[type=datetime-local].input-sm,input[type=month].input-sm{line-height:30px}input[type=date].input-lg,input[type=time].input-lg,input[type=datetime-local].input-lg,input[type=month].input-lg{line-height:46px}.form-group{margin-bottom:15px}.radio,.checkbox{position:relative;display:block;min-height:20px;margin-top:10px;margin-bottom:10px}.radio label,.checkbox label{padding-left:20px;margin-bottom:0;font-weight:400;cursor:pointer}.radio input[type=radio],.radio-inline input[type=radio],.checkbox input[type=checkbox],.checkbox-inline input[type=checkbox]{position:absolute;margin-top:4px \9;margin-left:-20px}.radio+.radio,.checkbox+.checkbox{margin-top:-5px}.radio-inline,.checkbox-inline{display:inline-block;padding-left:20px;margin-bottom:0;font-weight:400;vertical-align:middle;cursor:pointer}.radio-inline+.radio-inline,.checkbox-inline+.checkbox-inline{margin-top:0;margin-left:10px}input[type=radio][disabled],input[type=checkbox][disabled],input[type=radio].disabled,input[type=checkbox].disabled,fieldset[disabled] input[type=radio],fieldset[disabled] input[type=checkbox]{cursor:not-allowed}.radio-inline.disabled,.checkbox-inline.disabled,fieldset[disabled] .radio-inline,fieldset[disabled] .checkbox-inline{cursor:not-allowed}.radio.disabled label,.checkbox.disabled label,fieldset[disabled] .radio label,fieldset[disabled] .checkbox label{cursor:not-allowed}.form-control-static{padding-top:7px;padding-bottom:7px;margin-bottom:0}.form-control-static.input-lg,.form-control-static.input-sm{padding-right:0;padding-left:0}.input-sm,.form-horizontal .form-group-sm .form-control{height:30px;padding:5px 10px;font-size:12px;line-height:1.5;border-radius:3px}select.input-sm{height:30px;line-height:30px}textarea.input-sm,select[multiple].input-sm{height:auto}.input-lg,.form-horizontal .form-group-lg .form-control{height:46px;padding:10px 16px;font-size:18px;line-height:1.33;border-radius:6px}select.input-lg{height:46px;line-height:46px}textarea.input-lg,select[multiple].input-lg{height:auto}.has-feedback{position:relative}.has-feedback .form-control{padding-right:42.5px}.form-control-feedback{position:absolute;top:25px;right:0;z-index:2;display:block;width:34px;height:34px;line-height:34px;text-align:center}.input-lg+.form-control-feedback{width:46px;height:46px;line-height:46px}.input-sm+.form-control-feedback{width:30px;height:30px;line-height:30px}.has-success .help-block,.has-success .control-label,.has-success .radio,.has-success .checkbox,.has-success .radio-inline,.has-success .checkbox-inline{color:#3c763d}.has-success .form-control{border-color:#3c763d;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075)}.has-success .form-control:focus{border-color:#2b542c;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #67b168;box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #67b168}.has-success .input-group-addon{color:#3c763d;background-color:#dff0d8;border-color:#3c763d}.has-success .form-control-feedback{color:#3c763d}.has-warning .help-block,.has-warning .control-label,.has-warning .radio,.has-warning .checkbox,.has-warning .radio-inline,.has-warning .checkbox-inline{color:#8a6d3b}.has-warning .form-control{border-color:#8a6d3b;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075)}.has-warning .form-control:focus{border-color:#66512c;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #c0a16b;box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #c0a16b}.has-warning .input-group-addon{color:#8a6d3b;background-color:#fcf8e3;border-color:#8a6d3b}.has-warning .form-control-feedback{color:#8a6d3b}.has-error .help-block,.has-error .control-label,.has-error .radio,.has-error .checkbox,.has-error .radio-inline,.has-error .checkbox-inline{color:#a94442}.has-error .form-control{border-color:#a94442;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075)}.has-error .form-control:focus{border-color:#843534;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #ce8483;box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #ce8483}.has-error .input-group-addon{color:#a94442;background-color:#f2dede;border-color:#a94442}.has-error .form-control-feedback{color:#a94442}.has-feedback label.sr-only~.form-control-feedback{top:0}.help-block{display:block;margin-top:5px;margin-bottom:10px;color:#737373}@media (min-width:768px){.form-inline .form-group{display:inline-block;margin-bottom:0;vertical-align:middle}.form-inline .form-control{display:inline-block;width:auto;vertical-align:middle}.form-inline .input-group{display:inline-table;vertical-align:middle}.form-inline .input-group .input-group-addon,.form-inline .input-group .input-group-btn,.form-inline .input-group .form-control{width:auto}.form-inline .input-group>.form-control{width:100%}.form-inline .control-label{margin-bottom:0;vertical-align:middle}.form-inline .radio,.form-inline .checkbox{display:inline-block;margin-top:0;margin-bottom:0;vertical-align:middle}.form-inline .radio label,.form-inline .checkbox label{padding-left:0}.form-inline .radio input[type=radio],.form-inline .checkbox input[type=checkbox]{position:relative;margin-left:0}.form-inline .has-feedback .form-control-feedback{top:0}}.form-horizontal .radio,.form-horizontal .checkbox,.form-horizontal .radio-inline,.form-horizontal .checkbox-inline{padding-top:7px;margin-top:0;margin-bottom:0}.form-horizontal .radio,.form-horizontal .checkbox{min-height:27px}.form-horizontal .form-group{margin-right:-15px;margin-left:-15px}@media (min-width:768px){.form-horizontal .control-label{padding-top:7px;margin-bottom:0;text-align:right}}.form-horizontal .has-feedback .form-control-feedback{top:0;right:15px}@media (min-width:768px){.form-horizontal .form-group-lg .control-label{padding-top:14.3px}}@media (min-width:768px){.form-horizontal .form-group-sm .control-label{padding-top:6px}}.btn{display:inline-block;padding:6px 12px;margin-bottom:0;font-size:14px;font-weight:400;line-height:1.42857143;text-align:center;white-space:nowrap;vertical-align:middle;cursor:pointer;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;background-image:none;border:1px solid transparent;border-radius:4px}.btn:focus,.btn:active:focus,.btn.active:focus{outline:thin dotted;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}.btn:hover,.btn:focus{color:#333;text-decoration:none}.btn:active,.btn.active{background-image:none;outline:0;-webkit-box-shadow:inset 0 3px 5px rgba(0,0,0,.125);box-shadow:inset 0 3px 5px rgba(0,0,0,.125)}.btn.disabled,.btn[disabled],fieldset[disabled] .btn{pointer-events:none;cursor:not-allowed;filter:alpha(opacity=65);-webkit-box-shadow:none;box-shadow:none;opacity:.65}.btn-default{color:#333;background-color:#fff;border-color:#ccc}.btn-default:hover,.btn-default:focus,.btn-default:active,.btn-default.active,.open>.dropdown-toggle.btn-default{color:#333;background-color:#e6e6e6;border-color:#adadad}.btn-default:active,.btn-default.active,.open>.dropdown-toggle.btn-default{background-image:none}.btn-default.disabled,.btn-default[disabled],fieldset[disabled] .btn-default,.btn-default.disabled:hover,.btn-default[disabled]:hover,fieldset[disabled] .btn-default:hover,.btn-default.disabled:focus,.btn-default[disabled]:focus,fieldset[disabled] .btn-default:focus,.btn-default.disabled:active,.btn-default[disabled]:active,fieldset[disabled] .btn-default:active,.btn-default.disabled.active,.btn-default[disabled].active,fieldset[disabled] .btn-default.active{background-color:#fff;border-color:#ccc}.btn-default .badge{color:#fff;background-color:#333}.btn-primary{color:#fff;background-color:#428bca;border-color:#357ebd}.btn-primary:hover,.btn-primary:focus,.btn-primary:active,.btn-primary.active,.open>.dropdown-toggle.btn-primary{color:#fff;background-color:#3071a9;border-color:#285e8e}.btn-primary:active,.btn-primary.active,.open>.dropdown-toggle.btn-primary{background-image:none}.btn-primary.disabled,.btn-primary[disabled],fieldset[disabled] .btn-primary,.btn-primary.disabled:hover,.btn-primary[disabled]:hover,fieldset[disabled] .btn-primary:hover,.btn-primary.disabled:focus,.btn-primary[disabled]:focus,fieldset[disabled] .btn-primary:focus,.btn-primary.disabled:active,.btn-primary[disabled]:active,fieldset[disabled] .btn-primary:active,.btn-primary.disabled.active,.btn-primary[disabled].active,fieldset[disabled] .btn-primary.active{background-color:#428bca;border-color:#357ebd}.btn-primary .badge{color:#428bca;background-color:#fff}.btn-success{color:#fff;background-color:#5cb85c;border-color:#4cae4c}.btn-success:hover,.btn-success:focus,.btn-success:active,.btn-success.active,.open>.dropdown-toggle.btn-success{color:#fff;background-color:#449d44;border-color:#398439}.btn-success:active,.btn-success.active,.open>.dropdown-toggle.btn-success{background-image:none}.btn-success.disabled,.btn-success[disabled],fieldset[disabled] .btn-success,.btn-success.disabled:hover,.btn-success[disabled]:hover,fieldset[disabled] .btn-success:hover,.btn-success.disabled:focus,.btn-success[disabled]:focus,fieldset[disabled] .btn-success:focus,.btn-success.disabled:active,.btn-success[disabled]:active,fieldset[disabled] .btn-success:active,.btn-success.disabled.active,.btn-success[disabled].active,fieldset[disabled] .btn-success.active{background-color:#5cb85c;border-color:#4cae4c}.btn-success .badge{color:#5cb85c;background-color:#fff}.btn-info{color:#fff;background-color:#5bc0de;border-color:#46b8da}.btn-info:hover,.btn-info:focus,.btn-info:active,.btn-info.active,.open>.dropdown-toggle.btn-info{color:#fff;background-color:#31b0d5;border-color:#269abc}.btn-info:active,.btn-info.active,.open>.dropdown-toggle.btn-info{background-image:none}.btn-info.disabled,.btn-info[disabled],fieldset[disabled] .btn-info,.btn-info.disabled:hover,.btn-info[disabled]:hover,fieldset[disabled] .btn-info:hover,.btn-info.disabled:focus,.btn-info[disabled]:focus,fieldset[disabled] .btn-info:focus,.btn-info.disabled:active,.btn-info[disabled]:active,fieldset[disabled] .btn-info:active,.btn-info.disabled.active,.btn-info[disabled].active,fieldset[disabled] .btn-info.active{background-color:#5bc0de;border-color:#46b8da}.btn-info .badge{color:#5bc0de;background-color:#fff}.btn-warning{color:#fff;background-color:#f0ad4e;border-color:#eea236}.btn-warning:hover,.btn-warning:focus,.btn-warning:active,.btn-warning.active,.open>.dropdown-toggle.btn-warning{color:#fff;background-color:#ec971f;border-color:#d58512}.btn-warning:active,.btn-warning.active,.open>.dropdown-toggle.btn-warning{background-image:none}.btn-warning.disabled,.btn-warning[disabled],fieldset[disabled] .btn-warning,.btn-warning.disabled:hover,.btn-warning[disabled]:hover,fieldset[disabled] .btn-warning:hover,.btn-warning.disabled:focus,.btn-warning[disabled]:focus,fieldset[disabled] .btn-warning:focus,.btn-warning.disabled:active,.btn-warning[disabled]:active,fieldset[disabled] .btn-warning:active,.btn-warning.disabled.active,.btn-warning[disabled].active,fieldset[disabled] .btn-warning.active{background-color:#f0ad4e;border-color:#eea236}.btn-warning .badge{color:#f0ad4e;background-color:#fff}.btn-danger{color:#fff;background-color:#d9534f;border-color:#d43f3a}.btn-danger:hover,.btn-danger:focus,.btn-danger:active,.btn-danger.active,.open>.dropdown-toggle.btn-danger{color:#fff;background-color:#c9302c;border-color:#ac2925}.btn-danger:active,.btn-danger.active,.open>.dropdown-toggle.btn-danger{background-image:none}.btn-danger.disabled,.btn-danger[disabled],fieldset[disabled] .btn-danger,.btn-danger.disabled:hover,.btn-danger[disabled]:hover,fieldset[disabled] .btn-danger:hover,.btn-danger.disabled:focus,.btn-danger[disabled]:focus,fieldset[disabled] .btn-danger:focus,.btn-danger.disabled:active,.btn-danger[disabled]:active,fieldset[disabled] .btn-danger:active,.btn-danger.disabled.active,.btn-danger[disabled].active,fieldset[disabled] .btn-danger.active{background-color:#d9534f;border-color:#d43f3a}.btn-danger .badge{color:#d9534f;background-color:#fff}.btn-link{font-weight:400;color:#428bca;cursor:pointer;border-radius:0}.btn-link,.btn-link:active,.btn-link[disabled],fieldset[disabled] .btn-link{background-color:transparent;-webkit-box-shadow:none;box-shadow:none}.btn-link,.btn-link:hover,.btn-link:focus,.btn-link:active{border-color:transparent}.btn-link:hover,.btn-link:focus{color:#2a6496;text-decoration:underline;background-color:transparent}.btn-link[disabled]:hover,fieldset[disabled] .btn-link:hover,.btn-link[disabled]:focus,fieldset[disabled] .btn-link:focus{color:#777;text-decoration:none}.btn-lg,.btn-group-lg>.btn{padding:10px 16px;font-size:18px;line-height:1.33;border-radius:6px}.btn-sm,.btn-group-sm>.btn{padding:5px 10px;font-size:12px;line-height:1.5;border-radius:3px}.btn-xs,.btn-group-xs>.btn{padding:1px 5px;font-size:12px;line-height:1.5;border-radius:3px}.btn-block{display:block;width:100%}.btn-block+.btn-block{margin-top:5px}input[type=submit].btn-block,input[type=reset].btn-block,input[type=button].btn-block{width:100%}.fade{opacity:0;-webkit-transition:opacity .15s linear;-o-transition:opacity .15s linear;transition:opacity .15s linear}.fade.in{opacity:1}.collapse{display:none}.collapse.in{display:block}tr.collapse.in{display:table-row}tbody.collapse.in{display:table-row-group}.collapsing{position:relative;height:0;overflow:hidden;-webkit-transition:height .35s ease;-o-transition:height .35s ease;transition:height .35s ease}.caret{display:inline-block;width:0;height:0;margin-left:2px;vertical-align:middle;border-top:4px solid;border-right:4px solid transparent;border-left:4px solid transparent}.dropdown{position:relative}.dropdown-toggle:focus{outline:0}.dropdown-menu{position:absolute;top:100%;left:0;z-index:1000;display:none;float:left;min-width:160px;padding:5px 0;margin:2px 0 0;font-size:14px;text-align:left;list-style:none;background-color:#fff;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #ccc;border:1px solid rgba(0,0,0,.15);border-radius:4px;-webkit-box-shadow:0 6px 12px rgba(0,0,0,.175);box-shadow:0 6px 12px rgba(0,0,0,.175)}.dropdown-menu.pull-right{right:0;left:auto}.dropdown-menu .divider{height:1px;margin:9px 0;overflow:hidden;background-color:#e5e5e5}.dropdown-menu>li>a{display:block;padding:3px 20px;clear:both;font-weight:400;line-height:1.42857143;color:#333;white-space:nowrap}.dropdown-menu>li>a:hover,.dropdown-menu>li>a:focus{color:#262626;text-decoration:none;background-color:#f5f5f5}.dropdown-menu>.active>a,.dropdown-menu>.active>a:hover,.dropdown-menu>.active>a:focus{color:#fff;text-decoration:none;background-color:#428bca;outline:0}.dropdown-menu>.disabled>a,.dropdown-menu>.disabled>a:hover,.dropdown-menu>.disabled>a:focus{color:#777}.dropdown-menu>.disabled>a:hover,.dropdown-menu>.disabled>a:focus{text-decoration:none;cursor:not-allowed;background-color:transparent;background-image:none;filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.open>.dropdown-menu{display:block}.open>a{outline:0}.dropdown-menu-right{right:0;left:auto}.dropdown-menu-left{right:auto;left:0}.dropdown-header{display:block;padding:3px 20px;font-size:12px;line-height:1.42857143;color:#777;white-space:nowrap}.dropdown-backdrop{position:fixed;top:0;right:0;bottom:0;left:0;z-index:990}.pull-right>.dropdown-menu{right:0;left:auto}.dropup .caret,.navbar-fixed-bottom .dropdown .caret{content:"";border-top:0;border-bottom:4px solid}.dropup .dropdown-menu,.navbar-fixed-bottom .dropdown .dropdown-menu{top:auto;bottom:100%;margin-bottom:1px}@media (min-width:768px){.navbar-right .dropdown-menu{right:0;left:auto}.navbar-right .dropdown-menu-left{right:auto;left:0}}.breadcrumb{padding:8px 15px;margin-bottom:20px;list-style:none;background-color:#f5f5f5;border-radius:4px}.breadcrumb>li{display:inline-block}.breadcrumb>li+li:before{padding:0 5px;color:#ccc;content:"/\00a0"}.breadcrumb>.active{color:#777}.label{display:inline;padding:.2em .6em .3em;font-size:75%;font-weight:700;line-height:1;color:#fff;text-align:center;white-space:nowrap;vertical-align:baseline;border-radius:.25em}a.label:hover,a.label:focus{color:#fff;text-decoration:none;cursor:pointer}.label:empty{display:none}.btn .label{position:relative;top:-1px}.label-default{background-color:#777}.label-default[href]:hover,.label-default[href]:focus{background-color:#5e5e5e}.label-primary{background-color:#428bca}.label-primary[href]:hover,.label-primary[href]:focus{background-color:#3071a9}.label-success{background-color:#5cb85c}.label-success[href]:hover,.label-success[href]:focus{background-color:#449d44}.label-info{background-color:#5bc0de}.label-info[href]:hover,.label-info[href]:focus{background-color:#31b0d5}.label-warning{background-color:#f0ad4e}.label-warning[href]:hover,.label-warning[href]:focus{background-color:#ec971f}.label-danger{background-color:#d9534f}.label-danger[href]:hover,.label-danger[href]:focus{background-color:#c9302c}.badge{display:inline-block;min-width:10px;padding:3px 7px;font-size:12px;font-weight:700;line-height:1;color:#fff;text-align:center;white-space:nowrap;vertical-align:baseline;background-color:#777;border-radius:10px}.badge:empty{display:none}.btn .badge{position:relative;top:-1px}.btn-xs .badge{top:0;padding:1px 5px}a.badge:hover,a.badge:focus{color:#fff;text-decoration:none;cursor:pointer}a.list-group-item.active>.badge,.nav-pills>.active>a>.badge{color:#428bca;background-color:#fff}.nav-pills>li>a>.badge{margin-left:3px}.jumbotron{padding:30px;margin-bottom:30px;color:inherit;background-color:#eee}.jumbotron h1,.jumbotron .h1{color:inherit}.jumbotron p{margin-bottom:15px;font-size:21px;font-weight:200}.jumbotron>hr{border-top-color:#d5d5d5}.container .jumbotron{border-radius:6px}.jumbotron .container{max-width:100%}@media screen and (min-width:768px){.jumbotron{padding-top:48px;padding-bottom:48px}.container .jumbotron{padding-right:60px;padding-left:60px}.jumbotron h1,.jumbotron .h1{font-size:63px}}.thumbnail{display:block;padding:4px;margin-bottom:20px;line-height:1.42857143;background-color:#fff;border:1px solid #ddd;border-radius:4px;-webkit-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;transition:all .2s ease-in-out}.thumbnail>img,.thumbnail a>img{margin-right:auto;margin-left:auto}a.thumbnail:hover,a.thumbnail:focus,a.thumbnail.active{border-color:#428bca}.thumbnail .caption{padding:9px;color:#333}.alert{padding:15px;margin-bottom:20px;border:1px solid transparent;border-radius:4px}.alert h4{margin-top:0;color:inherit}.alert .alert-link{font-weight:700}.alert>p,.alert>ul{margin-bottom:0}.alert>p+p{margin-top:5px}.alert-dismissable,.alert-dismissible{padding-right:35px}.alert-dismissable .close,.alert-dismissible .close{position:relative;top:-2px;right:-21px;color:inherit}.alert-success{color:#3c763d;background-color:#dff0d8;border-color:#d6e9c6}.alert-success hr{border-top-color:#c9e2b3}.alert-success .alert-link{color:#2b542c}.alert-info{color:#31708f;background-color:#d9edf7;border-color:#bce8f1}.alert-info hr{border-top-color:#a6e1ec}.alert-info .alert-link{color:#245269}.alert-warning{color:#8a6d3b;background-color:#fcf8e3;border-color:#faebcc}.alert-warning hr{border-top-color:#f7e1b5}.alert-warning .alert-link{color:#66512c}.alert-danger{color:#a94442;background-color:#f2dede;border-color:#ebccd1}.alert-danger hr{border-top-color:#e4b9c0}.alert-danger .alert-link{color:#843534}.close{float:right;font-size:21px;font-weight:700;line-height:1;color:#000;text-shadow:0 1px 0 #fff;filter:alpha(opacity=20);opacity:.2}.close:hover,.close:focus{color:#000;text-decoration:none;cursor:pointer;filter:alpha(opacity=50);opacity:.5}button.close{-webkit-appearance:none;padding:0;cursor:pointer;background:0 0;border:0}.modal-open{overflow:hidden}.modal{position:fixed;top:0;right:0;bottom:0;left:0;z-index:1050;display:none;overflow:hidden;-webkit-overflow-scrolling:touch;outline:0}.modal.fade .modal-dialog{-webkit-transition:-webkit-transform .3s ease-out;-o-transition:-o-transform .3s ease-out;transition:transform .3s ease-out;-webkit-transform:translate3d(0,-25%,0);-o-transform:translate3d(0,-25%,0);transform:translate3d(0,-25%,0)}.modal.in .modal-dialog{-webkit-transform:translate3d(0,0,0);-o-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}.modal-open .modal{overflow-x:hidden;overflow-y:auto}.modal-dialog{position:relative;width:auto;margin:10px}.modal-content{position:relative;background-color:#fff;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #999;border:1px solid rgba(0,0,0,.2);border-radius:6px;outline:0;-webkit-box-shadow:0 3px 9px rgba(0,0,0,.5);box-shadow:0 3px 9px rgba(0,0,0,.5)}.modal-backdrop{position:fixed;top:0;right:0;bottom:0;left:0;z-index:1040;background-color:#000}.modal-backdrop.fade{filter:alpha(opacity=0);opacity:0}.modal-backdrop.in{filter:alpha(opacity=50);opacity:.5}.modal-header{min-height:16.43px;padding:15px;border-bottom:1px solid #e5e5e5}.modal-header .close{margin-top:-2px}.modal-title{margin:0;line-height:1.42857143}.modal-body{position:relative;padding:15px}.modal-footer{padding:15px;text-align:right;border-top:1px solid #e5e5e5}.modal-footer .btn+.btn{margin-bottom:0;margin-left:5px}.modal-footer .btn-group .btn+.btn{margin-left:-1px}.modal-footer .btn-block+.btn-block{margin-left:0}.modal-scrollbar-measure{position:absolute;top:-9999px;width:50px;height:50px;overflow:scroll}@media (min-width:768px){.modal-dialog{width:600px;margin:30px auto}.modal-content{-webkit-box-shadow:0 5px 15px rgba(0,0,0,.5);box-shadow:0 5px 15px rgba(0,0,0,.5)}.modal-sm{width:300px}}@media (min-width:992px){.modal-lg{width:900px}}.clearfix:before,.clearfix:after,.dl-horizontal dd:before,.dl-horizontal dd:after,.container:before,.container:after,.container-fluid:before,.container-fluid:after,.row:before,.row:after,.form-horizontal .form-group:before,.form-horizontal .form-group:after,.btn-toolbar:before,.btn-toolbar:after,.btn-group-vertical>.btn-group:before,.btn-group-vertical>.btn-group:after,.nav:before,.nav:after,.navbar:before,.navbar:after,.navbar-header:before,.navbar-header:after,.navbar-collapse:before,.navbar-collapse:after,.pager:before,.pager:after,.panel-body:before,.panel-body:after,.modal-footer:before,.modal-footer:after{display:table;content:" "}.clearfix:after,.dl-horizontal dd:after,.container:after,.container-fluid:after,.row:after,.form-horizontal .form-group:after,.btn-toolbar:after,.btn-group-vertical>.btn-group:after,.nav:after,.navbar:after,.navbar-header:after,.navbar-collapse:after,.pager:after,.panel-body:after,.modal-footer:after{clear:both}.center-block{display:block;margin-right:auto;margin-left:auto}.pull-right{float:right!important}.pull-left{float:left!important}.hide{display:none!important}.show{display:block!important}.invisible{visibility:hidden}.text-hide{font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0}.hidden{display:none!important;visibility:hidden!important}.affix{position:fixed;-webkit-transform:translate3d(0,0,0);-o-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}@-ms-viewport{width:device-width}.visible-xs,.visible-sm,.visible-md,.visible-lg{display:none!important}.visible-xs-block,.visible-xs-inline,.visible-xs-inline-block,.visible-sm-block,.visible-sm-inline,.visible-sm-inline-block,.visible-md-block,.visible-md-inline,.visible-md-inline-block,.visible-lg-block,.visible-lg-inline,.visible-lg-inline-block{display:none!important}@media (max-width:767px){.visible-xs{display:block!important}table.visible-xs{display:table}tr.visible-xs{display:table-row!important}th.visible-xs,td.visible-xs{display:table-cell!important}}@media (max-width:767px){.visible-xs-block{display:block!important}}@media (max-width:767px){.visible-xs-inline{display:inline!important}}@media (max-width:767px){.visible-xs-inline-block{display:inline-block!important}}@media (min-width:768px) and (max-width:991px){.visible-sm{display:block!important}table.visible-sm{display:table}tr.visible-sm{display:table-row!important}th.visible-sm,td.visible-sm{display:table-cell!important}}@media (min-width:768px) and (max-width:991px){.visible-sm-block{display:block!important}}@media (min-width:768px) and (max-width:991px){.visible-sm-inline{display:inline!important}}@media (min-width:768px) and (max-width:991px){.visible-sm-inline-block{display:inline-block!important}}@media (min-width:992px) and (max-width:1199px){.visible-md{display:block!important}table.visible-md{display:table}tr.visible-md{display:table-row!important}th.visible-md,td.visible-md{display:table-cell!important}}@media (min-width:992px) and (max-width:1199px){.visible-md-block{display:block!important}}@media (min-width:992px) and (max-width:1199px){.visible-md-inline{display:inline!important}}@media (min-width:992px) and (max-width:1199px){.visible-md-inline-block{display:inline-block!important}}@media (min-width:1200px){.visible-lg{display:block!important}table.visible-lg{display:table}tr.visible-lg{display:table-row!important}th.visible-lg,td.visible-lg{display:table-cell!important}}@media (min-width:1200px){.visible-lg-block{display:block!important}}@media (min-width:1200px){.visible-lg-inline{display:inline!important}}@media (min-width:1200px){.visible-lg-inline-block{display:inline-block!important}}@media (max-width:767px){.hidden-xs{display:none!important}}@media (min-width:768px) and (max-width:991px){.hidden-sm{display:none!important}}@media (min-width:992px) and (max-width:1199px){.hidden-md{display:none!important}}@media (min-width:1200px){.hidden-lg{display:none!important}}.visible-print{display:none!important}@media print{.visible-print{display:block!important}table.visible-print{display:table}tr.visible-print{display:table-row!important}th.visible-print,td.visible-print{display:table-cell!important}}.visible-print-block{display:none!important}@media print{.visible-print-block{display:block!important}}.visible-print-inline{display:none!important}@media print{.visible-print-inline{display:inline!important}}.visible-print-inline-block{display:none!important}@media print{.visible-print-inline-block{display:inline-block!important}}@media print{.hidden-print{display:none!important}}

{# /* // Swiper 4.4.2 */ #}
.swiper-container{width:100%;margin:0 auto;position:relative;overflow:hidden;list-style:none;padding:0;z-index:1}.swiper-container-no-flexbox .swiper-slide{float:left}.swiper-container-vertical>.swiper-wrapper{-webkit-box-orient:vertical;-webkit-box-direction:normal;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column}.swiper-wrapper{position:relative;width:100%;height:100%;z-index:1;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-transition-property:-webkit-transform;transition-property:-webkit-transform;-o-transition-property:transform;transition-property:transform;transition-property:transform,-webkit-transform}.swiper-container-android .swiper-slide,.swiper-wrapper{-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}.swiper-container-multirow>.swiper-wrapper{-webkit-flex-wrap:wrap;-ms-flex-wrap:wrap;flex-wrap:wrap}.swiper-container-free-mode>.swiper-wrapper{-webkit-transition-timing-function:ease-out;-o-transition-timing-function:ease-out;transition-timing-function:ease-out;margin:0 auto}.swiper-slide{-webkit-flex-shrink:0;-ms-flex-negative:0;flex-shrink:0;width:100%;height:100%;position:relative;-webkit-transition-property:-webkit-transform;transition-property:-webkit-transform;-o-transition-property:transform;transition-property:transform;transition-property:transform,-webkit-transform}.swiper-slide-invisible-blank{visibility:hidden}.swiper-container-autoheight,.swiper-container-autoheight .swiper-slide{height:auto}.swiper-container-autoheight .swiper-wrapper{-webkit-box-align:start;-webkit-align-items:flex-start;-ms-flex-align:start;align-items:flex-start;-webkit-transition-property:height,-webkit-transform;transition-property:height,-webkit-transform;-o-transition-property:transform,height;transition-property:transform,height;transition-property:transform,height,-webkit-transform}.swiper-container-3d{-webkit-perspective:1200px;perspective:1200px}.swiper-container-3d .swiper-cube-shadow,.swiper-container-3d .swiper-slide,.swiper-container-3d .swiper-slide-shadow-bottom,.swiper-container-3d .swiper-slide-shadow-left,.swiper-container-3d .swiper-slide-shadow-right,.swiper-container-3d .swiper-slide-shadow-top,.swiper-container-3d .swiper-wrapper{-webkit-transform-style:preserve-3d;transform-style:preserve-3d}.swiper-container-3d .swiper-slide-shadow-bottom,.swiper-container-3d .swiper-slide-shadow-left,.swiper-container-3d .swiper-slide-shadow-right,.swiper-container-3d .swiper-slide-shadow-top{position:absolute;left:0;top:0;width:100%;height:100%;pointer-events:none;z-index:10}.swiper-container-3d .swiper-slide-shadow-left{background-image:-webkit-gradient(linear,right top,left top,from(rgba(0,0,0,.5)),to(rgba(0,0,0,0)));background-image:-webkit-linear-gradient(right,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:-o-linear-gradient(right,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:linear-gradient(to left,rgba(0,0,0,.5),rgba(0,0,0,0))}.swiper-container-3d .swiper-slide-shadow-right{background-image:-webkit-gradient(linear,left top,right top,from(rgba(0,0,0,.5)),to(rgba(0,0,0,0)));background-image:-webkit-linear-gradient(left,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:-o-linear-gradient(left,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:linear-gradient(to right,rgba(0,0,0,.5),rgba(0,0,0,0))}.swiper-container-3d .swiper-slide-shadow-top{background-image:-webkit-gradient(linear,left bottom,left top,from(rgba(0,0,0,.5)),to(rgba(0,0,0,0)));background-image:-webkit-linear-gradient(bottom,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:-o-linear-gradient(bottom,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:linear-gradient(to top,rgba(0,0,0,.5),rgba(0,0,0,0))}.swiper-container-3d .swiper-slide-shadow-bottom{background-image:-webkit-gradient(linear,left top,left bottom,from(rgba(0,0,0,.5)),to(rgba(0,0,0,0)));background-image:-webkit-linear-gradient(top,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:-o-linear-gradient(top,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:linear-gradient(to bottom,rgba(0,0,0,.5),rgba(0,0,0,0))}.swiper-container-wp8-horizontal,.swiper-container-wp8-horizontal>.swiper-wrapper{-ms-touch-action:pan-y;touch-action:pan-y}.swiper-container-wp8-vertical,.swiper-container-wp8-vertical>.swiper-wrapper{-ms-touch-action:pan-x;touch-action:pan-x}.swiper-button-next,.swiper-button-prev{position:absolute;top:50%;z-index:10;width:30px;height:40px;margin-top:-25px;line-height:40px;color:#fff;text-align:center;cursor:pointer}.swiper-button-next.swiper-button-disabled,.swiper-button-prev.swiper-button-disabled{opacity:0;cursor:auto}.swiper-button-prev,.swiper-container-rtl .swiper-button-next{left:20px;right:auto}.swiper-button-next,.swiper-container-rtl .swiper-button-prev{right:20px;left:auto}.swiper-button-lock{display:none}.swiper-pagination{position:absolute;text-align:center;-webkit-transition:.3s opacity;-o-transition:.3s opacity;transition:.3s opacity;-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0);z-index:10}.swiper-pagination.swiper-pagination-hidden{opacity:0}.swiper-container-horizontal>.swiper-pagination-bullets,.swiper-pagination-custom,.swiper-pagination-fraction{bottom:20px;left:0;width:100%}.swiper-pagination-bullets-dynamic{overflow:hidden;font-size:0}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet{-webkit-transform:scale(.33);-ms-transform:scale(.33);transform:scale(.33);position:relative}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active{-webkit-transform:scale(1);-ms-transform:scale(1);transform:scale(1)}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active-main{-webkit-transform:scale(1);-ms-transform:scale(1);transform:scale(1)}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active-prev{-webkit-transform:scale(.66);-ms-transform:scale(.66);transform:scale(.66)}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active-prev-prev{-webkit-transform:scale(.33);-ms-transform:scale(.33);transform:scale(.33)}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active-next{-webkit-transform:scale(.66);-ms-transform:scale(.66);transform:scale(.66)}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active-next-next{-webkit-transform:scale(.33);-ms-transform:scale(.33);transform:scale(.33)}.swiper-pagination-bullet{width:8px;height:8px;display:inline-block;border-radius:100%;background:#000;opacity:.2}button.swiper-pagination-bullet{border:none;margin:0;padding:0;-webkit-box-shadow:none;box-shadow:none;-webkit-appearance:none;-moz-appearance:none;appearance:none}.swiper-pagination-clickable .swiper-pagination-bullet{cursor:pointer}.swiper-pagination-bullet-active{opacity:1;background:#007aff}.swiper-container-vertical>.swiper-pagination-bullets{right:10px;top:50%;-webkit-transform:translate3d(0,-50%,0);transform:translate3d(0,-50%,0)}.swiper-container-vertical>.swiper-pagination-bullets .swiper-pagination-bullet{margin:6px 0;display:block}.swiper-container-vertical>.swiper-pagination-bullets.swiper-pagination-bullets-dynamic{top:50%;-webkit-transform:translateY(-50%);-ms-transform:translateY(-50%);transform:translateY(-50%);width:8px}.swiper-container-vertical>.swiper-pagination-bullets.swiper-pagination-bullets-dynamic .swiper-pagination-bullet{display:inline-block;-webkit-transition:.2s top,.2s -webkit-transform;transition:.2s top,.2s -webkit-transform;-o-transition:.2s transform,.2s top;transition:.2s transform,.2s top;transition:.2s transform,.2s top,.2s -webkit-transform}.swiper-container-horizontal> .swiper-pagination-bullets .swiper-pagination-bullet{margin:0 4px}.swiper-container-horizontal>.swiper-pagination-bullets.swiper-pagination-bullets-dynamic{left:50%;-webkit-transform:translateX(-50%);-ms-transform:translateX(-50%);transform:translateX(-50%);white-space:nowrap}.swiper-container-horizontal>.swiper-pagination-bullets.swiper-pagination-bullets-dynamic .swiper-pagination-bullet{-webkit-transition:.2s left,.2s -webkit-transform;transition:.2s left,.2s -webkit-transform;-o-transition:.2s transform,.2s left;transition:.2s transform,.2s left;transition:.2s transform,.2s left,.2s -webkit-transform}.swiper-container-horizontal.swiper-container-rtl>.swiper-pagination-bullets-dynamic .swiper-pagination-bullet{-webkit-transition:.2s right,.2s -webkit-transform;transition:.2s right,.2s -webkit-transform;-o-transition:.2s transform,.2s right;transition:.2s transform,.2s right;transition:.2s transform,.2s right,.2s -webkit-transform}.swiper-pagination-progressbar{background:rgba(0,0,0,.25);position:absolute}.swiper-pagination-progressbar .swiper-pagination-progressbar-fill{background:#007aff;position:absolute;left:0;top:0;width:100%;height:100%;-webkit-transform:scale(0);-ms-transform:scale(0);transform:scale(0);-webkit-transform-origin:left top;-ms-transform-origin:left top;transform-origin:left top}.swiper-container-rtl .swiper-pagination-progressbar .swiper-pagination-progressbar-fill{-webkit-transform-origin:right top;-ms-transform-origin:right top;transform-origin:right top}.swiper-container-horizontal>.swiper-pagination-progressbar,.swiper-container-vertical>.swiper-pagination-progressbar.swiper-pagination-progressbar-opposite{width:100%;height:4px;left:0;top:0}.swiper-container-horizontal>.swiper-pagination-progressbar.swiper-pagination-progressbar-opposite,.swiper-container-vertical>.swiper-pagination-progressbar{width:4px;height:100%;left:0;top:0}.swiper-pagination-white .swiper-pagination-bullet-active{background:#fff}.swiper-pagination-progressbar.swiper-pagination-white{background:rgba(255,255,255,.25)}.swiper-pagination-progressbar.swiper-pagination-white .swiper-pagination-progressbar-fill{background:#fff}.swiper-pagination-black .swiper-pagination-bullet-active{background:#000}.swiper-pagination-progressbar.swiper-pagination-black{background:rgba(0,0,0,.25)}.swiper-pagination-progressbar.swiper-pagination-black .swiper-pagination-progressbar-fill{background:#000}.swiper-pagination-lock{display:none}.swiper-lazy-preloader{width:42px;height:42px;position:absolute;left:50%;top:50%;margin-left:-21px;margin-top:-21px;z-index:10;-webkit-transform-origin:50%;-ms-transform-origin:50%;transform-origin:50%;-webkit-animation:swiper-preloader-spin 1s steps(12,end) infinite;animation:swiper-preloader-spin 1s steps(12,end) infinite}.swiper-lazy-preloader:after{display:block;content:'';width:100%;height:100%;background-image:url("data:image/svg+xml;charset=utf-8,%3Csvg%20viewBox%3D'0%200%20120%20120'%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20xmlns%3Axlink%3D'http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink'%3E%3Cdefs%3E%3Cline%20id%3D'l'%20x1%3D'60'%20x2%3D'60'%20y1%3D'7'%20y2%3D'27'%20stroke%3D'%236c6c6c'%20stroke-width%3D'11'%20stroke-linecap%3D'round'%2F%3E%3C%2Fdefs%3E%3Cg%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(30%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(60%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(90%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(120%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(150%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.37'%20transform%3D'rotate(180%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.46'%20transform%3D'rotate(210%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.56'%20transform%3D'rotate(240%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.66'%20transform%3D'rotate(270%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.75'%20transform%3D'rotate(300%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.85'%20transform%3D'rotate(330%2060%2C60)'%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E");background-position:50%;background-size:100%;background-repeat:no-repeat}.swiper-lazy-preloader-white:after{background-image:url("data:image/svg+xml;charset=utf-8,%3Csvg%20viewBox%3D'0%200%20120%20120'%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20xmlns%3Axlink%3D'http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink'%3E%3Cdefs%3E%3Cline%20id%3D'l'%20x1%3D'60'%20x2%3D'60'%20y1%3D'7'%20y2%3D'27'%20stroke%3D'%23fff'%20stroke-width%3D'11'%20stroke-linecap%3D'round'%2F%3E%3C%2Fdefs%3E%3Cg%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(30%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(60%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(90%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(120%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(150%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.37'%20transform%3D'rotate(180%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.46'%20transform%3D'rotate(210%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.56'%20transform%3D'rotate(240%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.66'%20transform%3D'rotate(270%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.75'%20transform%3D'rotate(300%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.85'%20transform%3D'rotate(330%2060%2C60)'%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E")}@-webkit-keyframes swiper-preloader-spin{100%{-webkit-transform:rotate(360deg);transform:rotate(360deg)}}@keyframes swiper-preloader-spin{100%{-webkit-transform:rotate(360deg);transform:rotate(360deg)}}.swiper-container-fade.swiper-container-free-mode .swiper-slide{-webkit-transition-timing-function:ease-out;-o-transition-timing-function:ease-out;transition-timing-function:ease-out}.swiper-container-fade .swiper-slide{pointer-events:none;-webkit-transition-property:opacity;-o-transition-property:opacity;transition-property:opacity}.swiper-container-fade .swiper-slide .swiper-slide{pointer-events:none}.swiper-container-fade .swiper-slide-active,.swiper-container-fade .swiper-slide-active .swiper-slide-active{pointer-events:auto}

{# /* // Font Awesome Sizes */ #}

.svg-inline--fa{display:inline-block;font-size:inherit;height:1em;overflow:visible;vertical-align:-.125em}.svg-inline--fa.fa-lg{vertical-align:-.225em}.svg-inline--fa.fa-w-1{width:.0625em}.svg-inline--fa.fa-w-2{width:.125em}.svg-inline--fa.fa-w-3{width:.1875em}.svg-inline--fa.fa-w-4{width:.25em}.svg-inline--fa.fa-w-5{width:.3125em}.svg-inline--fa.fa-w-6{width:.375em}.svg-inline--fa.fa-w-7{width:.4375em}.svg-inline--fa.fa-w-8{width:.5em}.svg-inline--fa.fa-w-9{width:.5625em}.svg-inline--fa.fa-w-10{width:.625em}.svg-inline--fa.fa-w-11{width:.6875em}.svg-inline--fa.fa-w-12{width:.75em}.svg-inline--fa.fa-w-13{width:.8125em}.svg-inline--fa.fa-w-14{width:.875em}.svg-inline--fa.fa-w-15{width:.9375em}.svg-inline--fa.fa-w-16{width:1em}.svg-inline--fa.fa-w-17{width:1.0625em}.svg-inline--fa.fa-w-18{width:1.125em}.svg-inline--fa.fa-w-19{width:1.1875em}.svg-inline--fa.fa-w-20{width:1.25em}.fa-lg{font-size:1.33333em;line-height:.75em;vertical-align:-.0667em}.fa-xs{font-size:.75em}.fa-sm{font-size:.875em}.fa-1x{font-size:1em}.fa-2x{font-size:2em}.fa-3x{font-size:3em}.fa-4x{font-size:4em}.fa-5x{font-size:5em}.fa-6x{font-size:6em}.fa-7x{font-size:7em}.fa-8x{font-size:8em}.fa-9x{font-size:9em}.fa-10x{font-size:10em}.fa-spin{animation:fa-spin 2s infinite linear}@keyframes fa-spin{0%{transform:rotate(0deg)}to{transform:rotate(1turn)}}

{#/*============================================================================
  #Critical path utilities classes
==============================================================================*/#}

/* Hidden general content until rest of styling loads */

.visible-when-content-ready{
	visibility: hidden!important;
}
.display-when-content-ready{
	display: none!important;
}

{#/*============================================================================
  #Components
==============================================================================*/#}

{# /* // Animations */ #}

.rotate{
    -webkit-animation: rotate 2s infinite linear;
    -moz-transform: rotate 2s infinite linear;
	-ms-transform: rotate 2s infinite linear;
	-o-transform: rotate 2s infinite linear;
	transform: rotate 2s infinite linear;
}
@-webkit-keyframes rotate {
	from {
		-webkit-transform: rotate(0deg);
		-moz-transform: rotate(0deg);
		-ms-transform: rotate(0deg);
		-o-transform: rotate(0deg);
		transform: rotate(0deg);
	}
	to {
		-webkit-transform: rotate(359deg);
		-moz-transform: rotate(359deg);
		-ms-transform: rotate(359deg);
		-o-transform: rotate(359deg);
		transform: rotate(359deg);
	}
}
.placeholder-shine{
  position: absolute;
  width: 100%;
  height: 100%;
  opacity: 0.5;
  -moz-animation: placeholder-shine 1.5s infinite;
  -webkit-animation: placeholder-shine 1.5s infinite;
  animation: placeholder-shine 1.5s infinite;
  top: 0;
  left: 0;
}
@keyframes placeholder-shine {
  0%{
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}

.placeholder-fade{
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  opacity: 0.1;
  -moz-animation: placeholder-fade 1.5s infinite;
  -webkit-animation: placeholder-fade 1.5s infinite;
  animation: placeholder-fade 1.5s infinite;
}
@keyframes placeholder-fade {
  0%{
    opacity: 0.1;
  }
  50% {
    opacity: 0.2;
  }
  100% {
    opacity: 0.1;
  }
}

.transition-up,
.fade-in-vertical {
  opacity: 0;
}

.bounce {
  animation: bounce 2s ease 10;
}
@keyframes bounce {
  70% { transform:translateY(0%); }
  80% { transform:translateY(-30%); }
  90% { transform:translateY(0%); }
  95% { transform:translateY(-15%); }
  97% { transform:translateY(0%); }
  99% { transform:translateY(-8%); }
  100% { transform:translateY(0); }
}


{# /* // Placeholders and preloaders */ #}

.mobile-placeholder,
.page-loading-icon-container{
	display: none;
}
.page-loading-icon{
  height: 40px;
  width: 40px;
  margin: 40px auto;
}
.slider-desktop-placeholder{
  height: 400px;
}
.blur-up {
  -webkit-filter: blur(1px);
  filter: blur(1px);
  -moz-filter: blur(1px);
  -ms-filter: blur(1px);
  -o-filter: blur(1px);
  transition: filter .2s, -webkit-filter .2s;
}
.blur-up-big {
  -webkit-filter: blur(3px);
  filter: blur(3px);
  -moz-filter: blur(3px);
  -ms-filter: blur(3px);
  -o-filter: blur(3px);
  transition: filter .2s, -webkit-filter .2s;
}

.blur-up-huge {
  -webkit-filter: blur(6px);
  filter: blur(6px);
  -moz-filter: blur(6px);
  -ms-filter: blur(6px);
  -o-filter: blur(6px);
  transition: filter .2s, -webkit-filter .2s;
}
.blur-up.lazyloaded,
.blur-up-big.lazyloaded,
.blur-up-huge.lazyloaded,
.blur-up.swiper-lazy-loaded,
.blur-up-big.swiper-lazy-loaded,
.blur-up-huge.swiper-lazy-loaded  {
  -webkit-filter: none;
  filter: none;
  -moz-filter: none;
  -ms-filter: none;
  -o-filter: none;
}

.fade-in {
  opacity: 0;
  transition: opacity .2s;
}
.fade-in.lazyloaded,
.fade-in.swiper-lazy-loaded {
  opacity: 1;
}
.placeholder-overlay{
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 1;
  transition: opacity .5s;

}
.lazyloaded + .placeholder-overlay,
.lazyloaded > .placeholder-overlay,
.swiper-lazy-loaded + .placeholder-fade{
  opacity: 0;
}

.lazyloaded + .placeholder-fade{
  display: none;
}

{# /* // Wrappers */ #}

.container {
  max-width: 1440px;
}
.no-gutter {
  padding: 0;
  margin: 0;    
}
.top-shadow {
  position: absolute;
  width: 100%;
  height: 20px;
  z-index: 98;
  -webkit-box-shadow: inset 1px 4px 7px -6px;
  -moz-box-shadow: inset 1px 4px 7px -6px;
  box-shadow: inset 1px 4px 7px -6px;
}

{# /* // SVG Icons */ #}

.svg-medium {
  width: 20px;
  vertical-align: middle;
}

{# /* // Images */ #}

/* Used for images that have a placeholder before it loads. The image container should have a padding-bottom inline with the result of (image height/ image width) * 100 */
.img-absolute {
  position: absolute;
  left: 0;
  width: 100%;
  height: auto;
  vertical-align: middle;
  text-indent: -9999px;
  z-index: 1;
  transform: translate3d(0, 0, 0);
  -webkit-transform: translate3d(0, 0, 0);
  -ms-transform: translate3d(0, 0, 0);
}

.img-absolute-centered{
  left: 50%;
  transform: translate3d(-50%, 0, 0);
  -webkit-transform: translate3d(-50%, 0, 0);
  -ms-transform: translate3d(-50%, 0, 0);
}

.img-absolute-centered-vertically{
  position: absolute;
  top: 50%;
  left: 50%;
  z-index: 9;
  width: 100%;
  height: 100%;
  transform: translate(-50%, -50%);
  object-fit: cover;
}

.card-img-square-container {
  position: relative;
  width: 100%;
  padding-top: 100%;
}
.card-img-square {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
}
.card-img-pill {
  position: absolute;
  top: 0;
  left: 0;
  z-index: 999;
}

.kit-products-item-image {
  display: block;
  width: 42px;
  height: 42px;
  object-fit: cover;
}

{# /* // Breadcrumbs */ #}

.breadcrumb {
  width: 100%;
  margin: 20px auto 0 auto;
  background: none;
  text-align: center;
}
.breadcrumb>li+li:before{
  display: none;
}

{# /* // Pills */ #}

.pills-container{
  margin: 10px 0;
  padding: 10px 0;
  line-height: 50px;
  -webkit-overflow-scrolling: touch;
}
.pills-container ul{
  list-style: none;
}

{# /* // Labels */ #}

.labels-floating {
  position: absolute;
  top: -3px;
  left: 0;
  z-index: 98;
}
.label-overlap{
  margin-top: -5px;
}
.label{
  padding: 5px 10px;
  font-size: 11px;
  font-weight: normal;
  text-align:center;
  text-transform: uppercase;
  white-space: normal;
}
.label-circle {
  width: 60px;
  height: 60px;
  -webkit-border-radius: 30px;
  -moz-border-radius: 30px;
  border-radius: 30px;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
}
.label-text{
  display: table-cell;
  vertical-align: middle;
  text-transform: uppercase;
  font-size: 10px;
  line-height: initial;
}
.label-small{
  font-size: 65%;
  line-height: 120%;
  text-transform: lowercase;
}
{# /* // Sliders */ #}

.home-slider{
  position: relative;
  padding: 0;
  list-style: none;
}
.home-slider .swiper-slide{
  overflow: hidden;
}
.slider {
  margin: 0;
  padding: 0;
  /* Fixes white flickering on Chrome */
  -webkit-perspective: 1000px;
}
.swiper-pagination {
  position: relative;
  top: 0;
  margin-top: 10px;
}
.swiper-button-prev {
  left: 0;
}
.swiper-button-next {
  right: 0;
}
.swiper-button-prev,
.swiper-button-next {
  position: absolute;
  top: 50%;
  width: 60px;
  height: 60px;
  transform: translateY(-50%);
  -webkit-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
}
.swiper-button-cart {
  width: 40px;
  height: 40px;
}
.swiper-pagination-bullet {
  width: 10px;
  height: 10px;
  opacity: 1;
}
.slider-slide{
  position: relative;
  min-width: 1px;
  min-height: 1px;
  overflow: hidden;
}
.slider img,
.slide-img {
  position: relative;
  z-index: 1;
  display: block;
  width: 100%;
  height: 100%;
  object-fit: cover;
}
.slider-arrow{
  width: 60px;
}

.products-slider .swiper-button-prev,
.products-slider .swiper-button-next{
  top: 40%;
}

.swiper-container-horizontal .swiper-pagination-bullets {
  bottom: 10px;
  left: 0;
  width: 100%;
}
.swiper-container-horizontal .swiper-pagination-bullets .swiper-pagination-bullet,
.products-section-slider-controls-pagination .swiper-pagination-bullet {
  margin: 0 4px;
}

{# /* // Banners */ #}

.banner-container{
  position: relative;
  overflow: hidden;
}
.banner-image {
  width: 100%;
}
.textbanner {
  position: relative;
  margin: 20px 0;
}

.textbanner-image {
  position: relative;
  padding-bottom: 100%;
  overflow: hidden;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

.textbanner-image:after {
  position: absolute;
  top: 0;
  display: block;
  width: 100%;
  height: 100%;
  opacity: 0;
  content: '';
}

.textbanner-image-empty {
  height: 150%;
  top: -20%;
  background-image: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1440 770'><rect width='1440' height='770' fill='%23fcfcfc'/><path d='M852.28,303.08a17.11,17.11,0,0,0-11.62-6.15l-80.84-7.56-10.51-46a17.22,17.22,0,0,0-20.6-12.91l-152.45,34.5a17.19,17.19,0,0,0-13,20.51L599.57,444.3a17.22,17.22,0,0,0,20.6,12.91L652.06,450l-1,10.19a17.23,17.23,0,0,0,15.52,18.68l155.54,14.56c.55.05,1.09.07,1.62.07A17.19,17.19,0,0,0,840.89,478l2.76-29.35a1,1,0,0,0,.17-1.77l12.35-131.22A17,17,0,0,0,852.28,303.08ZM567.2,273.61a15.08,15.08,0,0,1,9.5-6.73l152.45-34.5a15.22,15.22,0,0,1,18.21,11.4l10.37,45.39-72.61-6.79a17.21,17.21,0,0,0-18.74,15.47l-1.59,16.89-28.65-18.83a1,1,0,0,0-1.39.29,1,1,0,0,0,.29,1.38L664.58,317,657,397.89l-62.69,14.27L565.24,285A15,15,0,0,1,567.2,273.61ZM737.9,424.37a1,1,0,0,0,1.41.19l71.12-54.77L845.6,402.6a1,1,0,0,0,.36.21l-4.12,43.71L656.2,427.36l4.49-47.66a.94.94,0,0,0,.86-.1l67.93-45.68,51.61,55.93-43,33.12A1,1,0,0,0,737.9,424.37ZM619.73,455.26a15.23,15.23,0,0,1-18.21-11.41l-6.79-29.74,62-14.13-2.61,27.76a1.12,1.12,0,0,0-.14.4,1,1,0,0,0,.06.43l-1.82,19.33Zm219.17,22.5a15.21,15.21,0,0,1-16.55,13.67L666.81,476.88a15.22,15.22,0,0,1-13.72-16.5l2.92-31,185.64,19.16Zm15.28-162.34-8,85-35-32.67a1,1,0,0,0-1.3-.06l-27.2,20.95-52.31-56.7a1,1,0,0,0-1.3-.15l-68.19,45.86,7.5-79.6a15.2,15.2,0,0,1,16.55-13.67l155.54,14.55a15.22,15.22,0,0,1,13.71,16.5ZM788.4,325.69A12.21,12.21,0,0,0,786.12,350c.39,0,.77.05,1.15.05A12.22,12.22,0,0,0,799.41,339h0a12.19,12.19,0,0,0-11-13.29Zm9,13.1a10.2,10.2,0,1,1-10.17-11.15c.32,0,.64,0,1,0a10.2,10.2,0,0,1,9.21,11.11Zm-168.36,3.62a1,1,0,0,0,.55.17,1,1,0,0,0,.56-1.83L607.75,325.8a1,1,0,0,0-1.11,1.67Zm-78.72-42.54L38.33,49.46l.44-.9L550.78,299ZM39.58,724l-.44-.9,549.09-271.3.45.9Zm1364.65,1.75-.45-.22L870,463.38l.44-.89.45.22,533.77,262.13ZM870.51,307.35l-.44-.9L1402.64,44.84l.44.89Z' fill='%23ccc'/></svg>");
  background-position: center;
  background-repeat: no-repeat;

}
.textbanner-image-empty-vertical{
  padding-top: 20%;
}
.textbanner-image-background {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.textbanner-image.lazyloaded > .item-preloader-container {
  display: none;
}

.textbanner-image .placeholder-icon {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 20%;
  transform: translate(-50%, -50%);
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  text-align: center;
  opacity: 0.2; 
}

.textbanner-text {
  position: relative;
  z-index: 9;
  margin: -30px 30px 60px 30px;
  padding: 20px;
  text-align: center;
}

.textbanner-shape {
  position: absolute;
  top: -28px;
  left: 0px;
  width: 100%;
  overflow: hidden;
}

.textbanner-shape:before {
  display: block;
  border-style: solid;
  border-width: 0 0 28px 495px;
  content: '';
}

.textbanner-title {
  margin-top: 0;
  margin-bottom: 15px;
  font-size: 20px;
  font-weight: 700;
  line-height: 22px; 
}

.textbanner-paragraph {
  display: -webkit-box;
  margin-bottom: 20px;
  font-weight: 300;
  letter-spacing: 1px;
  overflow: hidden;
  text-overflow: ellipsis;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
}

.textbanner-button.btn {
  position: absolute;
  left: 50%;
  margin-bottom: -70px;
  transform: translate(-50%, 0%);
  max-width: 95%;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.textbanner:hover .textbanner-image:after {
  opacity: 0.5; 
}

.services{
  clear: both;
  opacity: 0.8;
  padding: 20px 0;
  margin: 10px auto;
}
.service-item{
  margin: auto;
  text-align: center;
}
.service-icon {
  display: inline-block;
  width: 20px;
  margin-right: 4px;
  vertical-align: middle;
}
.service-item .service-icon-small {
  font-size: 16px;
}
.service-item .service-icon-big {
  width: 22px;
}
.service-title {
  display: inline;
  font-size: 16px;
  line-height: 24px;
}
.service-text{
  margin: 0;
  text-align: center;
  letter-spacing: 2px;
  font-weight: 300;
}

{# /* // Modules with image and text */ #}

.module-wrapper {
  margin-top: 20px;
}

.module-wrapper-promotional {
  margin-top: 40px;
}

.module-image {
  position: relative;
  height: 420px;
  margin-bottom: 40px;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

.module-image-placeholder svg {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  object-fit: cover;
}

.module-link {
  position: absolute;
  width: 100%;
  height: 100%;
}

.module-image-promotional {
  height: auto;
  padding-bottom: 150%;
}

.module-text {
  position: relative;
  top: 45%;
  z-index: 9;
  width: 33.33333333%;
  margin: 0 30px;
  padding: 20px;
  text-align: center;
  transform: translate(0%, -50%);
}
.module-text-promotional {
  position: absolute;
  top: auto;
  right: 0;
  bottom: 0;
  left: 0;
  width: auto;
  margin: 0 30px 45px 30px;
  transform: none;
}
.module-text.module-center {
  left: 50%;
  margin-right: 0;
  margin-left: 0;
  transform: translate(-50%, -50%);
}

.module-text-title {
  margin-bottom: 20px;
  display: -webkit-box;
  font-size: 20px;
  line-height: 22px;
  overflow: hidden;
  text-overflow: ellipsis;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
}

.module-text-paragraph {
  margin-bottom: 25px;
  display: -webkit-box;
  font-weight: 300;
  letter-spacing: 1px;
  overflow: hidden;
  text-overflow: ellipsis;
  -webkit-line-clamp: 4;
  -webkit-box-orient: vertical;
}

.module-text-button.btn {
  position: absolute;
  left: 50%;
  margin-bottom: -70px;
  transform: translate(-50%, -0%);
  max-width: 95%;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.player-container {
  position: absolute;
  top: 0;
  left: 0;
  z-index: 1;
  width: 100%;
  height: 100%;    
  cursor: pointer;
}

.player-container .btn-primary {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 70px;
  height: 70px;
  margin: -35px 0 0 -35px;
  padding: 0;
  line-height: 65px;
  text-align: center;
  border-radius: 70px;
}

.player-container .btn-small {
  width: initial;
  height: 35px;
  margin: -18px 0 0 -18px;
  padding: 0 8px;
  line-height: 30px;
}
.player-container .play-icon {
  margin-left: 6px;
  vertical-align: middle;
}

.video-image {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 100%;
  height: auto;
  transform: translate(-50%, -50%);
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
}

{# /* // Forms */ #}

.form-group .form-select-icon {
  position: absolute;
  top: 50%;
  right: 10px;
  transform: translateY(-50%);
  -webkit-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
}

.form-toggle-eye {
  position: absolute;
  top: 50%;
  right: 0;
  display: inline-block;
  margin-top: -24px;
  padding: 10px;
  background: none;
  border: 0;
}

.radio-button-container{
  padding: 0;
  list-style: none;
}
.radio-group-label{
  margin-bottom: 10px;
}
.radio-button-item:last-of-type .radio-button-content,
.radio-button-item:only-child .radio-button-content{
  margin-bottom: 0;
}
.shipping-extra-options .radio-button-item:first-child .radio-button-content{
  margin-top: 10px;
}
.radio-button {
  width: 100%;
  float: left;
  margin-bottom: 0;
  -webkit-tap-highlight-color: rgba(0,0,0,0);
  font-weight: normal;
  cursor: pointer;
}

.radio-button.disabled {
  opacity: 0.6;
  cursor: not-allowed;
}

.radio-button.disabled input[type="radio"] {
  cursor: not-allowed;
}

.radio-button-content {
  position: relative;
  width: 100%;
  float: left;
  margin-bottom: 10px;
  padding: 20px 15px;
  clear: both;
  border-radius: 4px;
}

.radio-button-icons-container {
  position: absolute;
  top: 0;
  left: 0;
  height: calc(100% - 3px);
  padding: 18px 10px;
  border-radius: 3px 0 0 3px;
}

.radio-button-icon {
  border-radius: 50%;
  width: 20px;
  height: 20px;
}

.radio-button input[type="radio"] {
  display: none;
}

.radio-button input[type="radio"] + .radio-button-content .unchecked {
  float: left;
}

.radio-button input[type="radio"] + .radio-button-content .checked {
  position: absolute;
  left: 20px;
  top: 28px;
  width: 0;
  height: 0;
  -webkit-transform: translate(-50%,-50%);
  -ms-transform: translate(-50%,-50%);
  -moz-transform: translate(-50%,-50%);
  -o-transform: translate(-50%,-50%);
  transform: translate(-50%,-50%);
  -webkit-transition: all 0.2s;
  -ms-transition: all 0.2s;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  transition: all 0.2s;
}

.radio-button input[type="radio"]:checked + .radio-button-content .checked {
  width: 16px;
  height: 16px;
}

.radio-button input[type="radio"]:checked + .radio-button-content .shipping-price:after {
  width: 100%;
}

.radio-button-label {
  width: calc(100% - 15px);
  float: left;
  padding-left: 40px;
  font-size: 12px;
}

{#/*============================================================================
  #Header and nav
==============================================================================*/#}


{# /* // Ad bar */ #}

.section-advertising{
  padding: 8px 0;
  font-size: 11px;
  text-align: center;
  text-transform: uppercase;
}

{# /* // Nav desktop */ #}

.nav-head-top{
  padding: 10px 0;
}
.nav-head-main {
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  justify-content: space-between;
  align-items: center;
}
.desktop-nav {
  width: 100%;
  flex-grow: 1;
  padding: 0 10px;
  margin: 10px 0;
  text-align: center;
}
.desktop-nav-list {
  display: none;
}
.desktop-nav-item {
  position: relative;
  display: inline-block;
}
.desktop-nav-link {
  display: block;
  padding: 10px 12px;
  text-transform: uppercase;
}
.desktop-nav > .desktop-nav-item > .desktop-nav-link > .desktop-nav-arrow{
  display:none;
}

{# /* // Nav mobile */ #}

.mobile-nav-search-row, 
.mobile-nav-second-row,
.hamburger-panel{
  display: none;
}

.mobile-nav-empty-cart{
  position: fixed;
  top: 120px;
  left: 5%;
  display: none;
  box-sizing:border-box;
  width: 90%;
}

{# /* // Search desktop */ #}

.desktop-search {
  position: relative;
  margin: 10px 10px 0 10px;
  display: inline-block;
}
.desktop-search-input {
  width: 200px;
  padding: 2px 2px 2px 32px;
  border-radius: 14px;
}
.desktop-search-submit {
  position: absolute;
  top: 5px;
  float: left;
  width: 17px;
  height: 16px;
  cursor: pointer;
  border: 0;
  background: none;
}
.desktop-search-icon{
	width: 14px;
	height: 14px;
  margin-top: -2px;
}

{# /* // Logo */ #}

.logo-container {
  margin: 10px 0;
  padding-right: 5px;
  text-align: left;
}
.logo-container h1{
  margin: 0;
  line-height: inherit;
}
.logo-text{
  width: 100%;
  float:left;
  font-size: 24px;
  line-height: initial;
  text-transform: uppercase;
  word-wrap: break-word;
}
.logo-img-container {
  width: 100%;
  max-width: 480px;
}
.template-password .logo-img-container {
  display: inline-block;
  max-width: 380px;
}
.logo-img{
  display: block;
  max-height: 180px;
  max-width: 100%;
  width: auto;
  height: auto;
}
.logo-img-small {
  max-width: 110px;
  max-height: 70px;
}
.logo-img-medium {
  max-width: 175px;
  max-height: 100px;
}
.logo-img-big {
  max-width: 235px;
  max-height: 130px;
}

{# /* // Cart widget desktop */ #}

.cart-summary{
  position: relative;
  min-width: 60px;
  text-align: center;
}

.cart-summary-icon{
	width: 26px;
	height: 26px;
  margin: auto;
}

{# /* // Notification */ #}

.notification {
	width: 100%;
	padding: 15px;
	text-align: center;
}

.notification-centered {
  position: fixed;
  top: 30%;
  left: 35%;
  z-index: 999;
  width: 30%;
  box-shadow: 0 2px 12px 0 rgb(50 50 50 / 25%);
}

.notification .container {
	position: relative;
}
.notification-close {
	padding: 10px;
	position: absolute;
	right: 0;
	top: -10px;
	cursor: pointer;
}
.notification-fixed-bottom {
  position: fixed;
  bottom: 0;
  left: 0;
  z-index: 999;
  width: 100%;
}
.notification-floating {
  position: fixed;
  top: 110px;
  right: 10px;
  z-index: 1040;
  width: 350px;
  border-radius: 3px;
}

{# /* // Badge */ #}

.badge:empty {
  display: block;
}

.badge {
  position: absolute;
  right: 5px;
  padding: 0px 5px;
  font-size: 14px;
  font-weight: bold;
  line-height: 16px;
  border-radius: 50%;
  text-align: center;
  box-shadow: 0 0 5px 0 rgba(0, 0, 0, .1), 0 2px 3px 0 rgba(0, 0, 0, .2);
}

.badge-small {
  width: 6px;
  height: 10px;
  min-width: auto;
}

.badge-top {
  top: 0;
  right: -7px;
}

.badge-right {
  top: 3px;
  right: 40%;
  margin-right: -25%;
  box-shadow: 0 0 5px 0 rgba(0, 0, 0, .1), 0 2px 3px 0 rgba(0, 0, 0, .2);
}

.badge-number {
  padding: 1px 6px;
}

{# /* // Tootlip */ #}

.tooltip {
  top: initial;
  left: -120%;
  z-index: 10!important;
  width: 320px;
  padding: 15px 10px;
  font-size: 11px !important;
  text-transform: uppercase;
  text-align: center;
  border-radius: 10px;
}

.tooltip-left {
  right: 50px;
  left: initial;
}

.tooltip-bottom {
  top: initial;
}

.tooltip-arrow {
  position: absolute;
  right: 40%;
  width: 0;
  height: 0;
  pointer-events: none;
}

.tooltip-left .tooltip-arrow {
  right: 0;
}

.tooltip-bottom .tooltip-arrow {
  top: -8px;
}

.tooltip-top .tooltip-arrow {
  bottom: -8px;
  transform: rotate(180deg);
}

{#/*============================================================================
  #Product grid
==============================================================================*/ #}

{# /* // Grid */ #}

.sort-by {
  width: 30%;
  display: inline-block;
}

{# /* // Grid item */ #}

.item-container{
  float: left;
  width: 25%;
  padding: 10px;
}
.item-container-slide{
  width: 100%;
}
.item{
  position: relative;
  -webkit-box-shadow: 0 2px 2px 0 rgba(50, 50, 50, 0.15);
  -moz-box-shadow: 0 2px 2px 0 rgba(50, 50, 50, 0.15);
  box-shadow: 0 2px 2px 0 rgba(50, 50, 50, 0.15);
}
.item-image-container{
  position: relative;
}
.item-image-container-slide{
  position: relative;
  max-height: 365px;
  overflow: hidden;
}
.item-image{
  width: auto;
  height: 100%;
  transition: all 0.5s ease;
}
.item-image-slide img{
  max-width: 100%;
  object-fit: contain;
  object-position: top;
}
.item-image:not(.product-item-image-secondary).lazyloaded {
  z-index: 2;
  opacity: 1;
}
.item-image-secondary,
.item-image-secondary.fade-in.lazyloaded {
  display: none;
  opacity: 0;
}
.item-image-container a{
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  z-index: 2;
}
.item-product-reduced .item-image-container {
  height: 180px;
}
.item-product-reduced .item-image-container img {
  width: 100%;
  height: 180px;
  object-fit: cover;
}
.product-item-secondary-images-loaded:not(.product-item-secondary-images-disabled):hover .item-image-featured {
  opacity: 0;
}
.product-item-secondary-images-loaded:not(.product-item-secondary-images-disabled):hover .item-image-featured ~ .item-image-secondary{
  opacity: 1;
}
.product-item-slider-container {
  width: 100%;
  height: 100%;
}
.product-item-slider-container .swiper-button-prev,
.product-item-slider-container .swiper-button-next {
  top: 70%;
  width: 35px;
  height: 35px;
}
.item-slider-controls-container {
  opacity: 0;
  transition: opacity .2s ease;
}
.item-image:hover .item-slider-controls-container:not(.swiper-button-disabled) {
  opacity: 1;
}
.item-image-slider{
  max-height: 365px;
}
.item-info-container{
  position: relative;
  background: white;
  z-index: 2;
}
.item-info{
  position: relative;
  padding: 5px 10px 10px 10px;
  text-align: center;
}
.item-info:before{
  content: "";
  position: absolute;
  border-style: solid;
  border-width: 0 0px 28px 275px;
  left: 0px;
  top: -28px;
}
.item-colors-bullet {
  display: inline-block;
  min-width: 14px;
  height: 14px;
  margin: 0 3px;
  font-size: 8px;
  line-height: 14px;
  vertical-align: top;
  border-radius: 14px;
  cursor: pointer;
  opacity: 0.8;
  text-transform: uppercase;
  -webkit-transition: all 0.4s ease;
  -ms-transition: all 0.4s ease;
  -moz-transition: all 0.4s ease;
  -o-transition: all 0.4s ease;
  transition: all 0.4s ease;
}
.item-colors-bullet:hover,
.item-colors-bullet.selected {
  opacity: 1;
}
.item-colors-bullet-text {
  margin: 0 2px;
  padding: 0 5px;
}
.item-name{
  margin: 0 0 5px 0;
  font-size: 12px;
  line-height: 18px;
  word-break: break-word;
}
.item-quickshop-link {
	display: none;
}

.product-installment-amount,
.product-installment-value {
  font-weight: bold;
}

.item-slider-pagination-container {
  position: absolute;
  bottom: 15px;
  left: 50%;
  z-index: 1;
  display: flex;
  align-items: center;
  justify-content: start;
  width: 50px;
  overflow: hidden;
  transform: translateX(-50%);
  -webkit-transform: translateX(-50%);
  -ms-transform: translateX(-50%);
}
.item-slider-pagination-container.two-bullets {
  width: 30px;
}
.item-slider-pagination {
  overflow: initial;
  transform: translateX(calc(-50% + 11px));
  white-space: nowrap;
}
.item-slider-pagination .swiper-pagination-bullet {
  position: relative;
  left: 20px; 
  width: 8px;
  height: 8px;
  margin: 0 3px;
  transition: transform .2s, left .2s;
  transform: none;
  opacity: .5;
}

.item-slider-pagination-container.two-bullets .swiper-pagination-bullet {
  left: 6px!important;
}

.item-slider-pagination .swiper-pagination-bullet-active{
  opacity: 1;
}

.item-more-images-message {
  position: absolute;
  top: 12px;
  right: 12px;
  z-index: 1;
  font-size: 10px;
  opacity: 0;
  transition: all 0.2s ease;
}

{#/*============================================================================
  #Product detail
==============================================================================*/#}

{# /* // Image */ #}

.mobile-zoom-panel{
  display: none;
}
.product-single-image{
  height: 0;
  overflow: hidden;
}
.cloud-zoom-wrap,
.cloud-zoom-big{
  overflow: hidden;
}
.product-with-1-img img{
  margin: auto;
}
.product-slider-container{
  position: relative;
  margin: auto; 
}
.product-slide{
  max-height: 600px;
}
.product-slider-image{
  height: 100%;
  max-height: 600px;
  width: auto;
  transition: opacity 0.5s;
}
.product-with-1-img img{
  margin: auto;
}
.cloud-zoom-loading{
  display: none;
}
.product-video-container {
  width: 100%;
  height: 100%;
}
.product-video {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
}
.product-video .embed-responsive {
  width: 100%;
}
.product-video .video-image{
  width: auto;
  height: 100%;
}

.desktop-zoom-big {
  opacity: 0;
}
{# /* // Form and info */ #}

.product-name{
  float: left;
  width: 100%;
  margin: 0 0 20px 0;
  font-size: 28px;
}

.product-price-container{
  margin-bottom: 10px;
  clear: both;
}

.payment-credit-card {
  display: inline-block;
  width: 15px;
}

.shipping-truck {
  display: inline-block;
  width: 18px;
  vertical-align: sub;
}

.product-banner-service-image {
  width: 25px;
}

/*============================================================================
  #Cart detail
==============================================================================*/

{# /* // Shipping Calculator */ #}

.shipping-calculator-head.with-zip {
  height: 45px;
}
.shipping-calculator-head.with-form {
  height: 95px;
}
.shipping-calculator-head.with-error {
  height: 200px;
}

/*============================================================================
#Blog
==============================================================================*/

.post-item-image-container {
  position: relative;
  height: 200px;
  overflow: hidden;
}

.post-item-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.post-item-title,
.post-item-summary {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  overflow: hidden;
  text-overflow: ellipsis;
  line-height: 1.5em;
}

.post-content,
.post-content p {
  line-height: 1.8em;
}

.post-content img {
  max-width: 100%;
  height: auto;
}

.post-content h1,
.post-content h2,
.post-content h3,
.post-content h4,
.post-content h5,
.post-content h6 {
  margin: 1.5em 0 1em 0;
  line-height: initial;
}

.post-content h1,
.post-content .h1 {
  font-size: 24px;
}
.post-content h2,
.post-content .h2 {
  font-size: 20px;
}
.post-content h3,
.post-content .h3 {
  font-size: 18px;
}
.post-content h4,
.post-content .h4 {
  font-size: 16px;
}
.post-content h5,
.post-content .h5 {
  font-size: 14px;
}

{#/*============================================================================
  #Media queries page
==============================================================================*/#}

{# /* // Min width 767px */ #}

@media (min-width: 767px) {
  .container-narrow {
    max-width: 680px;
  }
}

{# /* // Min width 1368px */ #}

@media screen and (min-width: 1368px) {

	{# /* //// Components */ #}

	{# /* Sliders */ #}

  .home-slider {
    max-width: 1170px !important;
    margin: 20px auto 0 auto;
  }
}


{# /* // Max width 1200px */ #}

@media screen and (max-width: 1200px) {

  {# /* //// Components */ #}

  .container {
    max-width: 100%;
  }
}


{# /* // Max width 767px */ #}

@media (max-width: 767px){

	{# /* //// Components */ #}

  {# /* Placeholders and preloaders */ #}

  .mobile-placeholder,
  .page-loading-icon-container{
    position: relative;
    display: block;
    box-sizing: border-box;
    overflow: hidden;
  } 
  .slider-desktop-placeholder{
    display: none;
  }
  .placeholder-figures-container{
    width: 100%;
    padding: 10%;
    box-sizing: border-box;
    overflow: hidden;
  }
  .placeholder-left-col{
    width: 30%;
  }
  .placeholder-right-col{
    width: 60%;
    margin-left: 10%;
  }
  .placeholder-circle{
    width: 100%;
    border-radius: 50%;
  }
  .placeholder-circle:after{
    content: "";
    display: block;
    padding-bottom: 100%;
  }
  .placeholder-line{
    position: relative;
    overflow: hidden;
    border-radius: 6px;
  }
  .placeholder-line:after{
    content: "";
    display: block;
    padding-top: 10%;
  }
  .placeholder-line-medium{
    position: relative;
    height: 20px;
  }
  .placeholder-circle-small{
    position: relative;
    width: 20px;
    height: 20px;
    margin-right: 5px;
    border-radius: 50%;
    vertical-align: sub;
  }
  .placeholder-icon{
    position: absolute;
    top: 50%;
    left: 50%;
    width: 20%;
    transform: translateX(-50%);
    -webkit-transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
  }
  .product-placeholder-container{
    position: relative;
  }

  {# /* Notifications */ #}

  .notification-centered {
    left: 5%;
    width: 90%;
  }

  .notification-floating {
    top: initial;
    right: 0;
    bottom: -10px;
    left: 10px;
    width: calc(100% - 20px);
	}

  {# /* Tooltips */ #}

  .tooltip-right-edge {
    top: -60px;
    right: -20%;
  }

  .tooltip-right-edge .tooltip-arrow{
    right: 20%;
  }

	{# /* Modals */ #}

  {# /* Critical mobile modal animation - rest of animations on style.scss.tpl */ #}

  .modal-xs-right.modal.fade,
  .modal-xs-right-out{
    transition: all 1.5s cubic-bezier(.16,.68,.43,.99);
    -webkit-transform: translate3d(200%,0,0);
    -moz-transform: translate3d(200%,0,0);
    -ms-transform: translate3d(200%,0,0);
    -o-transform: translate3d(200%,0,0);
    transform: translate3d(200%,0,0);
  }
  .modal-xs-bottom.modal.fade,
  .modal-xs-bottom-out{
    transition: all 1.5s cubic-bezier(.16,.68,.43,.99);
    -webkit-transform: translate3d(0,100%,0);
    -moz-transform: translate3d(0,100%,0);
    -ms-transform: translate3d(0,100%,0);
    -o-transform: translate3d(0,100%,0);
    transform: translate3d(0,100%,0);
  }

  .modal-xs-bottom.modal.fade,
  .modal-xs-bottom-out{
    transition: all 1.5s cubic-bezier(.16,.68,.43,.99);
    -webkit-transform: translate3d(0,100%,0);
    -moz-transform: translate3d(0,100%,0);
    -ms-transform: translate3d(0,100%,0);
    -o-transform: translate3d(0,100%,0);
    transform: translate3d(0,100%,0);
  }

  .modal-xs-left.modal.fade,
  .modal-xs-left-out{
    transition: all 1.5s cubic-bezier(.16,.68,.43,.99);
    -webkit-transform: translate3d(-100%,0,0);
    -moz-transform: translate3d(-100%,0,0);
    -ms-transform: translate3d(-100%,0,0);
    -o-transform: translate3d(-100%,0,0);
    transform: translate3d(-100%,0,0);
  }

	{# /* Banners */ #}
  

  .textbanner-text {
    margin: -30px 20px 40px 20px;
  }
  .textbanner-button.btn {
    height: 40px;
    padding: 0 15px;
    font-size: 12px;
    line-height: 38px;
  }

  .services{
    float: left;
    margin: 0;
    padding: 0;
  }
  .service-item {
    width: 100%;
    float: left;
    margin: 10px auto;
  }

  {# /* Modules with image and text */ #}
  
  .module-image {
    height: 265px;
  }

  .module-image-placeholder svg {
    left: -50%;
    width: 200%;
  }

  .module-text {
    top: 0;
    width: 100%;
    margin: 265px 0 80px 0;
    transform: none;
  }

  .module-text-promotional {
    top: auto;
    width: auto;
    margin: 0 20px 40px 20px;
  }

  .module-text.module-center {
    left: 0;
    transform: none;
  }
  .module-text-paragraph {
    -webkit-line-clamp: 6;
  }
  .module-text-button.btn {
    height: 40px;
    padding: 0 15px;
    font-size: 12px;
    line-height: 38px;
  }
  

  {# /* //// Header and nav */ #}

  {# /* Ad bar */ #}

  .section-advertising{
    position: fixed;
    z-index: 4001;
    top: 0;
    width: 100%;
  }

	{# /* Logo */ #}

  .logo-container{
    width: 100%;
    margin: auto;
    padding: 110px 0 0 0;
    text-align: center;
  }
  .logo-text{
    display: block;
    margin: 20px auto 10px auto;
    font-size: 18px;
  }
  .logo-img{
    margin: 10px auto;
    max-height:80px;
    max-width: 50%;
  }
  .mobile-logo-home .logo-img{
    max-height: 60px;
    max-width: 60%;
  }
  .mobile-logo-home .logo-img-small{
    max-width: 65%;
    max-height: 40px;
  }
  .mobile-logo-home .logo-img-medium{
    max-width: 65%;
    max-height: 60px;
  }
  .mobile-logo-home .logo-img-big{
    max-width: 80%;
    max-height: 90px;
  }

  {# /* Nav mobile */ #}

  .mobile-nav{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 4000;
  }
  .mobile-nav-first-row{
    height: 50px;
  }
  .mobile-nav-first-row-icon{
    width: 22px;
    height: 22px;
    margin: 10px;
  }

  {# /* Nav mobile title */ #}

  .mobile-nav-title{
    float: left;
    width: 70%;
    margin: 10px 0 0 5px;
    font-size: 16px;
    text-transform: uppercase;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  {# /* Nav mobile tabs */ #}

  .mobile-nav-second-row {
    display: block;
  }
  .mobile-nav-tab {
    position: relative;
    padding: 5px 0 12px 0;
    text-align: center;
    text-transform: uppercase;
    font-size: 12px;
  }
  .mobile-nav-tab-icon{
    width: 20px;
    height: 20px;
    margin: 0 auto 5px auto;
  }
	
	{# /* //// Product grid */ #}

  {# /* Grid item */ #}

  .item-container{
    width: 50%;
    padding: 5px;
  }
  .item-container-slide{
    width: 100%;
  }
  .item-image-container-slide,
  .item-image-slider{
    max-height: 250px;
  }
  .item-colors {
    margin-bottom: 10px;
  }
  .item-colors-bullet-text {
    width: fit-content;
    margin: 0 auto;
  }
  .item-info{
    padding: 5px 5px 10px 5px;
  }
  .item-info:before{
    top: -27px;
    left: -15px;
    border-width: 0 0px 28px 380px;
  }
  .item-name{
    font-size: 10px;
    line-height: inherit;
    letter-spacing: 0px;
  }
  .item-installments{
    display: block;
    font-size: 12px;
  }

  .item-product-reduced .item-image-container,
  .item-product-reduced .item-image-container img {
    height: 150px;
  }

  .item-more-images-message {
    top: initial;
    bottom: 12px;
  }
    
  {# /* //// Product detail */ #}

	{# /* Image */ #}

  .product-slider-container {
    position: relative;
    display: block;
    float: left;
    width: 100%;
    margin-bottom: 20px;
    text-align: center;
  }
  .product-slide,
  .product-slider-image{
    max-height: none!important;
  }
  .cloud-zoom-wrap .mousetrap{
    display: none;
  }

  {# /* Video */ #}
  
  .product-video .video-image {
    max-width: initial;
  }
  .product-video .embed-responsive{
    height: 100%;
    padding-bottom: 0;
  }

  {# /* Form and info */ #}
  
  .product-name{
    font-size: 14px;
  }
  
  {# /* Notification */ #}
  .notification-close {
  	right: 0;
  }
}

{#/*============================================================================
  #Utilities classes
==============================================================================*/#}

{# /*CSS properties like margins, paddings and text align minified, to unminify it you have to copy the code and paste it here http://unminify.com/, after that paste the unminified code here */ #}

.row-flex{display:-ms-flexbox;display:flex;-ms-flex-wrap:wrap;flex-wrap:wrap;margin-right:-15px;margin-left:-15px}.align-items-center{-ms-flex-align:center!important;align-items:center!important}.align-items-baseline{-ms-flex-align:baseline!important;align-items:baseline!important}.col{-ms-flex-preferred-size:0;flex-basis:0;-ms-flex-positive:1;flex-grow:1;max-width:100%}.col-auto{-ms-flex:0 0 auto;flex:0 0 auto;width:auto;max-width:none}.overide-container-width{margin-left:-15px!important;margin-right:-15px!important}.text-danger{color:red!important}.input-error{border:1px solid #cc4845!important}.d-table{display:table}.d-flex{display:flex}.d-inline{display:inline}.d-block{display:block}.d-inline-block{display:inline-block}.d-inline-block-xs{display:none}.hidden-important{display:none!important}.flex-wrap{-ms-flex-wrap:wrap!important;flex-wrap:wrap!important}.center-content{justify-content:center}.p-relative{position:relative!important}.p-absolute{position:absolute!important}.p-fixed{position:fixed}.p-static{position:static}.clear-both{clear:both!important}.opacity-80{opacity:.8!important}.opacity-60{opacity:.6!important}.opacity-50{opacity:.5!important}.opacity-10{opacity:.1!important}.full-height{height:100%!important}.h-auto{height:auto!important}.full-width-container{width: 100%; float: left; clear: both;}.full-width{width:100%!important}.m-top{margin-top:20px!important}.m-top-double{margin-top:40px!important}.m-top-half{margin-top:10px!important}.m-top-quarter{margin-top:5px!important}.m-top-none{margin-top:0!important}.m-right{margin-right:20px!important}.m-right-double{margin-right:40px!important}.m-right-half{margin-right:10px!important}.m-right-quarter{margin-right:5px!important}.m-right-none{margin-right:0!important}.m-bottom{margin-bottom:20px!important}.m-bottom-double{margin-bottom:40px!important}.m-bottom-half{margin-bottom:10px!important}.m-bottom-quarter{margin-bottom:5px!important}.m-bottom-none{margin-bottom:0!important}.m-left{margin-left:20px!important}.m-left-half{margin-left:10px!important}.m-left-quarter{margin-left:5px!important}.m-left-none{margin-left:0!important}.m-all{margin:20px!important}.m-all-half{margin:10px!important}.m-all-quarter{margin:5px!important}.m-auto{margin:auto!important}.m-none{margin:0!important}.p-top{padding-top:20px!important}.p-top-double{padding-top:40px!important}.p-top-half{padding-top:10px!important}.p-top-quarter{padding-top:5px!important}.p-top-none{padding-top:0!important}.p-right{padding-right:20px!important}.p-right-double{padding-right:40px!important}.p-right-half{padding-right:10px!important}.p-right-quarter{padding-right:5px!important}.p-right-none{padding-right:0!important}.p-bottom{padding-bottom:20px!important}.p-bottom-double{padding-bottom:40px!important}.p-bottom-half{padding-bottom:10px!important}.p-bottom-quarter{padding-bottom:5px!important}.p-bottom-none{padding-bottom:0!important}.p-left{padding-left:20px!important}.p-left-double{padding-left:40px!important}.p-left-half{padding-left:10px!important}.p-left-quarter{padding-left:5px!important}.p-left-none{padding-left:0!important}.p-all{padding:20px!important}.p-all-half{padding:10px!important}.p-all-quarter{padding:5px!important}.p-none{padding:0!important}.text-left{text-align:left!important}.text-right{text-align:right!important}.text-center{text-align:center!important}.text-justify{text-align:justify!important}.text-nowrap{white-space:nowrap!important}.text-lowercase{text-transform:lowercase!important}.text-uppercase{text-transform:uppercase!important}.text-capitalize{text-transform:capitalize!important}.text-wrap{-ms-word-break:break-all!important;word-wrap:break-word!important;-webkit-hyphens:auto!important;-moz-hyphens:auto!important;hyphens:auto!important}.text-trim{white-space:nowrap;overflow:hidden;text-overflow:ellipsis}.text-underline{text-decoration:underline}.overflow-none{overflow:hidden}.list-style-disc{list-style: disc}.icon-align-middle{margin-top: 3px; vertical-align: middle;}.align-baseline{vertical-align:baseline!important}.align-top{vertical-align:top!important}.align-middle{vertical-align:middle!important}.align-bottom{vertical-align:bottom!important}.align-text-bottom{vertical-align:text-bottom!important}.align-text-top{vertical-align:text-top!important}.img-fluid{max-width:100%;height:auto}

{# /* // Mobile helpers */ #}

@media (max-width: 767px) {
  .overide-container-width,.overide-container-width-xs{width:100vw!important}.clear-both-xs{clear:both!important}.f-none-xs{float:none!important}.pull-left-xs{float:left!important}.d-inline-block-xs{display:inline-block!important}.d-block-xs{display:block!important}.p-absolute-xs{position:absolute!important}.full-width-xs{width:100%!important}.p-all-half-xs{padding:10px!important}.p-all-quarter-xs{padding: 5px!important}.p-none-xs{padding:0!important}.p-top-xs{padding-top:20px!important}.p-right-double-xs{padding-right:40px!important}.p-top-half-xs{padding-top:10px!important}.p-top-quarter-xs{padding-top:5px!important}.p-top-none-xs{padding-top:0px!important}.p-right-half-xs{padding-right:10px!important}.p-right-quarter-xs{padding-right:5px!important}.p-right-none-xs{padding-right:0!important}.p-bottom-xs{padding-bottom:20px!important}.p-bottom-double-xs{padding-bottom:40px!important}.p-bottom-half-xs{padding-bottom:10px!important}.p-left-half-xs{padding-left:10px!important}.p-left-quarter-xs{padding-left:5px!important}.p-left-none-xs{padding-left:0!important}.m-none-xs{margin:0!important}.m-top-xs{margin-top:20px!important}.m-top-half-xs{margin-top:10px!important}.m-top-quarter-xs{margin-top:5px!important}.m-top-none-xs{margin-top:0!important}.m-right-half-xs{margin-right: 10px!important}.m-bottom-xs{margin-bottom:20px!important}.m-bottom-half-xs{margin-bottom:10px!important}.m-bottom-quarter-xs{margin-bottom:5px!important}.m-bottom-none-xs{margin-bottom:0!important}.m-left-xs{margin-left:20px!important}.m-left-half-xs{margin-left:10px!important}.m-auto-xs{margin: auto!important;}.border-none-xs{border:0!important}.text-center-xs{text-align:center!important}.text-left-xs{text-align:left!important}.horizontal-container{overflow-y:hidden;overflow-x:scroll!important;margin:0}.horizontal-container::-webkit-scrollbar{width:1px!important;height:0!important}.horizontal-container::-webkit-scrollbar-track{background:0 0!important;border-radius:10px!important}.horizontal-container::-webkit-scrollbar-thumb{border-radius:1px!important}.horizontal-container ul,.horizontal-products-scroller{white-space:nowrap!important}.list-unstyled-spaced li{margin-bottom:10px}
}
{% endraw %}
