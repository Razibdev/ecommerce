<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Banner;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class IndexController extends Controller
{
    public function index(){
        $products = Product::inRandomOrder()->where(['status' => 1, 'feature_item' => 1])->paginate(6);

        // Get all Categories
        $categories = Category::with('categories')->where(['parent_id' => 0, 'status' => 1])->get();
        //Product Banner
        $banners = Banner::where('status', 1)->orderBy('id', 'desc')->limit(3)->get();
//        $categories = json_decode(json_encode($categories));
//        echo "<pre>"; print_r($categories); die;
//        $category_menu = "";
//        foreach ($categories as $cat){
//            $category_menu .= "
//                <div class='panel-heading'>
//                                    <h4 class='panel-title'>
//                                        <a data-toggle='collapse' data-parent='#accordian' href='#".$cat->id."'>
//                                            <span class='badge pull-right'><i class='fa fa-plus'></i></span>
//                                            ".$cat->category_name."
//                                        </a>
//                                    </h4>
//                                </div>
//
//                                 <div id='".$cat->id."' class='panel-collapse collapse'>
//                                    <div class='panel-body'>
//                                        <ul> ";
//
//                        $sub_categories = Category::where(['parent_id' => $cat->id, 'status' => 1])->get();
//                        foreach ($sub_categories as $subcat){
//                            $category_menu .= "<li><a href='".$subcat->url."'>".$subcat->category_name."</a></li>";
//                        }
//
//            $category_menu .= "</ul>
//                                    </div>
//                                </div>
//            ";
//
//        }
        // Meta Tags
        $meta_title = "E-shop Sample Website";
        $meta_description = "Online Shopping Site for Men, Women and Kids Clothing.";
        $meta_keywords = "eshop website, online shopping, men clothing";

        return view('index', compact('products', 'categories', 'banners', 'meta_title', 'meta_description', 'meta_keywords'));
    }
}
