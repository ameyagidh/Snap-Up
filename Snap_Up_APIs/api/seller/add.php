<?php

header('Access-Control-Allow-Origin: *');
header('Content-type: application/json');
header('Access-Control-Allow-Method: POST');
header('Access-Control-Allow-Headers: Origin, Content-type, Accept'); // Handle pre-flight request

include_once '../../models/Products.php';


if($_SERVER('REQUEST_METHOD') === 'POST'){

    if($product->validate_parameters($_POST['name']))
    {   // save to database
        $product->$name = $_POST['name'];
    }
    else{
        echo json_encode(array('success' => 0, 'message'=>"name is required"));
    }

    $product_images = '../../assets/product_images';

    if(!is_dir($product_images)){
       mkdir($product_images);
    }

    if($isset($_FILES['images'])){
        $file_name = $_FILES['images']['name'];
        $file_tmp = $_FILES['images']['tmp_name'];
        $extension = end(explode('.',$file_name));
        
        // save the file
        $new_file_name = $product->seller_id . "_product_" . $product->name . "." . $extension;
        
        // save to database
        move_uploaded_file($file_tmp,$product_images."/".$new_file_name);

        $product->image = 'product_images/'.$new_file_name;
    }else{
        echo json_encode(array('success' => 0, 'message'=>"Photo is required"));
        die();
    }


    if($product->validate_parameters($_POST['price_per_kg']))
    {   // save to database
        $product->$price_per_kg = $_POST['price_per_kg'];
    }
    else{
        echo json_encode(array('success' => 0, 'message'=>"price_per_kg is required"));
    }

    if($product->validate_parameters($_POST['description']))
    {   // save to database
        $product->$description = $_POST['description'];
    }
    else{
        echo json_encode(array('success' => 0, 'message'=>"description is required"));
    }

    if($product->validate_parameters($_POST['interaction_count']))
    {   // save to database
        $product->$interaction_count = $_POST['interaction_count'];
    }
    else{
        echo json_encode(array('success' => 0, 'message'=>"interaction_count is required"));
    }

if($product->add_products()){
    json_encode(array('success' => 1 ,'message'=>"Product successfully added"));
}
else{
    die(header('HTTP/1.1 405 Product not registered.'));
}
}
else {
    die(header('HTTP/1.1 405 Request Method Not Allowed'));
}