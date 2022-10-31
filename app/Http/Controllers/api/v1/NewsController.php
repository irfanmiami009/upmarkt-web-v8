<?php

namespace App\Http\Controllers\api\v1;

use App\CPU\BrandManager;
use App\CPU\NewsManager;
use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class NewsController extends Controller
{
    public function latest_news()
    {
        try {
            $news = NewsManager::get_news();
        } catch (\Exception $e) {
        }

        return response()->json($news,200);
    }

}
