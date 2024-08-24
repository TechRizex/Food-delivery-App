import 'package:flutter/material.dart';

class PersonalInformationForm extends StatefulWidget {
  @override
  _PersonalInformationFormState createState() => _PersonalInformationFormState();
}

class _PersonalInformationFormState extends State<PersonalInformationForm> {
  final _formKey = GlobalKey<FormState>();

  OutlineInputBorder _borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: Colors.grey, width: 1.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Submit Personal Information'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    border: _borderStyle(),
                    enabledBorder: _borderStyle(),
                    focusedBorder: _borderStyle().copyWith(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    errorBorder: _borderStyle().copyWith(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Father\'s Name',
                    hintText: 'Enter your father\'s name',
                    border: _borderStyle(),
                    enabledBorder: _borderStyle(),
                    focusedBorder: _borderStyle().copyWith(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    errorBorder: _borderStyle().copyWith(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your father\'s name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    hintText: 'Enter your date of birth',
                    suffixIcon: Icon(Icons.calendar_today),
                    border: _borderStyle(),
                    enabledBorder: _borderStyle(),
                    focusedBorder: _borderStyle().copyWith(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    errorBorder: _borderStyle().copyWith(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your date of birth';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'House Number*',
                    hintText: 'Enter your house number',
                    border: _borderStyle(),
                    enabledBorder: _borderStyle(),
                    focusedBorder: _borderStyle().copyWith(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    errorBorder: _borderStyle().copyWith(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your house number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Street/Area',
                    hintText: 'Enter your street or area',
                    border: _borderStyle(),
                    enabledBorder: _borderStyle(),
                    focusedBorder: _borderStyle().copyWith(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    errorBorder: _borderStyle().copyWith(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your street or area';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'City/Town',
                    hintText: 'Enter your city or town',
                    border: _borderStyle(),
                    enabledBorder: _borderStyle(),
                    focusedBorder: _borderStyle().copyWith(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    errorBorder: _borderStyle().copyWith(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city or town';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'State',
                    hintText: 'Select your state',
                    border: _borderStyle(),
                    enabledBorder: _borderStyle(),
                    focusedBorder: _borderStyle().copyWith(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    errorBorder: _borderStyle().copyWith(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                  items: <String>['Select your state', 'State 1', 'State 2']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {});
                  },
                  validator: (value) {
                    if (value == null || value == 'Select your state') {
                      return 'Please select your state';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Pin Code',
                    hintText: 'Enter your pin code',
                    border: _borderStyle(),
                    enabledBorder: _borderStyle(),
                    focusedBorder: _borderStyle().copyWith(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    errorBorder: _borderStyle().copyWith(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your pin code';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigate back to the previous screen.
                        Navigator.pop(context);
                      },
                      child: Text('PREVIOUS'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Process the form.
                        }
                      },
                      child: Text('NEXT'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
