@extends('layouts.front_layout.front_design')
@push('css')

@endpush
@section('content')
    <section id="cart_items">
        <div class="container">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Thanks</li>
                </ol>
            </div>
        </div>
    </section> <!--/#cart_items-->

    <section id="do_action">
        <div class="container">
            <div class="heading" align="center">
                <h3>YOUR Paypal ORDER HAS BEEN Cancelled</h3>
                <p>Please contact us if there is any enquiry.</p>
            </div>
        </div>
    </section><!--/#do_action-->
@endsection

@push('')

@endpush
<?php
Session::forget('grand_total');
Session::forget('order_id');


?>
