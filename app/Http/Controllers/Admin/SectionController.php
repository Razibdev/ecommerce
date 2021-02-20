<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Section;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class SectionController extends Controller
{
    public function sections(){
        Session::put('page', 'sections');
        $sections = Section::get();
        return view('admin.sections.sections', compact('sections'));
    }

    public function updateSectionStatus(Request $request){
        $section = Section::findOrFail($request->section_id);
        $section->status = $request->status;
        $section->save();
        return response()->json([
            'message' => 'Section Status Updated Successfully !'
        ]);
    }

}
