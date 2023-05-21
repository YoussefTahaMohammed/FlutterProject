<?php

include "../connect.php";

$email = filterReq("email");
$password = filterReq("password");
$contactPersonName = filterReq("contactpersonname");
$contactPersonPhone	 = filterReq("contactpersonphone");

$companyName	 = filterReq("companyname");
$companyAddress = filterReq("companyaddress");
$companySize	 = filterReq("companysize");
$companyIndustry	 = filterReq("companyindustry");

$statement = $con->prepare("INSERT INTO `company`(`companyname`, `companyaddress`, `companysize`, `companyindustry`) 
VALUES (? ,? ,? ,?)
");
$statement-> execute(array($companyName,$companyAddress,$companySize,$companyIndustry));


$count = $statement->rowCount() ; 

///////////////////////////////////////////////////////////////////////////////////////////////////////////
$statement1 = $con->prepare("SELECT id from company where companyname = ?");
 $statement1->execute(array($companyName));


 $data = $statement1->fetch(PDO::FETCH_ASSOC);


 $count1 = $statement1->rowCount() ; 

///////////////////////////////////////////////////////////////////////////////////////////////////////////

$statement2 = $con->prepare("INSERT INTO `users`(`email`, `password`, `contactpersonname`,
                                                 `contactpersonphone`,`companyid`)
VALUES (? ,? ,? , ?, ?)
");

$statement2-> execute(array($email,$password,$contactPersonName,$contactPersonPhone,$data['id']));


$count2 = $statement2->rowCount() ; 



if ($count > 0&&$count1>0&&$count2>0){

   echo json_encode(array("status"=>"success"));

}
else{

   echo json_encode(array("status"=>"failed"));

}


