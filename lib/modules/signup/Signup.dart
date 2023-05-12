import 'package:assignment1/Industry.dart';
import 'package:assignment1/constant/menus.dart';
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
  List<String> _selectedItems = [];

  void _showMultiSelect() async {
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: industryList());
      },
    );

    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

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
  String? errorPhone;
  String? errorPass;
  String? errorCompany;

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
                        errorEmail   = await validEmail(context, email, setState);
                        //errorPhone   = await validPhone(context, contactPersonPhone, setState);
                        //errorCompany = await validCompanyName(context, companyName, setState);
                        if(errorEmail == null) {
                          if(confirmPassword(pass.text, confirmPass.text)){
                            controlsDetails.onStepContinue!();
                          }
                          else{
                            errorPass = "Password doesn't match";
                          }
                        }
                        // if(errorPhone == null) {
                        //   if(isNumber(contactPersonPhone.text)){
                        //     controlsDetails.onStepContinue!();
                        //   }
                        //   else{
                        //     errorPhone = "Numeric only";
                        //   }
                        // }
                        // if(errorCompany == null) {
                        //   controlsDetails.onStepContinue!();
                        // }
                      }
                    }else{
                      await signup(setState,context,email,pass,contactPersonName,contactPersonPhone,companyName,companyAddress,_dropdownValue,_selectedItems.toString());
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
                  minLength: 4,
                  //uppercaseCharCount: 1,
                  //numericCharCount: 1,
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
                obscureText: false,
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
                isRequired: true,
                errorText: errorCompany
            ),
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
            SizedBox(
              height: 60,
              child: OutlinedButton(
                onPressed: _showMultiSelect,
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // set border radius if needed
                  side: const BorderSide(color: Colors.grey), // add border color
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Industry',
                      style: TextStyle(color: Colors.grey.withOpacity(0.8)), // set text color to black
                    ),
                    const Icon(Icons.arrow_drop_down, color: Colors.black),
                  ],
                ),
              ),

            ),
            const SizedBox(
              height: 12,
            ),
            // display selected items
            SingleChildScrollView(
              scrollDirection: Axis.horizontal ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Wrap(
                    children: _selectedItems.map((e) => Chip(label: Text(e),)).toList(),
                  ),
                ],
              ),
            )
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
                isRequired: true,
                errorText: errorPhone
            ),
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