import 'package:assignment1/cubits/service_cubits/company_service_cubit/company_service_states.dart';
import 'package:assignment1/modules/service/Functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyServiceCubit extends Cubit<CompanyServicesStates>{
  CompanyServiceCubit():super(CompanyServicesInitialState());

  getServices(id)async{
    emit(GetCompanyServicesLoadingState());
    final res = await getServicesForCompany(id);
    emit(GetCompanyServicesSuccessState(res));
  }
}
