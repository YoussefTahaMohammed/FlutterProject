

import 'package:assignment1/cubits/company_cubit/company_cubit.dart';
import 'package:assignment1/cubits/company_cubit/company_states.dart';
import 'package:assignment1/modules/company/company_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Companies extends StatelessWidget {
   const Companies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocProvider(
          create: (context) => CompanyCubit()..getComp(),
          child: BlocBuilder<CompanyCubit,CompanyStates>(
            builder: (context, state) {
              if (state is GetCompanyLoadingState){
                return const Center(child: CircularProgressIndicator());
              }
              if (state is GetCompanySuccessState && state.companies.isEmpty){
                return const Center(
                  child: Text(
                      "There is No Companies"
                  ),
                );
              }
              if (state is GetCompanySuccessState){
                return ListView.separated(
                  itemCount:state.companies.length ,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return CompanyCard(companyModel: state.companies[index]);
                  }, separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 10);
                },
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

}




