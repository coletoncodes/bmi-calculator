import 'package:flutter/material.dart';

//Global Variables
final labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

final iconSize = 80.0;

final sizedBox = SizedBox(
  height: 15.0,
);

class IconContent extends StatelessWidget {
  IconContent({@required this.icon, this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final cardIcon = Icon(
      icon,
      size: iconSize,
    );

    final cardText = Text(
      label.toUpperCase().toString(),
      style: labelTextStyle,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cardIcon,
        sizedBox,
        cardText,
      ],
    );
  }
}
