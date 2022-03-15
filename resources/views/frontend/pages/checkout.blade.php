@extends('frontend.layouts.master')

@section('title', Config::get('app.site_name').'|| Checkout')

@section('main-content')
@if (session('demoX'))
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Check Out</h4>
                        <div class="breadcrumb__links">
                            <a href="/">Home</a>
                            <span>Check Out</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <form method="POST" action="{{route('cart.order')}}">
                    @csrf
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <h6 class="checkout__title">Billing Details</h6>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Fist Name<span>*</span></p>
                                        <input type="text" name="first_name" placeholder="" value="{{old('first_name')}}">
                                        @error('first_name')
                                        <span class='text-danger'>{{$message}}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Last Name<span>*</span></p>
                                        <input type="text" name="last_name" placeholder="" value="{{old('last_name')}}">
                                        @error('last_name')
                                        <span class='text-danger'>{{$message}}</span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Country<span>*</span></p>
                                <input type="text"  name="country" value="{{old('country')}}">
                                @error('country')
                                <span class='text-danger'>{{$message}}</span>
                                @enderror
                            </div>
                            <div class="checkout__input">
                                <p>Address<span>*</span></p>
                                <input type="text" name="address1" placeholder="" value="{{old('address1')}}">
                                @error('address1')
                                <span class='text-danger'>{{$message}}</span>
                                @enderror
                            </div>
                            <div class="checkout__input">
                                <p>Postcode / ZIP<span>*</span></p>
                                <input type="text" name="post_code" placeholder="" value="{{old('post_code')}}">
                                @error('post_code')
                                <span class='text-danger'>{{$message}}</span>
                                @enderror
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input type="number" name="phone" placeholder="" required value="{{old('phone')}}">
                                        @error('phone')
                                        <span class='text-danger'>{{$message}}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="email" name="email" placeholder="" value="{{old('email')}}">
                                        @error('email')
                                        <span class='text-danger'>{{$message}}</span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4 class="order__title">Your order</h4>
                                <ul class="checkout__total__all">
                                    <li>Subtotal <span>${{number_format(Helper::totalCartPrice(),2)}}</span></li>
                                    @php
                                        $total_amount=Helper::totalCartPrice();
                                        if(session('coupon')){
                                            $total_amount=$total_amount-session('coupon')['value'];
                                        }
                                    @endphp
                                    @if(session('coupon'))
                                        <li>You Save <span>${{number_format(session('coupon')['value'],2)}}</span></li>
                                    @endif
                                    @if(session('coupon'))
                                        <li>Total <span>${{number_format($total_amount,2)}}</span></li>
                                    @else
                                        <li>Total <span>${{number_format($total_amount,2)}}</span></li>
                                    @endif
                                </ul>
                                <p class="text-black-50">Payment Detail.</p>
                                <input name="payment_method"  type="radio" value="cod" id="cash">
                                <label for="cash"> Cash On Delivery</label>

                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
@endif


<section class="checkout_section">
    <div class="container">
        <div class="row">
            <div id="checkoutform" class="col-lg-12 col-sm-12">
                <form name="contactform" method="POST" action="{{route('cart.order')}}" class="shopform">
                    @csrf
                    <div class="row">
                        <div class="col-lg-6 col-sm-12">
                            <div class="custom-title">
                                <h3>Billing details</h3>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-sm-12">
                                        <p>Fist Name<span>*</span></p>
                                        <input type="text" name="first_name" placeholder="" value="{{old('first_name')}}"  id="name" class="form-control" required>
                                        @error('first_name')
                                        <span class='text-danger'>{{$message}}</span>
                                        @enderror
                                </div>

                                <div class="col-lg-6 col-sm-12">
                                    <p>Last Name<span>*</span></p>
                                        <input type="text" name="last_name" placeholder="" value="{{old('last_name')}}" class="form-control" required>
                                        @error('last_name')
                                        <span class='text-danger'>{{$message}}</span>
                                        @enderror
                                </div>
                                <div class="col-lg-12 col-sm-12">
                                    <p>Country<span>*</span></p>
                                    <select class="form-select" name="country" value="{{old('country')}}">
                                        <option value="IND" selected>India</option>
                                    </select>

                                    @error('country')
                                    <span class='text-danger'>{{$message}}</span>
                                    @enderror
                                </div>
                                <div class="col-lg-12 col-sm-12">
                                    <p>Address<span>*</span></p>
                                    <input type="text" name="address1" placeholder="" value="{{old('address1')}}" class="form-control" required>
                                    @error('address1')
                                    <span class='text-danger'>{{$message}}</span>
                                    @enderror
                                </div>
                                <div class="col-lg-12 col-sm-12">
                                    <p>Address 2</p>
                                    <input type="text" name="address2" placeholder="" value="{{old('address2')}}" class="form-control">
                                    @error('address2')
                                        <span class='text-danger'>{{$message}}</span>
                                    @enderror
                                </div>

                                <div class="col-lg-6 col-sm-12">
                                    <p>Postcode / ZIP</p>
                                    <input type="text" name="post_code" placeholder="" value="{{old('post_code')}}" class="form-control">
                                    @error('post_code')
                                    <span class='text-danger'>{{$message}}</span>
                                    @enderror
                                </div>
                                <div class="col-lg-6 col-sm-12">
                                    <p>Phone<span>*</span></p>
                                    <input type="number" name="phone" placeholder="" required value="{{old('phone')}}" class="form-control">
                                    @error('phone')
                                    <span class='text-danger'>{{$message}}</span>
                                    @enderror
                                </div>

                                <div class="col-lg-12 col-sm-12">
                                    <p>Email<span>*</span></p>
                                    <input type="email" name="email" placeholder="" value="{{old('email')}}" class="form-control" required>
                                    @error('email')
                                    <span class='text-danger'>{{$message}}</span>
                                    @enderror
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-sm-12">
                            <div class="checkout_order">
                                <div class="custom-title">
                                    <h3>Cart Totals </h3>
                                </div>
                                <div class="order-info">
                                    <ul class="order-list">
                                        <li class="sub-total">
                                            <h6>Sub Total</h6>
                                            <span>₹{{number_format(Helper::totalCartPrice(),2)}}</span>
                                        </li>
                                        @php
                                            $total_amount=Helper::totalCartPrice();
                                            if(session('coupon')){
                                                $total_amount=$total_amount-session('coupon')['value'];
                                            }
                                        @endphp


                                        @if(session('coupon'))
                                            <li class="sub-total">
                                                <h6>You Save</h6>
                                                <span>${{number_format(session('coupon')['value'],2)}}</span>
                                            </li>
                                        @endif
                                        @if(session('coupon'))
                                            <li class="order-total">
                                                <h6>Order Total</h6>
                                                <span>₹{{number_format($total_amount,2)}}</span>
                                            </li>
                                        @else
                                            <li class="order-total">
                                                <h6>Order Total</h6>
                                                <span>₹{{number_format($total_amount,2)}}</span>
                                            </li>
                                        @endif
                                    </ul>
                                </div>
                            </div>
                            <div class="payment_mth">
                                <div class="custom-title">
                                    <h3>Payment method </h3>
                                </div>
                                <br>
                                <div class="payment_wrap">
                                    <label class="checkbox payment-method inline">
                                        <input  name="payment_method"  type="radio" value="cod" >
                                        Cash On Delivery
                                    </label>

                                    <button type="submit" class="btn more-link">
                                        Place An Order <i
                                            class="far fa-chevron-double-right"></i>
                                    </button>
{{--
                                    <a href="#" class="more-link">Place An Order <i
                                            class="far fa-chevron-double-right"></i></a> --}}
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end row -->
                </form>
            </div>
            <!-- end content -->
        </div>
        <!-- end row -->
    </div>
    <!-- end container -->
</section>




@endsection

{{-- @push('styles')
    <style>
        .checkout__order .order__title{
            margin-bottom: unset;
        }
    </style>
@endpush --}}
