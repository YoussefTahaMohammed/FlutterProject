import 'package:assignment1/shared/components/components.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int _activeStepIndex = 0;
  String _dropdownValue = "Micro";
  var contactKey = GlobalKey<FormState>();

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
      appBar: appBar(name: "Signup"),
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

  void dropdownCallback(var selectedValue) {
      setState(() {
        _dropdownValue = selectedValue;
      });
  }
  List<DropdownMenuItem> companySizeMenu()=> const[
    DropdownMenuItem(value: "Micro", child: Text("Micro")),
    DropdownMenuItem(value: "Small", child: Text("Small")),
    DropdownMenuItem(value: "Mini", child: Text("Mini")),
    DropdownMenuItem(value: "Large", child: Text("Large")),
  ];
  List<Step> stepList() => [
    Step(
      state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
      isActive: _activeStepIndex >= 0,
      title: const Text('Account'),
      content: Column(
        children: [
          defaultTextFormField(
              textEditingController: email,
              icon: const Icon(Icons.email_outlined),
              text: "Email",
              isRequired: true),
          const SizedBox(
            height: 20,
          ),
          defaultTextFormField(
              textEditingController: pass,
              icon: const Icon(Icons.lock),
              text: "Password",
              isRequired: true),
          const SizedBox(
            height: 20,
          ),
          defaultTextFormField(
              textEditingController: confirmPass,
              icon: const Icon(Icons.lock),
              text: "Confirm Password",
              isRequired: true),
        ],
      ),
    ),
    Step(
      state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
      isActive: _activeStepIndex >= 1,
      title: const Text('Company'),
      content: Column(
        children: [
          defaultTextFormField(
              textEditingController: companyName,
              icon: const Icon(Icons.add_business_outlined),
              text: "Company Name",
              isRequired: true),
          const SizedBox(
            height: 20,
          ),
          defaultTextFormField(
              textEditingController: companyAddress,
              icon: const Icon(Icons.edit_location_alt_outlined),
              text: "Company Address",
              isRequired: true),
          const SizedBox(
            height: 20,
          ),
          defaultDropDownList(
              dropdownItemsList: companySizeMenu(),
              value: _dropdownValue,
              text: "Company Size",
              function: dropdownCallback,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ),
    Step(
      state: _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
      isActive: _activeStepIndex >= 2,
      title: const Text('Contact'),
      content: Form(
        key: contactKey,
        child: Column(
          children: [
            defaultTextFormField(
                textEditingController: contactPersonName,
                icon: const Icon(Icons.person),
                text: "Contact Person Name",
                isRequired: true),
            const SizedBox(
              height: 20,
            ),
            defaultTextFormField(
                textEditingController: contactPersonPhone,
                icon: const Icon(Icons.phone),
                text: "Contact Person Phone",
                isRequired: true),
          ],
        ),
      ),
    ),
    Step(
        state: StepState.complete,
        isActive: _activeStepIndex >= 3,
        title: const Text('Confirmation'),
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
