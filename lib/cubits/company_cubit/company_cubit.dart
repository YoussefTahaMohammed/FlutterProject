import 'package:assignment1/cubits/company_cubit/company_states.dart';
import 'package:assignment1/modules/company/Functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyCubit extends Cubit<CompanyStates>{
  CompanyCubit():super(CompanyInitialState());
  getComp () async{
    emit(GetCompanyLoadingState());
    final res = await getCompanies();
    emit(GetCompanySuccessState(res));
  }
}