<?php

namespace App\CPU;

use App\Model\Admin;
use App\Model\Order;
use App\Model\OrderDetail;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;


class HandleDeliveryManager
{
    // auth
    public static function auth()
    {
        $data = [
            'username' => "bstapi",
            'password' => "bst$30",
            'code' => "BST"
        ];

        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://test-api.bizlog.in:8443/privileges/auth/api",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30000,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_POSTFIELDS => json_encode($data),
            CURLOPT_HTTPHEADER => array(
                // Set here requred headers
                "accept: */*",
                "accept-language: en-US,en;q=0.8",
                "content-type: application/json",
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            echo "cURL Error #:" . $err;
        } else {
          return json_decode($response);
        }
    }

    // create ticket
    public static function create_ticket($order)
    {
        $response = HandleDeliveryManager::auth();
        $token = $response->data->jwtToken;
        $authorization = "Authorization: Bearer ".$token;
        $product_details = json_decode($order->details[0]->product_details);
        $shipping_address_data = json_decode($order->shipping_address_data);
        $data = [
            "primary" => [
                 "ticketPriority" => "high", 
                 "flowId" => "PickAndDropOneWay", 
                 "retailerId" => "bst1661854844344TZe05c59356b6443e9a86a3ea145bf0665", 
                 "retailerNo" => "bst123455676", 
                 "conComplaintNo" => "54554555555", 
                 "orderNo" => $order->id, 
                 "invoiceNo" => $order->id, 
                 "parentTicket" => "parentTicket", 
                 "ticketDetails" => "ticket details", 
                 "specialInstructions" => "instructions", 
                 "buyerContactNumber" => $order->customer->phone, 
                 "isAppointmentReq" => "yes", 
                 "isInstallationReq" => "yes", 
                 "isPhysicalEval" => "yes", 
                 "isTechEval" => "no", 
                 "isPackingReq" => "yes", 
                 "paymentMode" => $order->payment_method
            ], 
            "primary_details" => [
                "medical_equp" => "equi", 
                "someFiled2" => "additional fields" 
            ], 
            "products" => [
                [
                  "primary" => [
                     "productId" => $product_details->id, 
                     "productCode" => $product_details->name,
                     "productName" => $product_details->name, 
                     "dateOfPurchase" => "2022-01-25", 
                     "identificationNo" => $order->id, 
                  ],
                  "src_add" => [
                           "srcContactPerson" => "Homechoice E-Commerce India Private Limited",
                           "srcAdd1" => "Annex II Floor, No. 18/3, Rajah Annamalai Building, Rukmani
Lakshmipathi Road, Egmore, Chennai, Chennai, Tamil Nadu",
                           "srcContact1" => "9940100858",
                           "srcCity" => "Chennai",
                           "srcPincode" => "600008",
                           "srcEmailId" => "hcinfo2022@gmail.com",
                        ], 
                  "dst_add" => [
                              "dstContactPerson" => $order->customer->f_name,
                              "dstAdd1" => $shipping_address_data->address,
                              "dstContact1" => $shipping_address_data->phone,
                              "dstCity" => $shipping_address_data->city,  
                              "dstPincode" => $shipping_address_data->zip, 
                              "dstEmailId" => $order->customer->email,
                           ] 
                ],
            ] 
        ]; 

        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://test-api.bizlog.in:8443/core/api/ticket/create/PickAndDropOneWay",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30000,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "PUT",
            CURLOPT_POSTFIELDS => json_encode($data),
            CURLOPT_HTTPHEADER => array(
                // Set here requred headers
                "accept: */*",
                "accept-language: en-US,en;q=0.8",
                "content-type: application/json",
                $authorization
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);
        if ($err) {
            //echo "cURL Error #:" . $err;
            return false;
        } else {
            $datas = json_decode($response);
            $ticket = $datas->data->ticketNo;
            Order::where('id',$order->id)->update(['bizlog_ticket' => $ticket, 'bizlog_ticket_status' => 'Created']);
            return true;
        }
    }

    // cancel ticket
    public static function cancel_ticket($ticket_number, $order)
    {
        $response = HandleDeliveryManager::auth();
        $token = $response->data->jwtToken;
        $authorization = "Authorization: Bearer ".$token;
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://test-api.bizlog.in:8443/mis-report/ticket/cancel/".$ticket_number,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30000,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            //CURLOPT_POSTFIELDS => json_encode($data),
            CURLOPT_HTTPHEADER => array(
                // Set here requred headers
                "accept: */*",
                "accept-language: en-US,en;q=0.8",
                "content-type: application/json",
                $authorization
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);
        if ($err) {
            return false;
            //echo "cURL Error #:" . $err;
        } else {
          //return json_decode($response);
            Order::where('id',$order->id)->update(['bizlog_ticket_status' => 'Canceled']);
            return true;
        }
    }
    
}
