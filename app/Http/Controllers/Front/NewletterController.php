<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\NewletterSubscriber;
use Illuminate\Http\Request;

class NewletterController extends Controller
{
    public function checkSubscriber(Request $request){
        if($request->ajax()){
            $data = $request->all();
//            echo "<pre>"; print_r($data); die;
            $subscriberCount = NewletterSubscriber::where('email', $data['subscriber_email'])->count();
            if($subscriberCount > 0){
                echo "exist";
            }
        }
    }


    public function addSubscriber(Request $request){
        if($request->ajax()){
            $data = $request->all();
            $subscriberCount = NewletterSubscriber::where('email', $data['subscriber_email'])->count();
            if($subscriberCount > 0){
                echo "exist";
            }else{
                // Add Newsletter Email in
                $newleter = new NewletterSubscriber;
                $newleter->email = $data['subscriber_email'];
                $newleter->status = 1;
                $newleter->save();
                echo "saved";
            }
        }
    }
}
