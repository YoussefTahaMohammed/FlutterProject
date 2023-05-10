import 'package:assignment1/shared/components/components.dart';
import 'package:flutter/material.dart';

class editProfile extends StatefulWidget {
  const editProfile({Key? key}) : super(key: key);

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appBar(name: "Edit Profile", list: [],isBackable: true,function: (){
          Navigator.of(context).pop();
        }),
        body: Center(
          child: Column(
            children: [
              const TabBar(tabs:[
                Tab(
                  icon: Icon(Icons.email_outlined,color: Color.fromRGBO(119, 117, 245, 1),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.person,color: Color.fromRGBO(119, 117, 245, 1),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.business,color: Color.fromRGBO(119, 117, 245, 1),
                  ),
                ),
              ]
              ),
              Expanded(
                child: TabBarView(children: [
                  Column(
                    children:[
                      const SizedBox(
                        height: 20,
                      ),
                    ]
                  ),
                  Column(
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
                    ],
                  ),
                  Column(
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
                    ],
                  ),
                ]),
              )
            ],
          ),
        ),

      ),
    );
  }
}
