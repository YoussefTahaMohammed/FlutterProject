import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:assignment1/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../main.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController contactNameController = TextEditingController();
  TextEditingController contactPhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    emailController.text = sharedPref.getString("email").toString();
    passwordController.text = "joeMohamed";
    contactNameController.text = sharedPref.getString("contactName").toString();
    contactPhoneController.text = sharedPref.getString("contactPhone").toString();

    String image ="https://st3.depositphotos.com/9881890/15494/i/1600/depositphotos_154947154-stock-photo-smiling-woman-looking-at-camera.jpg";
    return Scaffold(
        appBar: appBar(name: "Profile",list: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed("editProfile");
        },
            icon: const Icon(Icons.edit))],
            function: (){
          Navigator.of(context).pop();
        }),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
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
                      border: Border.all(width: 3.0, color:  Colors.grey,strokeAlign: BorderSide.strokeAlignOutside),
                      image: const DecorationImage(
                          image: NetworkImage("https://st3.depositphotos.com/9881890/15494/i/1600/depositphotos_154947154-stock-photo-smiling-woman-looking-at-camera.jpg"),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(contactNameController.text ,style: const TextStyle(
                    fontSize: 30
                  ),),
                  Text(emailController.text ,style: const TextStyle(
                    fontSize: 15,
                  ),),
                  const SizedBox(
                    height: 20,
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      shape: CircleBorder(side: BorderSide(color: Colors.black)),
                      color: Color.fromRGBO(119, 117, 245, 1),
                      shadows: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(0, 7), // changes position of shadow
                          ),
                      ]
                    ),
                    child: IconButton(
                      iconSize: 50,
                        color: Colors.white,

                        onPressed: (){
                      sharedPref.clear();
                      Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
                    },
                        icon: const Icon(Icons.logout),
                    ),
                  )
                  ,

                ],
              ),
            ),
          ),
        ),
    );
  }
}
