import 'package:assignment1/constant/linkapi.dart';
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
    Navigator.of(context).pushNamedAndRemoveUntil("editProfile", (route) => false);
  }
  else{
    isLoading =false;
    setState((){

    });
    awesomeDialog(context: context, dialogType: DialogType.error
        ,message: "Email Already Exists", title: "Error");
  }
}

UpdatePerson(name,phone,setState,context) async {
  isLoading =true;
  setState(() {
  });
  var response = await _crud.postRequest(updateEmailPass, {
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
    Navigator.of(context).pushNamedAndRemoveUntil("editProfile", (route) => false);
  }
  else{
    isLoading =false;
    setState((){

    });
    awesomeDialog(context: context, dialogType: DialogType.error
        ,message: "Phone Already Exists", title: "Error");
  }
}