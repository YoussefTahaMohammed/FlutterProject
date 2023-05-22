<?php

include "../connect.php";

 $companyId = filterReq('companyid');


$statement = $con->prepare("SELECT * FROM `services` where `companyid` = ? ");
$statement->execute(array($companyId));


$data = $statement->fetchAll(PDO::FETCH_ASSOC);


$count = $statement->rowCount() ; 



 if ($count > 0){
     echo json_encode(array("status"=>"success", "data" => $data));
}
else{
    
    echo json_encode(array("status"=>"failed"));

 }