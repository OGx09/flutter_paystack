import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/src/common/validators.dart';

//Would have used bloc pattern but for the sake of consistency, i'm going for this
class CreateSubaccount extends StatefulWidget {
  @override
  CreateSubaccountState createState() {
    Validators validator = new Validators();
    return CreateSubaccountState(validator: validator);
  }
}

class CreateSubaccountState extends State<CreateSubaccount> {
  final _formKey = GlobalKey<FormState>();
  String? dropdownValue;
  Validators? validator;

  CreateSubaccountState({@required this.validator});

  var _autoValidate = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return new Form(
      autovalidateMode: _autoValidate,
      child: Column(),
      key: _formKey,
    );
  }

  Widget _buildCurrency() {
    return StreamBuilder(builder: (_, snapshot) {
      return DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['One', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });
  }
}
