<?php

include "../connect.php";

$list = filterReq("fav");
$list=substr($list,0,-1);
$statement = $con->prepare("SELECT * FROM `services` where `serviceid` in ({$list})");
 $statement->execute();


 $data = $statement->fetchAll(PDO::FETCH_ASSOC);


 $count = $statement->rowCount() ; 



 if ($count > 0){
     echo json_encode(array("status"=>"success", "data" => $data));
}
else{
    
    echo json_encode(array("status"=>"failed"));

 }