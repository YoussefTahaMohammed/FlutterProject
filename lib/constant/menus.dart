import 'package:flutter/material.dart';

List<DropdownMenuItem> companySizeMenu()=> const[
  DropdownMenuItem(value: "Micro", child: Text("Micro")),
  DropdownMenuItem(value: "Small", child: Text("Small")),
  DropdownMenuItem(value: "Mini", child: Text("Mini")),
  DropdownMenuItem(value: "Large", child: Text("Large")),
];
List<String> industryList()=> const[
  "Information Technology",
  "Marketing",
  "Software Eng.",
  "Software As a Services",
  "Digital Media",
  "Telecommunication",
  "Mining",
];
