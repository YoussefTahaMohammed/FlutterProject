<?php

include "../connect.php";

$statement = $con->prepare("SELECT DISTINCT id,companyname,COUNT(services.serviceid)as number FROM 
                           `company`left JOIN`services` 
                           ON company.id = services.companyid GROUP by id,companyname");
 $statement->execute();


 $data = $statement->fetchAll(PDO::FETCH_ASSOC);


 $count = $statement->rowCount() ; 



 if ($count > 0){
    echo json_encode(array("status"=>"success" ,"data" => $data));
    
 }
 else{

    echo json_encode(array("status"=>"failed"));

 }