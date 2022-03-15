<!DOCTYPE html>
<html lang="en">

@include('user.layouts.head')

<body>
<div class="tap-top"><i data-feather="chevrons-up"></i></div>
<div class="page-wrapper compact-wrapper" id="pageWrapper">
    @include('user.layouts.header')
    <div class="page-body-wrapper">
        @include('user.layouts.sidebar')
        <div class="page-body">
            @yield('main-content')
        </div>
        @include('user.layouts.before_footer')
    </div>
</div>
  @include('user.layouts.footer')
</body>

</html>
