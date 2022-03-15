@extends('frontend.layouts.master')
@section('title', Config::get('app.site_name').'|| Login')
@section('main-content')
<section class="account-section">
    <div class="container">
        <div class="row">          
            <div class="col-lg-6 col-sm-12" style="margin: 0px auto;"   >
                <div class="login-form">
                    <h2> Login to Your Account </h2>
                    <form method="post" action="{{route('login.submit')}}">
                        @csrf
                        <input class="login-field" type="email" name="email" required="required" value="{{old('email')}}" placeholder="Enter Your Email">
                        @error('email')
                            <span class="text-danger">{{$message}}</span>
                        @enderror

                        <input class="login-field" type="password" name="password" required="required" value="{{old('password')}}" placeholder="Enter Your Password">
                        @error('password')
                            <span class="text-danger">{{$message}}</span>
                        @enderror                                                
                        <div class="submit-area">
                            <button class="submit more-link">Login </button>                            
                            
                            <div class="col-sm-12">
                                <div class="term-and-condition mt-2">                                        
                                    <label for="term" >Creaet Have New Account? <a href="{{route('register.form')}}"> Register here </a>                                                
                                </div>
                            </div>                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
