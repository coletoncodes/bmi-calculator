import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 60;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'male',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'female',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),

                    // Center Slider saved as widget with a constant defined height.
                    HeightRow(height: height),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0XFF8D8E98),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                        thumbColor: Color(kSecondaryColor),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),

                      // The custom slider used for this project saved as a widget in reusable_card.dart
                      child: heightSlider(),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(color: kActiveCardColor),
                  ),
                  Expanded(
                    child: ReusableCard(color: kActiveCardColor),
                  ),
                ],
              ),
            ),
            Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          ],
        ),
      ),
    );
  }

  Slider heightSlider() {
    return Slider(
      value: height.toDouble(),
      min: 30.0,
      max: 80.0,
      divisions: null,
      activeColor: Color(0xFFEB1555),
      inactiveColor: Color(0xff8d8e98),
      onChanged: (double newValue) {
        setState(() {
          height = newValue.round();
        });
      },
    );
  }
}
