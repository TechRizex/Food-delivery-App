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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // 5% margin from both sides
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/Images/boylogo.png',
                  width: screenWidth * 0.4, // Responsive width
                  height: screenWidth * 0.4, // Responsive height
                ),
              ),
              SizedBox(height: screenHeight * 0.03), // 3% of screen height
              Text(
                "Continue with your Mobile \n Number",
                style: TextStyle(
                  fontSize: screenWidth * 0.05, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(height: screenHeight * 0.01), // 1% of screen height
              Text(
                "Phone Number",
                style: TextStyle(
                  fontSize: screenWidth * 0.04, // Responsive font size
                ),
              ),
              SizedBox(height: screenHeight * 0.01), // 1% of screen height
              Container(
                height: screenHeight * 0.08, // Responsive height
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(width: screenWidth * 0.02), // Responsive width
                    SizedBox(
                      width: screenWidth * 0.15, // Responsive width
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
                      style: TextStyle(fontSize: screenHeight * 0.05, color: Colors.grey),
                    ),
                    SizedBox(width: screenWidth * 0.02), // Responsive width
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
              SizedBox(height: screenHeight * 0.03), // 3% of screen height
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
              SizedBox(height: screenHeight * 0.05), // 5% of screen height
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.07, // Responsive height
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
                      fontSize: screenWidth * 0.04, // Responsive font size
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
