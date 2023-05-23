<?php

include "../connect.php";


$companyId = filterReq("companyid");
$serviceName = filterReq("servicename");
$serviceDescription = filterReq("servicedescription");



$statement = $con->prepare("INSERT INTO `services`(`companyid`, `servicename`, `servicedescription`) VALUES (?,?,?) ");

$statement->execute(array($companyId,$serviceName,$serviceDescription));


 $count = $statement->rowCount() ; 

 if ($count > 0){

   echo json_encode(array("status"=>"success"));

}
else{

   echo json_encode(array("status"=>"failed"));

}
