<?php

namespace App\CPU;

use App\Model\Poster;

class PosterManager
{
    public static function get_poster($poster_tye, $display_orders)
    {
        return Poster::where([
        	['poster_type', '=', $poster_tye],
        	['display_orders', '=', $display_orders],
        	['published', '=', 1],
        ])
        ->get();
    }

}
