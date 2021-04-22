import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color mainHexColor = HexColor('#1C1C1C');
  final Color cardHexColor = HexColor('#292929');
  final Color accentHexColor = HexColor('#FCC91C');
  Gender selectedGender;
  double person_height = 195;
  int weight = 60, age = 22;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 1,
      title: Text(
        'BMI',
        style: TextStyle(color: accentHexColor),
      ),
      backgroundColor: mainHexColor,
    );

    final double height = (MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top);
    final double width = MediaQuery.of(context).size.width;
    final double gender_height = height * 0.3;

    return Scaffold(
      appBar: appBar,
      body: Container(
        height: height,
        color: mainHexColor,
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: Container(
                    width: width / 2,
                    height: gender_height,
                    child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: selectedGender != Gender.male
                            ? cardHexColor
                            : Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        margin: EdgeInsets.fromLTRB(8, 4, 4, 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: gender_height * 0.1,
                            ),
                            FaIcon(
                              FontAwesomeIcons.male,
                              size: 90,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              height: gender_height * 0.05,
                            ),
                            Text(
                              'MALE',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            )
                          ],
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: Container(
                    width: width / 2,
                    height: gender_height,
                    child: Card(
                      color: selectedGender != Gender.female
                          ? cardHexColor
                          : Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      margin: EdgeInsets.fromLTRB(4, 4, 8, 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: gender_height * 0.1,
                          ),
                          FaIcon(
                            FontAwesomeIcons.female,
                            size: 90,
                            color: Colors.pink,
                          ),
                          SizedBox(
                            height: gender_height * 0.05,
                          ),
                          Text(
                            'FEMALE',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: width,
              height: height * 0.3,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: gender_height * 0.1,
                    ),
                    Text(
                      'HEIGHT',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(
                      height: gender_height * 0.04,
                    ),
                    Text(
                      person_height.toStringAsFixed(0),
                      style: TextStyle(
                          color: accentHexColor,
                          fontSize: 55,
                          fontWeight: FontWeight.w600),
                    ),
                    SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            overlayColor: accentHexColor,
                            inactiveTrackColor: Colors.grey,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 16.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 25.0),
                            thumbColor: accentHexColor),
                        child: Slider(
                          value: person_height.toDouble(),
                          label: person_height.round().toString(),
                          onChanged: (v) {
                            setState(() {
                              person_height = v;
                            });
                          },
                          min: 100.0,
                          max: 250.0,
                        ))
                  ],
                ),
                color: cardHexColor,
                margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            Container(
                width: width,
                height: height * 0.28,
                child: Row(
                  children: [
                    Container(
                      width: width / 2,
                      height: height * 0.28,
                      child: Card(
                        color: cardHexColor,
                        margin: EdgeInsets.fromLTRB(8, 4, 4, 4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    Container(
                      width: width / 2,
                      height: height * 0.28,
                      child: Card(
                        color: cardHexColor,
                        margin: EdgeInsets.fromLTRB(4, 4, 8, 4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ],
                )),
            Container(
              width: width,
              height: height * 0.1,
              margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: RaisedButton(
                onPressed: () {},
                color: accentHexColor,
                child: Center(
                  child: Text('CALCULATE BMI', style: TextStyle(fontSize: 20)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
