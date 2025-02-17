<style>
    .active {
        background: none;
        color: #fdb45e;
    }
</style>

<?php
use App\Http\Controllers\Controller;
$mainCategories = Controller::mainCategories();

use App\Models\Product;
$cartCount = Product::cartCount();
function set_active( $route ) {
    if( is_array( $route ) ){
        return in_array(Request::path(), $route) ? 'active' : '';
    }
    return Request::path() == $route ? 'active' : '';
}
?>
<header id="header"><!--header-->
    <div class="header_top"><!--header_top-->
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="contactinfo">
                        <ul class="nav nav-pills">
                            <li><a href="#"><i class="fa fa-phone"></i> +2 95 01 88 821</a></li>
                            <li><a href="#"><i class="fa fa-envelope"></i> info@domain.com</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="social-icons pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header_top-->

    <div class="header-middle"><!--header-middle-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="logo pull-left">
                        <a href="{{url('/')}}"><img src="{{asset('front/images/home/logo.png')}}" alt="" /></a>
                    </div>
                    <div class="btn-group pull-right">
                        <div class="btn-group">
                            <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                USA
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Canada</a></li>
                                <li><a href="#">UK</a></li>
                            </ul>
                        </div>

                        <div class="btn-group">
                            <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                DOLLAR
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Canadian Dollar</a></li>
                                <li><a href="#">Pound</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="shop-menu pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href="{{url('wish-list')}}"><i class="fa fa-star"></i> Wishlist</a></li>
                            <li><a class="{{ Request::url() == url('/orders') ? 'active' : '' }}" href="{{url('/orders')}}"><i class="fa fa-crosshairs"></i> Order</a></li>
                            <li><a class="{{ Request::url() == url('/cart') ? 'active' : '' }}" href="{{url('/cart')}}"><i class="fa fa-shopping-cart"></i> Cart ({{$cartCount}})</a></li>
                            @if(empty(\Illuminate\Support\Facades\Auth::check()))
                            <li><a class="{{ Request::url() == url('/login-register') ? 'active' : '' }}" href="{{url('/login-register')}}"><i class="fa fa-lock"></i> Login</a></li>
                            @else
                            <li><a class="{{ Request::url() == url('/account') ? 'active' : '' }}" href="{{url('/account')}}"><i class="fa fa-user"></i> Account</a></li>
                            <li><a href="{{url('/user-logout')}}"><i class="fa fa-sign-out"></i> Logout</a></li>
                            @endif
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-middle-->

    <div class="header-bottom"><!--header-bottom-->
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="mainmenu pull-left">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                            <li><a href="{{url('/')}}" class="{{ set_active('/') }}">Home</a></li>
                            <li class="dropdown"><a class="{{ request()->is('products*') ? 'active' : '' }}" href="#">Shop<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    @foreach($mainCategories as $cat)
                                         <li><a class="{{  Request::url() == url('/products/'.$cat->url) ? 'active' : '' }}" href="{{asset('/products/'.$cat->url)}}">{{$cat->category_name}}</a></li>
                                    @endforeach
                                </ul>
                            </li>
                            <li class="dropdown"><a href="#">Blog<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="blog.html">Blog List</a></li>
                                    <li><a href="blog-single.html">Blog Single</a></li>
                                </ul>
                            </li>

                            <li ><a class="{{ Request::url() == url('/page/contact') ? 'active' : '' }}" href="{{url('/page/contact')}}">Contact Us</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="search_box pull-right">
                        <form action="{{url('/search-products')}}" method="POST">{{csrf_field()}}
                            <input type="text" placeholder="Search Product" name="product" />
                            <button type="submit" style="border: 0px; height: 33px; margin-left: -3px;" >Go</button>
                        </form>
                      
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-bottom-->
</header><!--/header-->
