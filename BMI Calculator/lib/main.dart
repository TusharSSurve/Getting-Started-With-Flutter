import 'package:bmi_calculator/hw.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() => runApp(MyApp());

final Color mainHexColor = HexColor('#1C1C1C');
final Color accentHexColor = HexColor('#FCC91C');

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Center(
          child: Text(
            'BMI Calculator',
            style:
                TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
          ),
        ),
      ),
      backgroundColor: mainHexColor,
      body: HW(),
    );
  }
}
