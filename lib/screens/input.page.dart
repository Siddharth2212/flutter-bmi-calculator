import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/bmi_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  int height = 180;
  Gender selectedGender;
  int weight = 120;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: BmiCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      label: 'Male',
                      icon: FontAwesomeIcons.mars,
                    ),
                  )),
                  Expanded(
                      child: BmiCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                        label: 'Female', icon: FontAwesomeIcons.venus),
                  )),
                ],
              ),
            ),
            Expanded(
              child: BmiCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                            child: Text(
                          'Height',
                          style: kLabelTextStyle,
                        )),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(height.toString(), style: kBoldLabelTextStyle),
                            Text('cm', style: kLabelTextStyle)
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x15EB1555),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0)),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            activeColor: Color(0xFFEB1555),
                            inactiveColor: Color(0xFF8D8E98),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.toInt();
                              });
                            },
                          ),
                        )
                      ])),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: BmiCard(
                          colour: kActiveCardColor,
                          cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Center(
                                    child: Text(
                                  'Weight',
                                  style: kLabelTextStyle,
                                )),
                                Row(
                                  textBaseline: TextBaseline.alphabetic,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(weight.toString(), style: kBoldLabelTextStyle),
                                    Text('kg', style: kLabelTextStyle)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPressed: () {
                                        setState(() {
                                          weight = weight - 1; 
                                        });
                                      }
                                    ),
                                    SizedBox(width:14),
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          weight = weight + 1; 
                                        });
                                      }
                                    ),
                                  ],
                                )
                              ]))),
                  Expanded(
                    child: BmiCard(colour: kActiveCardColor,
                    cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(child: Text('Age', style: kLabelTextStyle,)),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text(
                        age.toString(),
                        style: kBoldLabelTextStyle
                      ),
                      Text(
                        'years',
                        style: kLabelTextStyle
                      )
                    ],),
                    Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPressed: () {
                                        setState(() {
                                          age = age - 1; 
                                        });
                                      }
                                    ),
                                    SizedBox(width:14),
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          age = age + 1; 
                                        });
                                      }
                                    ),
                                  ],
                                )
                    ]
                )),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc = CalculatorBrain(
                  height: height,
                  weight: weight
                );
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getResult(),
                  );
                }));
              }
            )
          ],
        ),
      )
    );
  }
}
