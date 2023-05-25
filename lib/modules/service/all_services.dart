import 'package:assignment1/cubits/service_cubits/all_service_cubit/all_services_cubit.dart';
import 'package:assignment1/cubits/service_cubits/all_service_cubit/all_services_states.dart';
import 'package:assignment1/modules/service/filter_services.dart';
import 'package:assignment1/modules/service/service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllServices extends StatelessWidget {
  const AllServices({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    void showMultiSelect(List<String> list) async {
      final List<String>? results = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SingleSelect(allServ: list);
        },
      );
      if (results != null && results.length == 1)  {

        AllServicesCubit.get(context).searchServices(results.first);
      }
      else{
        AllServicesCubit.get(context).filteredServices = null;
        AllServicesCubit.get(context).getAllServices();
      }
    }
    TextEditingController editingController = TextEditingController();

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: editingController,
                onChanged: (value) {
                  AllServicesCubit.get(context).searchServices(value);
                },
                decoration:
                InputDecoration(
                    labelText: "Search",
                    prefixIcon: const Icon(Icons.search,),
                    suffixIcon: IconButton(
                      autofocus: true,
                        onPressed: () => showMultiSelect(AllServicesCubit.get(context).services!.map((service) => service.serviceName).toList()),
                      icon: const Icon  (Icons.filter_alt),
                    ),
                ),
              ),
            )
          ],
        ),

        const SizedBox(
          height: 10,
        ),
        BlocBuilder<AllServicesCubit,AllServiceStates>(
          builder: (context, state) {
            AllServicesCubit cubit = AllServicesCubit.get(context);
            if (state is GetAllServicesLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (cubit.filteredServices!=null && cubit.filteredServices!.isNotEmpty) {
              return Expanded(
                child: ListView.separated(
                  itemCount:cubit.filteredServices!.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ServiceCard(
                        serviceModel:cubit.filteredServices![index]
                    );
                  },
                  separatorBuilder:
                      (BuildContext context, int index) {
                    return const SizedBox(height: 10);
                  },
                ),
              );
            }
            if (state is GetServiceSearchedState&&cubit.filteredServices!=null&&cubit.filteredServices!.isEmpty) {
              return const Text("empty");
            }
            if (cubit.services!.isNotEmpty ){
              return Expanded(
                child: ListView.separated(
                  itemCount: cubit.services!.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ServiceCard(
                        serviceModel: cubit.services![index]);
                  },
                  separatorBuilder:
                      (BuildContext context, int index) {
                    return const SizedBox(height: 10);
                  },
                ),
              );
            }
            return Container();
            },
        ),
      ],
    );
  }
}


