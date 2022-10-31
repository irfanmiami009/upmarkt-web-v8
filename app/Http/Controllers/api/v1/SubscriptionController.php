<?php

namespace App\Http\Controllers\api\v1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SubscriptionController extends Controller
{

    public function add_to_subscription(Request $request)
    {
        DB::table('subscriptions')->insert([
            'mobile' => $request['mobile'],
            'created_at' => now(),
        ]);
        return response()->json(['message' => 'Subscription Added'], 200);
    }
}
