import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final Color mainHexColor = HexColor('#1C1C1C');
final Color accentHexColor = HexColor('#FCC91C');

class RightBar extends StatelessWidget {
  final double barWidth;
  RightBar(this.barWidth);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: accentHexColor),
        )
      ],
    );
  }
}
