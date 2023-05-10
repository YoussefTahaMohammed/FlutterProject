import 'package:assignment1/modules/editProfile/Profile.dart';
import 'package:assignment1/shared/components/components.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(
            name: "Home",
            list: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed("profile");
          },
              icon:const Icon(Icons.settings))
        ], isBackable: false),
    );
  }
}
