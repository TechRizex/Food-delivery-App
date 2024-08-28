import 'package:flutter/material.dart';
import 'package:pikaaya_customer_seller/seller1.dart';

class CustomerSaller extends StatefulWidget {
  @override
  _CustomerSallerState createState() => _CustomerSallerState();
}

class _CustomerSallerState extends State<CustomerSaller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue,
                  Colors.pink,
                  Colors.white,
                  Colors.white,
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/Images/cust_saller_ui.png'), // Replace with the actual image path
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Text(
                    'Select an option below to continue',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 150),
                  child: Text(
                    'Let the comfort begin!',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),

                // Button 1 with the same width and rectangular shape
                SizedBox(
                  width: 250, // Set the desired width for the buttons
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rectangular shape
                      ),
                    ),
                    child: Text(
                      'Continue as a Customer',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Button 2 with the same width and rectangular shape
                SizedBox(
                  width: 250,// Same width as the first button

                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SellerLoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple, // Button background color
                      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 20), // Button size
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Text style
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rectangular shape
                      ),
                      elevation: 5, // Set elevation if needed
                    ),
                    child: Text(
                      'Login as a Seller',
                      style: TextStyle(color: Colors.white), // Text color
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
