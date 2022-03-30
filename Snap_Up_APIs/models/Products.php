<?php
$ds = DIRECTORY_SEPARATOR;

$base_directory = realpath(dirname(__FILE__).$ds."..").$ds;

require_once("{$base_directory}includes{$ds}Database.php"); 

class product{
    private $table = 'products';
    public $seller_id;
    public $name ;
    public $image ;
    public $price_per_kg;
    public $description;
    public $interaction_count;

    public function __construct(){}

    public function validate_parameters($value){
        return !empty($value);
    }

    public function add_products(){

        global $database;

        $this->seller_id = trim(htmlspecialchars(strip_tags($this->seller_id)));
        $this->name = trim(htmlspecialchars(strip_tags($this->name)));
        $this->image = trim(htmlspecialchars(strip_tags($this->image)));
        $this->price_per_kg = trim(htmlspecialchars(strip_tags($this->price_per_kg)));
        $this->description = trim(htmlspecialchars(strip_tags($this->description)));
        $this->interaction_count = trim(htmlspecialchars(strip_tags($this->interaction_count)));

        $sql = "INSERT INTO $this->table(seller_id,name,image,price_per_kg,escription,nteraction_count)
         VALUES(
            '".$database->escape_value($this->seller_id)."',
            '".$database->escape_value($this->name)."',
            '".$database->escape_value($this->image)."',
            '".$database->escape_value($this->price_per_kg)."',
            '".$database->escape_value($this->description)."',

         )";

         $result = $database->query_exe($sql);

         if($result){
             return true;
         }
         else{
             return false;
         }
    }

    public function get_products_by_seller(){
        global $database;

        $sql = "SELECT * FROM $this->table where seller_id ='".$database->escape_value($this->seller_id)."'";
        $result = $database->query_exe($sql); 
        if($result){
            $value = $database->fetch_all($result);
            return $value;
        }
        else{
           echo "Falied to fetch products";
        }
    }
}
$product = new product();