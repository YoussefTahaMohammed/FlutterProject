import 'package:assignment1/constant/linkAPI.dart';
import 'package:assignment1/main.dart';
import 'package:assignment1/shared/components/components.dart';
import 'package:assignment1/shared/components/crud.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

final Crud _crud = Crud();
bool isLoading =false;
UpdateEmailPass(email,newpass,setState,context) async {
  isLoading =true;
  setState(() {
  });
  var response = await _crud.postRequest(updateEmailPass, {
    "id" : sharedPref.getString("id").toString(),
    "email" : email,
    "password": newpass,
  });
  if (response['status'] == "success"){
    isLoading =false;
    sharedPref.setString("email", email);
    sharedPref.setString("password", newpass);
    setState(() {
    });
    Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
  }
  else{
    isLoading =false;
    setState((){

    });
  }
}

UpdatePerson(name,phone,setState,context) async {
  isLoading =true;
  setState(() {
  });
  var response = await _crud.postRequest(updatePerson, {
    "id" : sharedPref.getString("id").toString(),
    "name" : name,
    "phone": phone,
  });
  if (response['status'] == "success"){
    isLoading =false;
    sharedPref.setString("contactName", name);
    sharedPref.setString("contactPhone", phone);
    setState(() {
    });
    Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
  }
  else{
    isLoading =false;
    setState((){

    });
  }
}

UpdateCompany(name,address,size,setState,context) async {
  isLoading =true;
  setState(() {
  });
  var response = await _crud.postRequest(updateCompany, {
    "id" : sharedPref.getString("companyid").toString(),
    "name" : name,
    "address": address,
    "size": size
  });
  if (response['status'] == "success"){
    sharedPref.setString("companyName", name);
    sharedPref.setString("companyAddress", address);
    sharedPref.setString("companySize", size);
    isLoading =false;
    setState(() {
    });
    Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
  }
  else{
    isLoading =false;
    setState((){

    });
    awesomeDialog(context: context, dialogType: DialogType.error
        ,message: response['status'], title: "Error");
  }
}
Future<bool> addPhoto(image,setState,context) async{
  isLoading =true;
  setState(() {
  });
  var response = await _crud.postRequestWithImage(linkUploadPhoto, {
    "id" : sharedPref.getString("id").toString(),},image);
  if (response['status'] == "success"){
    isLoading =false;
    setState(() {});
    return true;
  }
  else{
    isLoading =false;
    setState((){});
    return false;
  }
}

getImage(setState,context) async {
  isLoading =true;
  setState(() {});
  var response = await _crud.postRequest(linkGetPhoto, {
    "id" : sharedPref.get('id'),
  });
  if (response['status'] == "success"){
    sharedPref.setString("image", response['data']['image'].toString());
    isLoading =false;
    setState(() {});
    print( response['data']['image'].toString());
  }
  else{
    isLoading =false;
    setState((){});

  }
}