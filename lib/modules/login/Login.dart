import 'package:assignment1/constant/linkAPI.dart';
import 'package:assignment1/main.dart';
import 'package:assignment1/modules/login/Functions.dart';
import 'package:assignment1/modules/signup/Signup.dart';
import 'package:assignment1/shared/components/components.dart';
import 'package:assignment1/shared/components/crud.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

@override
class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(name: "Login",list:[],isBackable: false),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child:
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
                          await login(setState,emailController,passwordController,context);
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
