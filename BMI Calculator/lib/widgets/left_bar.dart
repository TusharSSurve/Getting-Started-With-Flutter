import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final Color mainHexColor = HexColor('#1C1C1C');
final Color accentHexColor = HexColor('#FCC91C');

class LeftBar extends StatelessWidget {
  final double barWidth;
  LeftBar(this.barWidth);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              color: accentHexColor),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.end,
    );
  }
}
