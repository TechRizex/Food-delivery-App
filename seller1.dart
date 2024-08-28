import 'package:flutter/material.dart';
import 'package:pikaaya_customer_seller/customer_saller.dart';
import 'package:pikaaya_customer_seller/saller_hom_page.dart';

class SellerLoginScreen extends StatefulWidget {
  const SellerLoginScreen({Key? key}) : super(key: key);

  @override
  State<SellerLoginScreen> createState() => _SellerLoginScreenState();
}

class _SellerLoginScreenState extends State<SellerLoginScreen> {
  @override
  Widget build(BuildContext context) {
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      resizeToAvoidBottomInset: true, // Allow resizing when keyboard is visible
      body: Stack(
        children: [
          // Top Gradient Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFCF0A2C), Color(0xFF9C27B0)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          // Image at the top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/Images/saller1.png',
                height: 300,
                width: 400,
              ),
            ),
          ),
          // Bottom White Background with input fields
          Align(

            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100.0),
                    topRight: Radius.circular(100.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0 ,),

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 150), // Adjust spacing to make room for the image
                      Text(
                        'Seller Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: '+91 98765 43210',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Color(0xFF3E4095),
                              width: 2.0,
                            ),
                          ),
                          prefixIcon: Icon(Icons.phone),
                          suffixIcon: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle Get OTP button press
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF3E4095),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              child: Text('Get OTP', style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 60),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: '123 321',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Color(0xFFAF3D78),
                              width: 2.0,
                            ),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: SizedBox(
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SallerHomPage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFAF3D78),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              child: Text('Submit OTP', style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 60), // Add extra space at the bottom if needed
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Back Button
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerSaller()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
