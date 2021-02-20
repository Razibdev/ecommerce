@extends('layouts.front_layout.front_design')
@push('css')

@endpush
@section('content')
    <section id="slider"><!--slider-->
        {{--@include('products.slider')--}}
    </section><!--/slider-->

    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    @include('layouts.front_layout.front_sidebar')
                </div>

                <div class="col-sm-9 padding-right">
                    <div class="features_items"><!--features_items-->
                        <h2 class="title text-center">
                            @if(!empty($search_product))
                            {{$search_product}} item
                            @else
                                {{$categoryDetails->category_name}}

                            @endif
                            ({{  count($products) }})
                        </h2>
                        <div align="left"><?php echo $breadcrumb; ?></div>
                        <div>&nbsp;</div>
                        @foreach($products as $product)
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            @if(isset($product->image))
                                            <img src="{{asset('image/product_image/small/'.$product->image)}}" alt="" />
                                            @endif
                                            <h2>Tk {{$product->price}}</h2>
                                            <p>{{$product->product_name}}</p>
                                            <a href="{{url('product/'.$product->id)}}" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>
                                        {{--<div class="product-overlay">--}}
                                        {{--<div class="overlay-content">--}}
                                        {{--<h2>$ {{$product->price}}</h2>--}}
                                        {{--<p>{{$product->product_name}}</p>--}}
                                        {{--<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}}
                                        {{--</div>--}}
                                        {{--</div>--}}
                                    </div>
                                    <div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        @endforeach

                    </div><!--features_items-->
                    @if(empty($search_product))
                    <nav aria-label="Page navigation" align="center">
                        <ul class="pagination justify-content-center">
                            <li class="page-item">{{$products->links()}}</li>
                        </ul>
                    </nav>
                        @endif

                </div>
            </div>
        </div>
    </section>
@endsection

@push('js')

@endpush
