@extends('user.layouts.master')

@section('main-content')
    <div class="container-fluid">
        <div class="page-title">
            <div class="row">
                <div class="col-12 col-sm-6">
                    <h3>Order</h3>
                </div>
                <div class="col-12 col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{route('user')}}">
                                <i data-feather="home"></i>
                                Home
                            </a>
                        </li>
                        <li class="breadcrumb-item active">Order</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid list-products">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive product-table">
                            <table class="display" id="basic-1">
                                <thead>
                                <tr>
                                    <th>S.N.</th>
                                    <th>Order No.</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Quantity</th>
                                    <th>Total Amount</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                @if(count($orders)>0)
                                    @foreach($orders as $order)
                                        @php
                                            $shipping_charge=DB::table('shippings')->where('id',$order->shipping_id)->pluck('price');
                                        @endphp
                                        <tr>
                                            <td>{{$order->id}}</td>
                                            <td>{{$order->order_number}}</td>
                                            <td>{{$order->first_name}} {{$order->last_name}}</td>
                                            <td>{{$order->email}}</td>
                                            <td>{{$order->quantity}}</td>
                                            <td>₹{{number_format($order->total_amount,2)}}</td>
                                            @if($order->status=='new')
                                                <td class="font-primary">{{$order->status}}</td>
                                            @elseif($order->status=='process')
                                                <td class="font-warning">{{$order->status}}</td>
                                            @elseif($order->status=='delivered')
                                                <td class="font-success">{{$order->status}}</td>
                                            @else
                                                <td class="font-danger">{{$order->status}}</td>
                                            @endif
                                            <td>
                                                <a href="{{route('user.order.show',$order->id)}}" class="btn btn-primary btn-xs"
                                                   data-original-title="btn btn-danger btn-xs" style="    padding: 2px 12px;   font-size: 14px;   z-index: 0;">View
                                                </a>
                                                <form method="POST" action="{{route('user.order.delete',[$order->id])}}" style="    display: inline-block;">
                                                    @csrf
                                                    @method('delete')

                                                    <button class="btn btn-danger btn-xs"
                                                            data-original-title="btn btn-danger btn-xs" title="">Delete
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
                                @else
                                    <td colspan="8" class="text-center"><h4 class="my-4">No orders found!!! Please order some products</h4></td>
                                @endif
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
