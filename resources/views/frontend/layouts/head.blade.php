<!-- Meta Tag -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="csrf-token" content="{{ csrf_token() }}">

@yield('meta')
<!-- Title Tag  -->
<title>@yield('title')</title>
<!-- Favicon -->

<link rel="icon" type="image/png" href="{{asset("frontend/images/favicon.svg")}}">

    <!-- Css Styles -->
    <link href="{{asset('frontend/css/animate.css')}}" rel="stylesheet">
    <link href="{{asset('frontend/css/hover.css')}}" rel="stylesheet">
    <link rel="stylesheet" href="{{asset('frontend/css/magnific-popup.css')}}">
    <link href="{{asset('frontend/css/owl.carousel.css')}}" rel="stylesheet">
    <link rel="stylesheet" href="{{asset('frontend/css/slick.css')}}">
    <link rel="stylesheet" href="{{asset('frontend/css/fontawesome.min.css')}}">
    <link href="{{asset('frontend/css/bootstrap.min.css')}}" rel="stylesheet">
    <link href="{{asset('frontend/css/normalize.css')}}" rel="stylesheet">
    <link href="{{asset('frontend/css/style.css')}}" rel="stylesheet">
    <link href="{{asset('frontend/css/responsive.css')}}" rel="stylesheet">

@stack('styles')
<style>
    .alert-success button{
        display: none;
    }
    .alert-danger button{
        display: none;
    }
		
</style>
