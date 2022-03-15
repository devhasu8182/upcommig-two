<!DOCTYPE html>
<html lang="en">
<head>
	@include('frontend.layouts.head')

</head>
<body class="js">

	<!-- Preloader -->
	<div class="preloader">
        <div class="loader loader1"></div>
        <div class="loader loader2"></div>
        <div class="loader loader3"></div>
        <div class="loader loader4"></div>
        <div class="loader loader5"></div>
        <div class="loader loader6"></div>
        <div class="loader loader7"></div>
        <div class="loader loader8"></div>
    </div>
	<!-- End Preloader -->

	@include('frontend.layouts.notification')
	<!-- Header -->
	@include('frontend.layouts.header')
	<!--/ End Header -->

    @yield('main-content')

	@include('frontend.layouts.footer')

</body>
</html>
