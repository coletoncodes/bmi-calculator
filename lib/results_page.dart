import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 50.0),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Your Result',
              style: kLargeLabelTextStyle,
            ),
            Expanded(
              child: ReusableCard(
                color: kInactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Normal',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.greenAccent[700],
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '22.1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 75.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      'You have a normal BMI. Great job!',
                      textAlign: TextAlign.center,
                      style: kLabelTextStyle,
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: GestureDetector(
                onTap: () {
                  //Go to input_page.dart
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(),
                    ),
                  );
                },
                child: BottomMenu(
                  text: 'Recalculate',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
