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
