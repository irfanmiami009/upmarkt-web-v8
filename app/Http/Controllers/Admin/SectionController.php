<?php

namespace App\Http\Controllers\Admin;

use App\CPU\Helpers;
use App\CPU\ImageManager;
use App\Http\Controllers\Controller;
use App\Model\Section;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;

class SectionController extends Controller
{
    function list(Request $request)
    {
        $query_param = [];
        $search = $request['search'];
        if ($request->has('search'))
        {
            $key = explode(' ', $request['search']);
            $sections = Section::where(function ($q) use ($key) {
                foreach ($key as $value) {
                    $q->Where('section', 'like', "%{$value}%");
                }
            })->orderBy('id', 'desc');
            $query_param = ['search' => $request['search']];
        }else{
            $sections = Section::orderBy('id', 'desc');
        }
        $sections = $sections->paginate(Helpers::pagination_limit())->appends($query_param);

        return view('admin-views.section.view', compact('sections','search'));
    }

    public function status(Request $request)
    {
        if ($request->ajax()) {
            $section = Section::find($request->id);
            $section->published = $request->status;
            $section->save();
            $data = $request->status;
            return response()->json($data);
        }
    }

}
