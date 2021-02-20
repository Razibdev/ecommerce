<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\CmsPage;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class CmsController extends Controller
{

    public function cmsPage($url){
        // Redirect 404 Check if CMS Page is disable or does not exits
        $cmsPageCount = CmsPage::where(['url' => $url, 'status' => 1])->count();
        if($cmsPageCount > 0){
            $cmsPageDetails = CmsPage::where('url', $url)->first();
            $meta_title = $cmsPageDetails->meta_title;
            $meta_description = $cmsPageDetails->meta_description;
            $meta_keywords = $cmsPageDetails->meta_keywords;
        }else{
            abort(404);
        }
        // Get all Categories
        $categories = Category::with('categories')->where(['parent_id' => 0])->get();
        return view('pages.cms_page', compact('cmsPageDetails', 'categories', 'meta_title', 'meta_description', 'meta_keywords'));
    }




    // contact page method
    public function contact(Request $request){
        Session::put('page', 'page-contact');
        if($request->isMethod('post')){
            $data = $request->all();

            $validatedData = Validator::make( $request->all(),[
                'name' => 'required|regex:/^[\pL\s\-]+$/u|max:255',
                'email' => 'required|email',
                'subject' => 'required',
                 'message' => 'required'
            ]);

            if($validatedData->fails()){
                return redirect()->back()->withErrors($validatedData)->withInput();
            }


            // Send Contact Mail
            $email = "razibhossen8566@yopmail.com";
            $messageData = [
                'email' => $data['email'],
                'name'  => $data['name'],
                'subject' => $data['subject'],
                'comment' => $data['message']
            ];

            Mail::send('admin.emails.enquiry', $messageData, function ($message) use($email){
               $message->to($email)->subject('Enquiry from E-com website');
            });
            Toastr::success('Thanks for your enquiry. We will get back to you soon.', 'Contact Us');
            return redirect()->back();
        }
        // Get all Categories
        $categories = Category::with('categories')->where(['parent_id' => 0])->get();

        $meta_title = "Contact Us E-shop Sample Website";
        $meta_description = "If you have any queries related to our products then.";
        $meta_keywords = "contact us, queries";


        return view('pages.contact', compact('categories', 'meta_title', 'meta_description', 'meta_keywords'));
    }







}
