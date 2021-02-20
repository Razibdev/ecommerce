<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@if(!empty($meta_title)){{$meta_title}} @else Home | E-Shopper @endif</title>
    @if(!empty($meta_description))
     <meta name="description" content="{{$meta_description}}">
    @endif

    @if(!empty($meta_keywords))
    <meta name="meta_keywords" content="{{$meta_keywords}}">
    @endif
        <link href="{{asset('front/css/bootstrap.min.css')}}" rel="stylesheet">
    <link href="{{asset('front/css/font-awesome.min.css')}}" rel="stylesheet">
    <link href="{{asset('front/css/prettyPhoto.css')}}" rel="stylesheet">
    <link href="{{asset('front/css/price-range.css')}}" rel="stylesheet">
    <link href="{{asset('front/css/animate.css')}}" rel="stylesheet">
    <link href="{{asset('front/css/main.css')}}" rel="stylesheet">
    <link href="{{asset('front/css/easyzoom.css')}}" rel="stylesheet">
    <link href="{{asset('front/css/passtrength.css')}}" rel="stylesheet">
    <link href="{{asset('front/css/responsive.css')}}" rel="stylesheet">
    <link rel="stylesheet" href="http://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css">
    <link rel="shortcut icon" href="{{asset('front/images/ico/favicon.ico')}}">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="{{asset('front/images/ico/apple-touch-icon-144-precomposed.png')}}">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="{{asset('front/images/ico/apple-touch-icon-114-precomposed.png')}}">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="{{asset('front/images/ico/apple-touch-icon-72-precomposed.png')}}">
    <link rel="apple-touch-icon-precomposed" href="{{asset('front/images/ico/apple-touch-icon-57-precomposed.png')}}">
    <script type='text/javascript' src='https://platform-api.sharethis.com/js/sharethis.js#property=5fa39b45420a440019cbdd2b&product=inline-share-buttons' async='async'></script>
    <style>
        .active {
            background: none;
            color: #fdb45e;
        }
    </style>
    @stack('css')
</head><!--/head-->

<body>
@include('layouts.front_layout.front_header')

@yield('content')

@include('layouts.front_layout.front_footer')



<script src="{{asset('front/js/jquery.js')}}"></script>
<script src="{{asset('front/js/bootstrap.min.js')}}"></script>
<script src="{{asset('front/js/jquery.scrollUp.min.js')}}"></script>
<script src="{{asset('front/js/price-range.js')}}"></script>
<script src="{{asset('front/js/jquery.prettyPhoto.js')}}"></script>
<script src="{{asset('front/js/easyzoom.js')}}"></script>
<script src="{{asset('front/js/passtrength.js')}}"></script>
<script src="{{asset('front/js/jquery.form.js')}}"></script>


<script src="{{asset('front/js/main.js')}}"></script>
<script src="{{asset('front/js/jquery.validate.js')}}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>

<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5fa16d21703d254e"></script>


<script src="http://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
{!! Toastr::message() !!}

@stack('js')
</body>
</html>
