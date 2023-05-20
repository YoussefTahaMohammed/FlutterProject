import 'package:assignment1/constant/linkAPI.dart';
import 'package:assignment1/main.dart';
import 'package:assignment1/shared/components/crud.dart';
import 'package:flutter/material.dart';

final Crud _crud = Crud();

addService(setState,serviceNameController,serviceDescriptionController) async {
  setState(() {});
  var response = await _crud.postRequest(linkAddService, {
    "companyid": sharedPref.getString("companyid"),
    "servicename" : serviceNameController.text,
    "servicedescription": serviceDescriptionController.text,
    "isfavourite": "0",
  });
  return response;
}
getServices() async{
  var response =  await _crud.postRequest(linkViewServices, {});
  return response;
}
getFavServices() async{
  var response =  await _crud.postRequest(linkViewFavServices, {
    "fav": sharedPref.getString("favoriteServices")
  });
  return response;
}
addFavorite(context,list) async{
  var response = await _crud.postRequest(linkAddFavorite, {
      "id":sharedPref.getString("id").toString(),
      "list":list
  });
}