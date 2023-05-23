import 'package:assignment1/models/CompanyModel.dart';

abstract class CompanyStates {}
class CompanyInitialState extends CompanyStates{}
class GetCompanyLoadingState extends CompanyStates{}
class GetCompanySuccessState extends CompanyStates{}
class GetCompanySearchedState extends CompanyStates{}