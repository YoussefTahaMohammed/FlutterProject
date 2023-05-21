<?php
include "../connect.php";

$imageName = imageUpload("image");
$id = filterReq("id");


if($imageName != "fail"){

    $statement = $con->prepare("UPDATE `users` 
    SET `image`=?
    WHERE id=?");
    $statement->execute(array($imageName,$id));
    
    $count = $statement->rowCount() ; 


    if ($count > 0){
       echo json_encode(array("status"=>"success"));
    }
    else{
       echo json_encode(array("status"=>"failed"));
    }

}
else{
   echo json_encode(array("status"=>"failed"));
}