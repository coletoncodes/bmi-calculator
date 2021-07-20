import 'package:flutter/material.dart';

import 'constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color, this.cardChild, this.onPress});

  final Color color;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}

class HeightRow extends StatelessWidget {
  const HeightRow({
    Key key,
    @required this.height,
  }) : super(key: key);

  final int height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        Text(
          height.toString(),
          style: kLargeLabelTextStyle,
        ),
        SizedBox(
          width: 5.0,
        ),
        Text(
          'IN',
          style: kLabelTextStyle,
        ),
      ],
    );
  }

  
}
