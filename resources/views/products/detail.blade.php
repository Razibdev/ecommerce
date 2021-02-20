@extends('layouts.front_layout.front_design')
@push('css')

@endpush
@section('content')
    <?php  Use App\Models\Product; ?>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                   @include('layouts.front_layout.front_sidebar')
                </div>

                <div class="col-sm-9 padding-right">
                    <div class="product-details"><!--product-details-->
                        <div class="col-sm-5">
                            <div class="view-product">
                                <div class="easyzoom easyzoom--overlay easyzoom--with-thumbnails">
                                    <a href="{{asset('image/product_image/large/'.$productDetails->image)}}">
                                        <img style="width: 300px;" class="mainImage" src="{{asset('image/product_image/medium/'.$productDetails->image)}}" alt="" />
                                    </a>
                                </div>
                                {{--<h3>ZOOM</h3>--}}
                            </div>
                            <div id="similar-product" class="carousel slide" data-ride="carousel">

                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">
                                    <div class="item active thumbnails">
                                        <a href="{{asset('image/product_image/large/'.$productDetails->image)}}" data-standard="{{asset('image/product_image/small/'.$productDetails->image)}}">
                                            <img class="changeImage" style="width: 80px;" src="{{asset('image/product_image/small/'.$productDetails->image)}}" alt="">
                                        </a>
                                        @foreach($productAltImages as $proImage)
                                            <a href="{{asset('image/product_image/large/'.$proImage->image)}}" data-standard="{{asset('image/product_image/small/'.$proImage->image)}}">
                                                <img class="changeImage" style="width: 80px;" src="{{asset('image/product_image/small/'.$proImage->image)}}" alt="">
                                            </a>
                                        @endforeach
                                    </div>
                                </div>

                            </div>

                        </div>


                        <div class="col-sm-7">
                            <form method="POST" name="addtocartForm" id="addtocartForm" action="{{url('add-cart')}}"> {{csrf_field()}}
                                <input type="hidden" name="product_id" value="{{$productDetails->id}}">
                                <input type="hidden" name="product_name" value="{{$productDetails->product_name}}">
                                <input type="hidden" name="product_code" value="{{$productDetails->product_code}}">
                                <input type="hidden" name="product_color" value="{{$productDetails->product_color}}">
                                <input type="hidden" name="price" id="Price" value="{{$productDetails->price}}">

                                <div class="product-information"><!--/product-information-->
                                <img src="front/images/product-details/new.jpg" class="newarrival" alt="" />
                                <h2>{{$productDetails->product_name}}</h2>
                                <p>Code: {{$productDetails->product_code}}</p>
                                <p>Color: {{$productDetails->product_color}}</p>
                                @if(!empty($productDetails->sleeve))
                                    <p>Sleeve: {{$productDetails->sleeve}}</p>
                                 @endif
                                @if(!empty($productDetails->pattern))
                                    <p>Pattern: {{$productDetails->pattern}}</p>
                                @endif

                                    <p>
                                    <select name="size" required id="selSize" style="width: 150px;">
                                        <option value="">Select Size</option>
                                        @foreach($productDetails->attributes as $sizes)
                                            <option value="{{$productDetails->id}}-{{$sizes->size}}">{{$sizes->size}}</option>
                                        @endforeach
                                    </select>
                                </p>
                                <img src="{{asset('front/images/product-details/rating.png')}}" alt="" />
                                <span>
                                    <?php $getCurrencyRates = Product::getCurrencyRates($productDetails->price); ?>
									<span id="getPrice">
                                      Tk {{$productDetails->price}} <br>
                                        <h2>
                                            USD  {{$getCurrencyRates['USD_Rate']}} <br>
                                            GBP  {{$getCurrencyRates['GBP_Rate']}} <br>
                                            EUR  {{$getCurrencyRates['EUR_Rate']}} <br>

                                        </h2>
                                    </span>
									<label>Quantity:</label>
									<input type="text" name="quantity" value="1" />
                                    @if($total_stock > 0)
									<button type="submit" class="btn btn-fefault cart" id="cartButton" name="cartButton" value="shopping cart">
										<i class="fa fa-shopping-cart"></i>
										Add to cart
									</button>
                                        @endif
                                    <button type="submit" class="btn btn-default" id="wishListButton" name="wishListButton" value="wish list">
										<i class="fa fa-briefcase"></i>&nbsp;
										Add to wish list
									</button>
								</span>

                                <p><b>Availability:</b> <span id="availablity"> @if($total_stock > 0) In Stock @else Out of Stock @endif</span></p>
                                <p><b>Condition:</b> New</p>
                                <p><b>Delivery</b> <input type="text" name="pincode" id="chkPincode" placeholder="Check Pincode"> <button type="button"  onclick="return checkPincode();">Go</button> </p>
                                    <span id="pincodeResult"></span>
                                    <div style="float: left; margin-top: 10px;" class="sharethis-inline-share-buttons"></div>

                                </div><!--/product-information-->
                            </form>
                        </div>
                    </div><!--/product-details-->




                    <div class="category-tab shop-details-tab"><!--category-tab-->
                        <div class="col-sm-12">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#description" data-toggle="tab">Description</a></li>
                                <li><a href="#care" data-toggle="tab">Material & Care</a></li>
                                <li><a href="#delivery" data-toggle="tab">Delivery Options</a></li>
                                @if(!empty($productDetails->video))
                                <li><a href="#video" data-toggle="tab">Product Video</a></li>
                                    @endif
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade active in" id="description" >
                                <div class="col-sm-12">
                                    <p> {!! $productDetails->description !!}</p>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="care" >
                                <div class="col-sm-12">
                                    <p> {!! $productDetails->care !!}</p>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="delivery" >
                                <div class="col-sm-12">
                                    <p>100% Original Product <br>
                                        Cash On delivery
                                    </p>
                                </div>
                            </div>
                            @if(!empty($productDetails->video))
                            <div class="tab-pane fade" id="video" >
                                <div class="col-sm-12">
                                    <video width="800" height="600" controls>
                                        <source src="{{URL::asset("video/".$productDetails->video)}}" type="video/mp4">
                                        Your browser does not support the video tag.
                                    </video>
                                </div>
                            </div>
                            @endif

                        </div>
                    </div><!--/category-tab-->

                    <div class="recommended_items"><!--recommended_items-->
                        <h2 class="title text-center">recommended items</h2>

                        <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <?php $count = 1; ?>
                                @foreach($reletedProducts->chunk(3) as $chunk )
                                <div <?php if($count == 1){ ?> class="item active" <?php }else{ ?> class="item" <?php } ?>>
                                    @foreach($chunk as $item)
                                    <div class="col-sm-4">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="{{asset('image/product_image/small/'.$item->image)}}" alt="" />
                                                    <h2>$ {{$item->price}}</h2>
                                                    <p>{{$item->product_name}}</p>
                                                    <a href="{{url('product/'.$item->id)}}">
                                                    <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button> </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    @endforeach
                                </div>
                                    <?php $count++; ?>
                                @endforeach

                            </div>
                            <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>
                    </div><!--/recommended_items-->

                </div>
            </div>
        </div>
    </section>
@endsection

@push('js')
    <script>
        $(document).ready(function () {
            $('#selSize').change(function () {
                let idSize = $(this).val();
                if(idSize == ""){
                    return false;
                }
                $.ajax({
                   type:'get',
                   url:"/get-product-price",
                    data:{idSize:idSize},
                    success:function (resp) {
                       // alert(resp); return false;
                        var arr = resp.split('#');
                        var arr1 = arr[0].split("-");

                        $('#getPrice').html(" TK "+arr1[0]+"<br> <h2> USD "+ arr1[1]+"<br> <h2> GBP "+ arr1[2]+ "<br> <h2> EUR "+ arr1[3]+"</h2>");
                        $('#Price').val(arr[0]);

                        if(arr[1] == 0){
                            $('#cartButton').hide();
                            $('#availablity').text('Out of Stock');
                        }else{
                            $('#cartButton').show();
                            $('#availablity').text('In Stock');
                        }
                    },
                    error:function () {
                        alet('Error');
                    }
                });

            });
        });


       $(document).ready(function () {
           $('.changeImage').click(function () {
               var image = $(this).attr('src');
               $('.mainImage').attr("src", image);
           });
       });

       $(document).ready(function () {
           // Instantiate EasyZoom instances
           var $easyzoom = $('.easyzoom').easyZoom();

           // Setup thumbnails example
           var api1 = $easyzoom.filter('.easyzoom--with-thumbnails').data('easyZoom');

           $('.thumbnails').on('click', 'a', function(e) {
               var $this = $(this);

               e.preventDefault();

               // Use EasyZoom's `swap` method
               api1.swap($this.data('standard'), $this.attr('href'));
           });

           // Setup toggles example
           var api2 = $easyzoom.filter('.easyzoom--with-toggle').data('easyZoom');

           $('.toggle').on('click', function() {
               var $this = $(this);

               if ($this.data("active") === true) {
                   $this.text("Switch on").data("active", false);
                   api2.teardown();
               } else {
                   $this.text("Switch off").data("active", true);
                   api2._init();
               }
           });
       });

    </script>
@endpush
