import 'package:assignment1/models/CompanyModel.dart';

abstract class CompanyStates {}
class CompanyInitialState extends CompanyStates{}
class GetCompanyLoadingState extends CompanyStates{}
class GetCompanySuccessState extends CompanyStates{
  final List<CompanyModel> companies;

  GetCompanySuccessState(this.companies);
}