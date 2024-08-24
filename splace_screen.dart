import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pikaaya/phoneno_screen.dart';
import 'package:pikaaya/main.dart';

class SplaceScreen extends StatefulWidget {
  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyPhone(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [

          Container(

            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff2d135b),
                    Color(0xffcc208e),
                    Color(0xff721424)],
                  begin: FractionalOffset(1.0, 0.2),
                  end: FractionalOffset(0.0, 1.1)),
            ),

            child: Center(
              heightFactor: 700,
              widthFactor: 700,
              child: Image.asset('assets/Images/deli.png'),

            ),



          ),

          Container(
            padding: EdgeInsets.only(left: 100, top: 130),
            child: Text(
              'Pikaaya',
              style: TextStyle(color: Colors.white, fontSize: 50,fontWeight: FontWeight.w900,fontFamily:'Regular 400'),
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: 70, top: 600),
            child: Text(
              'A Whole Grocery Store\n    at your Fingertips',
              style: TextStyle(color: Colors.white, fontSize: 22 ),
            ),
          ),
        ],
      )
    );
  }
}
