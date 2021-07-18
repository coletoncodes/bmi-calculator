import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const primaryColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xffeb1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: primaryColor,
                      cardChild: Container(
                        child: Text('Test Text'),
                      ),
                      // cardChild: Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Icon(FontAwesomeIcons.mars, size: 80.0),
                      //     SizedBox(
                      //       height: 15.0,
                      //     ),
                      //     Text(
                      //       'MALE',
                      //       style: TextStyle(
                      //         fontSize: 18.0,
                      //         color: Color(0xFF8D8E98),
                      //       ),
                      //     ),
                      // ],
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(color: primaryColor),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(color: primaryColor),
                  ),
                  Expanded(
                    child: ReusableCard(color: primaryColor),
                  ),
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color, this.cardChild});

  final Color color;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
