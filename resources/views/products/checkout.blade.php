@extends('layouts.front_layout.front_design')
@push('css')

@endpush
@section('content')


    <section id="form" style="margin-top: 20px;"><!--form-->
        <div class="container">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Checkout</li>
                </ol>
            </div>
            <form action="{{url('/checkout')}}" method="post" >{{csrf_field()}}
            <div class="row">
                <div class="col-sm-4 col-sm-offset-1">
                    <div class="login-form"><!--login form-->
                        <h2>Bill To</h2>
                        <div class="form-group">
                            <input type="text" name="billing_name" id="billing_name" value="{{$userDetails->name}}" placeholder="Billing Name" class="form-control" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="billing_address" id="billing_address" value="{{$userDetails->address}}" placeholder="Billing Address" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="billing_city" id="billing_city" value="{{$userDetails->city}}" placeholder="Billing City" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="billing_state" id="billing_state" value="{{$userDetails->state}}" placeholder="Billing State" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <select name="billing_country" id="billing_country" class="form-control">
                                <option value="">Select Country</option>
                                @foreach($countries as $country)
                                    <option value="{{$country->country_name}}" @if($country->country_name == $userDetails->country) selected @endif> {{$country->country_name}}</option>
                                 @endforeach
                            </select>
                        </div>

                        <div class="form-group">
                            <input type="text" name="billing_picode" id="billing_pincode" value="{{$userDetails->pincode}}" placeholder="Billing Pincode" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="billing_mobile" id="billing_mobile" value="{{$userDetails->mobile}}" placeholder="Billing Mobile" class="form-control"/>
                        </div>

                        <div class="form-check">
                            <input type="checkbox" name="bill2ship" id="bill2ship" class="form-check-input"/>&nbsp;
                            <label class="form-check-label" for="bill2ship">Shipping Address same as Billing Address </label>

                        </div>

                    </div><!--/login form-->
                </div>
                <div class="col-sm-1">
                    <h2></h2>
                </div>
                <div class="col-sm-4">
                    <div class="signup-form"><!--sign up form-->
                        <h2> Ship To</h2>
                        <div class="form-group">
                            <input type="text" name="shipping_name" id="shipping_name" @if($shippingcount > 0) value="{{$shippingDetails->name}}" @endif placeholder="Shipping Name" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="shipping_address" id="shipping_address" @if($shippingcount > 0)value="{{$shippingDetails->address}}" @endif placeholder="Shipping Address" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="shipping_city" id="shipping_city" @if($shippingcount > 0) value="{{$shippingDetails->city}}" @endif placeholder="Shipping City" class="form-control" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="shipping_state" id="shipping_state" @if($shippingcount > 0) value="{{$shippingDetails->state}}" @endif placeholder="Shipping State" class="form-control"/>
                        </div>
                        <div class="form-group">
                        <select name="shipping_country" id="shipping_country" class="form-control">
                            <option value="">Select Country</option>
                            @foreach($countries as $country)

                                <option value="{{$country->country_name}}" @if($shippingcount > 0)  @if($country->country_name == $shippingDetails->country) selected @endif @endif > {{$country->country_name}}</option>
                            @endforeach
                        </select>
                        </div>
                        <div class="form-group">
                            <input type="text" name="shipping_picode" id="shipping_pincode" @if($shippingcount > 0) value="{{$shippingDetails->pincode}}" @endif placeholder="Shipping Pincode" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="shipping_mobile" id="shipping_mobile" @if($shippingcount > 0) value="{{$shippingDetails->mobile}}" @endif placeholder="Shipping Mobile" class="form-control"/>
                        </div>
                            <button type="submit" class="btn btn-success">Checkout</button>
                    </div><!--/sign up form-->
                </div>
            </div>
            </form>
        </div>
    </section><!--/form-->



@endsection

@push('js')

@endpush
