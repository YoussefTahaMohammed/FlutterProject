<?php

include "../connect.php";


$companyId = filterReq("companyid");
$serviceName = filterReq("servicename");
$serviceDescription = filterReq("servicedescription");
$isFavourite = filterReq("isfavourite");



$statement = $con->prepare("INSERT INTO `services`(`companyid`, `servicename`, `servicedescription`, `isfavourite`) VALUES (?,?,?,?) ");

$statement->execute(array($companyId,$serviceName,$serviceDescription,$isFavourite ));


 $count = $statement->rowCount() ; 

 if ($count > 0){

   echo json_encode(array("status"=>"success"));

}
else{

   echo json_encode(array("status"=>"failed"));

}
