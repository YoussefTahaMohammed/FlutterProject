import 'package:assignment1/constant/linkAPI.dart';
import 'package:assignment1/main.dart';
import 'package:assignment1/shared/components/crud.dart';

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
  var response =  await _crud.postRequest(linkViewFavServices, {});
  return response;
}