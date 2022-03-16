<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title')</title>

    <link type="image/x-icon" rel="icon" href="{{asset('backend_user/assets/images/logo/favicon-icon.png')}}">
    <link type="image/x-icon" rel="shortcut icon" href="{{asset('backend_user/assets/images/logo/favicon-icon.png')}}">

    <link
        href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
        rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap"
        rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="{{asset('backend_user/assets/css/vendors/font-awesome.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('backend_user/assets/css/vendors/icofont.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('backend_user/assets/css/vendors/themify.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('backend_user/assets/css/vendors/flag-icon.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('backend_user/assets/css/vendors/feather-icon.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('backend_user/assets/css/vendors/scrollbar.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('backend_user/assets/css/vendors/datatables.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('backend_user/assets/css/vendors/owlcarousel.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('backend_user/assets/css/vendors/rating.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('backend_user/assets/css/vendors/bootstrap.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('backend_user/assets/css/style.css')}}">
    <link id="color" rel="stylesheet" media="screen" href="{{asset('backend_user/assets/css/color-1.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('backend_user/assets/css/responsive.css')}}">
    <link href="{{asset('backend_user/assets/css/snackbar.min.css')}}" rel="stylesheet">
    @stack('styles')
</head>
