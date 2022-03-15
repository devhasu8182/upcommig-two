@extends('frontend.layouts.master')
@section('title', Config::get('app.site_name').'|| Cart')
@section('main-content')

<div class="shop_cart">
    <div class="container">
    <div class="coupon_show">
        <h3>Have a coupon? <span id="showcoupon">Click here to enter your
            code</span></h3>
        <div id="checkout_coupon" class="coupon-checkout-content" style="display: none;">
            <div class="coupon-info">
                <form action="{{route('coupon-store')}}" method="POST">
                    @csrf
                    <p class="checkout-coupon">
                        <input type="text" name="code" placeholder="Enter Your Coupon">
                        <input type="submit" value="Apply Coupon">
                    </p>
                </form>
            </div>
        </div>
       </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="table-responsive text-center">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="shop_cart_tr">
                                <th class="text-left">Products name</th>
                                <th class="text-center">Price</th>
                                <th class="text-center">Qty</th>
                                <th class="text-center">total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <form action="{{route('cart.update')}}" method="POST">
                                @csrf
                                @if(Helper::getAllProductFromCart())
                                    @foreach(Helper::getAllProductFromCart() as $key=>$cart)
                                        <tr>
                                            <td class="prod">
                                                <a href="{{route('cart-delete',$cart->id)}}" class="cart-trash"> <i class="fa fa-trash"></i> </a>
                                                <a href="#">
                                                    @php
                                                        $photo=explode(',',$cart->product['photo']);
                                                        $cid = $cart->id;
                                                    @endphp
                                                    <img src="{{$photo[0]}}" alt="{{$photo[0]}}">
                                                    <span class="ptitle">{{$cart->product['title']}}</span>
                                                </a>
                                            </td>
                                            <td class="unit"><span>₹ {{number_format($cart['price'],2)}}</span>
                                            </td>
                                            <td class="quantity__item">
                                                <div class="quantity">
                                                    <div class="pro-qty-2" data-title="Qty" style="display: flex;">
                                                        <button type="button" class="btn btn-number"  style="color: #111111" data-type="minus" data-field="quant[{{$key}}]">
                                                            <span class="fa fa-angle-left inc qtybtn"></span>
                                                        </button>
                                                        <input type="text" name="quant[{{$key}}]" class="input-number"  data-min="1" data-max="100" value="{{$cart->quantity}}">
                                                        <input type="hidden" name="qty_id[]" value="{{$cart->id}}">
                                                        <button type="button" class="btn  btn-number"  style="color: #111111" data-type="plus" data-field="quant[{{$key}}]">
                                                            <span class="fa fa-angle-right inc qtybtn"></span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="unit"><span>₹ {{$cart['amount']}}</span>
                                            </td>
                                        </tr>
                                    @endforeach                                    
                                @else    
                                    <tr>
                                        <td class="text-center">
                                            There are no any carts available. <a href="{{route('product-grids')}}" style="color:blue;">Continue shopping</a>
                                        </td>
                                    </tr>
                                @endif
                                <tr>
                                    <td class="float-right" colspan="5">
                                        <div class="continue__btn update__btn" style="float: right;">
                                            <button type="submit"><i class="fa fa-spinner"></i> Update cart</button>
                                        </div>
                                    </td>
                                </tr>
                            </form>                            
                        </tbody>
                    </table>                   
                </div>
            </div>
        </div>
    </div>
</div>
<div class="shop_cart_bottom">
    <div class="container">
        <div class="row">
            <div class="col-lg-5   offset-lg-7">
                <div class="grand-total-area">
                    <h4>Cart Totals</h4>
                    <p class="sub-total">Subtotal<span class="amt">₹{{number_format(Helper::totalCartPrice(),2)}}</span></p>
                    @php
                        $total_amount=Helper::totalCartPrice();
                        if(session()->has('coupon')){
                            $total_amount=$total_amount-Session::get('coupon')['value'];                            
                        }
                    @endphp                                                            
                    <p class="grand-total">total <span class="amt">₹ {{number_format($total_amount,2)}}</span></p>
                    <a class="pro-checkout" href="{{route('checkout')}}">Proceed To Checkout</a>
                </div>
            </div>
        </div>
    </div>
</div>


@endsection

@push('scripts')
    <script src="{{asset('frontend/js/jquery-migrate-3.0.0.js')}}"></script>
    <script src="{{asset('frontend/js/nicesellect.js')}}"></script>
@endpush

@push('styles')
    <style>
        .btn.focus, .btn:focus {
            outline: 0;
            box-shadow: unset;
        }
        .continue__btn.update__btn button {
            color: #ffffff;
            background: #111111;
            border-color: #111111;
        }

        .continue__btn.update__btn button i {
            margin-right: 5px;
        }

        .continue__btn button {
            color: #111111;
            font-size: 14px;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
            border: 1px solid #e1e1e1;
            padding: 14px 35px;
            display: inline-block;
        }
        .shopping__cart__table table tbody tr td.product__cart__item .product__cart__item__pic img{
            width: 100px;
        }
        .update_row{
            display: inline-block;
        }
        .continue__btn{
            margin-top: 25px;
        }
    </style>
@endpush
