import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pikaaya_customer_seller/customer_saller.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({Key? key}) : super(key: key);

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {


  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CustomerSaller(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:Stack(

          children: [


            Container(

              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff2d135b),
                      Color(0xffcc208e),
                      Color(0xff721424)],
                    begin: FractionalOffset(01.0, 0.0),
                    end: FractionalOffset(01.0, 03.0)),
              ),

              child: Center(
                heightFactor: 800,
                widthFactor: 800,
                child: Image.asset('assets/Images/pikaayalogo.png'),

              ),



            ),



            Container(
              padding: EdgeInsets.fromLTRB(100,500,50,0),
              child: Text(
                'A Whole Grocery Store\n    at your Fingertips',
                style: TextStyle(color: Colors.white, fontSize: 17 ),
              ),
            ),
          ],
        )
    );
  }
}
