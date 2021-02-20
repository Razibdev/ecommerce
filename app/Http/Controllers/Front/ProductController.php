<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Banner;
use App\Models\Category;
use App\Models\Country;
use App\Models\Coupon;
use App\Models\DeliveryAddress;
use App\Models\Order;
use App\Models\OrderProduct;
use App\Models\Product;
use App\Models\ProductAttribute;
use App\Models\ProductImage;
use App\Models\User;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;

class ProductController extends Controller
{
    /**
     * @param null $url
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function products($url = null)
    {
        // Count category
        $countCategory = Category::where(['url' => $url, 'status' => 1])->count();
//        echo "<pre>"; print_r($countCategory); die;
        if ($countCategory == 0) {
            abort(404);
        } else {
            // Get all Categories
            $categories = Category::with('categories')->where(['parent_id' => 0, 'status' => 1])->get();

            $categoryDetails = Category::where(['url' => $url])->first();
            if ($categoryDetails->parent_id == 0) {
                // if url is main category url
                $subcategories = Category::with('categories')->where(['parent_id' => $categoryDetails->id, 'status' => 1])->get();
                if (count($subcategories) > 0) {
                    $subcategories = json_decode(json_encode($subcategories));
                    foreach ($subcategories as $key => $subcat) {

                        $cat_ids[] = $subcat->id;
                    }
                    $products = Product::whereIn('products.category_id', $cat_ids)->where('products.status', 1)->orderBy('products.id', 'Desc');

                    $breadcrumb = "<a href='/'>Home</a> / <a href='".$categoryDetails->url."'>.$categoryDetails->category_name.</a>";
                }else{
                    abort(404);
                }
            } else {
                // if url is sub category url
                $products = Product::where(['products.category_id' => $categoryDetails->id, 'products.status' => 1])->orderBy('products.id', 'Desc');
                $mainCategory = Category::where('id', $categoryDetails->parent_id)->first();
                $breadcrumb = "<a href='/'>Home</a> / <a href='".$mainCategory->url."'>.$mainCategory->category_name.</a> / <a href='".$categoryDetails->url."'>.$categoryDetails->category_name.</a>";
            }

            if(!empty($_GET['color'])){
                $colorArray = explode('-', $_GET['color']);
                $products = $products->whereIn('products.product_color', $colorArray);
            }

            if(!empty($_GET['sleeve'])){
                $sleeveArray = explode('-', $_GET['sleeve']);
                $products = $products->whereIn('products.sleeve', $sleeveArray);
            }

            if(!empty($_GET['pattern'])){
                $patternArray = explode('-', $_GET['pattern']);
                $products = $products->whereIn('products.pattern', $patternArray);
            }

            if(!empty($_GET['size'])){
                $sizeArray = explode('-', $_GET['size']);
                $products = $products->join('product_attributes','product_attributes.product_id', '=', 'products.id')
                    ->select('products.*', 'product_attributes.product_id', 'product_attributes.size')
                    ->groupBy('product_attributes.product_id')
                    ->whereIn('product_attributes.size', $sizeArray);

            }

            $products = $products->paginate(6);
//            $colorArr = array('Blue', 'Black', 'Red', 'Green', 'Brown', 'Gold', 'Orange', 'Pink', 'Purple', 'Silver', 'White', 'Yellow');
            // Color Filter
            $colorArr = Product::select('product_color')->groupBy('product_color')->get();
            $colorArr = Arr::flatten(json_decode(json_encode($colorArr), true));

            // Sleeve Filter
            $sleeveArr = Product::select('sleeve')->where('sleeve', '!=', '')->groupBy('sleeve')->get();
            $sleeveArr = Arr::flatten(json_decode(json_encode($sleeveArr), true));

            // Sleeve Filter
            $patternArr = Product::select('pattern')->where('pattern', '!=', '')->groupBy('pattern')->get();
            $patternArr = Arr::flatten(json_decode(json_encode($patternArr), true));
            // Size Filter
            $sizeArr = ProductAttribute::select('size')->groupBy('size')->get();
            $sizeArr = Arr::flatten(json_decode(json_encode($sizeArr), true));


            $banners = Banner::where('status', 1)->orderBy('id', 'desc')->limit(3)->get();
            $meta_title = $categoryDetails->meta_title;
            $meta_description = $categoryDetails->meta_description;
            $meta_keywords = $categoryDetails->meta_keywords;

            return view('products.listing', compact('categoryDetails', 'products', 'categories', 'banners', 'meta_title', 'meta_description', 'meta_keywords', 'url', 'colorArr', 'sleeveArr', 'patternArr', 'sizeArr', 'breadcrumb'));
        }
    }

    public function filter(Request $request){
        $data = $request->all();
       $colorUrl = "";
       if(!empty($data['colorFilter'])){
           foreach ($data['colorFilter'] as $color){
               if (empty($colorUrl)){
                   $colorUrl = "&color=".$color;
               }else{
                   $colorUrl .= "-".$color;
               }
           }
       }


        $sleeveUrl = "";
        if(!empty($data['sleeveFilter'])){
            foreach ($data['sleeveFilter'] as $sleeve){
                if (empty($sleeveUrl)){
                    $sleeveUrl = "&sleeve=".$sleeve;
                }else{
                    $sleeveUrl .= "-".$sleeve;
                }
            }
        }

        $patternUrl = "";
        if(!empty($data['patternFilter'])){
            foreach ($data['patternFilter'] as $pattern){
                if (empty($patternUrl)){
                    $patternUrl = "&pattern=".$pattern;
                }else{
                    $patternUrl .= "-".$pattern;
                }
            }
        }

        $sizeUrl = "";
        if(!empty($data['sizeFilter'])){
            foreach ($data['sizeFilter'] as $size){
                if (empty($sizeUrl)){
                    $sizeUrl = "&size=".$size;
                }else{
                    $sizeUrl .= "-".$size;
                }
            }
        }


       $finalUrl = "/products/".$data['url']."?".$colorUrl.$sleeveUrl.$patternUrl.$sizeUrl;
       return redirect::to($finalUrl);
    }


    public function product($id = null){
        // Get all Categories
        $categories = Category::with('categories')->where(['parent_id' => 0, 'status' => 1])->get();
        //get Product Details
        $productDetails = Product::with('attributes')->where('id', $id)->first();
        $productDetails = json_decode(json_encode($productDetails));
//        echo "<pre>"; print_r($productDetails); die;
        $reletedProducts = Product::where('id', '!=', $id)->where(['category_id' => $productDetails->category_id, 'status' => 1])->get();
        $productAltImages = ProductImage::where('product_id', $id)->get();
        $total_stock = ProductAttribute::where('product_id', $id)->sum('stock');
        $meta_title = $productDetails->product_name;
        $meta_description = $productDetails->description;
        $meta_keywords = $productDetails->product_name;
        return view('products.detail', compact('productDetails', 'categories', 'productAltImages', 'total_stock', 'reletedProducts', 'meta_title', 'meta_description', 'meta_keywords'));
    }

    public function getProductPrice(Request $request){
        $data = $request->all();
//        echo "<pre>"; print_r($data); die;
        $proArr = explode('-', $data['idSize']);
//        echo $proArr[0]; echo $proArr[1]; die;
        $proAttr = ProductAttribute::where(['product_id' => $proArr[0], 'size' => $proArr[1]])->first();
        $getCurrencyRates = Product::getCurrencyRates($proAttr->price);
        echo $proAttr->price."-".$getCurrencyRates['USD_Rate']."-".$getCurrencyRates['GBP_Rate']."-".$getCurrencyRates['EUR_Rate'];
        echo "#";
        echo $proAttr->stock;
    }


    public function addtocart(Request $request){
        Session::forget('CouponAmount');
        Session::forget('CouponCode');
        $data = $request->all();
//        echo "<pre>"; print_r($data); die;

        if(!empty($data['wishListButton']) && $data['wishListButton'] == 'wish list'){
            // check user is login or not
            if(!Auth::check()){
                Toastr::error('Please login to add product in your wish list', 'Error');
                return redirect()->back();
            }

            // Get Product Size
            $product_size = explode("-", $data['size']);
            // Get Product Price
            $getProductPrice= ProductAttribute::where(['product_id' => $data['product_id'], 'size' => $product_size[1]])->first();
            $product_price = $getProductPrice->price;
            //Get User email
            $user_email = Auth::user()->email;
            //Set Quantity
            $quantiiy = 1;
            // Get Current Date
            $created_at = Carbon::now();
            // wish list count
            $wishListCount = DB::table('wish_lists')->where(['user_email'=> $user_email, 'product_id' => $data['product_id'], 'product_color' => $data['product_color'], 'size' => $product_size[1]])->count();

            if($wishListCount > 0){
                Toastr::error('Product already exists in wish lists', 'Error');
                return redirect()->back();
            }else{
                // Insert Product in Wish List
                DB::table('wish_lists')->insert(['product_id' => $data['product_id'], 'product_name' => $data['product_name'],  'product_color' => $data['product_color'],  'product_code' => $data['product_code'], 'price' => $product_price, 'quantity' => $quantiiy,  'size' => $product_size[1], 'user_email' => $user_email, 'created_at' => $created_at ]);

                Toastr::success('Product has been added in wish list!', 'Success');
                return redirect()->back();
            }

        }else{
//            echo "<pre>"; print_r($data); die;
            if(!empty($data['cartButton']) && $data['cartButton'] == "Add to Cart"){
               $data['quantity'] = 1;
            }
            // Check Product stock is available or not
            $product_size = explode("-", $data['size']);
            $getProductStock = ProductAttribute::where(['product_id' => $data['product_id'], 'size' => $product_size[1]])->first();
            if($getProductStock->stock < $data['quantity']){
                Toastr::error('Required Quantity is not available', 'success');
                return redirect()->back();
            }
            $size = $data['size'];
            $size_s = explode("-", $size);
            $session_id = Session::get('session_id');
            if(empty($session_id)){
                $session_id = Str::random(40);
                Session::put('session_id', $session_id);
            }
            if(Auth::check()){
                $user_email = Auth::user()->email;
                $countProduct =  DB::table('cart')->where(['product_id' => $data['product_id'], 'product_color' => $data['product_color'], 'size' => $size_s[1], 'user_email' => $user_email])->count();
            }else{
                $countProduct =  DB::table('cart')->where(['product_id' => $data['product_id'], 'product_color' => $data['product_color'], 'size' => $size_s[1], 'session_id' => $session_id])->count();
            }


            if($countProduct > 0){
                Toastr::error('Product Already Exists in cart!','error');
                return redirect()->back();
            }else{
                if(Auth::check()){
                    $user_email = Auth::user()->email;
                    $getSKU = ProductAttribute::select('sku')->where(['product_id'=> $data['product_id'], 'size' => $size_s[1]])->first();
                    DB::table('cart')->insert(['product_id' => $data['product_id'], 'product_name' => $data['product_name'], 'product_code' =>$getSKU->sku, 'product_color' => $data['product_color'], 'price'=> $data['price'], 'size' => $size_s[1], 'quantity' => $data['quantity'], 'user_email' => $user_email, 'session_id' => $session_id]);
                }else{
                    $getSKU = ProductAttribute::select('sku')->where(['product_id'=> $data['product_id'], 'size' => $size_s[1]])->first();
                    DB::table('cart')->insert(['product_id' => $data['product_id'], 'product_name' => $data['product_name'], 'product_code' =>$getSKU->sku, 'product_color' => $data['product_color'], 'price'=> $data['price'], 'size' => $size_s[1], 'quantity' => $data['quantity'], 'user_email' => '', 'session_id' => $session_id]);
                }
            }
            Toastr::success('Product has been added in Cart!', 'success');
            return redirect('cart');
        }
    }




    public function cart(){

        if(Auth::check()){
            $user_email = Auth::user()->email;
            $userCart = DB::table('cart')->where(['user_email' => $user_email])->get();
        }else{
            $session_id = Session::get('session_id');
            $userCart = DB::table('cart')->where(['session_id' => $session_id])->get();
        }
//        echo "<pre>"; print_r($userCart); die;

        foreach ($userCart as $key => $product){
//            echo $product->product_id;
            $productDetails = Product::where('id', $product->product_id)->first();
            $userCart[$key]->image = $productDetails->image;
        }
        $meta_title = "Shopping cart E-com Website";
        $meta_description = "View Shopping cart of E-com Website";
        $meta_keywords = "shopping cart, e-com website";

//        echo "<pre>"; print_r($userCart); die;
        return view('products.cart', compact('userCart', 'meta_title', 'meta_description', 'meta_keywords'));
    }


    public function wishList(){
        $user_email = Auth::user()->email;
        $userWishList = DB::table('wish_lists')->where('user_email', $user_email)->get();

        foreach ($userWishList as $key => $product){
//            echo $product->product_id;
            $productDetails = Product::where('id', $product->product_id)->first();
            $userWishList[$key]->image = $productDetails->image;
        }
        $meta_title = "Wish List E-com Website";
        $meta_description = "View Wish List of E-com Website";
        $meta_keywords = "wish list, e-com website";
        return view('products.wish_list', compact('userWishList', 'meta_title', 'meta_description', 'meta_keywords'));
    }


    public function deleteCartProduct($id = null){
        Session::forget('CouponAmount');
        Session::forget('CouponCode');
        DB::table('cart')->where('id', $id)->delete();
        Toastr::success('Product has been deleted from Cart!', 'success');
        return redirect('cart');
    }


    public function updateCartQuantity($id = null, $quantity=null){
        Session::forget('CouponAmount');
        Session::forget('CouponCode');
        $getCartDetails = DB::table('cart')->where('id', $id)->first();
        $getAttributeStock = ProductAttribute::where('sku', $getCartDetails->product_code)->first();
        $updated_quantity = $getCartDetails->quantity+$quantity;

        if($getAttributeStock->stock >= $updated_quantity){
            DB::table('cart')->where('id', $id)->increment('quantity', $quantity);
            Toastr::success('Product quantity has been updated', 'success');
            return redirect('cart');
        }else{
            Toastr::error('Require Product Quantity is not available', 'error');
            return redirect('cart');
        }

    }

    public function checkPincode(Request $request){
        if($request->isMethod('post')){
            $data = $request->all();
            $pincodeCount = DB::table('pincodes')->where(['pincode' => $data['pincode']])->count();
            if($pincodeCount > 0){
                return true;
            }else{
                return false;
            }
        }
    }


public function applyCoupon(Request $request){
    Session::forget('CouponAmount');
    Session::forget('CouponCode');
    $data = $request->all();
//    echo "<pre>"; print_r($data); die;
    $couponCount = Coupon::where(['coupon_code' => $data['coupon_code']])->count();

    if($couponCount == 0){
        Toastr::error('Coupon code is not exist', 'error');
        return redirect()->back();
    }else{
        // coupon details
        $couponDetails = Coupon::where('coupon_code', $data['coupon_code'])->first();
        // If Coupon code is Inactive
        if($couponDetails->status ==0){
            Toastr::error('Coupon code is not active', 'error');
            return redirect()->back();
        }

        // If coupon si expiry
        $expiry_date = $couponDetails->expiry_date;
        $current_date = date('Y-m-d');

        if($expiry_date < $current_date){
            Toastr::error('This coupon is expiry!', 'error');
            return redirect()->back();
        }

        // get cart total amount
        if(Auth::check()){
            $user_email = Auth::user()->email;
            $userCart = DB::table('cart')->where(['user_email' => $user_email])->get();
        }else{
            $session_id = Session::get('session_id');
            $userCart = DB::table('cart')->where(['session_id'=> $session_id])->get();

        }


        $total_amount = 0;
        foreach ($userCart as $item){
            $total_amount = $total_amount + ($item->price * $item->quantity);
        }

        // if check amount type is fixed or percentage
        if($couponDetails->amount_type == "Fixed"){
            $couponAmount =  $couponDetails->amount;
        }else{
            $couponAmount = $total_amount * ($couponDetails->amount/100);
        }

       // Add coupon amount in session

        Session::put('CouponAmount', $couponAmount);
        Session::put('CouponCode', $data['coupon_code']);

        Toastr::success('Coupon Code Successfully applied. you are availing discount! ', 'success');
        return redirect()->back();

    }
}


public function checkout(Request $request){
    $user_id = Auth::user()->id;
//    echo "<pre>"; print_r($user_id); die;
    $user_email = Auth::user()->email;
    $userDetails = User::find($user_id);
    $countries = Country::get();
    $shippingDetails = array();
    $shippingcount = DeliveryAddress::where('user_id', $user_id)->count();
    if($shippingcount > 0){
        $shippingDetails = DeliveryAddress::where('user_id', $user_id)->first();
    }
    // Update cart table with user email
    $session_id = Session::get('session_id');
    DB::table('cart')->where(['session_id' => $session_id])->update(['user_email' => $user_email]);
    if($request->isMethod('post')){
        $data = $request->all();
//        echo "<pre>"; print_r($data); die;

        if(empty($data['billing_name']) || empty($data['billing_address']) || empty($data['billing_city']) || empty($data['billing_state']) || empty($data['billing_country']) || empty($data['billing_picode']) || empty($data['billing_mobile']) || empty($data['shipping_name']) || empty($data['shipping_address']) || empty($data['shipping_city']) || empty($data['shipping_state']) || empty($data['shipping_country']) || empty($data['shipping_picode']) || empty($data['shipping_mobile'])){
            Toastr::error('Please fill all fields to continue!', 'error');
            return redirect()->back();
        }

        // Update User Details
        User::where('id', $user_id)->update(['name' => $data['billing_name'], 'address' => $data['billing_address'], 'city' => $data['billing_city'], 'state' => $data['billing_state'], 'country' => $data['billing_country'], 'pincode' => $data['billing_picode'], 'mobile' => $data['billing_mobile']]);

        if($shippingcount > 0){
            // update shipping address
            DeliveryAddress::where('user_id', $user_id)->update(['user_email' => $user_email,'name' => $data['shipping_name'], 'address' => $data['shipping_address'], 'city' => $data['shipping_city'], 'state' => $data['shipping_state'], 'country' => $data['shipping_country'], 'pincode' => $data['shipping_picode'], 'mobile' => $data['shipping_mobile']]);
        }else{
            // add new shipping address
            $shipping = new DeliveryAddress;
            $shipping->user_id = $user_id;
            $shipping->user_email = $user_email;
            $shipping->name = $data['shipping_name'];
            $shipping->address = $data['shipping_address'];
            $shipping->city = $data['shipping_city'];
            $shipping->state = $data['shipping_state'];
            $shipping->country = $data['shipping_country'];
            $shipping->pincode = $data['shipping_picode'];
            $shipping->mobile = $data['shipping_mobile'];
            $shipping->save();

        }

        $pincodeCount = DB::table('pincodes')->where('pincode', $data['shipping_picode'])->count();

        if($pincodeCount == 0){
            Toastr::error('Your location is not available for delivery. Please enter another location', 'Error');
            return redirect()->back();
        }

        return redirect()->action('App\Http\Controllers\Front\ProductController@orderReview');

    }
    $meta_title = "Checkout - E-com Website";

    return view('products.checkout', compact('userDetails', 'countries', 'shippingcount', 'shippingDetails', 'meta_title'));
}


public function orderReview(){
        $user_id = Auth::user()->id;
        $user_email = Auth::user()->email;
        $session_id = Session::get('session_id');
        $userDetails = User::where('id', $user_id)->first();
        $shippingDetails = DeliveryAddress::where('user_id', $user_id)->first();

        $userCart = DB::table('cart')->where(['user_email' => $user_email])->get();
        $total_weight = 0;

        foreach ($userCart as $key => $product){
    //            echo $product->product_id;
            $productDetails = Product::where('id', $product->product_id)->first();
            $userCart[$key]->image = $productDetails->image;
            $total_weight = $total_weight + $productDetails->weight;
        }

        $shippingCharges = Product::getShippingCharges($total_weight, $shippingDetails->country);
        Session::put('ShippingCharges', $shippingCharges);
//        echo "<pre>"; print_r($userCart); die;
        $meta_title = "Checkout - E-com Website";
        return view('products.order_review',compact('userDetails', 'shippingDetails', 'userCart', 'meta_title', 'shippingCharges'));
}


public function placeOrder(Request $request){
       if($request->isMethod('post')){
           $data = $request->all();
           $user_id = Auth::user()->id;
           $user_email = Auth::user()->email;
           // Prevent Out of Stock  products from ordering
           $user_cart = DB::table('cart')->where('user_email', $user_email)->get();
            foreach ($user_cart as $cart){
                $getAttributeCount = Product::getAttributeCount($cart->product_id, $cart->size);
                if($getAttributeCount == 0){
                    Product::deleteCartProduct($cart->product_id, $user_email);
                    Toastr::error('One of the product is not available. Try again!', 'Error');
                    return \redirect('/cart');
                }

                $product_stock = Product::getProductStock($cart->product_id, $cart->size);
                if($product_stock == 0){
                    Product::deleteCartProduct($cart->product_id, $user_email);
                    Toastr::error('Product is sold out, Please choose another product', 'Error');
                    return \redirect('/cart');
                }

                if($cart->quantity > $product_stock){
                    Toastr::error('Reduce Product Stock!! Please Try again!!', 'Error');
                    return \redirect('/cart');
                }

                $product_status = Product::getProductsStatus($cart->product_id);
                if($product_status == 0){
                    Product::deleteCartProduct($cart->product_id, $user_email);
                    Toastr::error('Disabled Product remove from cart. Please try again!', 'Error');
                    return \redirect('/cart');
                }

                $getCategoryId = Product::select('category_id')->where('id', $cart->product_id)->first();
                $category_status = Product::getCategoryStatus($getCategoryId->category_id);
                if($category_status ==0){
                    Product::deleteCartProduct($cart->product_id, $user_email);
                    Toastr::error('One of the product category is disabled. Please try again!', 'Error');
                    return \redirect('/cart');
                }

            }

            $shippingDetails = DeliveryAddress::where('user_email', $user_email)->first();

            $pincodeCount = DB::table('pincodes')->where('pincode', $shippingDetails->pincode)->count();

            if($pincodeCount == 0){
                Toastr::error('Your location is not available for delivery. Please choose another location', 'Error');
                return redirect()->back();
            }

           if(empty(Session::get('CouponCode'))){
              $coupon_code = '';
           }else{
               $coupon_code = Session::get('CouponCode');
           }
           if(empty(Session::get('CouponAmount'))){
               $coupon_amount = '';
           }else{
               $coupon_amount = Session::get('CouponAmount');
           }
//           $shippingCharges = Product::getShippingCharges($shippingDetails->country);

           $data['grand_total'] = 0;

           $grandTotal = Product::getGrandTotal();

           $order = new Order;
           $order->user_id = $user_id;
           $order->user_email = $user_email;
           $order->name = $shippingDetails->name;
           $order->address = $shippingDetails->address;
           $order->city = $shippingDetails->city;
           $order->state = $shippingDetails->state;
           $order->country = $shippingDetails->country;
           $order->pincode = $shippingDetails->pincode;
           $order->mobile = $shippingDetails->mobile;
           $order->coupon_code = $coupon_code;
           $order->coupon_amount =$coupon_amount;
           $order->order_status = "New";
           $order->shipping_charges = 0;
           $order->payment_method = $data['payment_method'];
           $order->shipping_charges = Session::get('ShippingCharges');

           $order->grand_total = $grandTotal;
           $order->save();

           $order_id = DB::getPdo()->lastInsertId();
           $cartProducts = DB::table('cart')->where(['user_email' => $user_email])->get();
           foreach ($cartProducts as $pro){
               $cartPro = new OrderProduct;
               $cartPro->order_id = $order_id;
               $cartPro->user_id = $user_id;
               $cartPro->product_id = $pro->product_id;
               $cartPro->product_name = $pro->product_name;
               $cartPro->product_code = $pro->product_code;
               $cartPro->product_color = $pro->product_color;
               $cartPro->product_size = $pro->size;
               $product_price = Product::getProductPrice($pro->product_id, $pro->size);

               $cartPro->product_price = $product_price;
               $cartPro->product_qty = $pro->quantity;
               $cartPro->save();
               // Reduce Stock Scripts Start
               $getProductStock = ProductAttribute::where('sku', $pro->product_code)->first();
               $new_stock = $getProductStock->stock - $pro->quantity;
               if($new_stock <= 0){
                   $new_stock = 0;
               }
               ProductAttribute::where('sku', $pro->product_code)->update(['stock'=> $new_stock]);

           }

           Session::put('order_id', $order_id);
           Session::put('grand_total', $grandTotal);
           if($data['payment_method'] == 'COD'){
               $productDetails = Order::with('orders')->where('id', $order_id)->first();
               $userDetails = User::where('id', $user_id)->first();
               /* Code for order Email start */
                $email = $user_email;
                $messageData = [
                    'email' => $email,
                    'name'  => $shippingDetails->name,
                    'order_id' => $order_id,
                    'productDetails' => $productDetails,
                    'userDetails'   => $userDetails
                ];
                Mail::send('admin.emails.order', $messageData, function ($message) use($email){
                    $message->to($email)->subject('Order Placed - E-com Website');
               });
               /* Code for order Email End */


               return redirect('/thanks');
           }else{
               return redirect('/paypal');
           }

       }
}

public function thanks(Request $request){
        $user_email = Auth::user()->email;
        DB::table('cart')->where('user_email', $user_email)->delete();

        return view('orders.thanks');
}

    public function paypal(Request $request){
        $user_email = Auth::user()->email;
        DB::table('cart')->where('user_email', $user_email)->delete();
        return view('orders.paypal');
    }


public function userOrders(){
        $user_id = Auth::user()->id;
        $orders = Order::with('orders')->where('user_id', $user_id)->get();

        return view('orders.users_orders', compact('orders'));
}


public function userOrderDetails($order_id){
        $user_id = Auth::user()->id;
        $orderDetails = Order::with('orders')->where('id', $order_id)->first();
//        $orderDetails = json_decode(json_encode($orderDetails));
////        echo "<pre>"; print_r($orderDetails); die;
        return view('orders.user_order_details',compact('orderDetails'));
}


public function thanksPaypal(){
        return view('orders.thanks_paypal');
}
public function cancelPaypal(){
    return view('orders.cancel_paypal');

}

public function searchProducts(Request $request){
        if($request->isMethod('post')){
            $data = $request->all();
//            echo "<pre>"; print_r($data); die;
            $categories = Category::with('categories')->where(['parent_id' => 0])->get();
            $search_product = $data['product'];
//            $products = Product::where('product_name', 'like', '%'.$search_product.'%')->orwhere('product_code', $search_product)->where('status', 1)->paginate();
            $products = Product::where(function ($query) use ($search_product){
                $query->where('product_name', 'like', '%'.$search_product.'%')
                    ->orwhere('product_code', 'like', '%'.$search_product.'%')
                    ->orwhere('description', 'like', '%'.$search_product.'%')
                    ->orwhere('product_color', 'like', '%'.$search_product.'%');})
                    ->where('status', 1)->get();
            $breadcrumb = "<a href='/'>Home</a> /". $search_product;
            return view('products.listing',compact('categories', 'products', 'search_product', 'breadcrumb'));

        }
}


public function deleteWishListProduct($id){
        DB::table('wish_lists')->where('id', $id)->delete();
        Toastr::success('Product has been deleted from wish list!!!', 'Success');
        return redirect()->back();
}







}
