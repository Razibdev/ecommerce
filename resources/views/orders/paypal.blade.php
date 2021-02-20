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
                <h3>YOUR  ORDER HAS BEEN PLACED</h3>
                <p>Your order number is {{Session::get('order_id')}} and total payable about is USD {{Session::get('grand_total')}}</p>
                <p>Please make payment by clicking on below Payment Button</p>
                <?php
                    $orderDetails = \App\Models\Order::getOrderDetails(Session::get('order_id'));
                    $getCountryCode = \App\Models\Order::getCountryCode($orderDetails->country);
                    $nameArr = explode(' ', $orderDetails->name);

                ?>
                <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                    <input type="hidden" name="cmd" value="_xclick">
                    <input type="hidden" name="business" value="razibhossen62776@gmail.com">
                    <input type="hidden" name="item_name" value="{{Session::get('order_id')}}">
                    <input type="hidden" name="currency_code" value="USD">
                    <input type="hidden" name="amount" value="{{Session::get('grand_total')}}">
                    <input type="hidden" name="first_name" value="{{$nameArr[0]}}">
                    <input type="hidden" name="last_name" value="{{$nameArr[1]}}">
                    <input type="hidden" name="address1" value="{{$orderDetails->address}}">
                    <input type="hidden" name="address2" value="">
                    <input type="hidden" name="city" value="{{$orderDetails->city}}">
                    <input type="hidden" name="state" value="{{$orderDetails->state}}">
                    <input type="hidden" name="zip" value="{{$orderDetails->pincode}}">
                    <input type="hidden" name="night_phone_a" value="610">
                    <input type="hidden" name="night_phone_b" value="555">
                    <input type="hidden" name="night_phone_c" value="1234">
                    <input type="hidden" name="email" value="{{$orderDetails->email}}">
                    <input type="hidden" name="country" value="{{$getCountryCode->iso}}">
                    <input type="hidden" name="return" value="{{url('paypal/thanks')}}">
                    <input type="hidden" name="cancle_return" value="{{url('paypal/cancel')}}">

                    {{--sb-s2wbb3133946@personal.example.com--}}
                    <input type="image" src="http://www.paypal.com/en_US/i/btn/x-click-but01.gif" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
                </form>
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
{{--<form action="https://www.paypal.com/cgi-bin/webscr" method="post">--}}
    {{--<input type="hidden" name="cmd" value="_xclick">--}}
    {{--<input type="hidden" name="business" value="sb-7kh9433137084@business.example.com">--}}
    {{--<input type="hidden" name="item_name" value="{{Session::get('order_id')}}">--}}
    {{--<input type="hidden" name="item_number" value="1">--}}
    {{--<input type="hidden" name="amount" value="{{Session::get('grand_total')}}">--}}
    {{--<input type="hidden" name="no_shipping" value="0">--}}
    {{--<input type="hidden" name="no_note" value="1">--}}
    {{--<input type="hidden" name="currency_code" value="USD">--}}
    {{--<input type="hidden" name="lc" value="AU">--}}
    {{--<input type="hidden" name="bn" value="PP-BuyNowBF">--}}
    {{--<input type="image" src="https://www.paypal.com/en_AU/i/btn/btn_buynow_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online.">--}}
    {{--<img alt="" border="0" src="https://www.paypal.com/en_AU/i/scr/pixel.gif" width="1" height="1">--}}
{{--</form>--}}


{{--<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" name="form-pp">--}}
    {{--<input type="hidden" name="business" value="sb-7kh9433137084@business.example.com">--}}
    {{--<input type="hidden" name="image_url" value="http://paypal.local/static/logo.png">--}}
    {{--<input type="hidden" name="charset" value="utf8">--}}
    {{--<input type="hidden" name="item_name" value="{{Session::get('order_id')}}">--}}
    {{--<input type="hidden" name="item_number" value="1">--}}
    {{--<input type="hidden" name="amount" value="{{Session::get('grand_total')}}">--}}
    {{--<input type="hidden" name="currency_code" value="USD">--}}
    {{--<input type="hidden" name="cmd" value="_xclick">--}}

    {{--<input type="hidden" name="no_note" value="1">--}}
    {{--<input type="hidden" name="no_shipping" value="1">--}}
    {{--<input type="hidden" name="return" value="{{url('/')}}">--}}
    {{--<input type="hidden" name="rm" value="2">--}}
    {{--<!-- This can be set in PayPal profile -->--}}
    {{--<!-- <input type="hidden" name="notify_url" value="http://10.10.10.10/payment-listner.php"> -->--}}
    {{--<input type="hidden" name="cancel_return" value="{{url('/')}}">--}}
    {{--<input type="submit" value="buy">--}}
    {{--<input type="image" src="https://www.paypal.com/en_AU/i/btn/btn_buynow_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online.">--}}
{{--</form>--}}
