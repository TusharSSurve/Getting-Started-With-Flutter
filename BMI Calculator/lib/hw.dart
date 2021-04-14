import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HW extends StatefulWidget {
  @override
  _HWState createState() => _HWState();
}

final Color mainHexColor = HexColor('#1C1C1C');
final Color accentHexColor = HexColor('#FCC91C');

class _HWState extends State<HW> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmiResult = 0;
  String textResult = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 100,
                child: TextField(
                  controller: heightController,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Height',
                      hintStyle: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8))),
                ),
              ),
              Container(
                width: 80,
                child: TextField(
                  controller: weightController,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Mass',
                      hintStyle: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8))),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              double h = double.parse(heightController.text);
              double w = double.parse(weightController.text);
              setState(() {
                bmiResult = w / (h * h);
                if (bmiResult > 25) {
                  textResult = "Over Weight";
                } else if (bmiResult >= 18.5 && bmiResult <= 25) {
                  textResult = "Normal Weight";
                } else
                  textResult = 'Under Weight';
              });
            },
            child: Container(
              child: Text(
                'Calculate',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: accentHexColor),
              ),
            ),
          ),
          Container(
            child: Text(
              bmiResult.toStringAsFixed(2),
              style: TextStyle(fontSize: 90, color: accentHexColor),
            ),
          ),
          Visibility(
            visible: textResult.isNotEmpty,
            child: Container(
              child: Text(
                textResult,
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w400,
                    color: accentHexColor),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          LeftBar(40),
          SizedBox(
            height: 10,
          ),
          LeftBar(70),
          SizedBox(
            height: 10,
          ),
          LeftBar(40),
          SizedBox(
            height: 10,
          ),
          RightBar(40),
          SizedBox(
            height: 40,
          ),
          RightBar(40),
        ],
      ),
    );
  }
}
