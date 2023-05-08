import 'package:flutter/material.dart';
import 'package:assignment1/shared/colors.dart';
AppBar appBar({
  required String name
})=>
  AppBar(
  leading: IconButton(
  icon: const Icon(Icons.arrow_back),
  onPressed: () {},
  ),
  title: Text(name),
    backgroundColor: const Color.fromRGBO(119, 117, 245, 1),
);

Widget defaultButton({
  double width = double.infinity,
  Color buttonColor = const Color.fromRGBO(119, 117, 245, 1),
  Color textColor = Colors.white,
  bool isUpperCase = true,
  required VoidCallback function,
  required String text
}) =>
    Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 7), // changes position of shadow
          ),
        ],
      ),
      child: OutlinedButton(
        onPressed: function,
        style: OutlinedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20
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
}) =>
    TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: textEditingController,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      onFieldSubmitted: (value) {

      },
      decoration: InputDecoration(
          suffixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          labelText: text,
      ),
      validator: (value) {
        if (value!.isEmpty && isRequired) {
          return 'This Field Is Required';
        }
        return null;
      },
    );

Widget defaultTextButton({
  required String text,
})=>TextButton(onPressed: (){}, child:

  Text(text,
  style: const TextStyle(
    color: Color.fromRGBO(119, 117, 245, 1)
  ),
  )

);