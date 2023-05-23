import 'package:assignment1/cubits/service_cubits/fav_service_cubit/fav_services_cubit.dart';
import 'package:assignment1/cubits/service_cubits/fav_service_cubit/fav_services_states.dart';
import 'package:assignment1/models/CompanyModel.dart';
import 'package:assignment1/models/service_model.dart';
import 'package:assignment1/modules/company/company_profile.dart';
import 'package:assignment1/modules/service/Functions.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel serviceModel;
  final bool isCompanyProfile;
  const ServiceCard({
    Key? key,
    required this.serviceModel, this.isCompanyProfile =false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if(!isCompanyProfile) {
          final CompanyModel companyModel = await getCompanyFromService(
              serviceModel.companyId);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
              CompanyProfile(companyModel: companyModel,),));
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(119, 117, 245, 0.2),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serviceModel.serviceName,
                      style: const TextStyle(
                        fontSize: 25,
                        wordSpacing: 7,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      serviceModel.serviceDescription,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if(!isCompanyProfile)
              BlocBuilder<FavServicesCubit,FavServiceStates>(
                builder: (context, state) {
                FavServicesCubit cubit=FavServicesCubit.get(context);
                return StarButton(
                  valueChanged:(isStared){
                    if(isStared) {
                      cubit.favServices!.add(serviceModel);
                    }
                    else if (!isStared){
                      cubit.favServices!.remove(serviceModel);
                    }
                    cubit.change();
                    isFav(isStared,context,serviceModel.id);
                  },
                  isStarred:cubit.find(serviceModel.id),
                  iconColor: const Color.fromRGBO(255, 149, 41, 1),
                    );
              },)
            ],
          ),
        ),
      ),
    );
  }
}
