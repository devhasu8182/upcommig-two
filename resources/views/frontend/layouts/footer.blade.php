<footer class="footer-section">
    <div class="container">
        <div class="row">
            <!-- Start: About -->
            <div class="col-lg-3 col-md-6 col-sm-12">
                <div class="widget">
                    <div class="footer_logo">
                        <img class="img-responsive" src="{{asset('frontend/images/footer-logo.png')}}" alt="">
                    </div>
                    <div class="footer_p">
                        <p class="footer_para">Mitions provide full of nutrients milk and are devoid of oxytocin and hormones. Mitions deliver fresh quality and chemical-free milk to our customers.</p>
                    </div>                    
                </div>
            </div>

            <div class="col-lg-6 col-md-6 col-sm-12">
                <div class="widget quick_lnk">
                    <ul>
                        <li>
                            <a href="/"> <span>></span>Home</a>
                        </li>
                        <li>
                            <a  href="{{route('about-us')}}"> <span>></span>About Us</a>
                        </li>
                        <li>
                            <a href="{{route('privacy-policy')}}"><span>></span> Privacy Policy</a>
                        </li>
                        <li>
                            <a href="{{route('refund-policy')}}"><span>></span> Refund Policy</a>
                        </li>
                        <li>
                            <a href="{{route('shipping-and-returns')}}"><span>></span>Shipping And Returns</a>
                        </li>
                        <li>
                            <a href="{{route('tc-page')}}"><span>></span>Terms & Conditions</a>
                        </li>
                    </ul>
                </div>
            </div>              

            <div class="col-lg-3 col-md-6 col-sm-12">
                <div class="widget">
                    <div class="footer_contact">
                        <div class="footer_contact_address">
                            <div class="footer-contact-icon">
                                <i class="far fa-envelope-open"></i>
                            </div>
                            <div class="footer-contact-text">
                                <span>{{Config::get('app.site_email')}}</span>
                            </div>
                        </div>

                        <div class="footer-contact-address">
                            <div class="footer-contact-icon">
                                <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <div class="footer-contact-text">
                                <span>{{Config::get('app.location')}}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="subfooter_wrap">
            <div class="subfooter">
                <p>{{now()->year}} © Copyright <a href="/">mitions.</a> All rights Reserved.</p>
            </div>       
        </div>
    </div>
</footer>

<div class="scrollup">
    <a href="#top"> <i class="fal fa-chevron-double-up"></i> </a>
</div>
        
<!-- Js Plugins -->
<script src="{{asset('frontend/js/jquery.min.js')}}"></script>
<script src="{{asset('frontend/js/plugins.js')}}"></script>
<script src="{{asset('frontend/js/bootstrap.min.js')}}"></script>
<script src="{{asset('frontend/js/slick.min.js')}}"></script>
<script src="{{asset('frontend/js/owl-carousel.js')}}"></script>
<script src="{{asset('frontend/js/isotope.js')}}"></script>
<script src="{{asset('frontend/js/magnific-popup.js')}}"></script>
<script src="{{asset('frontend/js/jquery.ajaxchimp.min.js')}}"></script>
<script src="{{asset('frontend/js/stellar.min.js')}}"></script>
<script src="{{asset('frontend/js/main.js')}}"></script>
<script src="{{asset('frontend/js/jquery.toaster.js ')}}"></script>
	@stack('scripts')
