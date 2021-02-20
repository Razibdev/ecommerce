<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Banner;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;
use Intervention\Image\Facades\Image;

class BannerController extends Controller
{
    public function addBanner(Request $request){
        Session::put('page', 'add_banner');
        if($request->isMethod('post')){
            $data = $request->all();

            if($request->hasFile('image')){
                $image_tmp = $request->file('image');
                if($image_tmp->isValid()){
                    $extension = $image_tmp->getClientOriginalExtension();
                    $filename = rand(111, 99999).'.'.$extension;
                    $banner_image_path = "image/banner_image/".$filename;

                    // Resize Image
                    Image::make($image_tmp)->save($banner_image_path);
                }
            }

            if($request->hasFile('price_image')){
                $image_tmp = $request->file('price_image');
                if($image_tmp->isValid()){
                    $extension = $image_tmp->getClientOriginalExtension();
                    $Pfilename = rand(111, 99999).'.'.$extension;
                    $pricing_image_path = "image/price_image/".$Pfilename;

                    // Resize Image
                    Image::make($image_tmp)->save($pricing_image_path);
                }
            }
            $link = Str::slug($data['link']);

            $banner = new Banner;
            $banner->image = $filename;
            $banner->price_image = $Pfilename;
            $banner->title = $data['title'];
            $banner->link = $link;
            $banner->status = $data['status'];
            $banner->save();
            Toastr::success('Banner picture add successfully', 'error');
            return redirect('admin/view-banners');
        }
        return view('admin.banners.add_banner');
    }

    public function editBanner(Request $request ,$id=null){
        Session::put('page', 'view_banner');
        $bannerDetails = Banner::where('id', $id)->first();
        $data = $request->all();

        if($request->isMethod('post')){

        if($request->hasFile('image')){
            $image_tmp = $request->file('image');
            if($image_tmp->isValid()){
                $extension = $image_tmp->getClientOriginalExtension();
                $filename = rand(111, 99999).'.'.$extension;

            }
            if (isset($bannerDetails->image)){
                $banner_image_path = "image/price_image/".$bannerDetails->image;

                if(File::exists($banner_image_path)) {
                    File::delete($banner_image_path);
                }
            }

            $banner_image_path = "image/price_image/".$filename;

            // Resize Image
            Image::make($image_tmp)->save($banner_image_path);

        }else{
            $filename = $bannerDetails->image;
        }


        if($request->hasFile('price_image')){
            $image_tmp = $request->file('price_image');
            if($image_tmp->isValid()){
                $extension = $image_tmp->getClientOriginalExtension();
                $filenames = rand(111, 99999).'.'.$extension;

            }
            if (isset($bannerDetails->image)){
                $banner_image_path = "image/banner_image/".$bannerDetails->price_image;

                if(File::exists($banner_image_path)) {
                    File::delete($banner_image_path);
                }
            }

            $banner_image_path = "image/banner_image/".$filenames;

            // Resize Image
            Image::make($image_tmp)->save($banner_image_path);

        }else{
            $filenames = $bannerDetails->price_image;
        }

        Banner::where('id', $id)->update(['image'=> $filename, 'price_image' => $filenames, 'title' => $data['title'], 'link' => $data['link'], 'status' => $data['status']]);

        Toastr::success('Banner Updated Successfully', 'success');
        return redirect('admin/view-banners');

        }


        return view('admin.banners.edit_banner', compact('bannerDetails'));
    }






    public function viewBanner(){
        Session::put('page', 'view_banner');
        $banners = Banner::get();
        return view('admin.banners.view_banners', compact('banners'));
    }


    public function updateBannerStatus(Request $request){
        $banner = Banner::findOrFail($request->banner_id);
//        echo "<pre>"; print_r($banner); die;
        $banner->status = $request->status;
        $banner->save();
        return response()->json([
            'message' => 'Banners Status Updated Successfully !'
        ]);
    }

    public function deleteBanner($id)
    {
        $delete_banner = Banner::where('id', $id)->first();

        if (isset($delete_banner->image)) {
            $banner_image_path = "image/banner_image/" . $delete_banner->image;

            if (File::exists($banner_image_path)) {
                File::delete($banner_image_path);
            }

        }
        if (isset($delete_banner->price_image)) {
            $price_image_path = "image/price_image/" . $delete_banner->price_image;

            if (File::exists($price_image_path)) {
                File::delete($price_image_path);
            }

        }
        $delete_banner->delete();
        Toastr::success('Banner has been deleted', 'success');
        return redirect('admin/view-banners');
    }













}
