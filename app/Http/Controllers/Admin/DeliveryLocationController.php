<?php

namespace App\Http\Controllers\Admin;

use App\CPU\Helpers;
use App\CPU\ImageManager;
use App\Http\Controllers\Controller;
use App\Model\DeliveryLocation;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;

class DeliveryLocationController extends Controller
{
    function list(Request $request)
    {
        $query_param = [];
        $search = $request['search'];
        if ($request->has('search'))
        {
            $key = explode(' ', $request['search']);
            $delivery_locations = DeliveryLocation::where(function ($q) use ($key) {
                foreach ($key as $value) {
                    $q->Where('Pincode', 'like', "%{$value}%");
                }
            })->orderBy('id', 'desc');
            $query_param = ['search' => $request['search']];
        }else{
            $delivery_locations = DeliveryLocation::orderBy('id', 'desc');
        }
        $delivery_locations = $delivery_locations->paginate(Helpers::pagination_limit())->appends($query_param);

        return view('admin-views.delivery-location.list', compact('delivery_locations','search'));
    }

}
