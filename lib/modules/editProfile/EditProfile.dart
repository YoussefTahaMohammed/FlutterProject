import 'package:assignment1/constant/menus.dart';
import 'package:assignment1/main.dart';
import 'package:assignment1/modules/editProfile/Functions.dart';
import 'package:assignment1/modules/signup/Functions.dart';
import 'package:assignment1/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class editProfile extends StatefulWidget {
  const editProfile({Key? key}) : super(key: key);

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  void dropdownCallback(var selectedValue) {
    setState(() {
      _dropdownValue = selectedValue;
      print(_dropdownValue);
    });
  }
  String? _dropdownValue ;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController newpass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  TextEditingController contactPersonPhone = TextEditingController();
  TextEditingController contactPersonName = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController companyAddress = TextEditingController();
  String image = "https://st3.depositphotos.com/9881890/15494/i/1600/depositphotos_154947154-stock-photo-smiling-woman-looking-at-camera.jpg";
  String? errorEmail;
  String? errorPass;
  String? errorNewPass;
  String? errorConfirm;
  String? errorPhone;
  String? errorCompName;
  bool emailCheck = false;
  bool passCheck = false;
  bool validatePass =false;
  GlobalKey<FormState> form1Key = GlobalKey<FormState>();
  GlobalKey<FormState> form2Key = GlobalKey<FormState>();
  GlobalKey<FormState> form3Key = GlobalKey<FormState>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    email.text = sharedPref.getString("email").toString();
    contactPersonName.text = sharedPref.getString("contactName").toString();
    contactPersonPhone.text = sharedPref.getString("contactPhone").toString();
    companyName.text = sharedPref.getString("companyName").toString();
    companyAddress.text = sharedPref.getString("companyAddress").toString();
    if(sharedPref.getString("companySize").toString().toLowerCase() != "null"&&sharedPref.getString("companySize").toString().toLowerCase()!=""){
      _dropdownValue=sharedPref.getString("companySize");
      print(_dropdownValue);
    }

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appBar(name: "Edit Profile", list: [],isBackable: true,function: (){
          setState(() {

          });
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
                                  key: form1Key,
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
                                        text: "Old Password",
                                        obscureText: false,
                                        autocorrect: false,
                                        isRequired: false,
                                        errorText: errorPass
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      defaultTextFormField(
                                        textEditingController: newpass,
                                        icon: const Icon(Icons.lock),
                                        text: "New Password",
                                        obscureText: false,
                                        autocorrect: false,
                                        isRequired: false,
                                        errorText: errorNewPass
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      SingleChildScrollView(
                                        child: FlutterPwValidator(
                                            controller: newpass,
                                            minLength: 8,
                                            uppercaseCharCount: 1,
                                            numericCharCount: 1,
                                            width: 400,
                                            height:100,
                                            onSuccess: (){
                                              validatePass =true;
                                            },
                                            onFail: (){
                                              validatePass = false;
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
                                          isRequired: false,
                                          errorText: errorConfirm
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      defaultButton(function: () async {
                                          if(email.value.text != sharedPref.getString("email").toString()){
                                            if(form1Key.currentState!.validate()) {
                                              errorEmail = await validEmail(
                                                  context, email, setState);
                                              if (errorEmail == null) {
                                                emailCheck =true;
                                              }
                                            }
                                            }
                                          if(pass.value.text!=""){
                                            if(pass.value.text==sharedPref.getString("password")){
                                              errorPass = null;
                                              setState(() {

                                              });
                                              if(form1Key.currentState!.validate()){
                                                  if (confirmPassword(newpass.text, confirmPass.text)) {
                                                    passCheck = true;
                                                  }
                                                  else {
                                                    errorConfirm =
                                                    "Password Doesn't Match";
                                                    setState(() {

                                                    });
                                                }
                                              }
                                            }
                                            else{
                                              errorPass = "Wrong Password";
                                              setState(() {

                                              });
                                            }

                                          };
                                            if(passCheck&&validatePass) {
                                              await UpdateEmailPass(email.text,newpass.text,setState,context);
                                            }
                                            else if(!validatePass){
                                              if(!passCheck){
                                                await UpdateEmailPass(email.text, sharedPref.getString("password").toString(),setState,context);
                                              }
                                            }
                                      }, text: "Save")
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
                                key: form2Key,
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
                                        isRequired: true,
                                        errorText: errorPhone
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    defaultButton(function: () async {
                                      bool isNum = true;
                                      if(contactPersonPhone.text != sharedPref.getString("contactPhone")) {
                                        errorPhone = await validPhone(context, contactPersonPhone, setState);
                                        isNum = isNumber(contactPersonPhone.text);
                                      }
                                      if(form2Key.currentState!.validate()) {
                                        isNum ? errorPhone = null : errorPhone ='Numeric Only' ;
                                        setState(() {});
                                        if (errorPhone == null && isNum ) {
                                          await UpdatePerson(contactPersonName.text, contactPersonPhone.text, setState, context);
                                        }
                                      }
                                    }, text: "Save")
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
                                key: form3Key,
                                child: Column(
                                  children: [
                                    defaultTextFormField(
                                        textEditingController: companyName,
                                        icon: const Icon(Icons.add_business_outlined),
                                        text: "Company Name",
                                        isRequired: true,
                                        errorText: errorCompName
                                    ),
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
                                    defaultButton(function: () async {
                                      if(companyName.text != sharedPref.getString("companyName")) {
                                        errorCompName = await validCompanyName(
                                            context, companyName,
                                            setState);
                                      }
                                      if(form3Key.currentState!.validate()) {
                                        if (errorCompName == null) {

                                          await UpdateCompany(companyName.text,companyAddress.text,_dropdownValue!, setState, context);
                                        }
                                      }
                                    }, text: "Save")
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

