
import 'package:flutter/material.dart';

class MyFormF extends StatefulWidget {
  const MyFormF({super.key});

  @override
  _MyFormFState createState() => _MyFormFState();
}

class _MyFormFState extends State<MyFormF> {
  final _formKey = GlobalKey<FormState>();
  late String selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gender Select Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (selectedGender.isEmpty) {
                    return 'Please select a gender';
                  }
                  return null;
                },
              ),
              genderSelectFormField(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process the form data
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FormField<String> genderSelectFormField() {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: 'Gender',
            errorText: state.hasError ? state.errorText : null,
          ),
          isEmpty: selectedGender == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedGender,
              isDense: true,
              onChanged: (newValue) {
                state.didChange(newValue);
                setState(() {
                  selectedGender = newValue!;
                });
              },
              items: <String>['Male', 'Female', 'Other']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}