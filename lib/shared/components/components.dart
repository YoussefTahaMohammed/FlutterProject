import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color buttonColor = const Color.fromRGBO(119, 117, 245, 1),
  Color textColor = Colors.white,
  bool isUpperCase =true,
  required Function function,
  required String text
})=>Container(
    width: width,
    height: 50,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child:OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child:  Text(isUpperCase ? text.toUpperCase():text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 30
        ),
      ),
    ),
);

Widget defaultTextFormField({
  required TextEditingController textEditingController,
  required Icon icon,
  required String text,
  required bool isRequired,
  bool obscureText = false,
  bool enableSuggestions = true,
  bool autocorrect = true,
})=>TextFormField(
  keyboardType: TextInputType.emailAddress,
  controller: textEditingController,
  obscureText: obscureText,
  enableSuggestions: enableSuggestions,
  autocorrect: autocorrect,
  onFieldSubmitted: (value){

  },
  decoration:  InputDecoration(
  icon: icon,
  labelText: text
  ),
  validator: (value) {
    if (value!.isEmpty&&isRequired) {
      return 'This Field Is Required';
    }
    return null;
  },
);