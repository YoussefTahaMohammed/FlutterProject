import 'dart:io';
import 'package:assignment1/constant/linkAPI.dart';
import 'package:assignment1/main.dart';
import 'package:assignment1/modules/editProfile/Functions.dart';
import 'package:assignment1/shared/colors.dart';
import 'package:assignment1/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? myFile;
  TextEditingController emailController = TextEditingController();
  TextEditingController contactNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    emailController.text = sharedPref.getString("email").toString();
    contactNameController.text =sharedPref.getString("contactName").toString();
    String image =  sharedPref.getString("image").toString()!="null" ? sharedPref.getString("image").toString():"person.png";
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
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
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
                        image:  DecorationImage(
                          image: NetworkImage("$linkImageRoot/$image"),
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () async {
                        XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                        if(xFile!=null) {
                          myFile = File(xFile.path);
                        }
                        if(myFile!=null){
                          if(await addPhoto(myFile!, setState, context)){
                            getImage(setState, context);
                            image = sharedPref.getString('image').toString();
                          }
                        }
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: defaultColor,
                            border: Border.all(width: 3.0, color:  Colors.grey,strokeAlign: BorderSide.strokeAlignOutside),

                        ),
                        child: const Icon(Icons.camera_alt),

                      ),
                    ),
                  )
                ],
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
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
            onPressed: (){
              sharedPref.clear();
              Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
            },
          backgroundColor: defaultColor,
          child: const Icon(Icons.logout,size: 35,),
        ),
      ),
    );
  }
}
