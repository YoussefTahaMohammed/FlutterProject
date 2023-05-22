import 'package:assignment1/models/service_model.dart';

abstract class AllServiceStates {}
class AllServiceInitialState extends AllServiceStates{}
class GetAllServicesLoadingState extends AllServiceStates{}
class GetAllServicesSuccessState extends AllServiceStates{
  final List<ServiceModel> services;

  GetAllServicesSuccessState(this.services);
}