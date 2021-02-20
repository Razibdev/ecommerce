<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    public function orders(){
        return $this->hasMany('App\Models\OrderProduct', 'order_id');
    }

    public static function getOrderDetails($order_id){
        $getOrderDetails = Order::where('id', $order_id)->first();
        return $getOrderDetails;
    }
    public static function getCountryCode($country){
        $getCountryCode = Country::where('country_name', $country)->first();
        return $getCountryCode;
    }
}
