import 'package:assignment1/bloc_observer.dart';
import 'package:assignment1/cubits/company_cubit/company_cubit.dart';
import 'package:assignment1/modules/editProfile/Profile.dart';
import 'package:assignment1/modules/editProfile/EditProfile.dart';
import 'package:assignment1/modules/home/Home.dart';
import 'package:assignment1/modules/map/screens/map.dart';
import 'package:assignment1/modules/service/add_service.dart';
import 'package:assignment1/modules/service/services.dart';
import 'package:assignment1/modules/signup/Signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'modules/Login/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'modules/company/companies.dart';
late SharedPreferences sharedPref ;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  Bloc.observer=AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CompanyCubit()..getComp())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: sharedPref.getString("id") == null? "login":"home",
        routes: {
          "login": (context) => Login(),
          "signup": (context) => const Signup(),
          "profile": (context) => const Profile(),
          "home": (context) => const Home(),
          "editProfile": (context) => const editProfile(),
          "company":(context)=> const Companies(),
          "services":(context)=> const Services(),
          "addService":(context)=> const AddService(),
          "googleMap":(context)=>  const MapScreen(
              lat: 30.044430,
              lng: 31.2357,
              info: "Cairo",
              cameraPositionn: CameraPosition(
                  target: LatLng(30.044430,31.2357),
                  zoom: 14
              ))
          //"companyProfile":(context)=> CompanyScreen( ),
        },

      ),
    );
  }
}
