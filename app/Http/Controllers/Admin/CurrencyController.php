<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Currency;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;

class CurrencyController extends Controller
{
    public function addCurrency(Request $request){
        if($request->isMethod('post')){
            $data = $request->all();
            if(empty($data['status'])){
                $status = 0;
            }else{
                $status = 1;
            }
            $currency = new Currency;
            $currency->currency_code = $data['currency_code'];
            $currency->exchange_rate = $data['exchange_rate'];
            $currency->status = $status;
            $currency->save();
            Toastr::success('Currency has been added successfully', 'Success');
            return redirect('/admin/view-currencies');
        }
        return view('admin.currencies.add_currency');
    }

    public function viewCurrencies(){
        $currencies = Currency::get();
        return view('admin.currencies.view_currency', compact('currencies'));
    }

    public function deleteCurrency($id){
        Currency::where('id', $id)->delete();
        Toastr::success('Currency has been deleted', 'success');
        return redirect()->back();
    }

    public function editCurrency(Request $request, $id=null){
        $currencyDetails = Currency::where('id', $id)->first();
        if($request->isMethod('post')) {
            $data = $request->all();
            if (empty($data['status'])) {
                $status = 0;
            } else {
                $status = 1;
            }
            Currency::where('id', $id)->update(['currency_code' => $data['currency_code'], 'exchange_rate' => $data['exchange_rate'], 'status' => $status]);
            Toastr::success('Currency has been updated successfully', 'Updated');
            return redirect('/admin/view-currencies');
        }
        return view('admin.currencies.edit_currency', compact('currencyDetails'));
    }




}
