<?php
define('MB',1048576);
function filterReq($requestName){
    return htmlspecialchars(strip_tags($_POST[$requestName]));
}
function imageUpload($imageRequast){
    global $msgError;
    $imageName = rand(1000,100000) . $_FILES[$imageRequast]['name'] ;
    $imageTmp = $_FILES[$imageRequast]['tmp_name'] ;
    $imageSize = $_FILES[$imageRequast]['size'] ;
    $allowExt = array("jpg","png","gif","jpeg") ;
    $strToArray = explode(".",$imageName);
    $ext = end($strToArray);
    $ext = strtolower($ext);

    if(!empty($imageName) && !in_array($ext,$allowExt)){
        $msgError[]="extention";
    }
    if($imageSize > 10 * MB ){
        $msgError[]="size";
    }
    if(empty($msgError)){
        move_uploaded_file($imageTmp, "../upload/".$imageName);
        return $imageName;
    }else{
        return "fail";
    }
}