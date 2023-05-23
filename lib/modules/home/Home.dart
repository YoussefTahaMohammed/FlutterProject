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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(

          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              defaultButton(
                  function: (){
                    Navigator.of(context).pushNamed("company");
                  }, text: "Companies"),
              const SizedBox(
                height: 20,
              ),
              defaultButton(
                  function: (){
                    Navigator.of(context).pushNamed("services");
                  }, text: "Services"),
            ],
          ),
        ),
      ),
    );
  }
}
