<?php

header('Access-Control-Allow-Origin: *');
header('Content-type: application/json');
header('Access-Control-Allow-Method: POST');
header('Access-Control-Allow-Headers: Origin, Content-type, Accept'); // Handle pre-flight request

include_once '../../models/seller.php';

// Saving data into the database.

if($_SERVER('REQUEST_METHOD') === 'POST'){
    // store this data into the database.
    if($seller->validate_parameters($_POST['email']))
    {   // save to database
        $seller->email = $_POST['email'];
    }
    else{
        echo json_encode(array('success' => 0, 'message'=>"email is required"));
    }
    if ($seller->validate_parameters($_POST['password'])) {
        $seller->password = $_POST['password'];
    } else {
        echo json_encode(array('success' => 0, 'message' => 'Password is required!'));
        die();
    }

    $seller_images = '../../assets/seller_images';

    if(!is_dir($seller_images)){
       mkdir($seller_images);
    }

    if($isset($_FILES['images'])){
        $file_name = $_FILES['images']['name'];
        $file_tmp = $_FILES['images']['tmp_name'];
        $extension = end(explode('.',$file_name));
        
        // save the file
        $new_file_name = $seller->email.".".$extension;

        // save to database
        move_uploaded_file($file_tmp,$seller_images."/".$new_file_name);

        $seller->image = 'seller_images/'.$new_file_name;
    }

    if($seller->validate_parameters($_POST['name'])){
        $seller->name = $_POST['name'];
    }
    else{
        echo json_encode(array('success' => 0, 'message'=>"name is required"));
    }
    
    if($seller->validate_parameters($_POST['address']))
    {   // save to database
        $seller->address = $_POST['address'];
    }
    else{
        echo json_encode(array('success' => 0, 'message'=>"address is required"));
    }

    if ($seller->check_unique_email()) {
        if ($id = $seller->register_seller()) {
            echo json_encode(array('success' => 1, 'message' => 'Seller regstered!'));
        } else {
            http_response_code(500);
            echo json_encode(array('success' => 0, 'message' => 'Internal Server Error'));
        }
    } else {
        http_response_code(401);
        echo json_encode(array('success' => 0, 'message' => 'Email already exists!'));
    }
} else {
    die(header('HTTP/1.1 405 Request Method Not Allowed'));
}

