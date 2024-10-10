import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/models/gender.dart';

class GenderCard extends StatelessWidget {
  final Gender gender;
  final Gender? selectedGender;
  final VoidCallback onTap;

  const GenderCard({super.key, 
    required this.gender,
    required this.selectedGender,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        onPress: onTap,
        color: selectedGender == gender ? kActiveCardColor : kInactiveCardColor,
        cardChild: IconContent(
          icon: gender == Gender.male
              ? FontAwesomeIcons.mars
              : FontAwesomeIcons.venus,
          label: gender == Gender.male ? 'MALE' : 'FEMALE',
        ),
      ),
    );
  }
}