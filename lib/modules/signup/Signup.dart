import 'package:assignment1/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

import 'Functions.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  List<GlobalKey<FormState>> stepperKey = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];
  int _activeStepIndex = 0;
  String _dropdownValue = "Micro";
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  TextEditingController contactPersonPhone = TextEditingController();
  TextEditingController contactPersonName = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController companyAddress = TextEditingController();
  String? errorEmail;
  String? errorPass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          name: "Signup",
          list: [],
        function:(){
            Navigator.of(context).pop();
          }
      ),
      body: Stepper(
        elevation: 0.5,
        steps: stepList(),
        type: StepperType.horizontal,
        currentStep: _activeStepIndex,
        onStepContinue: () {
          if (_activeStepIndex < (stepList().length - 1)) {
            setState(() {
              _activeStepIndex += 1;
            });
          }
        },
        onStepCancel: () {
          if (_activeStepIndex == 0) {
            return;
          }
          setState(() {
            _activeStepIndex -= 1;
          });
        },
        controlsBuilder: (BuildContext context, ControlsDetails controlsDetails) {
          final isLastStep = _activeStepIndex == stepList().length - 1;
          return Row(
            children: [
              Expanded(
                child: defaultButton(
                  function: () async {
                    if(!isLastStep){
                      if (stepperKey[_activeStepIndex].currentState!.validate()) {
                        errorEmail = await validEmail(context, email, setState);
                        if(errorEmail==null) {
                          if(confirmPassword(pass.text, confirmPass.text)){
                            controlsDetails.onStepContinue!();
                          }
                          else{
                            errorPass = "Password doesn't match";
                          }
                        }
                      }
                    }else{
                      await signup(setState,context,email,pass,contactPersonName,contactPersonPhone,companyName,companyAddress,_dropdownValue);
                    }
                  },
                  textFontSize: 15,
                  text: (isLastStep)?"Signup":"Next",
                ),
              ),

              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: defaultButton(
                  function: controlsDetails.onStepCancel!,
                  text: "Back",
                  textFontSize: 15,
                  buttonColor: Colors.grey,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
  void dropdownCallback(var selectedValue) {
    setState(() {
      _dropdownValue = selectedValue;
    });
  }
  double fontSize=22;
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
      content: Form(
        key: stepperKey[0],
        child: Column(
          children: [
            defaultTextFormField(
                textEditingController: email,
                icon: const Icon(Icons.email_outlined),
                isEmail: true,
                text: "Email",
                isRequired: true,
                keyboardType: TextInputType.emailAddress,errorText: errorEmail),
            const SizedBox(
              height: 20,
            ),
            defaultTextFormField(
              textEditingController: pass,
              icon: const Icon(Icons.lock),
              text: "Password",
              obscureText: false,
              autocorrect: false,
              isRequired: true,
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              child: FlutterPwValidator(
                  controller: pass,
                  minLength: 8,
                  uppercaseCharCount: 1,
                  numericCharCount: 1,
                  width: 400,
                  height:100,
                  onSuccess: (){
                    print(pass.text);
                  },
                  onFail: (){
                    print("Error");
                  }
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            defaultTextFormField(
                textEditingController: confirmPass,
                icon: const Icon(Icons.lock),
                text: "Confirm Password",
                obscureText: true,
                autocorrect: false,
                isRequired: true,errorText: errorPass),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ),
    Step(
      state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
      isActive: _activeStepIndex >= 1,
      title: const Text('Company'),
      content: Form(
        key: stepperKey[1],
        child: Column(
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
              isRequired: true,
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
    ),
    Step(
      state: _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
      isActive: _activeStepIndex >= 2,
      title: const Text('Contact'),
      content: Form(
        key: stepperKey[2],
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
                keyboardType: TextInputType.phone,
                textEditingController: contactPersonPhone,
                icon: const Icon(Icons.phone),
                text: "Contact Person Phone",
                isRequired: true),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ),
    Step(
        state: StepState.complete,
        isActive: _activeStepIndex >= 3,
        title: const Text('Confirm'),
        content: Form(
          key: stepperKey[3],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Email: ${email.text}',
                style: TextStyle(
                  fontSize: fontSize,
                ),),
              Text('Password: *****',
                style:  TextStyle(
                  fontSize: fontSize,
                ),),
              Text('Company Name : ${companyName.text}',
                style:  TextStyle(
                  fontSize: fontSize,
                ),
              ),
              Text('Company Address : ${companyAddress.text}',
                style: TextStyle(
                  fontSize: fontSize,
                ),
              ),
              Text('Company Size : $_dropdownValue',
                style:  TextStyle(
                  fontSize: fontSize,
                ),),
              Text('Contact Person Name : ${contactPersonName.text}',
                style:  TextStyle(
                  fontSize: fontSize,
                ),),
              Text('Company Person Phone : ${contactPersonPhone.text}',
                style:  TextStyle(
                  fontSize: fontSize,
                ),),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ))
  ];


}