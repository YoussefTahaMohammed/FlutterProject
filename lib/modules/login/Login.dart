import 'package:assignment1/main.dart';
import 'package:assignment1/modules/signup/Signup.dart';
import 'package:assignment1/shared/components/components.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../../constant/linkapi.dart';
import '../../shared/components/crud.dart';
import '../home/Home.dart';


class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

@override
class _LoginState extends State<Login> {
  final Crud _crud = Crud();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var loginKey = GlobalKey<FormState>();
  bool isLoading =false;
  login() async {
    isLoading =true;
    setState(() {
    });
    var response = await _crud.postRequest(linkLogin, {
      "email" : emailController.text,
      "password": passwordController.text,
    });
    if (response['status'] == "success"){
      sharedPref.setString("id", response['data']['id'].toString());
      sharedPref.setString("email", response['data']['email'].toString());
      sharedPref.setString("password", response['data']['password']).toString();
      sharedPref.setString("contactName", response['data']['contactpersonname'].toString());
      sharedPref.setString("contactPhone", response['data']['contactpersonphone'].toString());
      sharedPref.setString("companyName", response['data']['companyname'].toString());
      sharedPref.setString("companyAddress", response['data']['companyaddress'].toString());
      sharedPref.setString("companySize", response['data']['companysize'].toString());

      isLoading =false;
      setState(() {
      });
      Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
    }
    else{
      isLoading =false;
      setState((){

      });
      awesomeDialog(context: context, dialogType: DialogType.error
          ,message: "Incorrect Email or Password", title: "Error");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(name: "Login",list:[],isBackable: false),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: isLoading ? const Center(child: CircularProgressIndicator(),):
        SingleChildScrollView(
          child: Form(
            key: loginKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                  width: 300,
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultTextFormField(
                    textEditingController: emailController,
                    icon: const Icon(Icons.email_outlined),
                    text: "Email",
                    isRequired: true,
                    isEmail: true),
                const SizedBox(
                  height: 20,
                ),
                defaultTextFormField(
                  textEditingController: passwordController,
                  icon: const Icon(Icons.lock_outline),
                  text: "Password",
                  isRequired: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: true,
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: defaultButton(
                      text: "Login",
                      function: () async {
                        if (loginKey.currentState!.validate()) {
                          await login();
                        }
                      }),
                ),
                //defaultTextButton(text: "Forgot Password?",),
                Padding(
                  padding: const EdgeInsets.only(top:50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have account?"),
                      defaultTextButton(text: "signup",
                          function: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) => const Signup()));
                          }),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
