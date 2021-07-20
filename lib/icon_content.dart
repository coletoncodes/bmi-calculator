import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.icon, this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final cardIcon = Icon(
      icon,
      size: kIconSize,
    );

    final cardText = Text(
      label.toUpperCase().toString(),
      style: kLabelTextStyle,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cardIcon,
        kSizedBox,
        cardText,
      ],
    );
  }
}
