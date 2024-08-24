import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pikaaya/phone_otp.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countryController = TextEditingController();
  bool agreeToPrivacyPolicy = false;  // State for the first checkbox
  bool acceptTermsAndConditions = false;  // State for the second checkbox

  @override
  void initState() {
    super.initState();
    countryController.text = "+91";
  }

  void _openPrivacyPolicy() {
    // Implement the action for opening the privacy policy
    print("Privacy policy clicked");
  }

  void _openTermsAndConditions() {
    // Implement the action for opening the terms and conditions
    print("Terms and conditions clicked");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Images/boylogo.png',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 25),
              Text(
                "Continue with your Mobile \n Number",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Phone Number",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),  // Adjust space before checkboxes
              CheckboxListTile(
                value: agreeToPrivacyPolicy,
                onChanged: (bool? value) {
                  setState(() {
                    agreeToPrivacyPolicy = value!;
                  });
                },
                title: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'I agree to the ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Privacy',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _openPrivacyPolicy, // Add your function here
                      ),
                      TextSpan(
                        text: ' & ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Policy',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _openPrivacyPolicy, // Add your function here
                      ),
                    ],
                  ),
                ),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                value: acceptTermsAndConditions,
                onChanged: (bool? value) {
                  setState(() {
                    acceptTermsAndConditions = value!;
                  });
                },
                title: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'I accept the ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Terms and Conditions',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _openTermsAndConditions, // Add your function here
                      ),
                    ],
                  ),
                ),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(),
                        ));
                  },
                  child: Text("SEND OTP",  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
