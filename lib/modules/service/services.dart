import 'package:assignment1/cubits/service_cubits/all_service_cubit/all_services_cubit.dart';
import 'package:assignment1/cubits/service_cubits/fav_service_cubit/fav_services_cubit.dart';
import 'package:assignment1/cubits/service_cubits/fav_service_cubit/fav_services_states.dart';
import 'package:assignment1/modules/service/all_services.dart';
import 'package:assignment1/modules/service/fav_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  int selectedIndex =0;
  static const List<Widget> _widgetOptions = <Widget>[
    AllServices(),
    FavouriteServices()
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AllServicesCubit()..getAllServices(),),
          BlocProvider(create: (context) => FavServicesCubit()..getFav(),),
        ],
        child: BlocBuilder<FavServicesCubit,FavServiceStates>(builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Business Services ",
              ),
              backgroundColor:const Color.fromRGBO(119, 117, 245, 1) ,
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child:_widgetOptions.elementAt(selectedIndex),
            ),
            bottomNavigationBar: Container(
              color: const Color.fromRGBO(119, 117, 245, 1),
              child:  Padding(
                padding:  const EdgeInsets.symmetric(horizontal:10.0,vertical: 5),
                child: GNav(
                  onTabChange:(index){
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  selectedIndex: selectedIndex,
                  activeColor: Colors.white,
                  tabBorderRadius: 152,
                  tabBackgroundColor: const Color.fromRGBO(130, 128, 255, 1),
                  backgroundColor: const Color.fromRGBO(119, 117, 245, 1),
                  gap: 20,
                  padding: const EdgeInsets.all(14),
                  tabs: const [
                    GButton(
                      icon: Icons.business_outlined,
                      text: "All",
                    ),
                    GButton(
                      icon: Icons.star_border,
                      text: "Favorite",
                      curve:Curves.bounceIn ,
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: SizedBox(
              width: 55,
              height: 55,
              child: FloatingActionButton(
                onPressed: (){Navigator.of(context).pushNamed("addService");},
                backgroundColor: const Color.fromRGBO(119, 117, 245, 1),
                child: const Icon(Icons.add,size: 35,),
              ),
            ),
          );
        },));
  }
}
