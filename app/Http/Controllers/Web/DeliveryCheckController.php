<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Model\DeliveryLocation;
use Auth;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DeliveryCheckController extends Controller
{
    public function check_delivery(Request $request)
    {
        $pincode = DeliveryLocation::where([
                ['Pincode', '=', $request['pincode']]
            ])
            ->get();

        return response()->json($pincode);
    }

}
