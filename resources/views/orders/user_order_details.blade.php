@extends('layouts.front_layout.front_design')
@push('css')

@endpush
@section('content')
    <section id="cart_items">
        <div class="container">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li><a href="{{url('/orders')}}">Orders</a></li>
                    <li class="active">{{$orderDetails->id}}</li>
                </ol>
            </div>
        </div>
    </section> <!--/#cart_items-->

    <section id="do_action">
        <div class="container">
            <div class="heading">
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
                            <td>Tk {{$pro->product_price}}</td>
                            <td>{{$pro->product_qty}}</td>

                        </tr>
                    @endforeach
                    </tbody>
                    <tfoot>
                    <tr>
                        <th>Product Name</th>
                        <th>Product Code</th>
                        <th>Product Size</th>
                        <th>Product Color</th>
                        <th>Product Price</th>
                        <th>Product Qty</th>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </section><!--/#do_action-->
@endsection

@push('')

@endpush
