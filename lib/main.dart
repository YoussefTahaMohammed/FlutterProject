import 'package:assignment1/constant/menus.dart';
import 'package:assignment1/modules/editProfile/Profile.dart';
import 'package:assignment1/modules/editProfile/editProfile.dart';
import 'package:assignment1/modules/home/Home.dart';
import 'package:assignment1/modules/signup/Signup.dart';
import 'package:flutter/material.dart';
import 'modules/Login/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Industry.dart';

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
      initialRoute: sharedPref.getString("id") == null? "login":"home",
      routes: {
        "login": (context) => Login(),
        "signup": (context) => Signup(),
        "profile": (context) => Profile(),
        "home": (context) => Home(),
        "editProfile": (context) => editProfile(),
      },
    );
  }
}