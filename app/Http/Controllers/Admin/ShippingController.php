<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ShippingCharge;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;

class ShippingController extends Controller
{
    public function viewShipping(){
        $shipping_charges = ShippingCharge::get();
        return view('admin.shipping.view_shipping', compact('shipping_charges'));
    }

    public function editShipping(Request $request, $id){
        if($request->isMethod('post')){
            $data = $request->all();
            ShippingCharge::where('id', $id)->update(['shipping_charges0_500g' => $data['shipping_charges0_500g'], 'shipping_charges501_1000g' => $data['shipping_charges501_1000g'], 'shipping_charges1001_2000g' => $data['shipping_charges1001_2000g'], 'shipping_charges2001_3000g' => $data['shipping_charges2001_3000g']]);
            Toastr::success('Shipping Charges Updated Successfully', 'success');
            return redirect()->back();
        }
        $shippingDetails = ShippingCharge::where('id', $id)->first();
        return view('admin.shipping.edit_shipping', compact('shippingDetails'));
    }










}
