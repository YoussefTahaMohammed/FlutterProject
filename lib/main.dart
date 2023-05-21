import 'package:assignment1/modules/editProfile/Profile.dart';
import 'package:assignment1/modules/editProfile/EditProfile.dart';
import 'package:assignment1/modules/home/Home.dart';
import 'package:assignment1/modules/service/add_service.dart';
import 'package:assignment1/modules/service/services.dart';
import 'package:assignment1/modules/signup/Signup.dart';
import 'package:flutter/material.dart';
import 'modules/Login/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'modules/company/companies.dart';
import 'modules/company/company_profile.dart';

late SharedPreferences sharedPref ;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: sharedPref.getString("id") == null? "login":"companyProfile",
      routes: {
        "login": (context) => Login(),
        "signup": (context) => Signup(),
        "profile": (context) => Profile(),
        "home": (context) => Home(),
        "editProfile": (context) => editProfile(),
        "company":(context)=> Companies(),
        "services":(context)=> Services(),
        "addService":(context)=> AddService(),
        "companyProfile":(context)=> CompanyScreen(),

      },
    );
  }
}