<?php

include "../connect.php";

$statement = $con->prepare("SELECT DISTINCT users.contactpersonname,c.id,companyname,companyaddress,companysize,companyindustry,c.number,c.lat,c.lng FROM (SELECT DISTINCT lat,lng ,company.id,companyname,companyaddress,companysize,companyindustry,COUNT(services.serviceid)as number FROM `company`left JOIN`services` ON company.id = services.companyid GROUP by id,companyname)AS c ,users WHERE users.companyid=c.id");
 $statement->execute();


 $data = $statement->fetchAll(PDO::FETCH_ASSOC);


 $count = $statement->rowCount() ; 



 if ($count > 0){
    echo json_encode(array("status"=>"success" ,"data" => $data));
    
 }
 else{

    echo json_encode(array("status"=>"failed"));

 }