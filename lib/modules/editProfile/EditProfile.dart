import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:assignment1/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../main.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController personNameController = TextEditingController();
  TextEditingController contactPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    emailController.text = sharedPref.getString("email").toString();
    passwordController.text = "joeMohamed";
    personNameController.text = "joeMohamed";
    contactPhone.text = "01140032992";

    String image ="https://st3.depositphotos.com/9881890/15494/i/1600/depositphotos_154947154-stock-photo-smiling-woman-looking-at-camera.jpg";
    return Scaffold(
        appBar: appBar(name: "Profile",list: [],function: (){
          Navigator.of(context).pop();
        }),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage("https://st3.depositphotos.com/9881890/15494/i/1600/depositphotos_154947154-stock-photo-smiling-woman-looking-at-camera.jpg"),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultTextFormField(
                      textEditingController: emailController,
                      icon: const Icon(Icons.email_outlined),
                      text: "Email",
                      isRequired:false,
                      enabled: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultTextFormField(
                      textEditingController: passwordController,
                      icon: const Icon(Icons.lock_outline),
                      text: "Password",
                      isRequired: false,
                      enabled: false,
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultTextFormField(
                      textEditingController: personNameController,
                      icon: const Icon(Icons.person),
                      text: "Contact Name",
                      isRequired: false,
                      enabled: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultTextFormField(
                      textEditingController: contactPhone,
                      icon: const Icon(Icons.phone),
                      text: "Contact Phone Number",
                      isRequired: false,
                      enabled: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultButton(function: (){
                    sharedPref.clear();
                    Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
                  }, text: "Logout",buttonColor: Colors.red,width: 120)
                ],
              ),
            ),
          ),
        ),
    );
  }
}
