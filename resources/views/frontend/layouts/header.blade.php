<div class="navigation">
    <div class="container">
        <div class="row">
        <div class="logo col-md-3 col-sm-3">
                <a href="/">
                    <img class="img-res6ponsive" src="{{asset('frontend/images/logo.png')}}" alt="hylik">        
                </a>
            </div>
            <div class="col-md-7 col-sm-7">
                <div id="navigation">
                    <ul>
                        <li class="{{Request::path()=='/' ? 'active' : ''}}">
                            <a href="{{route('home')}}">Home</a>        
                        </li>                    
                        <li class="@if(Request::path()=='products'||Request::path()=='products')  active  @endif">
                            <a href="{{route('product-grids')}}">Products</a>        
                        </li>        
                        <li class="{{Request::path()=='about-us' ? 'active' : ''}}">
                            <a href="{{route('about-us')}}">About Us</a>        
                        </li>      

                        <li class="{{Request::path()=='contact' ? 'active' : ''}}">
                            <a href="{{route('contact')}}">Contact Us</a>        
                        </li>      
                        <li class="has-sub"><a href="javascript:void(0);">Customer</a>
                            <ul>
                                @auth
                                    @if(Auth::user()->role=='admin')
                                        <li><a href="{{route('admin')}}"  target="_blank">Dashboard</a></li>                            
                                    @else
                                        <li><a href="{{route('user')}}"  target="_blank">Dashboard</a></li>
                                    @endif
                                    <li><a href="{{route('user.logout')}}">Logout</a></li>
                                @else
                                    <li><a href="{{route('login.form')}}">Login</a></li>
                                    <li><a href="{{route('register.form')}}">Register</a></li>
                                @endauth                        
                            </ul>
                        </li>                                                                               
                    </ul>
                </div>
                <!-- End: Menu  -->
            </div>

            <!-- Start: Search & Cart  -->
            <div class="header_cart col-md-2 col-sm-2">
                <ul>                
                    <li class="header_cart_icon">                                  
                        @auth
                            <a href="javascript:void(0);">
                                <i class="fal fa-shopping-cart"></i>
                            </a>
                        @else
                            <a href="{{route('cart')}}">
                                <i class="fal fa-shopping-cart"></i>
                            </a>                    
                        @endauth                    
                        <span class="cart_count"> {{Helper::cartCount()}} </span>
                    </li>                
                </ul>
            </div>
            <!-- End: Cart  -->
        </div>
        <!--/ row -->
    </div>
    <!--/ container -->
</div>

@auth
    <section class="cart_sidebar_info transition-3">
        <div class="info_inner transition-3">
            <div class="menu_sidebar_logo">
                <img src="{{asset('frontend/images/footer-logo.png')}}" alt="">
                <a href="javascript:void(0);" class="cart_sidebar_close-btn"><i class="fa fa-times"></i></a>
            </div>
            <!-- /. logo  -->

            <!-- Cart item -->
            <div class="cart-modal-body">
                <h2>My Cart</h2>
                @foreach(Helper::getAllProductFromCart() as $data)
                    @php
                        $photo=explode(',',$data->product['photo']);
                    @endphp
                    
                <div class="cart-modal-product-wrap">
                    <div class="cart-modal-product">
                        <div class="cart-modal-img">
                            <a href="{{route('product-detail',$data->product['slug'])}}" target="_blank">
                                <img src="{{$photo[0]}}" alt="{{$photo[0]}}">
                            </a>
                        </div>
                        <div class="cart-modal-content">
                            <h4><a href="{{route('product-detail',$data->product['slug'])}}" target="_blank">{{$data->product['title']}}</a></h4>
                            <div class="cart-modal-action">
                                <div class="cart-modal-action-item">
                                    <div class="cart-modal-quantity">
                                        <p>{{$data->quantity}}</p>
                                        <p> x </p>
                                        <p class="cart-quantity-price">₹ {{number_format($data->price,2)}}</p>
                                    </div>
                                </div>
                                <div class="cart-modal-delete">
                                    <a href="#"><i class="icofont-ui-delete"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>            
                </div>
                @endforeach
                {{-- <div class="cart-modal-product-wrap">
                    <div class="cart-modal-product">
                        <div class="cart-modal-img">
                            <a href="shop.html">
                                <img src="images/product2.jpg" alt="product">
                            </a>
                        </div>
                        <div class="cart-modal-content">
                            <h4><a href="shop-details.html">Organic Grassfed Butter </a></h4>
                            <div class="cart-modal-action">
                                <div class="cart-modal-action-item">
                                    <div class="cart-modal-quantity">
                                        <p>1</p>
                                        <p>x</p>
                                        <p class="cart-quantity-price">$ 8.30</p>
                                    </div>
                                </div>
                                <div class="cart-modal-delete">
                                    <a href="#"><i class="icofont-ui-delete"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>            
                </div> --}}
                <div class="cart-modal-total">
                    <p>Total</p>
                    <h3>₹ {{number_format(Helper::totalCartPrice(),2)}}</h3>
                </div>
                <div class="cart-modal-button">
                    <a href="{{route('checkout')}}" class="slider_btn_one more-link ">Proceed To Checkout</a>
                    <a href="{{route('cart')}}" class="slider_btn_one more-link ">View Shopping Cart</a>
                </div>
            </div>
            <!-- end: Cart item -->
        </div>
      
    </section>
    <div class="body-overlay transition-3"></div>
@endauth