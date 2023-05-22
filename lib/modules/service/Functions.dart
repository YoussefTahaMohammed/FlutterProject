import 'package:assignment1/constant/linkAPI.dart';
import 'package:assignment1/main.dart';
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
  var response =  await _crud.postRequest(linkViewServices, {});
  return List<ServiceModel>.from((response["data"] as List).map((e) => ServiceModel.fromJson(e)));
}
getServicesForCompany(companyId) async{
  var response =  await _crud.postRequest(linkViewServicesForCompany, {
    "companyid":companyId
  });
  return response;
}
getFavServices() async{
  if(sharedPref.getString("favoriteServices").toString()!="" && sharedPref.getString("favoriteServices")!=null){
    var response =  await _crud.postRequest(linkViewFavServices, {
      "fav": sharedPref.getString("favoriteServices")
    });
    return List<ServiceModel>.from((response["data"] as List).map((e) => ServiceModel.fromJson(e)));
  }
  return []  ;

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