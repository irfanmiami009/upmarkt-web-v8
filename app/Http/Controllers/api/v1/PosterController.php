<?php

namespace App\Http\Controllers\api\v1;

use App\CPU\PosterManager;
use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PosterController extends Controller
{
    public function get_posters(Request $request)
    {
        try {
            $poster = PosterManager::get_poster($request['poster_type'], $request['display_orders']);
        } catch (\Exception $e) {
        }

        return response()->json($poster,200);
    }

}
