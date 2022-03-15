@extends('frontend.layouts.master')

@section('title', Config::get('app.site_name').'|| Product Page')

@section('main-content')

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
                                <h4 id="lastPath"></h4>
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
                                        <del style="font-size: 12px;">${{number_format($product->price,2)}}</del>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    @else
                        <h4 class="text-black-50" style="margin:50px auto;">Product Not Available.</h4>
                    @endif
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
@push('scripts')
    <script>
        const url = window.location.href;

        const lastSegment = url.split("/").pop();
        const str = letterSpacing(lastSegment);

        document.getElementById("lastPath").innerText = capitalizeFirstLetter(str);

        function capitalizeFirstLetter(string) {
            return string.charAt(0).toUpperCase() + string.slice(1);
        }
        function letterSpacing(string) {
            return string.replace('-', ' ');
        }
    </script>
@endpush
