import 'package:assignment1/cubits/company_cubit/company_cubit.dart';
import 'package:assignment1/cubits/company_cubit/company_states.dart';
import 'package:assignment1/modules/company/company_card.dart';
import 'package:assignment1/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Companies extends StatelessWidget {
  const Companies({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = TextEditingController();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar(name: 'Companies', list: [],function: (){
          Navigator.of(context).pop();
        }),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: editingController,
                onChanged: (value) {
                  CompanyCubit.get(context).searchCompanies(value);
                },
                decoration: const InputDecoration(
                  labelText: "Search ...",
                  suffixIcon: Icon(
                    Icons.search,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<CompanyCubit,CompanyStates>(
                builder: (BuildContext context, state) {
                  CompanyCubit cubit = CompanyCubit.get(context);
                  if (state is GetCompanyLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (cubit.filteredCompanies!=null&&cubit.filteredCompanies!.isNotEmpty) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListView.separated(
                          itemCount:cubit.filteredCompanies!.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return CompanyCard(
                                companyModel:cubit.filteredCompanies![index]
                            );
                          },
                          separatorBuilder:
                              (BuildContext context, int index) {
                            return const SizedBox(height: 10);
                          },
                        ),
                      ),
                    );
                  }
                  if (state is GetCompanySearchedState&&cubit.filteredCompanies!=null&&cubit.filteredCompanies!.isEmpty)
                  {
                    return const Text("empty");
                  }
                  if (cubit.companies!.isNotEmpty ){
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListView.separated(
                          itemCount: cubit.companies!.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return CompanyCard(
                                companyModel: cubit.companies![index]);
                          },
                          separatorBuilder:
                              (BuildContext context, int index) {
                            return const SizedBox(height: 10);
                          },
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}