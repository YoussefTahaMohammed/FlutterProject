import 'package:assignment1/cubits/service_cubits/all_service_cubit/all_services_states.dart';
import 'package:assignment1/models/service_model.dart';
import 'package:assignment1/modules/service/Functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllServicesCubit extends Cubit<AllServiceStates>{
  AllServicesCubit():super(AllServiceInitialState());
  static AllServicesCubit get(context)=>BlocProvider.of(context);
  List<ServiceModel> ?services;

  getAllServices () async{
    emit(GetAllServicesLoadingState());
    services = [];
    final res = await getServices();
    services = res;
    emit(GetAllServicesSuccessState());

  }

  List<ServiceModel> ?filteredServices;
  void searchServices(String serviceName) {
    filteredServices = [];
    if (serviceName.isEmpty) {
      emit(GetAllServicesSuccessState());
    }
    else {
      filteredServices = services!
          .where((company) =>
          company.serviceName.toLowerCase().contains(serviceName.toLowerCase()))
          .toList();
      emit(GetServiceSearchedState());
    }
  }
}