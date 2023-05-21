<?php

include "../connect.php";

$id = filterReq("id");
$personName = filterReq("name");
$address = filterReq("address");
$size = filterReq("size");

$statement = $con->prepare("UPDATE `company` SET 
                           `companyname`=?,
                            `companyaddress`=?,
                            companysize = ?
                            WHERE id=?");
 $statement->execute(array($personName,$address,$size,$id));


 $data = $statement->fetch(PDO::FETCH_ASSOC);


 $count = $statement->rowCount() ; 



 if ($count > 0){

    echo json_encode(array("status"=>"success" ));
    
 }
 else{

    echo json_encode(array("status"=>"failed"));

 }