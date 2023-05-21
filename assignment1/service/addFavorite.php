<?php

include "../connect.php";


$id = filterReq("id");
$list = filterReq("list");



$statement = $con->prepare("UPDATE `users` SET `favoriteservices`=? WHERE id =?");

$statement->execute(array($list,$id));


 $count = $statement->rowCount() ; 

 if ($count > 0){

   echo json_encode(array("status"=>"success"));

}
else{

   echo json_encode(array("status"=>"failed"));

}
