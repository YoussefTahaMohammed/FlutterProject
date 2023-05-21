<?php
global $con;
include "connect.php";
$statement = $con->prepare("SELECT * FROM users");
$statement->execute();
$users = $statement->fetchAll(PDO::FETCH_ASSOC);
print_r($users);