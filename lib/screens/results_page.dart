import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bmi_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: 
            Container(
              padding: EdgeInsets.all(14.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your result', style: kTitleTextStyle)
              )
          ),
          Expanded(
            flex: 5,
            child: BmiCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText, style: kResultTitleTextStyle),
                  Text(bmiResult, style: kBMITextStyle),
                  Text(interpretation, style: kBodyTextStyle, textAlign: TextAlign.center,)
                ],
              ),
            )
          ),
          BottomButton(
              buttonTitle: 'RECALCULATE',
              onTap: () {
                Navigator.pop(context);
              }
            )
      ],)
    );
  }
}