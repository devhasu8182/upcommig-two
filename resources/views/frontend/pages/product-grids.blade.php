@extends('frontend.layouts.master')

@section('title', Config::get('app.site_name').' | Products')

@section('main-content')
    @if (session('demoX'))
        <section class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__text">
                            <h4>Products</h4>
                            <div class="breadcrumb__links">
                                <a href="/">Home</a>
                                <span>Products</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="shop spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="shop__sidebar">
                            <div class="shop__sidebar__accordion">
                                <div class="accordion" id="accordionExample">
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseOne">Categories</a>
                                        </div>
                                        <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <div class="shop__sidebar__categories">
                                                    <ul class="nice-scroll">
                                                        @php
                                                            $menu=App\Models\Category::getAllParentWithChild();
                                                        @endphp
                                                        @if($menu)

                                                        @endif
                                                    <li>
                                                        @foreach($menu as $cat_info)
                                                            @if($cat_info->child_cat->count()>0)
                                                                <li><a href="{{route('product-cat',$cat_info->slug)}}">{{$cat_info->title}}</a></li>
                                                            @else
                                                                <li><a href="{{route('product-cat',$cat_info->slug)}}">{{$cat_info->title}}</a></li>
                                                            @endif
                                                        @endforeach
                                                    </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="shop__product__option">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="shop__product__option__left">
                                        <p>All Products</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            @if(count($products)>0)
                                @foreach($products as $product)
                                    <div class="col-lg-4 col-md-6 col-sm-6">
                                        <div class="product__item">
                                            @php
                                                $photo=explode(',',$product->photo);
                                            @endphp
                                            <a href="{{route('product-detail',$product->slug)}}">
                                                <div class="product__item__pic set-bg" data-setbg="{{$photo[0]}}">
                                                </div>
                                            </a>
                                            <div class="product__item__text">
                                                <h6>{{$product->title}}</h6>
                                                <a href="{{route('add-to-cart',$product->slug)}}" class="add-cart">+ Add To Cart</a>
                                                @php
                                                    $after_discount=($product->price-($product->price*$product->discount)/100);
                                                @endphp
                                                <h5>${{number_format($after_discount,2)}}</h5>

                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            @else
                                <h4 class="text-warning" style="margin:100px auto;">There are no products.</h4>
                            @endif

                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endif


    <section class="shop-section shop-pg-shop">
        <div class="container">
            <div class="base-header">
                <span class="heading_small"> Shop </span>
            </div>

            <div class="row shop-carousel">
                {{-- <div class="col-sm-12 shop-filter">
                    <h4>Shop</h4>
                </div>        --}}

                @if(count($products)>0)
                    @foreach($products as $product)
                        <div class="col-lg-3 col-md-6 col-sm-12">
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
                        </div>
                    @endforeach
                @else
                    <h4 class="text-center" style="margin:50px auto 100px;">There are no products.</h4>
                @endif
            </div>
            <div class="pagination-link">
                {{$products->appends($_GET)->links()}}
            </div>

        </div>
    </section>

@endsection


@push('styles')
    <style>
        .shop-section.shop-pg-shop{
            padding: 40px 0px;
        }
        .pagination {
            list-style: unset;
        }
        .page-item:first-child .page-link {
            border-top-left-radius: unset;
            border-bottom-left-radius: unset;
        }
        .page-item.disabled .page-link {
            color: unset;
            pointer-events: unset;
            background-color: unset;
            border-color: unset;
        }
        .page-link {
            position: unset;
            display: unset;
            color: unset;
            text-decoration: unset;
            background-color: unset;
            border: unset;
            transition: unset;
        }
        .page-link {
            padding: unset;
        }
        .pagination {
            width: unset;
        }
        .page-item.active .page-link {
            z-index: unset;
            color: unset;
            background-color: unset;
            border-color: unset;
        }

        .page-item:not(:first-child) .page-link {
            margin-left: unset;
        }
        .pagination-link ul li {
            color: #e1b44f;
        }
        .page-link:focus {
            z-index: unset;
            color: unset;
            background-color: unset;
            outline: unset;
            box-shadow: unset;
        }
        .page-link:hover {
            z-index: unset;
            color: unset;
            background-color: unset;
            border-color: unset;
        }
    </style>
@endpush
