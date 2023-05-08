import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int _activeStepIndex = 0;
  String _dropdownValue = "Micro";
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  TextEditingController contactPersonPhone = TextEditingController();
  TextEditingController contactPersonName = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController companyAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fsfs App"),
        centerTitle: true,
      ),
      body: Stepper(
        steps: stepList(),
        type: StepperType.horizontal,
        currentStep: _activeStepIndex,
        onStepContinue: () {
          if (_activeStepIndex < (stepList().length - 1)) {
            _activeStepIndex += 1;
          }
          setState(() {});
        },
        onStepCancel: () {
          if (_activeStepIndex == 0) {
            return;
          }
          _activeStepIndex -= 1;
          setState(() {});
        },
      ),
    );
  }

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('Account'),
          content: Column(
            children: [
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: confirmPass,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                ),
              ),
            ],
          ),
        ),
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text('Company'),
          content: Column(
            children: [
              TextField(
                controller: companyName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Company Name',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: companyAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Company Address',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(value: "Micro", child: Text("Micro")),
                  DropdownMenuItem(value: "Small", child: Text("Small")),
                  DropdownMenuItem(value: "Mini", child: Text("Mini")),
                  DropdownMenuItem(value: "Large", child: Text("Large")),
                ],
                value: _dropdownValue,
                onChanged: dropdownCallback,
                isExpanded: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Company Size',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        Step(
          state: _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: const Text('Contact'),
          content: Column(
            children: [
              TextField(
                controller: contactPersonName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contact Person Name',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: contactPersonPhone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contact Person Phone',
                ),
              ),
            ],
          ),
        ),
    Step(
        state: StepState.complete,
        isActive: _activeStepIndex >= 3,
        title: const Text('Confirm'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Email: ${email.text}'),
            const Text('Password: *****'),
            Text('Company Name : ${companyName.text}'),
            Text('Company Address : ${companyAddress.text}'),
            Text('Company Size : $_dropdownValue'),
            Text('Contact Person Name : ${contactPersonName.text}'),
            Text('Company Person Phone : ${contactPersonPhone.text}'),
          ],
        ))
      ];
}
