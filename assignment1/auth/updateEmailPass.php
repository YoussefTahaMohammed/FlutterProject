<?php

include "../connect.php";

$id = filterReq("id");
$email = filterReq("email");
$password = filterReq("password");

$statement = $con->prepare("UPDATE `users` SET 
                            `email`=?,
                            `password`=?
                            WHERE id=?");
 $statement->execute(array($email,$password,$id));


 $data = $statement->fetch(PDO::FETCH_ASSOC);


 $count = $statement->rowCount() ; 



 if ($count > 0){

    echo json_encode(array("status"=>"success" ));
    
 }
 else{

    echo json_encode(array("status"=>"failed"));

 }