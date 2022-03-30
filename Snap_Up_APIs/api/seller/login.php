<?php

header('Access-Control-Allow-Origin: *');
header('Content-type: application/json');
header('Access-Control-Allow-Method: POST');
header('Access-Control-Allow-Headers: Origin, Content-type, Accept'); // Handle pre-flight request

include_once '../../models/seller.php';

if($_SERVER('REQUEST_METHOD') === 'POST'){

    if($seller->validate_parameters($_POST['email']))
    {   // save to database
        $seller->email = $_POST['email'];
    }
    else{
        die();
    }

    if ($seller->validate_parameters($_POST['password'])) {
        $seller->password = $_POST['password'];
    } else {
        echo json_encode(array('success' => 0, 'message' => 'Password is required!'));
        die();
    }

$s = $seller->login();
//fails if the type of s is String 
if(gettype($s)==="array"){
    http_response_code(200);
    echo json_encode(array('success'=>0,"message"=>"Password did not match"));
}
else {
    http_response_code(402);
    echo json_encode(array('success' => 0, 'message' => $s));
}
}
else {
    die(header('HTTP/1.1 405 Request Method Not Allowed'));
}