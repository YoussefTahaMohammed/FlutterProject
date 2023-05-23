import 'package:assignment1/cubits/service_cubits/all_service_cubit/all_services_cubit.dart';
import 'package:assignment1/cubits/service_cubits/all_service_cubit/all_services_states.dart';
import 'package:assignment1/modules/service/service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllServices extends StatelessWidget {
  const AllServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllServicesCubit,AllServiceStates>(
            builder: (context, state) {
          if (state is GetAllServicesSuccessState && state.services.isEmpty){
            return const Center(
              child: Text(
                  "There is No Services"
              ),
            );
          }
          if (state is GetAllServicesLoadingState){
            return const CircularProgressIndicator();
          }
          if (state is GetAllServicesSuccessState){
            return ListView.separated(
              itemCount:state.services.length ,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ServiceCard(serviceModel: state.services[index]);
              }, separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
            },
            );
          }
          return Container();
        },
    );
  }
}


