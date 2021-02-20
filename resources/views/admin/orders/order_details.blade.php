@extends('layouts.admin_layout.admin_layout')
@push('css')

@endpush
@section('content')
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Orders</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Order  # {{$orderDetails->id}}</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Order Details</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body" style="margin: 0; padding: 0;">
                                <table class="table table-bordered" style="margin: 0; padding: 0;">
                                    <tr>
                                        <td>Order Date</td>
                                        <td>{{$orderDetails->created_at}}</td>
                                    </tr>
                                    <tr>
                                        <td>Order Status</td>
                                        <td>{{$orderDetails->order_status}}</td>
                                    </tr>
                                    <tr>
                                        <td>Order Total</td>
                                        <td>$ {{$orderDetails->grand_total}}</td>
                                    </tr>
                                    <tr>
                                        <td>Shipping Charges</td>
                                        <td>$ {{$orderDetails->shipping_charges}}</td>
                                    </tr>
                                    <tr>
                                        <td>Coupon Code</td>
                                        <td>{{$orderDetails->coupon_code}}</td>
                                    </tr>
                                    <tr>
                                        <td>Coupon Amount</td>
                                        <td>$ {{$orderDetails->coupon_amount}}</td>
                                    </tr>
                                    <tr>
                                        <td>Payment Method</td>
                                        <td>{{$orderDetails->payment_method}}</td>
                                    </tr>

                                </table>
                            </div>

                        </div>
                        <!-- /.card -->
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Customer Details</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body" style="margin: 0; padding: 0;">
                                <table class="table table-bordered" style="margin: 0; padding: 0;">
                                    <tr>
                                        <td>Customer Name</td>
                                        <td>{{$orderDetails->name}}</td>
                                    </tr>
                                    <tr>
                                        <td>Customer Email</td>
                                        <td>{{$orderDetails->user_email}}</td>
                                    </tr>

                                </table>
                            </div>

                        </div>

                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Update Order Status</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <form action="{{url('/admin/update-order-status')}}" method="post">{{csrf_field()}}
                                    <input type="hidden" name="order_id" value="{{$orderDetails->id}}">
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <select name="order_status" id="order_status" class="form-control" required>
                                                <option value="New" @if($orderDetails->order_status == "New") selected @endif>New</option>
                                                <option value="Pending" @if($orderDetails->order_status == "Pending") selected @endif>Pending</option>
                                                <option value="Cancelled" @if($orderDetails->order_status == "Cancelled") selected @endif>Cancelled</option>
                                                <option value="In-Process" @if($orderDetails->order_status == "In-Process") selected @endif>In Process</option>
                                                <option value="Shipped" @if($orderDetails->order_status == "Shipped") selected @endif>Shipped</option>
                                                <option value="Delivered" @if($orderDetails->order_status == "Delivered") selected @endif>Delivered</option>
                                                <option value="Paid" @if($orderDetails->order_status == "Paid") selected @endif>Paid</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <input type="submit" value="Update Status" class="btn btn-success">
                                        </div>
                                    </div>
                                </form>
                            </div>

                        </div>
                        <!-- /.card -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Billing Address</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                               <div>
                                   {{$userDetails->name}}<br>
                                   {{$userDetails->address}}<br>
                                   {{$userDetails->city}}<br>
                                   {{$userDetails->state}}<br>
                                   {{$userDetails->country}}<br>
                                   {{$userDetails->pincode}}<br>
                                   {{$userDetails->mobile}}<br>

                               </div>
                            </div>

                        </div>
                        <!-- /.card -->
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Shipping Address</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div>
                                    {{$orderDetails->name}}<br>
                                    {{$orderDetails->address}}<br>
                                    {{$orderDetails->city}}<br>
                                    {{$orderDetails->state}}<br>
                                    {{$orderDetails->country}}<br>
                                    {{$orderDetails->pincode}}<br>
                                    {{$orderDetails->mobile}}<br>
                                </div>
                            </div>

                        </div>
                        <!-- /.card -->
                    </div>
                </div>
            </div><!-- /.container-fluid -->

            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Product Code</th>
                    <th>Product Size</th>
                    <th>Product Color</th>
                    <th>Product Price</th>
                    <th>Product Qty</th>

                </tr>
                </thead>
                <tbody>
                @foreach($orderDetails->orders as $pro)
                    <tr>
                        <td>{{$pro->product_name}}</td>
                        <td>{{$pro->product_code}}</td>
                        <td>{{$pro->product_size}}</td>
                        <td>{{$pro->product_color}}</td>
                        <td>{{$pro->product_price}}</td>
                        <td>{{$pro->product_qty}}</td>

                    </tr>
                @endforeach
                </tbody>
            </table>
        </section>
        <!-- /.content -->
    </div>
@endsection
@push('js')

@endpush
