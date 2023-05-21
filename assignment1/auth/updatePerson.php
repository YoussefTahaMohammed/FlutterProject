<?php

include "../connect.php";

$id = filterReq("id");
$personName = filterReq("name");
$phone = filterReq("phone");

$statement = $con->prepare("UPDATE `users` SET 
                           `contactpersonname`=?,
                            `contactpersonphone`=?
                            WHERE id=?");
 $statement->execute(array($personName,$phone,$id));


 $data = $statement->fetch(PDO::FETCH_ASSOC);


 $count = $statement->rowCount() ; 



 if ($count > 0){

    echo json_encode(array("status"=>"success" ));
    
 }
 else{

    echo json_encode(array("status"=>"failed"));

 }