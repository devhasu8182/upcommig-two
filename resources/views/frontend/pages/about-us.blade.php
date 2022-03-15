@extends('frontend.layouts.master')
@section('title', Config::get('app.site_name').'|| About Us')

@section('main-content')
<header class="breadcrumb-section">
    
    <div class="container">
        <div class="row wow fadeIn" data-wow-delay="0.5s">
            <div class="col-sm-12">
    
                <h3>About Us</h3>
                <p><a href="/"> <i class="fal fa-home-alt"></i> Home </a> <i
                        class="fas fa-chevron-right"></i> About Us </p>
            </div>
        </div>
    
    </div>
    
</header>
<section class="about-section about-pg-about">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-12 my-auto">
                <div class="base-header base_header_left">
                    <span class="heading_small">
                        About Us
                    </span>
                    <h2> Know About Our Products</h2>
                    <p>Mitions provide full of nutrients milk and are devoid of oxytocin and hormones. Mitions
                        deliver fresh quality and chemical-free milk to our customers.</p>
                    <div class="about_list">
                        <img src="{{ asset('frontend/images/about-icon.png') }}" alt="">
                        <p>Our human body requires a lot of protein, calcium, for humans. Proteins, fats, carbs,
                            vitamins, and minerals are all important for the human body. Cow milk is procured,
                            processed, manufactured, and sold.                        </p>
                    </div>
                </div>
            </div>
            <!-- /.about_wrp-->
            <div class="col-lg-6 col-md-12" id="scene">
                <div class="about_img layer" data-depth="0.20">
                    <img src="{{ asset('frontend/images/home-banner-2.png') }}" alt="image">
                </div>
            </div>
        </div>

        <!-- Start: History Section -->
        <div class="history-section">
            <div class="row">
                <!-- /. col-md-4 -->
                <div class="col-md-4">
                    <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist"
                        aria-orientation="vertical">
                        <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill"
                            data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home"
                            aria-selected="true">milk quality</button>
                        <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill"
                            data-bs-target="#v-pills-profile" type="button" role="tab"
                            aria-controls="v-pills-profile" aria-selected="false">Mitions motto</button>
                        <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill"
                            data-bs-target="#v-pills-messages" type="button" role="tab"
                            aria-controls="v-pills-messages" aria-selected="false">Our Vission</button>
                    </div>
                </div>
                <!-- /. col-md-4 -->
                <div class="col-md-8">
                    <div class="tab-content" id="v-pills-tabContent">
                        <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel"
                            aria-labelledby="v-pills-home-tab">
                            <div class="base-header base_header_left">
                              
                                <p>We collect fresh milk from a rural area from a different place. We also check the milk quality
                                    when we collect milk from people. Our techniques are on par with the world's most
                                    advanced.</p>                            
                            </div>
                        </div>
                        <!-- End: History content -->
                        <div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
                            aria-labelledby="v-pills-profile-tab">
                            <div class="base-header base_header_left">
                          
                                <p>Mitions motto is to provide the best quality milk to all of us and make a healthy nation.
                                    Discover fresh milk and deliver it to every people who want fresh milk every morning.</p>                               
                            </div>
                        </div>
                        <!-- End: Mission content -->

                        <div class="tab-pane fade" id="v-pills-messages" role="tabpanel"
                            aria-labelledby="v-pills-messages-tab">
                            <div class="base-header base_header_left">
                                
                                <p>Our human body requires a lot of protein, calcium, for humans. Proteins, fats, carbs,
                                    vitamins, and minerals are all important for the human body. Cow milk is procured,
                                    processed, manufactured, and sold.
                                    </p>

                            </div>
                        </div>
                        <!-- End: Vission content -->
                    </div>
                </div>
                <!-- /. col-md-8 -->
            </div>
            <!-- /. row -->
        </div>
        <!-- End: History  Section -->
    </div>
    <!-- /. container -->
</section>
@endsection
