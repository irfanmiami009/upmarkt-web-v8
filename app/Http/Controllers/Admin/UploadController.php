<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Model\Translation;

class UploadController extends Controller
{
    
    public function upload(Request $request)
    {

        $imageFolder = public_path('uploads/editor/');
        if (!file_exists($imageFolder)) {
            mkdir($imageFolder, 0777, true);
        }
        reset ($_FILES);
        $temp = current($_FILES);
        if (is_uploaded_file($temp['tmp_name'])){
            if (preg_match("/([^\w\s\d\-_~,;:\[\]\(\).])|([\.]{2,})/", $temp['name'])) {
                header("HTTP/1.1 400 Invalid file name.");
                return;
            }

            if (!in_array(strtolower(pathinfo($temp['name'], PATHINFO_EXTENSION)), array("gif", "jpg", "png", "jpeg"))) {
                header("HTTP/1.1 400 Invalid extension.");
                return;
            }

            list($name, $ext) = explode('.', $temp['name']);
            $fileName = $name.'-'.time().'.'.$ext;
            $filetowrite = $imageFolder . $fileName;
            move_uploaded_file($temp['tmp_name'], $filetowrite);
            $filetowrite = url('/').'/public/uploads/editor/' . $fileName;
            echo json_encode(array('location' => $filetowrite));
            exit();
        } else {
            header("HTTP/1.1 500 Server Error");
        }
    }
}
