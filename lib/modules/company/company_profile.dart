import 'package:flutter/material.dart';

class CompanyScreen extends StatelessWidget {
  final String companyName;
  final String companyIndustry;
  final String companyWebsite;
  final String companyAddress;
  final List<String> companyServices;
  final String email;
  final String phone;

  CompanyScreen({
    required this.companyName,
    required this.companyIndustry,
    required this.companyWebsite,
    required this.companyAddress,
    required this.companyServices,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Information'),
      ),
      body: Container(),
    );
  }


}
