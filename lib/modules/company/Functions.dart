import 'package:assignment1/constant/linkAPI.dart';
import 'package:assignment1/shared/components/crud.dart';
final Crud _crud = Crud();

getCompanies() async{
  var response =  await _crud.postRequest(linkGetCompanies, {});
  return response;
}