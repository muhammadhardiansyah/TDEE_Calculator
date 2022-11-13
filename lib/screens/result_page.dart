import 'package:flutter/material.dart';
import 'package:tdee_calculator/components/custom_card.dart';
import 'package:tdee_calculator/constants.dart';
import 'package:tdee_calculator/components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {required this.tdee,
      required this.mildLoss,
      required this.extremeLoss,
      required this.weightLoss,
      required this.mildGain,
      required this.weightGain,
      required this.fastGain});

  final String tdee;
  final String mildLoss;
  final String weightLoss;
  final String extremeLoss;
  final String mildGain;
  final String weightGain;
  final String fastGain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TDEE CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Maintenance Calories',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    tdee,
                    style: bmiTextStyle,
                  ),
                  const Text(
                    "calories per day",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    (int.parse(tdee) * 7).toString(),
                    style: bmiTextStyle,
                  ),
                  const Text(
                    "calories per week",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
