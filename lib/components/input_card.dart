import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputCard extends StatelessWidget {
  final String label;
  final int value;
  final String? unit;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onTap;

  const InputCard({super.key, 
    required this.label,
    required this.value,
    this.unit,
    required this.onIncrement,
    required this.onDecrement,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        color: kActiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              label,
              style: kLabelTextStyle,
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                value.toString(),
                style: kNumberTextStyle,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: onDecrement),
                const SizedBox(width: 10.0),
                RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: onIncrement),
              ],
            ),
            if (unit != null)
              Text(
                unit!,
                style: kLabelTextStyle,
              )
          ],
        ),
      ),
    );
  }
}