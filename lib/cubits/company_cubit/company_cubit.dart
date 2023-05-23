import 'package:assignment1/cubits/company_cubit/company_states.dart';
import 'package:assignment1/modules/company/Functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/CompanyModel.dart';

class CompanyCubit extends Cubit<CompanyStates> {
  CompanyCubit() :super(CompanyInitialState());
  static CompanyCubit get(context)=>BlocProvider.of(context);
  List<CompanyModel> ?companies;

  getComp() async {
    emit(GetCompanyLoadingState());
    companies = [];
    final res = await getCompanies();
    companies = res;
    emit(GetCompanySuccessState());
  }
  List<CompanyModel> ?filteredCompanies;
  void searchCompanies(String companyName) {
    filteredCompanies = [];
    if (companyName.isEmpty) {
      emit(GetCompanySuccessState());
    }
    else {
       filteredCompanies = companies!
          .where((company) =>
          company.companyName.toLowerCase().contains(companyName.toLowerCase()))
          .toList();
      emit(GetCompanySearchedState());
    }
  }
}