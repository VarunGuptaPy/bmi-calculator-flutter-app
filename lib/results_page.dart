import 'package:flutter/material.dart';
import 'constants.dart';
import 'Reusable_card.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
  ResultPage(this.bmi);
  final double bmi;
  String obesitycalc(int num) {
    if (num == 1) {
      if (bmi < 18.5) {
        return 'underweight';
      } else if (bmi > 18.5 && bmi <= 25) {
        return "ideal";
      } else if (bmi > 25 && bmi <= 30) {
        return 'overweight';
      } else {
        return 'obesity';
      }
    } else if (num == 2) {
      if (bmi < 18.5) {
        return 'You should eat a lot because you are underweight';
      } else if (bmi > 18.5 && bmi <= 25) {
        return "You should live a normal life because you are ideal";
      } else if (bmi > 25 && bmi <= 30) {
        return 'You should need to do workout in gym because you are overweight';
      } else {
        return 'You should need to do a lot of workout in gym because of your obesity';
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableWidget(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      obesitycalc(1),
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: TextStyle(
                          fontSize: 100.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      obesitycalc(2),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22.0),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              },
              child: Container(
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
                    style: kLargeButtonTextStyle,
                  ),
                ),
                color: kBottomContainerColor,
                padding: EdgeInsets.only(bottom: 20.0),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: kBottomContainerHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
