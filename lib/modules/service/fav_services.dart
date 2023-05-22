import 'package:assignment1/cubits/service_cubits/fav_service_cubit/fav_services_cubit.dart';
import 'package:assignment1/cubits/service_cubits/fav_service_cubit/fav_services_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'service_card.dart';

class FavouriteServices extends StatelessWidget {
  const FavouriteServices({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavServicesCubit,FavServiceStates>(
      builder: (context, state) {
        FavServicesCubit cubit = FavServicesCubit.get(context);
        if (state is GetFavServicesLoadingState){
          return const CircularProgressIndicator();
        }
        if (cubit.favServices!.isEmpty){
          return const Center(
            child: Text(
                "There is No Services"
            ),
          );
        }
        if (cubit.favServices!.isNotEmpty){
          return ListView.separated(
            itemCount:cubit.favServices!.length ,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ServiceCard(serviceModel: cubit.favServices![index]);
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

