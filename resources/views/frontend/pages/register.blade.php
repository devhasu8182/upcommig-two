@extends('frontend.layouts.master')
@section('title', Config::get('app.site_name').'|| Register')
@section('main-content')
<section class="account-section">
    <div class="container">
        <div class="row">          
            <div class="col-lg-6 col-sm-12" style="margin: 0px auto;"   >
                <div class="registration-form">
                    <h2> New User Signup! </h2>
                    <form method="post" action="{{route('register.submit')}}">
                        @csrf
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <input class="signup-field" name="name" id="fname" type="text"  required="required"
                                    placeholder="Full Name" value="{{old('name')}}">
                                    @error('name')
                                        <span class="text-danger">{{$message}}</span>
                                    @enderror
                            </div>
                            <div class="col-md-12 col-sm-12">
                                <input type="email" class="signup-field" name="email"  required="required" value="{{old('email')}}"
                                    placeholder="Email address">
                                    @error('email')
                                        <span class="text-danger">{{$message}}</span>
                                    @enderror
                            </div>

                            <div class="col-md-12 col-sm-12">
                                <input class="signup-field" type="password" name="password" required="required" value="{{old('password')}}"
                                    placeholder="Password">
                                    @error('password')
                                        <span class="text-danger">{{$message}}</span>
                                    @enderror
                            </div>

                            <div class="col-md-12 col-sm-12">
                                <input class="signup-field" type="password" name="password_confirmation" required="required" value="{{old('password_confirmation')}}"
                                    placeholder="Confirm Password">
                                    @error('password_confirmation')
                                        <span class="text-danger">{{$message}}</span>
                                    @enderror
                            </div>
                                                    
                            <div class="col-sm-12 submit-area">
                                <button type="submit" class="submit more-link"> Sign Up </button>                                
                                <div class="col-sm-12">
                                    <div class="term-and-condition mt-2">                                        
                                        <label for="term">Already have Account?  <a href="{{route('login.form')}}"> Login here </a>                                                
                                    </div>
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
