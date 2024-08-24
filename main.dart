import 'package:flutter/material.dart';
import 'package:pikaaya/phoneno_screen.dart';
import 'package:pikaaya/splace_screen.dart';

void main() {
  runApp(  Pikaaya());

}
 class Pikaaya extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pikaaya App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primarySwatch:Colors.blue
      ),
      home: SplaceScreen(),
    );
  }
 }