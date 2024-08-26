import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pikaaya/last_submission.dart';

class PersonalInformationForm extends StatefulWidget {
  @override
  _PersonalInformationFormState createState() => _PersonalInformationFormState();
}

class _PersonalInformationFormState extends State<PersonalInformationForm> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();

  OutlineInputBorder _borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: Colors.grey, width: 1.0),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double formFieldHeight = screenSize.height * 0.07; // Adjust form field height
    final double buttonWidth = screenSize.width * 0.4; // Adjust button width

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Submit Personal Information'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenSize.width * 0.04), // Padding based on screen width
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextFormField('Name', 'Enter your name', TextInputType.text),
              SizedBox(height: screenSize.height * 0.02), // Adjust spacing
              _buildTextFormField('Father\'s Name', 'Enter your father\'s name', TextInputType.text),
              SizedBox(height: screenSize.height * 0.02), // Adjust spacing
              _buildDateFormField('Date of Birth', 'Enter your date of birth'),
              SizedBox(height: screenSize.height * 0.02), // Adjust spacing
              _buildTextFormField('House Number*', 'Enter your house number', TextInputType.number),
              SizedBox(height: screenSize.height * 0.02), // Adjust spacing
              _buildTextFormField('Street/Area', 'Enter your street or area', TextInputType.text),
              SizedBox(height: screenSize.height * 0.02), // Adjust spacing
              _buildTextFormField('City/Town', 'Enter your city or town', TextInputType.text),
              SizedBox(height: screenSize.height * 0.02), // Adjust spacing
              _buildDropdownFormField(),
              SizedBox(height: screenSize.height * 0.02), // Adjust spacing
              _buildTextFormField('Pin Code', 'Enter your pin code', TextInputType.number),
              SizedBox(height: screenSize.height * 0.04), // Adjust spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: buttonWidth,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'PREVIOUS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenSize.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: buttonWidth,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                       onPressed: () {
                      //   if (_formKey.currentState!.validate()) {
                      //
                      //   }
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LastSubmission()),
                       );
                      },
                      child: Text(
                        'NEXT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenSize.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _buildTextFormField(String label, String hint, TextInputType keyboardType, {IconData? suffixIcon}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: _borderStyle(),
        enabledBorder: _borderStyle(),
        focusedBorder: _borderStyle().copyWith(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        errorBorder: _borderStyle().copyWith(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      ),
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

  TextFormField _buildDateFormField(String label, String hint) {
    return TextFormField(
      controller: _dateController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        hintText: _dateController.text.isEmpty ? hint : _dateController.text,
        border: _borderStyle(),
        enabledBorder: _borderStyle(),
        focusedBorder: _borderStyle().copyWith(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        errorBorder: _borderStyle().copyWith(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () => _selectDate(context),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your date of birth';
        }
        return null;
      },
    );
  }

  DropdownButtonFormField<String> _buildDropdownFormField() {
    return DropdownButtonFormField<String>(
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
      items: <String>['Select your state', 'State 1', 'State 2'].map((String value) {
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
    );
  }
}
