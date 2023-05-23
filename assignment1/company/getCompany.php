<?php

include "../connect.php";
$id = filterReq("companyid");

$statement = $con->prepare("SELECT users.contactpersonname,company.id,companyname,companyaddress,companysize,companyindustry
 FROM `company`,`users` where company.id = ? and users.companyid = company.id");
 $statement->execute(array($id));


 $data = $statement->fetch(PDO::FETCH_ASSOC);


 $count = $statement->rowCount() ; 



 if ($count > 0){
    echo json_encode(array("status"=>"success" ,"data" => $data));
    
 }
 else{

    echo json_encode(array("status"=>"failed"));

 }