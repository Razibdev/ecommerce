<?php

namespace App\Http\Controllers\Admin;

use App\Exports\ProductsExport;
use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Order;
use App\Models\Product;
use App\Models\ProductAttribute;
use App\Models\ProductImage;
use App\Models\User;
use Barryvdh\DomPDF\PDF;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Session;
use Intervention\Image\Facades\Image;
use Maatwebsite\Excel\Facades\Excel;

class ProductsController extends Controller
{
    public function addProduct(Request $request){
        Session::put('page', 'add_product');
        if($request->isMethod('post')){
            $data = $request->all();

            // Category validation
            $rules = [
                'product_name'   => 'required|regex:/(^([a-zA-z -]+)(\d+)?$)/u',
                'product_code' => 'required|regex:/(^([a-zA-z]+)(\d+)?$)/u',
                'product_color' => 'required',
                'category_id' => 'required',
                'product_price' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/',

            ];
            $customMessage = [
                'product_name.required' => 'Product Name is required',
                'product_name.regex'    => 'Valid Product Name is required',
                'product_code.required'    => 'Product Code is required',
                'product_code.regex'    => 'Valid Product Code is required',
                'category_id.required'    => 'Category Level is required',
                'product_price.required'    => 'Product price is required',
                'product_price.regex'    => 'Valid Product Price is required'


            ];
            $this->validate($request, $rules, $customMessage);

            if (empty($data['product_description'])){
                $data['product_description'] = "";
            }

            if (empty($data['sleeve'])){
                $data['sleeve'] = "";
            }

            if (empty($data['weight'])){
                $data['weight'] = 0;
            }

            if (empty($data['pattern'])){
                $data['pattern'] = "";
            }

            if (empty($data['care'])){
                $data['care'] = "";
            }
            if(empty($data['feature_item'])){
                $feature_item = 0;
            }else{
                $feature_item = 1;
            }
            //Upload Image
            if($request->hasFile('product_image')){
                $image_tmp = $request->file('product_image');
                if($image_tmp->isValid()){
                    $extension = $image_tmp->getClientOriginalExtension();
                    $filename = rand(111, 99999).'.'.$extension;
                    $large_image_path = "image/product_image/large/".$filename;
                    $medium_image_path = "image/product_image/medium/".$filename;
                    $small_image_path = "image/product_image/small/".$filename;

                    // Resize Image
                    Image::make($image_tmp)->save($large_image_path);
                    Image::make($image_tmp)->resize(600, 600)->save($medium_image_path);
                    Image::make($image_tmp)->resize(300, 300)->save($small_image_path);

                }
            }

            if($request->hasFile('video')){
                $video_tmp = $request->file('video');
                $video_name = $video_tmp->getClientOriginalName();
                $video_path = 'video/';
                $video_tmp->move($video_path, $video_name);

            }

            $product = new Product;
            $product->category_id = $data['category_id'];
            $product->product_name = $data['product_name'];
            $product->product_code = $data['product_code'];
            $product->product_color = $data['product_color'];
            $product->description = $data['product_description'];
            $product->price = $data['product_price'];
            $product->image = $filename;
            $product->video = $video_name;
            $product->sleeve = $data['sleeve'];
            $product->weight = $data['weight'];
            $product->pattern = $data['pattern'];
            $product->care = $data['care'];
            $product->feature_item = $feature_item;
            $product->save();
            Toastr::success('Product has been added successfully', 'success');
            return redirect('/admin/view-products');

        }

        $categories = Category::where(['parent_id' => 0])->get();
        $categories_dropdown = "<option selected disabled>Select</option>";
        foreach ($categories as $cat){
            $categories_dropdown .= "<option value='".$cat->id."'>".$cat->category_name."</option>";
            $sub_categories = Category::where(['parent_id' => $cat->id])->get();
            foreach ($sub_categories as $sub_cat){
                $categories_dropdown .= "<option value='".$sub_cat->id."'> &nbsp; &nbsp; &raquo; &nbsp; &nbsp;".$sub_cat->category_name."</option>";

            }

        }
        // SleeveArr
        $sleeveArr = array('Full Sleeve', 'Half Sleeve', 'Short Sleeve', 'Sleeveless');
        $patternArr = array('Checked', 'Plain', 'Printed', 'Self', 'Solid');
        return view('admin.products.add_product', compact('categories_dropdown', 'sleeveArr', 'patternArr'));
    }

    public function editProduct(Request $request, $id=null){
        $productDetails = Product::where(['id' => $id])->first();

        if($request->isMethod('post')){
            $data = $request->all();
            //Upload Image
            if($request->hasFile('product_image')){
                $image_tmp = $request->file('product_image');
                if($image_tmp->isValid()){
                    $extension = $image_tmp->getClientOriginalExtension();
                    $filename = rand(111, 99999).'.'.$extension;

                }
                if (isset($productDetails->image)){
                    $large_image_path = "image/product_image/large/".$productDetails->image;
                    $medium_image_path = "image/product_image/medium/".$productDetails->image;
                    $small_image_path = "image/product_image/small/".$productDetails->image;
                    if(File::exists($large_image_path)) {
                        File::delete($large_image_path);
                    }
                    if(File::exists($medium_image_path)){
                        File::delete($medium_image_path);
                    }

                    if(File::exists($small_image_path)){
                        File::delete($small_image_path);
                    }
                }

                $large_image_path = "image/product_image/large/".$filename;
                $medium_image_path = "image/product_image/medium/".$filename;
                $small_image_path = "image/product_image/small/".$filename;

                // Resize Image
                Image::make($image_tmp)->save($large_image_path);
                Image::make($image_tmp)->resize(600, 600)->save($medium_image_path);
                Image::make($image_tmp)->resize(300, 300)->save($small_image_path);

            }else{
                $filename = $data['current_image'];
            }


            if($request->hasFile('video')){
                $video_tmp = $request->file('video');
                $video_name = $video_tmp->getClientOriginalName();
                if (isset($productDetails->video)){
                    $video_path = "video/".$productDetails->video;

                    if(File::exists($video_path)){
                        File::delete($video_path);
                    }
                }
                $video_tmp->move('video/', $video_name);

            }else if(!empty($data['current_video'])){
                $video_name = $data['current_video'];
            }else{
                $video_name = "";
            }

            if (empty($data['weight'])){
                $data['weight'] = 0;
            }

            if (empty($data['sleeve'])){
                $data['sleeve'] = "";
            }
            if (empty($data['pattern'])){
                $data['pattern'] = "";
            }

            if(empty($data['product_description'])){
              $data['product_description'] = "";
            }
            if (empty($data['care'])){
                $data['care'] = "";
            }
            if(!empty($data['feature_item'])){
                $feature_item = 1;
            }else{
                $feature_item = 0;
            }

            Product::where(['id' => $id])->update(['category_id' => $data['category_id'], 'product_name' => $data['product_name'], 'product_code' => $data['product_code'], 'product_color' => $data['product_color'], 'description' => $data['product_description'], 'price' => $data['product_price'], 'image' => $filename, 'care' => $data['care'], 'feature_item' => $feature_item, 'video' => $video_name, 'sleeve' => $data['sleeve'], 'pattern' => $data['pattern'], 'weight' => $data['weight']]);
            Toastr::success('Product has been updated successfully', 'success');
            return redirect('/admin/view-products');
        }
        // category name
        $categories = Category::where(['parent_id' => 0])->get();
        $categories_dropdown = "<option selected disabled>Select</option>";
        foreach ($categories as $cat){
            if($cat->id == $productDetails->category_id){
                $selected = "selected";
            }else{
                $selected = "";
            }
            $categories_dropdown .= "<option value='".$cat->id."' ".$selected." disabled>".$cat->category_name."</option>";
            $sub_categories = Category::where(['parent_id' => $cat->id])->get();
            foreach ($sub_categories as $sub_cat){
                if($sub_cat->id == $productDetails->category_id){
                    $selected = "selected";
                }else{
                    $selected = "";
                }
                $categories_dropdown .= "<option value='".$sub_cat->id."' ".$selected."> &nbsp; &nbsp; &raquo; &nbsp; &nbsp;".$sub_cat->category_name."</option>";

            }

        }
        // SleeveArr
        $sleeveArr = array('Full Sleeve', 'Half Sleeve', 'Short Sleeve', 'Sleeveless');
        $patternArr = array('Checked', 'Plain', 'Printed', 'Self', 'Solid');
        return view('admin.products.edit_product', compact('productDetails', 'categories_dropdown', 'sleeveArr', 'patternArr'));
    }

    public function viewProducts(){

        if(Session::get('adminDetails')['products_access'] == 0){
            Toastr::error('You have no access for this module ', 'Error');
            return redirect('/admin/dashboard');
        }
        Session::put('page', 'product_view');
        $products = Product::with('category')->get();
        $products = json_decode(json_encode($products));
//       echo "<pre>"; print_r($products); die;
        return view('admin.products.view_products', compact('products'));
    }


    public function exportProducts(){
        $name = 'Products-'.rand().'.xlsx';
        return Excel::download(new ProductsExport(), $name);
    }


    public function updateProductStatus(Request $request){
        $product = Product::findOrFail($request->product_id);
        $product->status = $request->status;
        $product->save();
        return response()->json([
            'message' => 'Product Status Updated Successfully !'
        ]);
    }


    public  function deleteProduct($id){
        $delete_product = Product::where('id', $id)->first();
//       $delete_category = json_decode(json_encode($delete_product));
//       echo '<pre>'; print_r($delete_category); die();

        if (isset($delete_product->image)) {
            $large_image_path = "image/product_image/large/" . $delete_product->image;
            $medium_image_path = "image/product_image/medium/" . $delete_product->image;
            $small_image_path = "image/product_image/small/" . $delete_product->image;
            if (File::exists($large_image_path)) {
                File::delete($large_image_path);
            }
            if (File::exists($medium_image_path)) {
                File::delete($medium_image_path);
            }

            if (File::exists($small_image_path)) {
                File::delete($small_image_path);
            }

        }

            if (isset($delete_product->video)){
                $video_path = "video/".$delete_product->video;

                if(File::exists($video_path)){
                    File::delete($video_path);
                }
        }

        $delete_product->delete();
        Toastr::success('Product has been deleted', 'success');
        return redirect('/admin/view-products');
    }


    public function addAttribute(Request $request, $id = null){
        $productDetails = Product::with('attributes')->where(['id' => $id])->first();
//        $productDetails = json_decode(json_encode($productDetails));
//        echo "<pre>"; print_r($productDetails); die;

        if($request->isMethod('post')){
            $data = $request->all();
            foreach ($data['sku'] as $key => $val){
                if(!empty($val)){
                    $attrCountSKU = ProductAttribute::where('sku', $val)->count();
                    if($attrCountSKU > 0){
                        Toastr::error('SKU already exists! Please add another SKU', 'error');
                        return redirect('admin/add-attribute/'.$id);
                    }

                    // Prevent Duplicate Size
                    $attrCountSize = ProductAttribute::where(['product_id'=> $id, 'size' => $data['size'][$key]])->count();
                    if($attrCountSize > 0){
                        Toastr::error('Size already exists! Please add another Size', 'error');
                        return redirect('admin/add-attribute/'.$id);
                    }


                    $attribute = new ProductAttribute;
                    $attribute->product_id = $id;
                    $attribute->sku = $val;
                    $attribute->size = $data['size'][$key];
                    $attribute->price = $data['price'][$key];
                    $attribute->stock = $data['stock'][$key];
                    $attribute->save();
                }
            }
            Toastr::success('Attributes Added successfully ', 'success');
            return redirect('admin/add-attribute/'.$id);
        }
        return view('admin.products.add_attributes', compact('productDetails'));
    }



public function updateAttributeStatus(Request $request){
    $attribute = ProductAttribute::findOrFail($request->attribute_id);
    $attribute->status = $request->status;
    $attribute->save();
    return response()->json([
        'message' => 'Attribute Status Updated Successfully !'
    ]);
}

public function deleteAttribute($id = null){
    $delete_attribute = ProductAttribute::where('id', $id)->first();
    $delete_attribute->delete();
    Toastr::success('Product attribute has been deleted', 'success');
    return redirect()->back();
}

    public function editAttributes(Request $request){
        if($request->isMethod('post')){
            $data = $request->all();
//            $productData = Product::select('id')->with('attribute')->find($id);
            foreach ($data['attrId'] as $key => $attr){
                if(!empty($attr)){
                    ProductAttribute::where(['id'=> $data['attrId'][$key]])->update(['price' => $data['price'][$key], 'stock' => $data['stock'][$key]]);
                }
            }
            Toastr::success('Attribute Updated successfully', 'success');
            return redirect()->back();
        }
    }

    public function addImages(Request $request, $id=null){
        $productDetails = Product::with('images')->where(['id' => $id])->first();

        if($request->isMethod('post')){
            // Add Images
            $data = $request->all();
//            echo "<pre>"; print_r($data); die;

            if($request->hasFile('image')) {
                $files = $request->file('image');
                foreach ($files as $file) {
                    // Upload Images after resize
                    $image = new ProductImage;
                    $extension = $file->getClientOriginalExtension();
                    $fileName = rand(111, 99999) . '.' . $extension;

                    $large_image_path = "image/product_image/large/" . $fileName;
                    $medium_image_path = "image/product_image/medium/" . $fileName;
                    $small_image_path = "image/product_image/small/" . $fileName;
                    Image::make($file)->save($large_image_path);
                    Image::make($file)->resize(600, 600)->save($medium_image_path);
                    Image::make($file)->resize(300, 300)->save($small_image_path);
                    $image->image = $fileName;
                    $image->product_id = $id;
                    $image->save();
                }
            }
            Toastr::success('Product Alternative Images add successfully', 'success');
            return redirect('admin/add-images/'.$id);

        }
//        $productImages = ProductImage::where(['product_id' => $id])->get();

        return view('admin.products.add_images', compact('productDetails'));
    }

public function deleteImage($id){
    $delete_product_image = ProductImage::where('id', $id)->first();
//       $delete_category = json_decode(json_encode($delete_product));
//       echo '<pre>'; print_r($delete_category); die();

    if (isset($delete_product_image->image)) {
        $large_image_path = "image/product_image/large/" . $delete_product_image->image;
        $medium_image_path = "image/product_image/medium/" . $delete_product_image->image;
        $small_image_path = "image/product_image/small/" . $delete_product_image->image;
        if (File::exists($large_image_path)) {
            File::delete($large_image_path);
        }
        if (File::exists($medium_image_path)) {
            File::delete($medium_image_path);
        }

        if (File::exists($small_image_path)) {
            File::delete($small_image_path);
        }

    }
    $delete_product_image->delete();
    Toastr::success('Product Image has been deleted', 'success');
    return redirect()->back();
}


public function viewOrders(){
        Session::put('page', 'view_orders');
        $orders = Order::with('orders')->orderByDesc('id')->get();
        return view('admin.orders.view_orders',compact('orders'));
}

public function viewOrdersDetails($order_id){
        $orderDetails = Order::with('orders')->where('id', $order_id)->first();
        $user_id = $orderDetails->user_id;
        $userDetails = User::where('id', $user_id)->first();
        return view('admin.orders.order_details', compact('orderDetails', 'userDetails'));

}

    public function viewOrdersInvoice($order_id){
        $orderDetails = Order::with('orders')->where('id', $order_id)->first();
        $user_id = $orderDetails->user_id;
        $userDetails = User::where('id', $user_id)->first();
        return view('admin.orders.order_invoice', compact('orderDetails', 'userDetails'));

    }


public function updateOrderStatus(Request $request){
      if($request->isMethod('post')){
          $data = $request->all();
          Order::where('id', $data['order_id'])->update(['order_status' => $data['order_status']]);
          Toastr::success('Order Status has been updated successfully', 'success');
          return redirect()->back();
      }
}

public function viewPdfInvoice($order_id){
    $orderDetails = Order::with('orders')->where('id', $order_id)->first();
    $user_id = $orderDetails->user_id;
    $userDetails = User::where('id', $user_id)->first();

    $output = '
<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <div class="invoice-title">
                <h2>Invoice</h2><h3 class="pull-right">Order # '.$orderDetails->id.'</h3>
            </div>
            <hr>
            <div class="row">
                <div class="col-xs-6" style="float: left; width: 50%;">
                    <address>
                        <strong>Billed To:</strong><br>
                        '.$userDetails->name.'<br>
                        '.$userDetails->address.'<br>
                        '.$userDetails->city.'<br>
                        '.$userDetails->state.'<br>
                        '.$userDetails->country.'<br>
                        '.$userDetails->pincode.'<br>
                        '.$userDetails->mobile.'<br>
                    </address>
                </div>
                <div class="col-xs-6" style="float: right;">
                    <address>
                        <strong>Shipped To:</strong><br>
                        '.$orderDetails->name.'<br>
                        '.$orderDetails->address.'<br>
                        '.$orderDetails->city.'<br>
                        '.$orderDetails->state.'<br>
                        '.$orderDetails->country.'<br>
                        '.$orderDetails->pincode.'<br>
                        '.$orderDetails->mobile.'<br>
                    </address>
                </div>
            </div>
            <br><br><br><br><br><br><br><br><br>
            
            <div class="row" style="width: 100%;">
                <div class="col-xs-6">
                    <address>
                        <strong>Payment Method:</strong><br>
                        '.$orderDetails->payment_method.'
                    </address>
                </div>
                <div class="col-xs-6 text-right">
                    <address>
                        <strong>Order Date:</strong><br>
                        '.$orderDetails->created_at.'                    
                        </address>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title" style="text-align: center"><strong>Order summary</strong></h3>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-condensed" style="width: 100%;">
                            <thead>

                            <tr>
                                <td><strong>Code</strong></td>
                                <td class="text-center"><strong>Size</strong></td>
                                <td class="text-center"><strong>Color</strong></td>
                                <td class="text-center"><strong>Price</strong></td>
                                <td class="text-center"><strong>Qty</strong></td>
                                <td class="text-right"><strong>Totals</strong></td>
                            </tr>
                            </thead>
                            <tbody>';

                             $subtotal = 0;
                            foreach($orderDetails->orders as $pro){
                            $output .='
                            <tr>
                                <td>'.$pro->product_code.'</td>
                                <td class="text-center">'.$pro->product_size.'</td>
                                <td class="text-center">'.$pro->product_color.'</td>
                                <td class="text-center">$ '.$pro->product_price.'</td>
                                <td class="text-center">'.$pro->product_qty.'</td>
                                <td class="text-right">$ '.$pro->product_price * $pro->product_qty.'</td>
                            </tr>';
                                $subtotal = $subtotal + ($pro->product_price * $pro->product_qty) ;
                           }
                           $output .= '
                            <tr>
                                <td class="thick-line"></td>
                                <td class="thick-line"></td>
                                <td class="thick-line"></td>
                                <td class="thick-line"></td>
                                <td class="thick-line text-center"><strong>Subtotal</strong></td>
                                <td class="thick-line text-right">$ '.$subtotal.'</td>
                            </tr>
                            <tr>
                                <td class="thick-line"></td>
                                <td class="thick-line"></td>
                                <td class="thick-line"></td>
                                <td class="thick-line"></td>
                                <td class="no-line text-center"><strong>Shipping Charges(+)</strong></td>
                                <td class="no-line text-right">$ 0</td>
                            </tr>

                            <tr>
                                <td class="thick-line"></td>
                                <td class="thick-line"></td>
                                <td class="thick-line"></td>
                                <td class="thick-line"></td>
                                <td class="no-line text-center"><strong>Coupon Discount(-)</strong></td>
                                <td class="no-line text-right">$ '.$orderDetails->coupon_amount.'</td>
                            </tr>

                            <tr>
                                <td class="thick-line"></td>
                                <td class="thick-line"></td>
                                <td class="thick-line"></td>
                                <td class="thick-line"></td>
                                <td class="no-line text-center"><strong>Grand Total</strong></td>
                                <td class="no-line text-right">$ '.$orderDetails->grand_total.'</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
';

    $pdf = App::make('dompdf.wrapper');
    $pdf->loadHTML($output);
    return $pdf->stream();

}

public function viewOrdersCharts(){
    Session::put('page', 'orders_charts');
    $current_month_orders = Order::whereYear('created_at', Carbon::now()->year)->whereMonth('created_at', Carbon::now()->month)->count();
    $last_month_orders = Order::whereYear('created_at', Carbon::now()->year)->whereMonth('created_at', Carbon::now()->subMonth(1))->count();
    $last_to_last_month_orders = Order::whereYear('created_at', Carbon::now()->year)->whereMonth('created_at', Carbon::now()->subMonth(2))->count();
        return view('admin.products.view_orders_chart', compact('current_month_orders', 'last_month_orders', 'last_to_last_month_orders'));
}















}


