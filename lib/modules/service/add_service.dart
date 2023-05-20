import 'package:assignment1/modules/service/Functions.dart';
import 'package:assignment1/shared/components/components.dart';
import 'package:flutter/material.dart';

class AddService extends StatefulWidget {
  const AddService({Key? key}) : super(key: key);

  @override
  State<AddService> createState() => _AddServiceState();
}

@override
class _AddServiceState extends State<AddService> {

  final serviceNameController = TextEditingController();
  final serviceDescriptionController = TextEditingController();
  var key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(name: "Add a service", list: [],function: (){
        Navigator.of(context).pop();
      }),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child:
        SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                  width: 300,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: serviceNameController,
                  decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.miscellaneous_services),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                    labelText: "Service Name",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  controller: serviceDescriptionController,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.text_format),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: "Service Description",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child:Container(
                    width: 200,
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
                      onPressed: (){
                        addService(setState,serviceNameController,serviceDescriptionController);
                        Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(119, 117, 245, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text("Add Service",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
