<?php

include "../connect.php";

$contactpersonphone = filterReq("contactpersonphone");

$statement = $con->prepare("SELECT * from users where contactpersonphone = ?");
 $statement->execute(array($contactpersonphone));


 $data = $statement->fetch(PDO::FETCH_ASSOC);


 $count = $statement->rowCount() ; 



 if ($count == 0){

     echo json_encode(array("status"=>"success"));
}
else{
    
    echo json_encode(array("status"=>"failed"));

 }