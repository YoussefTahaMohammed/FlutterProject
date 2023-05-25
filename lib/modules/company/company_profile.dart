import 'package:assignment1/cubits/service_cubits/company_service_cubit/company_service_cubit.dart';
import 'package:assignment1/cubits/service_cubits/company_service_cubit/company_service_states.dart';
import 'package:assignment1/models/CompanyModel.dart';
import 'package:assignment1/modules/map/screens/map.dart';
import 'package:assignment1/modules/service/service_card.dart';
import 'package:assignment1/shared/colors.dart';
import 'package:assignment1/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CompanyProfile extends StatelessWidget {
  const CompanyProfile({super.key, required this.companyModel});
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    companyModel.companyIndustry=companyModel.companyIndustry.replaceAll("[","");
    companyModel.companyIndustry=companyModel.companyIndustry.replaceAll("]","");
    List<String> companyServices = companyModel.companyIndustry.split(",");
    return BlocProvider(create: (context) => CompanyServiceCubit()..getServices(companyModel.companyId),
      child:  DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: appBar(
              name: 'Company Profile',
              list: [],
              function: () {
                Navigator.of(context).pop();
              }),
          body: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 130,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.asset(
                        'assets/images/loc.png',
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: const Offset(0, 7), // changes position of shadow
                              ),
                            ],
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 3.0,
                                color: Colors.white54,
                                strokeAlign: BorderSide.strokeAlignOutside),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/fsfs.png'),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                companyModel.companyName,
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 300,
                child: Text(
                  companyModel.companyIndustry,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TabBar(
                tabs: [
                  Tab(
                    child:Row(
                      mainAxisAlignment :MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info,
                          color: defaultColor,
                        ),
                        Text(
                          " About",
                          style: TextStyle(color: defaultColor),
                        ),
                      ],
                    ),

                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.miscellaneous_services,
                          color: defaultColor,
                        ),
                        Text(
                          " Services",
                          style: TextStyle(color: defaultColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child:  TabBarView(
                    children: [
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children:  [
                                  const Text(
                                    "Owner : ",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    companyModel.contactPersonName,
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children:  [
                                  const Text(
                                    "Size : ",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    companyModel.companySize,
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children:  [
                                  const Text(
                                    "Address : ",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    companyModel.companyAddress,
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Industries of Our Company :',
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: companyServices.map((service) {
                                        return Padding(
                                          padding: const EdgeInsets.only(bottom: 15.0),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.circle,
                                                size: 12.0,
                                                color: Colors.black,
                                              ),
                                              const SizedBox(width: 8.0),
                                              Text(
                                                service,
                                                style: const TextStyle(fontSize: 20.0),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Center(
                                child: defaultButton(
                                    function: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapScreen(
                                    lat: companyModel.lat,
                                    lng: companyModel.lng,
                                    info: companyModel.companyAddress,
                                    cameraPositionn: CameraPosition(
                                      target:LatLng(companyModel.lat,companyModel.lng) ,
                                      zoom:20,
                                    )
                                ),));},
                                    text: "Go Location",
                                  height: 50,
                                  width: 180
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      BlocBuilder<CompanyServiceCubit,CompanyServicesStates>(builder: (context, state) {
                        if(state is GetCompanyServicesLoadingState){
                          return const CircularProgressIndicator();
                        }
                        if(state is GetCompanyServicesSuccessState && state.list.isEmpty){
                          return const Center(
                            child: Text(
                                "There is No Services"
                            ),
                          );
                        }
                        if(state is GetCompanyServicesSuccessState){
                          return ListView.builder(
                            itemCount: state.list.length,
                            itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                              child: ServiceCard(serviceModel: state.list[index],isCompanyProfile: true,),
                            );
                          }, );}

                        return Container();
                      },)
                    ]),
              ),
            ],
          ),
        ),
      ));
  }
}
