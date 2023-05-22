import 'package:assignment1/cubits/service_cubits/all_service_cubit/all_services_states.dart';
import 'package:assignment1/modules/service/Functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllServicesCubit extends Cubit<AllServiceStates>{
  AllServicesCubit():super(AllServiceInitialState());
  static AllServicesCubit get(context)=>BlocProvider.of(context);
  getAllServices () async{
    emit(GetAllServicesLoadingState());
    final res = await getServices();
    emit(GetAllServicesSuccessState(res));
  }
}