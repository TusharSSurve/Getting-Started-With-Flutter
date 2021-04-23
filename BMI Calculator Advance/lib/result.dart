import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Result extends StatelessWidget {
  final Color mainHexColor = HexColor('#1C1C1C');
  final Color accentHexColor = HexColor('#FCC91C');
  final Color cardHexColor = HexColor('#292929');
  @override
  Widget build(BuildContext context) {
    final Map<String, Object> Data = ModalRoute.of(context).settings.arguments;
    double width = MediaQuery.of(context).size.width;
    final appBar = AppBar(
      backgroundColor: mainHexColor,
      title: Text(
        'BMI RESULT',
        style: TextStyle(color: accentHexColor),
      ),
      centerTitle: true,
      elevation: 0,
    );
    final double height = (MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top);
    return Scaffold(
      appBar: appBar,
      body: Container(
        width: width,
        color: mainHexColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: width,
                height: height * 0.89,
                margin: EdgeInsets.all(8),
                child: Card(
                  color: cardHexColor,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Text(
                        Data['Msg'],
                        style: TextStyle(
                            fontSize: 20,
                            color: double.parse(Data['BMI']) >= 18.5 &&
                                    double.parse(Data['BMI']) < 25
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: height * 0.15,
                      ),
                      Text(
                        Data['BMI'],
                        style: TextStyle(
                            fontSize: 100,
                            color: accentHexColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: height * 0.15,
                      ),
                      FittedBox(
                        child: Text(
                          Data['Desc'],
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                )),
            // Text(Data['BMI']),
            // Text(Data['Msg']),
            // Text(Data['Desc']),
            Container(
              width: width,
              height: height * 0.083,
              child: RaisedButton(
                child: Text(
                  'GO BACK',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: accentHexColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
