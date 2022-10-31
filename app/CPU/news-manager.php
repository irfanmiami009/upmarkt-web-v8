<?php

namespace App\CPU;

use App\Model\News;

class NewsManager
{
    public static function get_news()
    {
        return News::latest()->get();
    }

}
