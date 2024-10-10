import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/models/gender.dart';
import 'package:bmi_calculator/components/gender_card.dart';
import 'package:bmi_calculator/components/height_sliders.dart';
import 'package:bmi_calculator/components/input_card.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int feet = 5;    // Feet component of height
  int inches = 6;  // Inches component of height
  int weight = 150; // Weight in pounds
  int age = 20;

  int get totalHeightInInches => (feet * 12) + inches;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          GenderCard(
                            gender: Gender.male,
                            selectedGender: selectedGender,
                            onTap: () {
                              setState(() {
                                selectedGender = Gender.male;
                              });
                            },
                          ),
                          GenderCard(
                            gender: Gender.female,
                            selectedGender: selectedGender,
                            onTap: () {
                              setState(() {
                                selectedGender = Gender.female;
                              });
                            },
                          ),
                        ],
                      ),
                      ReusableCard(
                        color: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'HEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  '$feet',  // Display feet
                                  style: kNumberTextStyle,
                                ),
                                const Text(
                                  'ft',
                                  style: kLabelTextStyle,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '$inches',  // Display inches
                                  style: kNumberTextStyle,
                                ),
                                const Text(
                                  'in',
                                  style: kLabelTextStyle,
                                ),
                              ],
                            ),
                            HeightSliders(
                              feet: feet,
                              inches: inches,
                              onFeetChanged: (newFeet) {
                                setState(() {
                                  feet = newFeet;
                                });
                              },
                              onInchesChanged: (newInches) {
                                setState(() {
                                  inches = newInches;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          InputCard(
                            label: 'WEIGHT',
                            value: weight,
                            unit: 'lbs',
                            onIncrement: () {
                              setState(() {
                                weight++;
                              });
                            },
                            onDecrement: () {
                              setState(() {
                                weight--;
                              });
                            },
                            onTap: () {
                              _showTextInputDialog(
                                context,
                                'Enter Weight',
                                weight.toString(),
                                (value) {
                                  setState(() {
                                    weight = int.parse(value);
                                  });
                                },
                              );
                            },
                          ),
                          InputCard(
                            label: 'AGE',
                            value: age,
                            unit: 'Years',
                            onIncrement: () {
                              setState(() {
                                age++;
                              });
                            },
                            onDecrement: () {
                              setState(() {
                                age--;
                              });
                            },
                            onTap: () {
                              _showTextInputDialog(
                                context,
                                'Enter Age',
                                age.toString(),
                                (value) {
                                  setState(() {
                                    age = int.parse(value);
                                  });
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              BottomButton(
                buttonTitle: 'CALCULATE',
                onTap: () {
                  CalculatorBrain calc = CalculatorBrain(
                    height: totalHeightInInches,  // Use total height in inches
                    weight: weight,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  // Show a dialog with a text input for manual entry
  void _showTextInputDialog(
      BuildContext context, String title, String initialValue, Function(String) onSubmitted) {
    final TextEditingController controller = TextEditingController();
    controller.text = initialValue;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "Enter value",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();  // Close dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onSubmitted(controller.text);  // Pass value to callback
                Navigator.of(context).pop();  // Close dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}