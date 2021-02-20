<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CmsPage;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;

class CmsController extends Controller
{
    public function addCmsPage(Request $request){
        Session::put('page', 'add-cms');
        if($request->isMethod('post')){
            $data = $request->all();
            if(empty($data['meta_title'])){
                $data['meta_title'] = "";
            }
            if(empty($data['meta_description'])){
                $data['meta_description'] = "";
            }
            if(empty($data['meta_keywords'])){
                $data['meta_keywords'] = "";
            }

            $cmspage = new CmsPage;
            $cmspage->title = $data['title'];
            $cmspage->url = Str::slug($data['url']);
            $cmspage->description = $data['description'];
            $cmspage->meta_title = $data['meta_title'];
            $cmspage->meta_description = $data['meta_description'];
            $cmspage->meta_keywords = $data['meta_keywords'];

            if(empty($data['status'])){
                $status = 0;
            }else{
                $status = 1;
            }
            $cmspage->status = $status;
            $cmspage->save();
            Toastr::success('CMS Page has been added successfully', 'success');
            return redirect('admin/view-cms-pages');

        }
        return view('admin.pages.add_cms_page');
    }

    public function editCmsPage(Request $request, $id=null){

        if ($request->isMethod('post')){
            $data = $request->all();
            if(empty($data['meta_title'])){
                $data['meta_title'] = "";
            }
            if(empty($data['meta_description'])){
                $data['meta_description'] = "";
            }
            if(empty($data['meta_keywords'])){
                $data['meta_keywords'] = "";
            }
            if(empty($data['status'])){
                $status = 0;
            }else{
                $status = 1;
            }
            CmsPage::where('id', $id)->update(['title' => $data['title'], 'url' => Str::slug($data['url']), 'description' => $data['description'], 'status' => $status, 'meta_title' => $data['meta_title'], 'meta_description' => $data['meta_description'], 'meta_keywords' => $data['meta_keywords']]);
            Toastr::success('CMS Page updated successfully', 'success');
            return redirect('admin/view-cms-pages');

        }
        $cmsPage = CmsPage::where('id', $id)->first();
        return view('admin.pages.edit_cms_page', compact('cmsPage'));
    }

    public function viewCmsPages(){
        Session::put('page', 'view-cms-pages');
        $cmsPages = CmsPage::get();
        return view('admin.pages.view_cms_page', compact('cmsPages'));
    }


    public function deleteCmsPages($id = null){
        CmsPage::where('id', $id)->delete();
        Toastr::success('CMS Page deleted successfully', 'success');
        return redirect('admin/view-cms-pages');
    }


}
