<!-- This class is used to interact with the database -->
<?php

define("HOST","localhost");
define("DB_NAME","snap_up");
define("USERNAME","root");
define("PASSWORD","");

class Database{

    private $connection;

    public function __construct(){
        $this->open_db_connection();
    }

    // connection to a database

    public function open_db_connection(){
        $sql = mysqli_connect(HOST,USERNAME,PASSWORD,DB_NAME);
        if(mysqli_connect_error()){
            die("Connection Error: ".mysqli_connect_error());
        }
    
    }

    
    
    // Query executed a query.

    public function query_exe($SQL){
        $result = $this->connection->query_exe($SQL);
        if(!$result){
            die("Query failed to execute");
        }
        return $result;
    }

    // fetch 1 result

    public function fetch_one_row($result){
        if($result->num_rows > 0){
            $result_one = $result->fetch_assoc();
        }
        return $result_one;
    }
    public function fetch_all($result){
    
        if($result->num_rows > 0){
            while($result->fetch_assoc()){
            $array_result[] = $result->fetch_assoc();
        }
    }
     return  $array_result;

    }
    public function close(){
        $this->connection->close();
    }

    // proper format of data and remove extra characters added to the data by sql.

    public function escape_value($value){
        return $this->connection->real_escape_string($value);
    }

}
$database = new Database();