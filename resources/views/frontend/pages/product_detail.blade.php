@extends('frontend.layouts.master')
@section('title', Config::get('app.site_name').'|| Product Detail')
@section('main-content')

<div class="shop-product-area">
	<div class="container">
		<div class="base-header">
			<span class="heading_small"> Product Detail </span>
		</div>
		<div class="row">
			<div class="col-md-6 col-sm-12">
				<div class="shop-products">
					<div class="single-item-detail">
						<div class="product-thumbnail">
							<div class="single-thumbnail-big">
								@php
									$photo=explode(',',$product_detail->photo);
								@endphp
								@foreach($photo as $data)
								<a class="project-link" href="{{$data}}" tabindex="0">
									<img src="{{$data}}" alt="{{$data}}">
								</a>
								@endforeach
							</div>
							<div class="single-thumbnail-small row">
								@php
									$photo=explode(',',$product_detail->photo);
									$countNumber = 0 ;
								@endphp
								@foreach($photo as $data)
									<div class="{{++$countNumber}} single-thumb" data-slick-index="">
										<img src="{{$data}}" alt="{{$data}}">
									</div>
								@endforeach
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-sm-12">
				<div class="allproduct-info">
					<div class="tittle_product">
						{{-- <span class="product-sub-tit">Milk Gallon </span> --}}
						<h4>{{$product_detail->title}}</h4>
					</div>
					<div class="allproduct-price-area">
						<span class="price">
							@php
								$after_discount=($product_detail->price-(($product_detail->price*$product_detail->discount)/100));
							@endphp

							<span class="n-amt">₹{{number_format($after_discount,2)}}</span>
						</span>
						<div class="star-rating rating2">
							<ul>
								@php
									$rate=ceil($product_detail->getReview->avg('rate'))
								@endphp
								@for($i=1; $i<=5; $i++)
									@if($rate>=$i)
										<li class="star yes"><i class="fa fa-star"></i></li>
									@else
										<li class="star no"><i class="fa fa-star"></i></li>
									@endif
								@endfor
								<li class="reviews"><a href="#">{{$product_detail['getReview']->count()}} Reviews(s)</a> </li>
							</ul>
						</div>
					</div>
					<div class="p-content">
						<p class="d-content">
							{!!($product_detail->summary)!!}
						</p>
					</div>
					<form action="{{route('single-add-to-cart')}}" method="POST">
						@csrf
						<div class="cart-quantity">
							<div class="input-group">
								<div class="button minus">
									<button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
										<i class="fa fa-minus"></i>
									</button>
								</div>
								<input type="hidden" name="slug" value="{{$product_detail->slug}}">
								<input type="text" name="quant[1]" class="input-number"  data-min="1" data-max="1000" value="1" id="quantity">
								<div class="button plus">
									<button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
										<i class="fa fa-plus"></i>
									</button>
								</div>
							</div>
						</div>

						<div class="allchoices">
							<div class="choice-icon">
								<ul>
									<li>
										<button type="submit" class="text-uppercase adtocart">Add to cart</button>
										{{-- <a class="text-uppercase adtocart">add to cart</a> --}}
									</li>
								</ul>
							</div>
						</div>
					</form>
					<div class="categories-area">
						<p class="category"><span>Brand</span></p>
						@php
							$brands_name=DB::table('brands')->where('id',$product_detail->brand_id)->first();
						@endphp
						<span>{{$brands_name->title}}</span>
					</div>
					<div class="categories-area">
						<p class="category"><span>Categories </span> </p>
						<span>{{$product_detail->cat_info['title']}}</span>
					</div>
					@if($product_detail->flavor)
						<div class="categories-area">
							<p class="category"><span>Flavor </span> </p>
								<span>{{$product_detail->flavor ? $product_detail->flavor : 'N/A' }}</span>
						</div>
					@endif

					<div class="categories-area">
						<p class="category"><span>Quantity </span> </p>
						<span><span>{{$product_detail->stock ? $product_detail->stock : 'N/A' }}</span>	</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="cust-reviews-area">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<a class="nav-item nav-link active" id="nav-profile-tab" data-bs-toggle="tab" href="#nav-profile"
						role="tab" aria-controls="nav-profile" aria-selected="false"
						data-bs-target="#nav-profile">product Information</a>
					<a class="nav-item nav-link" id="nav-contact-tab" data-bs-toggle="tab" href="#nav-contact"
						role="tab" aria-controls="nav-contact" aria-selected="false"
						data-bs-target="#nav-contact">Reviews</a>
				</div>
				<div class="tab-content" id="nav-tabContent">
					<div class="product_aditi_cont tab-pane fade show active" id="nav-profile" role="tabpanel"
						aria-labelledby="nav-profile-tab">
						<p>
							{!! ($product_detail->description) !!}
						</p>
						<table class="prod_attributes">
							<tbody>
								@if($product_detail->type)
									<tr>
										<th>Type</th>
										<td><span>{{$product_detail->type ? $product_detail->type : 'N/A' }}</span>	</td>
									</tr>
								@endif
								@if($product_detail->model_name)
									<tr class="attri">
										<th>Model Name</th>
										<td><span>{{$product_detail->model_name ? $product_detail->model_name : 'N/A' }}</span>	</td>
									</tr>
								@endif
								@if($product_detail->maximum_shelf_life)
									<tr class="attri">
										<th>Maximum Shelf Life</th>
										<td><span>{{$product_detail->maximum_shelf_life ? $product_detail->maximum_shelf_life : 'N/A' }}</span>	</td>
									</tr>
								@endif
								@if($product_detail->organic)
									<tr class="attri">
										<th>Organic</th>
										<td><span>{{$product_detail->organic ? $product_detail->organic : 'N/A' }}</span>	</td>
									</tr>
								@endif
								@if($product_detail->container_type)
									<tr class="attri">
										<th>Container Type</th>
										<td><span>{{$product_detail->container_type ? $product_detail->container_type : 'N/A' }}</span>	</td>
									</tr>
								@endif

								@if($product_detail->nutrient_content)
									<tr class="attri">
										<th>Nutrient Content</th>
										<td><span>{{$product_detail->nutrient_content ? $product_detail->nutrient_content : 'N/A' }}</span>	</td>
									</tr>
								@endif


								@if($product_detail->ingredients)
									<tr class="attri">
										<th>Ingredients</th>
										<td><span>{{$product_detail->ingredients ? $product_detail->ingredients  : 'N/A' }}</span>	</td>
									</tr>
								@endif

							</tbody>
						</table>
					</div>
					<div class="product_revi tab-pane fade" id="nav-contact" role="tabpanel"
						aria-labelledby="nav-contact-tab">

						<!-- Review -->
						<div class="comment-review">
							<h4>Add A Review</h4>
							<div class="review-inner">
								@auth
									<form class="form" method="post" action="{{route('review.store',$product_detail->slug)}}">
										@csrf
										<div class="row">
											<div class="col-lg-12 col-12">
												<div class="rating_box">
													<div class="star-rating">
														<div class="star-rating__wrap">
														<input class="star-rating__input" id="star-rating-5" type="radio" name="rate" value="5">
														<label class="star-rating__ico fa fa-star" for="star-rating-5" title="5 out of 5 stars"></label>
														<input class="star-rating__input" id="star-rating-4" type="radio" name="rate" value="4">
														<label class="star-rating__ico fa fa-star" for="star-rating-4" title="4 out of 5 stars"></label>
														<input class="star-rating__input" id="star-rating-3" type="radio" name="rate" value="3">
														<label class="star-rating__ico fa fa-star" for="star-rating-3" title="3 out of 5 stars"></label>
														<input class="star-rating__input" id="star-rating-2" type="radio" name="rate" value="2">
														<label class="star-rating__ico fa fa-star" for="star-rating-2" title="2 out of 5 stars"></label>
														<input class="star-rating__input" id="star-rating-1" type="radio" name="rate" value="1">
														<label class="star-rating__ico fa fa-star" for="star-rating-1" title="1 out of 5 stars"></label>

														@error('rate')
															<span class="text-danger">{{$message}}</span>
														@enderror
														</div>
													</div>
												</div>
											</div>
											<div class="col-lg-12 col-12">
												<div class="form-group">
													<label>Write a review</label>
													<textarea name="review" rows="6" placeholder="" ></textarea>
												</div>
											</div>
											<div class="col-lg-12 col-12">
												<div class="form-group button5">
													<button type="submit" class="adtocart">Submit</button>
												</div>
											</div>
										</div>
									</form>
								@else
								<p class="text-center p-5">
									You need to <a href="{{route('login.form')}}" style="color:rgb(54, 54, 204)">Login</a> OR <a style="color:blue" href="{{route('register.form')}}">Register</a>
								</p>
								<!--/ End Form -->
								@endauth
							</div>
						</div>
						<div class="avg-ratting">
							<h4>Average Review( {{ceil($product_detail->getReview->avg('rate'))}} )</h4>
							<span>Total Review ( {{$product_detail->getReview->count()}} )</span>
						</div>
						<hr>

						@foreach($product_detail['getReview'] as $data)
							<div class="row" style="margin-top: 1.25rem;">
								<div class="col-12">
									@if($data->user_info['photo'])
										<img src="{{$data->user_info['photo']}}" alt="{{$data->user_info['photo']}}">
									@else
										<img src="{{asset('backend/img/avatar.png')}}" alt="Profile.jpg">
									@endif
									<div class="revi_text">
										<span class="revi_nam">{{$data->user_info['name']}}</span>

										<span class="revi_rating">
											@for($i=1; $i<=5; $i++)
												@if($data->rate>=$i)
													<i class="fas fa-star"></i>
												@else
													<i class="fas fa-star-o"></i>
												@endif
											@endfor
											(<span>{{$data->rate}}</span>)
											{{-- demoX <i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i> --}}
										</span>
										<div class="rat_des">
											<p>{{$data->review}}</p>
										</div>
									</div>
								</div>
							</div>
						@endforeach
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<section class="shop-section related_product_section">
	<div class="container">
		<div class="base-header">
			<span class="heading_small"> Products </span>
			<h2>Related Products </h2>
		</div>
		<div class="row">
			<div class="shop-carousel" id="shop_carousel">
				@foreach($product_detail->rel_prods as $data)
						<div class="product-wrap">
							<div class="product-img">
								@php
									$photo=explode(',',$data->photo);
								@endphp
									<a href="{{route('product-detail',$data->slug)}}">
										<img src="{{$photo[0]}}" alt="{{$photo[0]}}">
									</a>
									<span class="prod_badges">
									@if($data->stock<=0)
										<span class="sale">Sale out</span>
									@elseif($data->condition=='new')
										<span class="sale">New</span>
									@elseif($data->condition=='hot')
										<span class="sale">Hot</span>
									@else
										<span class="sale">{{$data->discount}}%</span>
									@endif
								</span>
								<div class="prod_love">
									<a class="cart-icon" title="Add to cart" href="{{route('add-to-cart',$data->slug)}}"><i class="fal fa-shopping-cart"></i></a>
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
								<a href="{{route('product-detail',$data->slug)}}">
									<h4>{{$data->title}}</h4>
								</a>
								<p class="prod_price">
									@php
										$after_discount=($data->price-($data->price*$data->discount)/100);
									@endphp
									<span class="new">₹ {{number_format($after_discount,2)}}</span>
									<span class="old">₹ {{number_format($data->price,2)}}</span>
								</p>
							</div>
						</div>
				@endforeach
			</div>
		</div>
	</div>
</section>


@endsection




@push('scripts')
    <script src="{{asset('frontend/js/jquery-migrate-3.0.0.js')}}"></script>
    <script src="{{asset('frontend/js/nicesellect.js')}}"></script>
@endpush


@push('styles')
    <style>
      .cart-quantity {
			display: inline-block;
			margin-right: 10px;
		}
		.cart-quantity .input-group {
			width: 151px;
			display: inline-block;
		}
		.cart-quantity .button.minus {
			left: 0;
			border-radius: 0;
			overflow: hidden;
		}
		.cart-quantity .button {
			display: inline-block;
			position: absolute;
			top: 0;
			display: inline-block;
		}
		.cart-quantity .button .btn {
			padding: 0;
			width: 35px;
			height: 45px;
			line-height: 45px;
			border-radius: 0px;
			background: transparent;
			color: #282828;
			font-size: 12px;
			border: none;
		}
		.cart-quantity .input-number {
			border: 1px solid #eceded;
			width: 100%;
			text-align: center;
			height: 45px;
			border-radius: 0px;
			overflow: hidden;
			padding: 0px 38px;
		}
		.cart-quantity .button.plus {
			right: 0;
			border-radius: 0;
			overflow: hidden;
		}
		.cart-quantity .button {
			display: inline-block;
			position: absolute;
			top: 0;
			display: inline-block;
		}
		.cart-quantity .button .btn {
			padding: 0;
			width: 35px;
			height: 45px;
			line-height: 45px;
			border-radius: 0px;
			background: transparent;
			color: #282828;
			font-size: 12px;
			border: none;
		}

		.product_revi .comment-review {
			margin-bottom: 30px;
		}
		.product_revi .comment-review h4 {
			font-size: 15px;
			font-weight: 600;
			margin-bottom: 7px;
			margin-top: 20px;
		}
		.product_revi .comment-review .review-inner {
			margin-bottom: 15px;
			display: block;
		}
		.rating_box {
			display: inline-flex;
		}
		.star-rating {
			font-size: 0;
			padding-left: 10px;
			padding-right: 10px;
		}
		.star-rating__wrap {
			display: inline-block;
			font-size: 1rem;
		}
		.product_revi .review-inner label {
			display: inline-block;
			margin: 0 5px 0 0;
		}

		.star-rating__ico {
			float: right;
			padding-left: 2px;
			cursor: pointer;
			/* color: #F7941D; */
			font-size: 16px;
			margin-top: 5px;
		}
		.product_revi .form .form-group label {
			color: #333;
			position: relative;
		}
		.product_revi .review-inner label {
			display: inline-block;
			margin: 0 5px 0 0;
		}
		.product_revi .form .form-group textarea {
			width: 100%;
			height: 200px;
			padding: 20px;
			background: #fff;
			border: 1px solid #ddd;
			resize: none;
			border-radius: 0;
			color: #333;
		}
		.star-rating__input {
			display: none;
		}
		.rating_box {
		display: inline-flex;
		}

		display: inline-flex;
		}

		.star-rating {
		font-size: 0;
		padding-left: 10px;
		padding-right: 10px;
		}

		.star-rating__wrap {
		display: inline-block;
		font-size: 1rem;
		}

		.star-rating__wrap:after {
		content: "";
		display: table;
		clear: both;
		}

		.star-rating__ico {
		float: right;
		padding-left: 2px;
		cursor: pointer;
		font-size: 16px;
		margin-top: 5px;
		}

		.star-rating__ico:last-child {
		padding-left: 0;
		}

		.star-rating__input {
		display: none;
		}

		.star-rating__ico:hover:before,
		.star-rating__ico:hover ~ .star-rating__ico:before,
		.star-rating__input:checked ~ .star-rating__ico:before {
		content: "\F005" ;
		color: #F7941D;
		}

		.adtocart {
			border: 2px solid #E1B44F;
			color: #FFF;
			display: block;
			font-weight: 700;
			height: 50px;
			line-height: 47px;
			margin-right: 20px;
			padding: 0 41px;
			background: #E1B44F;
			border-radius: 5px;
		}
    </style>
@endpush

@push('styles')
	{{-- <link href="http://127.0.0.1:8182/frontend/css/font-awesome.css" rel="stylesheet"> --}}
@endpush
