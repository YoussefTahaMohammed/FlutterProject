import 'package:assignment1/modules/signup/Signup.dart';
import 'package:flutter/material.dart';
import 'modules/Login/Login.dart';
import 'modules/editProfile/EditProfile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Login(),
    );
  }
}