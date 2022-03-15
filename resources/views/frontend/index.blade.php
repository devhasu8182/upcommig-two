@extends('frontend.layouts.master')
@section('title', Config::get('app.site_name').' | Fresh Milk')


@section('main-content')
    <div class="slides_wrapper">
        <div class="slider_home" id="slider_owl">
            <div class="single_slider slide_bg_1">
                <div class="slider_item_tb">
                    <div class="slider_item_tbcell">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-10 col-sm-12">
                                    <h5>Order Fresh Milk</h5>
                                    <h2>
                                        Drink Raw Milk & <span> Eat Raw Cheese </span>
                                    </h2>
                                    <div class="slider_btn">
                                        <a href="{{route('product-grids')}}" class="slider_btn_one more-link">Shop Now <i
                                            class="far fa-chevron-double-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider slide_bg_2">
                <div class="slider_item_tb">
                    <div class="slider_item_tbcell">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-10 col-sm-12">
                                    <h5>Order Fresh Milk</h5>
                                    <h2>
                                        Drink Raw Milk & <span> Eat Raw Cheese</span>
                                    </h2>
                                    <div class="slider_btn">
                                        <a href="{{route('product-grids')}}" class="slider_btn_one more-link">Shop Now <i
                                                class="far fa-chevron-double-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <section class="shop-section">
        <div class="container">
            <div class="base-header">
                <span class="heading_small"> FRESH MILK </span>
                <h2>Most Selling Products</h2>
            </div>
            <div class="row shop-carousel">
                @if($product_lists)
                    @foreach($product_lists as $key=>$product)
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <div class="product-wrap">

                                <div class="product-img">
                                        @php
                                            $photo=explode(',',$product->photo);
                                        @endphp
                                    <a href="{{route('product-detail',$product->slug)}}" class="hii">
                                        <img src="{{$photo[0]}}" alt="{{$photo[0]}}">
                                    </a>
                                    <span class="prod_badges">
                                        @if($product->stock<=0)
                                            <span class="sale">Sale out</span>
                                        @elseif($product->condition=='new')
                                            <span class="sale">New</span>
                                        @elseif($product->condition=='hot')
                                            <span class="sale">Hot</span>
                                        @else
                                            <span class="sale">{{$product->discount}}%</span>
                                        @endif
                                    </span>
                                    <div class="prod_love">
                                        <a class="cart-icon" title="Add to cart" href="{{route('add-to-cart',$product->slug)}}"><i class="fal fa-shopping-cart"></i></a>
                                    </div>
                                </div>

                                <div class="product-info">
                                    {{-- <div class="prod_rating">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                    </div> --}}
                                    <a href="{{route('product-detail',$product->slug)}}">
                                        <h4>{{$product->title}}</h4>
                                    </a>
                                    <p class="prod_price">
                                        @php
                                            $after_discount=($product->price-($product->price*$product->discount)/100);
                                        @endphp
                                        <span class="new">₹ {{number_format($after_discount,2)}}</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @endif
            </div>
        </div>
    </section>

    <section class="cta-section">
        <div class="container">
            <div class="row">
                <div class="cta-wrap">
                    <div class="base-header">
                        <span class="heading_small"> Organic Food Services </span>
                    </div>
                    <h2> Delivering organic integrity to
                        <span> everyone, everywhere. </span>
                    </h2>
                    <a href="{{route('product-grids')}}" class="more-link">Shop Now<i
                            class="far fa-chevron-double-right"></i></a>
                </div>
            </div>
        </div>
    </section>


    <section class="shop-section">
        <div class="container">
            <div class="base-header">
                <span class="heading_small"> shop </span>
                <h2>Latest Products</h2>
            </div>
            <div class="row">
                <div class="shop-carousel" id="shop_carousel">
                    @php
                        $product_lists=DB::table('products')->where('status','active')->orderBy('id','DESC')->limit(10)->get();
                    @endphp

                    @foreach($product_lists as $product)
                        <div class="product-wrap">
                            <div class="product-img">
                                @php
                                    $photo=explode(',',$product->photo);
                                @endphp
                                    <a href="{{route('product-detail',$product->slug)}}">
                                        <img src="{{$photo[0]}}" alt="{{$photo[0]}}">
                                    </a>
                                    <span class="prod_badges">
                                    @if($product->stock<=0)
                                        <span class="sale">Sale out</span>
                                    @elseif($product->condition=='new')
                                        <span class="sale">New</span>
                                    @elseif($product->condition=='hot')
                                        <span class="sale">Hot</span>
                                    @else
                                        <span class="sale">{{$product->discount}}%</span>
                                    @endif
                                </span>
                                <div class="prod_love">
                                    <a class="cart-icon" title="Add to cart" href="{{route('add-to-cart',$product->slug)}}"><i class="fal fa-shopping-cart"></i></a>
                                </div>
                            </div>
                            <div class="product-info">
                                {{-- <div class="prod_rating">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div> --}}
                                <a href="{{route('product-detail',$product->slug)}}">
                                    <h4>{{$product->title}}</h4>
                                </a>
                                <p class="prod_price">
                                    @php
                                        $after_discount=($product->price-($product->price*$product->discount)/100);
                                    @endphp
                                    <span class="new">₹ {{number_format($after_discount,2)}}</span>
                                </p>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </section>
@endsection

@push('styledfs')
    <style>
        .navigation .logo img {
            margin-top: 10px;
            max-width: inherit;
        }
        .logo img {
            max-width: inherit;
            width: 140px;
        }
    </style>
@endpush
