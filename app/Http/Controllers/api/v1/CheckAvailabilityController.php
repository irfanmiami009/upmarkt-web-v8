<?php

namespace App\Http\Controllers\api\v1;

use App\CPU\AvailabilityManager;
use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CheckAvailabilityController extends Controller
{
    public function check(Request $request)
    {
        try {
            $delivery = AvailabilityManager::check($request['pincode']);
        } catch (\Exception $e) {
        }

        if(count($delivery) > 0) {
        	return response()->json($delivery,200);
        }else{
        	return response()->json($delivery,400);
        }
        
    }

    public function update_ticket_status(Request $request)
    {
        if($request['ticketNo'] == "") {
            return response()->json('Ticket number is requird!', 400);
        }

        try {
            $response = AvailabilityManager::update_tracking_order_status($request);
            if ($response) {
                return response()->json('Tracking status updated successfully', 200);
            }else{
                return response()->json('Invalid ticket number!', 400);
            }
            return response()->json($response, 200);
        } catch (\Exception $e) {
            return response()->json('Somthing went wrong! Try again later!', 400);
        }
    }

}
