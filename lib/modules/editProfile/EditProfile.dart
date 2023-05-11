import 'package:assignment1/constant/menus.dart';
import 'package:assignment1/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class editProfile extends StatefulWidget {
  const editProfile({Key? key}) : super(key: key);

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {

  String _dropdownValue = "Micro";
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  TextEditingController contactPersonPhone = TextEditingController();
  TextEditingController contactPersonName = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController companyAddress = TextEditingController();
  String? errorEmail;
  String? errorPass;

  void dropdownCallback(var selectedValue) {
    setState(() {
      _dropdownValue = selectedValue;
    });
  }

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
                child:
                TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                            children:[
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Form(
                                  child: Column(
                                    children: [
                                      defaultTextFormField(
                                          textEditingController: email,
                                          icon: const Icon(Icons.email_outlined),
                                          isEmail: true,
                                          text: "Email",
                                          isRequired: true,
                                          keyboardType: TextInputType.emailAddress,errorText: errorEmail),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      defaultTextFormField(
                                        textEditingController: pass,
                                        icon: const Icon(Icons.lock),
                                        text: "Password",
                                        obscureText: false,
                                        autocorrect: false,
                                        isRequired: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      SingleChildScrollView(
                                        child: FlutterPwValidator(
                                            controller: pass,
                                            minLength: 8,
                                            uppercaseCharCount: 1,
                                            numericCharCount: 1,
                                            width: 400,
                                            height:100,
                                            onSuccess: (){
                                              print(pass.text);
                                            },
                                            onFail: (){
                                              print("Error");
                                            }
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      defaultTextFormField(
                                          textEditingController: confirmPass,
                                          icon: const Icon(Icons.lock),
                                          text: "Confirm Password",
                                          obscureText: true,
                                          autocorrect: false,
                                          isRequired: true,errorText: errorPass),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      defaultButton(function: (){}, text: "Save")
                                    ],
                                  ),
                                ),
                              ),
                            ]
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Form(
                                child: Column(
                                  children: [
                                    defaultTextFormField(
                                        textEditingController: contactPersonName,
                                        icon: const Icon(Icons.person),
                                        text: "Contact Person Name",
                                        isRequired: true),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    defaultTextFormField(
                                        keyboardType: TextInputType.phone,
                                        textEditingController: contactPersonPhone,
                                        icon: const Icon(Icons.phone),
                                        text: "Contact Person Phone",
                                        isRequired: true),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    defaultButton(function: (){}, text: "Save")
                                  ],
                                ),
                              ),
                            ),

                    ],
                  ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Form(
                                child: Column(
                                  children: [
                                    defaultTextFormField(
                                        textEditingController: companyName,
                                        icon: const Icon(Icons.add_business_outlined),
                                        text: "Company Name",
                                        isRequired: true),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    defaultTextFormField(
                                        textEditingController: companyAddress,
                                        icon: const Icon(Icons.edit_location_alt_outlined),
                                        text: "Company Address",
                                        isRequired: true),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    defaultDropDownList(
                                      dropdownItemsList: companySizeMenu(),
                                      isRequired: true,
                                      value: _dropdownValue,
                                      text: "Company Size",
                                      function: dropdownCallback,
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    defaultButton(function: (){}, text: "Save")
                                  ],

                                ),
                              ),
                            ),

                    ],
                  ),
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
