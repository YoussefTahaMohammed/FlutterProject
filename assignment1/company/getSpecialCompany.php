<?php

include "../connect.php";

$id	 = filterReq("id");

$statement = $con->prepare("SELECT * FROM `company` where `id` in ?");
$statement->execute(array($id));


 $data = $statement->fetch(PDO::FETCH_ASSOC);


 $count = $statement->rowCount() ; 



 if ($count > 0){
     echo json_encode(array("status"=>"success", "data" => $data));
}
else{
    
    echo json_encode(array("status"=>"failed"));

 }