import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../constant/linkapi.dart';
import '../../shared/components/components.dart';
import '../../shared/components/crud.dart';

final Crud _crud = Crud();
bool isLoading =false;

Future<String?> validEmail(context,email,setState)async{
  isLoading = true;
  var response = await _crud.postRequest(linkValidEmail, {
    "email" : email.text,
  });
  if (response['status'] == "success"){
    isLoading =false;
    setState(() {
    });
    return null;
  }
  else{
    isLoading =false;
    setState((){

    });
    return "Email Already Exists";
  }
}
Future<String?> validCompanyName(context,companyName,setState) async{
  isLoading = true;
  var response = await _crud.postRequest(linkValidCompanyName, {
    "companyname" : companyName.text,
  });
  if (response['status'] == "success"){
    isLoading =false;
    setState(() {
    });
    return null;
  }
  else{
    isLoading =false;
    setState((){

    });
    return "Company Name Already Exists";
  }
}
Future<String?> validPhone(context,contactPersonPhone,setState) async{
  isLoading = true;
  var response = await _crud.postRequest(linkValidPersonPhone, {
    "contactpersonphone" : contactPersonPhone.text,
  });
  if (response['status'] == "success"){
    isLoading =false;
    setState(() {

    });
    return null;
  }
  else{
    isLoading =false;
    setState((){

    });
    return "Phone is Already Exists";
  }
}

signup(setState,context,email,pass,contactPersonName,contactPersonPhone,companyName,companyAddress,_dropdownValue,_selectedItems) async {
  isLoading = true;
  var response = await _crud.postRequest(linkSignup, {
    "email" : email.text,
    "password": pass.text,
    "contactpersonname" : contactPersonName.text,
    "contactpersonphone" :contactPersonPhone.text,
    "companyname" : companyName.text,
    "companyaddress" : companyAddress.text,
    "companysize":_dropdownValue,
    "companyindustry":_selectedItems,
  });
  if (response['status'] == "success"){
    isLoading =false;
    setState(() {
    });
    Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
    // awesomeDialog(
    //   context: context,
    //   message: "Done",
    //   title: "Signup",
    //   dialogType: DialogType.success,
    // );
  }
  else{
    isLoading =false;
    setState((){

    });
    awesomeDialog(context: context, message: "Error",
        title: "Connection Error", dialogType: DialogType.info);
  }
}

bool confirmPassword(pass1,pass2){
  if(pass1 == pass2){
    return true;
  }else{
    return false;
  }
}
bool isNumber(phoneNumber){
  num? number = num.tryParse(phoneNumber);
  if (number == null) {
    return false;
  } else {
    return true;
  }
}
