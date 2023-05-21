<?php

include "../connect.php";

$email = filterReq("email");

$statement = $con->prepare("SELECT * from users where email = ?");
 $statement->execute(array($email));


 $data = $statement->fetch(PDO::FETCH_ASSOC);


 $count = $statement->rowCount() ; 



 if ($count == 0){

     echo json_encode(array("status"=>"success"));
}
else{
    
    echo json_encode(array("status"=>"failed"));

 }