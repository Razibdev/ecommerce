<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Coupon;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class CouponController extends Controller
{
    /**
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function addCoupon(Request $request){
        Session::put('page', 'coupon');
        if($request->isMethod('post')){
            $data = $request->all();
//            echo "<pre>"; print_r($data); die;

            $coupon = new Coupon;
            $coupon->coupon_code = $data['coupon_code'];
            $coupon->amount = $data['amount'];
            $coupon->amount_type = $data['amount_type'];
            $coupon->expiry_date = $data['expiry_date'];
            $coupon->status = $data['status'];
            $coupon->save();
            Toastr::success('Coupon has been Added Successfully', 'success');
            return redirect('admin/view-coupon');

        }
        return view('admin.coupons.add_coupon');
    }

    public function viewCoupon(){
        Session::put('page', 'coupons');
        $coupons = Coupon::get();
        return view('admin.coupons.view_coupons', compact('coupons'));
    }

    public function updateCouponStatus(Request $request){
        $coupon = Coupon::findOrFail($request->coupon_id);
        $coupon->status = $request->status;
        $coupon->save();
        return response()->json([
            'message' => 'Coupon Status Updated Successfully !'
        ]);
    }


    public function deleteCoupon($id=null){
        $delete_coupon = Coupon::where('id', $id)->first();
        $delete_coupon->delete();
        Toastr::success('Delete Coupon Successfully', 'success');
        return redirect('admin/view-coupon');
    }

    public function editCoupon(Request $request, $id=null){
        if($request->isMethod('post')){
            $data = $request->all();
            $coupon = Coupon::find($id);
            $coupon->coupon_code = $data['coupon_code'];
            $coupon->amount = $data['amount'];
            $coupon->amount_type = $data['amount_type'];
            $coupon->expiry_date = $data['expiry_date'];
            if(empty($data['status'])){
                $data['status'] =0;
            }
            $coupon->status = $data['status'];
            $coupon->save();
            Toastr::success('Coupon has been Updated Successfully', 'success');
            return redirect('admin/view-coupon');

        }
        $couponDetails = Coupon::find($id);
        return view('admin.coupons.edit_coupon', compact('couponDetails'));

    }










}
