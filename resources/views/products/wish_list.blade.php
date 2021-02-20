@extends('layouts.front_layout.front_design')
@push('css')

@endpush
@section('content')
    <?php use App\Models\Product; ?>
    <section id="cart_items">
        <div class="container">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Wish List</li>
                </ol>
            </div>
            <div class="table-responsive cart_info">
                <table class="table table-condensed">
                    <thead>
                    <tr class="cart_menu">
                        <td class="image">Item</td>
                        <td class="description"></td>
                        <td class="price">Price</td>
                        <td class="quantity">Quantity</td>
                        <td class="total">Total</td>
                        <td>Action</td>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $total_amount = 0; ?>
                    @foreach($userWishList as $wishList)
                    <tr>
                        <td class="cart_product">
                            <a href=""><img width="150" src="{{asset('image/product_image/small/'.$wishList->image)}}" alt=""></a>
                        </td>
                        <td class="cart_description">
                            <h4><a href="">{{$wishList->product_name}}</a></h4>
                            <p>Code: {{$wishList->product_code}} | {{$wishList->size}}</p>
                        </td>

                        <td class="cart_price">
                            <?php
                                $product_price = Product::getProductPrice($wishList->product_id, $wishList->size);
                            ?>
                            <p>Tk {{$product_price}}</p>
                        </td>
                        <td class="cart_quantity">
                            <div class="cart_quantity_button">
                               <p>{{$wishList->quantity}}</p>
                            </div>
                        </td>
                        <td class="cart_total">
                            <p class="cart_total_price">Tk {{$product_price * $wishList->quantity}}</p>
                        </td>
                        <form method="POST" name="addtocartForm" id="addtocartForm" action="{{url('add-cart')}}"> {{csrf_field()}}
                            <input type="hidden" name="product_id" value="{{$wishList->product_id}}">
                            <input type="hidden" name="product_name" value="{{$wishList->product_name}}">
                            <input type="hidden" name="product_code" value="{{$wishList->product_code}}">
                            <input type="hidden" name="product_color" value="{{$wishList->product_color}}">
                            <input type="hidden" name="size" id="size" value="{{$wishList->product_id}}-{{$wishList->size}}">

                            <input type="hidden" name="price" id="Price" value="{{$wishList->price}}">
                        <td class="cart_delete">
                            <button type="submit" class="btn btn-fefault cart" id="cartButton" name="cartButton" value="Add to Cart">
                                <i class="fa fa-shopping-cart"></i>
                                Add to cart
                            </button> &nbsp; &nbsp;
                            <a class="cart_quantity_delete" href="{{url('/wish-list/delete-product/'.$wishList->id)}}"><i class="fa fa-times"></i></a>
                        </td>
                        </form>
                    </tr>
                        <?php $total_amount = $total_amount + ($product_price * $wishList->quantity) ?>
                    @endforeach

                    </tbody>
                </table>
            </div>
        </div>
    </section> <!--/#cart_items-->

@endsection

@push('')

@endpush
