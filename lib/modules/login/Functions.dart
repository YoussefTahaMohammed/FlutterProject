import 'package:assignment1/main.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../constant/linkAPI.dart';
import '../../shared/components/components.dart';
import '../../shared/components/crud.dart';


bool isLoading =false;
final Crud _crud = Crud();
login(setState,emailController,passwordController,context) async {
  isLoading =true;
  setState(() {
  });
  var response = await _crud.postRequest(linkLogin, {
    "email" : emailController.text,
    "password": passwordController.text,
  });
  if (response['status'] == "success"){
    sharedPref.setString("id", response['data']['id'].toString());
    sharedPref.setString("email", response['data']['email'].toString());
    sharedPref.setString("password", response['data']['password']).toString();
    sharedPref.setString("contactName", response['data']['contactpersonname'].toString());
    sharedPref.setString("contactPhone", response['data']['contactpersonphone'].toString());
    sharedPref.setString("companyid", response['data2']['id'].toString());
    sharedPref.setString("companyName", response['data2']['companyname'].toString());
    sharedPref.setString("companyAddress", response['data2']['companyaddress'].toString());
    sharedPref.setString("companySize", response['data2']['companysize'].toString());
    sharedPref.setString("image", response['data']['image'].toString());
    sharedPref.setString("favoriteServices", response['data']['favoriteservices'].toString());
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
        ,message: "Incorrect Email or Password", title: "Error");
  }
}