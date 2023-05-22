import 'package:assignment1/constant/linkAPI.dart';
import 'package:assignment1/models/CompanyModel.dart';
import 'package:assignment1/shared/components/crud.dart';

final Crud _crud = Crud();
getCompanies() async{
  var response =  await _crud.postRequest(linkGetCompanies, {});
  return List<CompanyModel>.from((response["data"] as List).map((e) => CompanyModel.fromJson(e)));
}
// void searchCompanyName(String searchedCompany){
//   List<CompanyModel> result = [];
//   if(searchedCompany.isEmpty){
//     result = companies;
//   }
//   else{
//     result = companies.where((element) => element.companyName.toLowerCase().contains(searchedCompany.toLowerCase())).toList();
//   }
//   setState(() {
//     foundCompanies = result;
//   });
// }
// void searchCompanyServices(String searchedCompany){
//   List<CompanyModel> result = [];
//   if(searchedCompany.isEmpty){
//     result = companies;
//   }
//   else{
//     result = companies.where((element) => element.companyServices.toLowerCase().contains(searchedCompany.toLowerCase())).toList();
//   }
//   setState(() {
//     foundCompanies = result;
//   });
// }