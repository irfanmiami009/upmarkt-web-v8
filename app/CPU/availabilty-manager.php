<?php

namespace App\CPU;

use App\Model\DeliveryLocation;
use App\Model\BizlogOrder;
use App\Model\Order;

class AvailabilityManager
{
    public static function check($pincode)
    {
        return DeliveryLocation::where([
        	['Pincode', '=', $pincode]
        ])
        ->get();
    }

    public static function update_tracking_order_status($request)
    {
    	$order_id = Order::where('bizlog_ticket', $request['ticketNo'])->get(['id']);
    	// check order exist
    	$bizlog_order = BizlogOrder::where('order_id', $order_id[0]->id)->get(['id']);

    	if(count($order_id) > 0) {
    		if (count($bizlog_order) > 0) {
    			$data = array(
		    		'ticket_number' => $request['ticketNo'],
		    		'bizlog_track_status' => $request['status'],
		    		'bizlog_track_remark' => $request['remark']
		    	);
		    	BizlogOrder::where(['order_id' => $order_id[0]->id])->update($data);
		    	return true;
    		}else{
    			$data = array(
		    		'order_id' => $order_id[0]->id,
		    		'ticket_number' => $request['ticketNo'],
		    		'bizlog_track_status' => $request['status'],
		    		'bizlog_track_remark' => $request['remark']
		    	);
		    	BizlogOrder::insert($data);
		    	return true;
    		}
    	}else{
    		return false;
    	}
    	
    }

}
