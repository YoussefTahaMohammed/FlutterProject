import 'package:assignment1/models/service_model.dart';

abstract class CompanyServicesStates{}
class CompanyServicesInitialState extends CompanyServicesStates {}
class GetCompanyServicesLoadingState extends CompanyServicesStates{}
class GetCompanyServicesSuccessState extends CompanyServicesStates{
  final List<ServiceModel> list ;

  GetCompanyServicesSuccessState(this.list);
}