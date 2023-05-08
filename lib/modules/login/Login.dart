import 'package:assignment1/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(name: "Login"),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
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
                    isRequired: true),
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
                      function: () {
                        if (loginKey.currentState!.validate()) {
                          if (EmailValidator.validate(emailController.text)) {
                            print("True");
                          } else {
                            print("Email Should Contain @");
                          }
                        }
                      }),
                ),
                defaultTextButton(text: "Forgot Password?"),
                Padding(
                  padding: const EdgeInsets.only(top:50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have account?"),
                      defaultTextButton(text: "Register")
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
