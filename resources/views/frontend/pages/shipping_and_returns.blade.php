@extends('frontend.layouts.master')
@section('title', Config::get('app.site_name').'| Shipping And Returns')

@section('main-content')

<header class="breadcrumb-section">

    <div class="container">
        <div class="row wow fadeIn" data-wow-delay="0.5s">
            <div class="col-sm-12">

                <h3>Shipping And Returns</h3>
                <p><a href="/"> <i class="fal fa-home-alt"></i> Home </a> <i
                        class="fas fa-chevron-right"></i> Shipping And Returns</p>
            </div>
        </div>

    </div>

</header>

<section class="about-section about-pg-about">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 my-auto">
                <div class="base-header base_header_left">
                    <span class="heading_small">
                        Shipping And Returns
                    </span>
                    <p> After receiving an order we check the quality of milk and then we package all orders smoothly. We make every effort to ensure that customer receives their orders in a timely and hassle-free.</p>
                    <p> We have a well-trained employee who is working for a long time in our company. And they working with the latest technology. We also try to get our customers to receive the same quality of milk that they ordered.</p>
                    <p> We deliver the customers order as soon as possible to the delivery address.</p>

                </div>
            </div>
        </div>
    </div>
    <!-- /. container -->
</section>
@endsection
