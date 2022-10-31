<?php

namespace App\Http\Controllers\Admin;

use App\CPU\Helpers;
use App\CPU\ImageManager;
use App\Http\Controllers\Controller;
use App\Model\Admin;
use App\Model\News;
use App\Model\Brand;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Model\Translation;

class NewsController extends Controller
{
    public function add_new()
    {
        $br = News::latest()->paginate(Helpers::pagination_limit());
        return view('admin-views.news.add-new', compact('br'));
    }

    public function store(Request $request)
    {
        $news = new News;
        $news->name = $request->news_title;
        $news->content = $request->news_content;
        $news->image = ImageManager::upload('news_image/', 'png', $request->file('news_image'));
        $news->status = 1;
        //$news->link = $user_link;
        $news->save();
        Toastr::success('News added successfully!');
        return back();
    }

    function list(Request $request)
    {
        $query_param = [];
        $search = $request['search'];
        if ($request->has('search'))
        {
            $key = explode(' ', $request['search']);
            $br = News::where(function ($q) use ($key) {
                foreach ($key as $value) {
                    $q->Where('name', 'like', "%{$value}%");
                }
            });
            $query_param = ['search' => $request['search']];
        }else{
            $br = new News();
        }
        $br = $br->latest()->paginate(Helpers::pagination_limit())->appends($query_param);
        return view('admin-views.news.list', compact('br','search'));
    }

    public function edit($id)
    {
        $b = News::where(['id' => $id])->withoutGlobalScopes()->first();
        return view('admin-views.news.edit', compact('b'));
    }

    public function update(Request $request, $id)
    {

        $news = News::find($id);
        $news->name = $request->news_title;
        $news->content = $request->news_content;
        if ($request->has('news_image')) {
            $news->image = ImageManager::update('news_image/', $news['image'], 'png', $request->file('news_image'));
         }
        $news->save();

        Toastr::success('News updated successfully!');
        return back();
    }

    public function delete(Request $request)
    {
        $translation = Translation::where('translationable_type','App\Model\Agent')
                                    ->where('translationable_id',$request->id);
        $translation->delete();
        $agent = Agent::find($request->id);
        ImageManager::delete('/agentProfile/' . $agent['profile_image']);
        ImageManager::delete('/agentProof/' . $agent['adhar_image']);
        $agent->delete();
        return response()->json();
    }

}
