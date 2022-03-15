<!DOCTYPE html>
<html lang="en">

<head>
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <title>Config::get('app.site_name').'|| Login'</title>
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

</head>

{{-- <body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9 mt-5">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                  </div>
                  <form class="user"  method="POST" action="{{ route('login') }}">
                    @csrf
                    <div class="form-group">
                      <input type="email" class="form-control form-control-user @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Enter Email Address..."  required autocomplete="email" autofocus>
                        @error('email')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user @error('password') is-invalid @enderror" id="exampleInputPassword" placeholder="Password"  name="password" required autocomplete="current-password">
                         @error('password')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    
                    </div>
                    <div class="form-group">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                            <label class="form-check-label" for="remember">
                                {{ __('Remember Me') }}
                            </label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary btn-user btn-block">
                      Login
                    </button>
                  </form>
                  <hr>
                   
                  <div class="text-center">
                    @if (Route::has('password.request'))
                        <a class="btn btn-link small" href="{{ route('password.request') }}">
                            {{ __('Forgot Your Password?') }}
                        </a>
                    @endif
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>
</body> --}}
<div class="navigation">
  <div class="container">
      <div class="row">
      <div class="logo col-md-3 col-sm-3">
              <a href="/">
                  <img class="img-res6ponsive" src="{{asset('frontend/images/logo.png')}}" alt="hylik">        
              </a>
          </div>
  
      </div>
      <!--/ row -->
  </div>
  <!--/ container -->
</div>
<div class="container">
  <div class="row">          
      <div class="col-lg-6 col-sm-12" style="margin: 0px auto;"   >
          <div class="login-form">
              <h2> Welcome Back! </h2>
              <form method="POST" action="{{ route('login') }}">
                  @csrf                  
                  <input type="email" class="login-field" name="email" value="{{ old('email') }}" id="exampleInputEmail"  placeholder="Enter Email Address..."  required autocomplete="email" autofocus>
                  @error('email')
                      <span class="invalid-feedback" role="alert">
                          <strong>{{ $message }}</strong>
                      </span>
                  @enderror              
                  <input type="password" class="login-field" id="exampleInputPassword" placeholder="Password"  name="password" required autocomplete="current-password">
                  @error('password')
                      <span class="invalid-feedback" role="alert">
                          <strong>{{ $message }}</strong>
                      </span>
                  @enderror                                           
                  <div class="submit-area">
                      <button class="submit more-link">Login </button>                                                                                            
                  </div>
              </form>
          </div>
      </div>
  </div>
</div>
</html>
