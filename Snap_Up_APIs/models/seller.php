<?php
// C:\xampp\htdocs\snap_up\includes
// create a data base called snap_up and have table called sellers
// model contains the data of the table

$ds = DIRECTORY_SEPARATOR;

$base_directory = realpath(dirname(__FILE__).$ds."..").$ds;

require_once("{$base_directory}includes{$ds}Database.php"); 
require_once("{$base_directory}includes{$ds}Bcrypt.php");

class Seller{

    private $table = "Sellers";
    public $id;
    public $name;
    public $email;
    public $password;
    public $image;
    public $address;
    public $description;


    public function __construct(){
    }


    public function check_unique_email(){
        global $database;

        $sql = "SELECT id from $this->table where email = '".$database->escape_value($this->email)."'";
        $result_email = $database->query_exe($sql);
        return empty($result_email);
    }

    public function login()
    {
        global $database;

        $this->email = trim(htmlspecialchars(strip_tags($this->email)));
        $this->password = trim(htmlspecialchars(strip_tags($this->password)));

        $sql = "SELECT * FROM $this->table WHERE email = '" .$database->escape_value($this->email). "'";

        $result = $database->query_exe($sql);
        $seller = $database->fetch_one_row($result);

        if (empty($seller)) {
            return "Seller doesn't exist.";
        } else {
            if (Bcrypt::checkPassword($this->password, $seller['password'])) {
                unset($seller['password']);
                return $seller;
            } else {
                return "Password doesn't match.";
            }
        }
    }

    public function register_seller(){
        global $database;
        // remove the extra elements added to html by the php file.
        $this->name = trim(htmlspecialchars(strip_tags($this->name)));
        $this->email = trim(htmlspecialchars(strip_tags($this->email)));
        $this->password = trim(htmlspecialchars(strip_tags($this->password)));
        $this->image = trim(htmlspecialchars(strip_tags($this->image)));
        $this->address = trim(htmlspecialchars(strip_tags($this->address)));
        $this->description = trim(htmlspecialchars(strip_tags($this->description)));

        $sql = "INSERT INTO $this->table (name,email,password,image,address,description)
         VALUES(
            '" .$database->escape_value($this->name). "',
            '" .$database->escape_value($this->email). "',
            '" .$database->escape_value(Bcrypt::hashPassword($this->password)). "',
            '" .$database->escape_value($this->image). "',
            '" .$database->escape_value($this->address). "',
            '" .$database->escape_value($this->description). "'
        )";
        // run / execute the query
        $saved = $database->query_exe($sql);
        if($saved){
            return true;
        }
        return false;
    }
    public function validate_parameters($params){
        return(!empty($params));
    }

    public function all_sellers(){
        global $database;
        $sql = "SELECT id,name,image,address FROM $this->table";
        $query = $database->query_exe($sql);
        $result = $database->fetch_all($query);
        return $result;
    }
}
$seller = new Seller();