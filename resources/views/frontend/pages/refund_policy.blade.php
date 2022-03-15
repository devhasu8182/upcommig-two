@extends('frontend.layouts.master')
@section('title', Config::get('app.site_name').'|| Refund Policy')

@section('main-content')
  
<header class="breadcrumb-section">
    
    <div class="container">
        <div class="row wow fadeIn" data-wow-delay="0.5s">
            <div class="col-sm-12">
    
                <h3>Refund Policy</h3>
                <p><a href="/"> <i class="fal fa-home-alt"></i> Home </a> <i
                        class="fas fa-chevron-right"></i> Refund Policy </p>
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
                        Refund Policy
                    </span>
                    <h2> Know About Our Products</h2>
                    
                    <h4>Refunds & Cancellation Policies :</h4>
                    <p> Thanks for shopping at mitions. We appreciate the fact that you like to buy the stuff we build. We also want to make sure you have a rewarding experience while you’re exploring, evaluating, and purchasing our products.</p>
                    <p> As with any shopping experience, there are terms and conditions that apply to transactions at mitions. We’ll be as brief as our attorneys will allow. The main thing to remember is that by placing an order or making a purchase at mitions, you agree to the terms set forth below along withmitions’s Privacy Policy. If there’s something wrong with the product you bought, or if you are not happy with it, you will be able to issue a refund for your item. And for that you need to know refund policies.</p>

                    <h4>Refunds</h4>
                    <p> We at Mitions commit ourselves to serving our customers with the best products. Every single product that you choose is thoroughly inspected, checked for defects and packaged with utmost care. We do this to ensure that you fall in love with our products.</p>
                    <p> Sadly, there are times when we may not have the product(s) that you choose in stock, or may face some issues with our inventory and quality check. In such cases, we may have to cancel your order. You will be intimated about it in advance so that you don’t have to worry unnecessarily about your order. If you have purchased via Online payment (not Cash on Delivery), then you will be refunded once our team confirms your request.</p>
                    <p> We carry out thorough quality check before processing the ordered item. We take utmost care while packing the product. At the same time we ensure that the packing is good such that the items won’t get damaged during transit. Please note that motions is not liable for damages that are caused to the items during transit or transportation.</p>

                    <ol>
                        <li> We follow certain policies to ensure transparency, efficiency and quality customer care:</li>
                        <li> We DO NOT allow returns on sold products – online or in retail outlets.</li>
                        <li> We DO NOT accept returned goods, as we believe that customers should get the best quality products. Refunds are NOT given for any purchases made – be they online or in retail store.</li>
                        <li> We DO NOT encourage exchanges of our products.</li>
                        <li> We DO NOT engage in reselling used products and discourage the same, because we cannot ensure the best quality products for our customers.</li>
                        <li> We DO NOT support Exchanges or Returns.</li>
                        <li> If you cancel the order before we process it and dispatch for shipping, a refund can be processed. Orders generally take 1- 2 days to process before dispatch.</li>
                        <li> Orders already in shipping cannot be returned, canceled or refunded. If you face any issues, please contact our Support Team immediately.</li>                        
                    </ol>

                    <h4>Product Availability and Limitations :</h4>
                    <p> Given the popularity and/or supply constraints of some of our products, motions may have to limit the number of products available for purchase. Trust us, we’re building them as fast as we can. mitions reserves the right to change quantities available for purchase at any time, even after you place an order.</p>
                    <p> Furthermore, there may be occasions when mitions confirms your order but subsequently learns that it cannot supply the ordered product. In the event we cannot supply a product you ordered, mitions will cancel the order and refund your purchase price in full.</p>

                    <h4>Your Consent :</h4>
                    <p>By using our platform, registering an account, or making a purchase, you hereby consent to our Return & Refund Policy and agree to its terms.</p>

                    <h4>Changes To Our Return & Refund Policy :</h4>
                    <p> Should we update, amend or make any changes to this document so that they accurately reflect our Service and policies. Unless otherwise required by law, those changes will be prominently posted here.</p>
                    <p> Then, if you continue to use the Service, you will be bound by the updated Return & Refund Policy. If you do not want to agree to this or any updated Return & Refund Policy, you can delete your account.</p>

                    <h4>Contact Us :</h4>
                    <p> If, for any reason, You are not completely satisfied with any good or service that we provide, don’t hesitate to contact us and we will discuss any of the issues you are going through with our product, contact us via 
                        Email: {{Config::get('app.site_email')}}</p>




                </div>
            </div>         
        </div>
    </div>
    <!-- /. container -->
</section>
@endsection
