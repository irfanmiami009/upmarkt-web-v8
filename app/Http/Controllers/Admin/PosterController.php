<?php

namespace App\Http\Controllers\Admin;

use App\CPU\Helpers;
use App\CPU\ImageManager;
use App\Http\Controllers\Controller;
use App\Model\Poster;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;

class PosterController extends Controller
{
    function list(Request $request)
    {
        $query_param = [];
        $search = $request['search'];
        if ($request->has('search'))
        {
            $key = explode(' ', $request['search']);
            $posters = Poster::where(function ($q) use ($key) {
                foreach ($key as $value) {
                    $q->Where('poster_type', 'like', "%{$value}%");
                }
            })->orderBy('id', 'desc');
            $query_param = ['search' => $request['search']];
        }else{
            $posters = Poster::orderBy('id', 'desc');
        }
        $posters = $posters->paginate(Helpers::pagination_limit())->appends($query_param);

        return view('admin-views.poster.view', compact('posters','search'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'poster_image' => 'required',
            'display_order' => 'required',
        ], [
            'poster_image.required' => 'Image is required!',
            'display_order.required' => 'Display order is required'
        ]);

        $poster = new Poster;
        $poster->poster_type = $request->poster_type;
        $poster->resource_type = $request->resource_type;
        $poster->resource_id = $request[$request->resource_type.'_id'];
        $poster->url = $request->url;
        $poster->display_orders = $request->display_order;
        $poster->photo = ImageManager::upload('poster/', 'png', $request->file('poster_image'));
        $poster->save();
        Toastr::success('Poster added successfully!');
        return back();
    }

    public function status(Request $request)
    {
        if ($request->ajax()) {
            $poster = Poster::find($request->id);
            $poster->published = $request->status;
            $poster->save();
            $data = $request->status;
            return response()->json($data);
        }
    }

    public function edit($id)
    {
        $poster = Poster::where('id', $id)->first();
        return view('admin-views.poster.edit',compact('poster'));
    }

    public function update(Request $request,$id)
    {

        $poster = Poster::find($id);
        $poster->poster_type = $request->poster_type;
        $poster->resource_type = $request->resource_type;
        $poster->resource_id = $request[$request->resource_type.'_id'];
        $poster->display_orders = $request->display_order;
        $poster->url = $request->url;
        if($request->file('poster_image')) {
            $poster->photo = ImageManager::update('poster/', $poster['photo'], 'png', $request->file('poster_image'));
        }
        $poster->save();

        Toastr::success('Poster updated successfully!');
        return back();
    }

    public function delete(Request $request)
    {
        $br = Poster::find($request->id);
        ImageManager::delete('/poster/' . $br['photo']);
        $br->delete();
        return response()->json();
    }
}
