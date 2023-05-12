import 'package:assignment1/shared/colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';


AppBar appBar({
  required String name,
  required List<Widget> list,
  bool isBackable=true,
  VoidCallback? function
})=>
  AppBar(
  leading: IconButton(
  icon: isBackable?const Icon(Icons.arrow_back):Icon(null),
  onPressed: function,
  ),
  actions: list,
  title: Text(name),
    backgroundColor: defaultColor,
);

Widget defaultButton({
  double width = double.infinity,
  Color buttonColor = const Color.fromRGBO(119, 117, 245, 1),
  Color textColor = Colors.white,
  bool isUpperCase = true,
  double textFontSize = 20,
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
  TextInputType keyboardType = TextInputType.text,
  bool isEmail =false,
  bool enabled =true,
  bool obscureText = false,
  bool enableSuggestions = true,
  bool autocorrect = true,
  String? errorText,
}) =>
    TextFormField(
      keyboardType: keyboardType,
      controller: textEditingController,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      enabled: enabled,
      decoration: InputDecoration(
          suffixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          labelText: text,
        errorText: errorText
      ),
      validator: (value) {
        if (value!.isEmpty && isRequired) {
          return 'This Field Is Required';
        }
        if(isEmail){
          if (!EmailValidator.validate(textEditingController.text)) {
            return 'Email format Wrong';
          }
        }
        return null;
      },
    );

Widget defaultTextButton({
  required String text,
  required VoidCallback function
})=>TextButton(
    onPressed: function,
    child:
  Text(text,
  style:  TextStyle(
    color: defaultColor
  ),
  )

);

Widget defaultDropDownList({
  required List<DropdownMenuItem> dropdownItemsList,
  required String value,
  required String text,
  bool isRequired =false,
  required void function(var x),
})=> DropdownButtonFormField(
    items: dropdownItemsList ,
    value: value,
    onChanged: function,
    isExpanded: true,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      labelText: text,
    ),
  );

Future awesomeDialog({
  required BuildContext context,
  required String message,
  required String title,
  required DialogType dialogType,
  int duration =3,
})=>AwesomeDialog(
      context: context,
      title: title,
      autoHide: Duration(seconds: duration),
      dialogType: dialogType,
      body: Padding(
      padding: const EdgeInsets.all(8.0),
      child:  Text(
        message
      ),
      ),

      ).show();


