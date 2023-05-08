import 'package:assignment1/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
class Login extends StatelessWidget {
  Login ({Key? key}) : super(key: key);
  final emailController= TextEditingController();
  final passwordController = TextEditingController();
  var loginKey = GlobalKey<FormState>();
  var name="login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {  },
        ),
        title: Text(
          name
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Form(
            key: loginKey,
            child:Column(
              children: [
                Image.asset(
                    'assets/images/person.png',
                  height: 150,
                  width: 150,
                ),
                defaultTextFormField(
                    textEditingController: emailController,
                    icon: const Icon(Icons.email_outlined),
                    text: "Email",
                    isRequired: true),
                defaultTextFormField(
                    textEditingController: passwordController,
                    icon: const Icon(Icons.password_outlined),
                    text: "Password",
                    isRequired: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: defaultButton(
                    text: "Login",
                    function: (){

                    }
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
