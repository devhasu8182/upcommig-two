@extends('frontend.layouts.master')
@section('title', Config::get('app.site_name').'|| Contact Us')
@section('main-content')
<header class="breadcrumb-section">

    <div class="container">
        <div class="row wow fadeIn" data-wow-delay="0.5s">
            <div class="col-sm-12">
                <h3>Contact Us</h3>
                <p><a href="/"> <i class="fal fa-home-alt"></i> Home </a> <i
                        class="fas fa-chevron-right"></i> Contact Us </p>
            </div>
        </div>
    </div>
</header>


<section class="contact-section contact_pg_contact">
    <div class="container">
        <div class="contact_wrp">
            <div class="row">

                <div class="col-lg-4 col-sm-12">
                    <!-- Start: Heading -->
                    <div class="base-header base_header_left">
                        <span class="heading_small">Message</span>
                        <h2> Get in touch </h2>
                    </div>
                    <!-- End: Heading -->
                    <div class="contact_pg_address">
                        <div class="single_con_add">
                            <a href="#"><i class="fas fa-map-marked-alt"></i></a>
                            <span>Location</span>
                            <h4 style="font-size: 15px">{{Config::get('app.location')}}</h4>
                        </div>
                        <div class="single_con_add">
                            <a href="#"><i class="fas fa-envelope-open-text"></i></a>
                            <span>Email </span>
                            <h4>{{Config::get('app.site_email')}}</h4>
                        </div>
                        <div class="single_con_add">
                            <a href="#"><i class="fas fa-phone-alt"></i></a>
                            <span>Phone</span>
                            <h4>{{Config::get('app.phone')}}</h4>
                        </div>
                    </div>
                </div>
                <!--  Contact Form  -->
                <div class="col-lg-8 col-sm-12 contact-form-warper">
                    <form method="post" action="{{route('contact.store')}}" id="contact-form">
                        @csrf
                        <div class="row">
                            <div class="col-lg-12 contact_col_left">
                                <div class="row">
                                    <div class="col-lg-6 col-sm-12">
                                        <label for="name"><i class="fal fa-user"></i>
                                            <input name="name" id="name" type="text" placeholder="Enter your name" class="con-field">
                                        </label>
                                    </div>
                                    <div class="col-lg-6 col-sm-12">
                                        <label for="email"><i class="fal fa-envelope"></i>
                                            <input name="email" type="email" id="email" placeholder="Enter email address" class="con-field">
                                        </label>
                                    </div>

                                    <div class="col-lg-6 col-sm-12">
                                        <label for="phone"><i class="fal fa-phone"></i>
                                            <input id="phone" name="phone" type="number" placeholder="Enter your phone" class="con-field">
                                        </label>
                                    </div>
                                    <div class="col-lg-6 col-sm-12">
                                        <label for="subject"><i class="fal fa-sticky-note"></i>
                                            <input name="subject" type="text" id="subject" placeholder="Enter Subject" class="con-field">
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 contact_col_right">
                                <div class="row">
                                    <div class="col-lg-12 col-sm-12">
                                        <label for="message"><i class="fal fa-pencil-alt"></i>
                                            <textarea class="con-field" name="message" id="message" rows="6"
                                                placeholder="Case Details"></textarea>
                                        </label>
                                    </div>
                                    <div class="col-sm-12 contact_col_full">
                                        <input type="submit" id="submit-contact" class="btn-alt" value="Submit Now" >
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- row /- -->
        </div>
    </div>
    <!-- container /- -->
</section>

@endsection
