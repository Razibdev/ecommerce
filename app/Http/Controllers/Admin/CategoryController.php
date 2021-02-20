<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;

class CategoryController extends Controller
{
    public function categories(){
        Session::put('page', 'categories');
        if(Session::get('adminDetails')['categories_view_access'] == 0){
            Toastr::error('You have no access for this module');
            return redirect('/admin/dashboard');
        }
        $categories = Category::get();
//        $categories = json_decode(json_encode($categories));
//        echo "<pre>"; print_r($categories);die;
        return view('admin.categories.categories', compact('categories'));

    }

    public function updateCategoryStatus(Request $request){
        $category = Category::findOrFail($request->category_id);
        $category->status = $request->status;
        $category->save();
        return response()->json([
            'message' => 'Category Status Updated Successfully !'
        ]);
    }

    public function addCategory(Request $request)
    {
        Session::put('page', 'add-category');
        if(Session::get('adminDetails')['categories_edit_access'] == 0){
            Toastr::error('You have no access for this module');
            return redirect('/admin/dashboard');
        }
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

            $rules = [
                'category_name'   => 'required|regex:/(^([a-zA-z -]+)(\d+)?$)/u',
                'category_url' => 'required'
            ];
            $customMessage = [
                'category_name.required' => 'Category Name is required',
                'category_name.regex'    => 'Valid Category Name is required',
                'category_url.required'    => 'Url is required'
            ];
            $this->validate($request, $rules, $customMessage);
            if(empty($data['category_description'])){
                $data['category_description'] = "";
            }


            $category = new Category;
            $category->category_name = $data['category_name'];
            $category->url = Str::slug($data['category_url']);
            $category->parent_id = $data['parent_id'];
            $category->description = $data['category_description'];
            $category->meta_title = $data['meta_title'];
            $category->meta_description = $data['meta_description'];
            $category->meta_keywords = $data['meta_keywords'];
            $category->status = 1;
            $category->save();
            Toastr::success('Add Category Successfully', 'success');
            return redirect('admin/categories');

        }
        $levels = Category::where(['parent_id' => 0])->get();
        return view('admin.categories.add_category',compact('levels'));
    }

    public function editCategory(Request $request, $id = null){
        if(Session::get('adminDetails')['categories_edit_access'] == 0){
            Toastr::error('You have no access for this module');
            return redirect('/admin/dashboard');
        }
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
            // Category validation
            $rules = [
                'category_name'   => 'required|regex:/(^([a-zA-z -]+)(\d+)?$)/u',
                'category_url' => 'required'
            ];
            $customMessage = [
                'category_name.required' => 'Category Name is required',
                'category_name.regex'    => 'Valid Category Name is required',
                'category_url.required'    => 'Url is required'
            ];
            $this->validate($request, $rules, $customMessage);

            Category::where(['id'=> $id])->update(['category_name' => $data['category_name'], 'url' => $data['category_url'], 'description' => $data['category_description'], 'parent_id' => $data['parent_id'], 'meta_title' => $data['meta_title'], 'meta_description' => $data['meta_description'], 'meta_keywords' => $data['meta_keywords']]);
            Toastr::success('Category Updated Successfully', 'success');
            return redirect('/admin/categories');
        }
        $categoryDetails = Category::where('id', $id)->first();
        $levels = Category::where(['parent_id' => 0])->get();
        return view('admin.categories.edit_categories', compact('categoryDetails', 'levels'));
    }

    public function deleteCategory($id)
    {
        if(Session::get('adminDetails')['categories_edit_access'] == 0){
            Toastr::error('You have no access for this module');
            return redirect('/admin/dashboard');
        }
        $delete_category = Category::where('id', $id)->first();
            $delete_category->delete();
            Toastr::success('Category has been deleted', 'success');
            return redirect('/admin/categories');
    }
}
