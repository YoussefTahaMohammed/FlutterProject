<?php

include "../connect.php";

$email = filterReq("email");
$password = filterReq("password");

$statement = $con->prepare("SELECT * from users where email = ? and `password` = ?");
 $statement->execute(array($email,$password));


 $data = $statement->fetch(PDO::FETCH_ASSOC);


 $count = $statement->rowCount() ; 



 if ($count > 0){
    $statement2 = $con->prepare("SELECT * from company where `id` = ?");
    $statement2->execute(array($data['companyid']));
   
   
    $data2 = $statement2->fetch(PDO::FETCH_ASSOC);
   
   
    $count2 = $statement2->rowCount() ; 
    if($count2>0){
      echo json_encode(array("status"=>"success" ,"data" => $data, "data2" => $data2));
    }
    
 }
 else{

    echo json_encode(array("status"=>"failed"));

 }