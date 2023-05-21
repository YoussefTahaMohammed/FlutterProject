<?php

include "../connect.php";

$companyname = filterReq("companyname");

$statement = $con->prepare("SELECT * from company where companyname = ?");
 $statement->execute(array($companyname));


 $data = $statement->fetch(PDO::FETCH_ASSOC);


 $count = $statement->rowCount() ; 



 if ($count == 0){

     echo json_encode(array("status"=>"success"));
}
else{
    
    echo json_encode(array("status"=>"failed"));

 }