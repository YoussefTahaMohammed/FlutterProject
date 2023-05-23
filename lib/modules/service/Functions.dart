import 'package:assignment1/constant/linkAPI.dart';
import 'package:assignment1/main.dart';
import 'package:assignment1/models/CompanyModel.dart';
import 'package:assignment1/models/service_model.dart';
import 'package:assignment1/shared/components/crud.dart';


final Crud _crud = Crud();

addService(setState,serviceNameController,serviceDescriptionController) async {
  setState(() {});
  var response = await _crud.postRequest(linkAddService, {
    "companyid": sharedPref.getString("companyid"),
    "servicename" : serviceNameController.text,
    "servicedescription": serviceDescriptionController.text,
  });
  return response;
}
getServices() async{
  List<ServiceModel> result =[];
  var response =  await _crud.postRequest(linkViewServices, {});
  if(response['status'] != "failed") {
    return List<ServiceModel>.from(
        (response["data"] as List).map((e) => ServiceModel.fromJson(e)));
  }
  return result;
}
getServicesForCompany(companyId) async{
  List<ServiceModel> result =[];
  var response =  await _crud.postRequest(linkViewServicesForCompany, {
    "companyid":companyId.toString()
  });
  if(response['status'] != "failed"){
    result = List<ServiceModel>.from((response["data"] as List).map((e) => ServiceModel.fromJson(e)));
  }
  return result;
}
getCompanyFromService(companyId) async {
  var response = await _crud.postRequest(linkGetCompany, {
    "companyid": companyId.toString()
  });
  return CompanyModel.fromJson(response['data']);
}
getFavServices() async{
  List<ServiceModel> result =[];
  if(sharedPref.getString("favoriteServices").toString()!="" && sharedPref.getString("favoriteServices").toString().toLowerCase()!="null"){
    var response =  await _crud.postRequest(linkViewFavServices, {
      "fav": sharedPref.getString("favoriteServices")
    });
    if(response['status'] != "failed") {
      result = List<ServiceModel>.from(
          (response["data"] as List).map((e) => ServiceModel.fromJson(e)));
    }
  }
  return result  ;

}
addFavorite(context,list) async{
  await _crud.postRequest(linkAddFavorite, {
      "id":sharedPref.getString("id").toString(),
      "list":list
  });
}
isFav(isStared,context,id) {
  if(isStared){
    if(sharedPref.getString("favoriteServices")=="null"||
        sharedPref.getString("favoriteServices")==""){
      addFavorite(context,"$id,");
      sharedPref.setString("favoriteServices", "$id,");
    }
    else{
      sharedPref.setString("favoriteServices", "${sharedPref.getString("favoriteServices")}$id,");
      addFavorite(context, sharedPref.getString("favoriteServices"));
    }
  }
  else{
    //1,3
    List<String> list =sharedPref.getString("favoriteServices").toString().split(",");
    list.removeWhere((element) => element == "$id");
    String out =list.toString();
    out = out.replaceAll("[", "");
    out = out.replaceAll("]", "");
    out = out.replaceAll(" ", "");
    sharedPref.setString("favoriteServices", out);
    addFavorite(context, sharedPref.getString("favoriteServices"));
  }
}