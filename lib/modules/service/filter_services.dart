import 'package:assignment1/modules/service/Functions.dart';
import 'package:flutter/material.dart';

import '../../cubits/service_cubits/all_service_cubit/all_services_cubit.dart';

class SingleSelect extends StatefulWidget {
  final List<String> allServ;

  const SingleSelect({Key? key, required this.allServ}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SingleSelectState();
}

class _SingleSelectState extends State<SingleSelect> {

  String selectedItem = "";

  void _cancel() {
    Navigator.of(context).pop();
  }

  void _submit() {
    List<String> list = [];
    list.add(selectedItem);
    Navigator.of(context).pop(list);
  }
  void _refresh() {
    Navigator.of(context).pop(null);
  }

  @override
  Widget build(BuildContext context) {
    final Set<String> serviceSet = {...widget.allServ};
    List<String> items = serviceSet.toList();

    return AlertDialog(
      title: Row(
        children: [
          const Expanded(
            flex: 6,
              child: Text('Select Services')
          ),
          IconButton(
              onPressed: _refresh,
              icon: const Icon(Icons.refresh)
          )

        ],
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: items.map((item) => RadioListTile(
            value: item,
            title: Text(item),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (isChecked) {
              setState(() {
                selectedItem = item;
              });

            },
            groupValue: selectedItem,
          )).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Save'),
        ),
      ],
    );
  }
}

