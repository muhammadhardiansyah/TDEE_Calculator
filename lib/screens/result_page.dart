import 'package:flutter/material.dart';
import 'package:tdee_calculator/components/custom_card.dart';
import 'package:tdee_calculator/constants.dart';
import 'package:tdee_calculator/components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {required this.tdee, required this.mildLoss, required this.extremeLoss, required this.weightLoss, required this.mildGain, required this.weightGain, required this.fastGain});

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
                'Your Result',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
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
                  Text(
                    mildLoss,
                    style: resultTextStyle,
                  ),
                  Text(
                    weightLoss,
                    style: resultTextStyle,
                  ),
                  Text(
                    extremeLoss,
                    style: resultTextStyle,
                  ),
                  Text(
                    mildGain,
                    style: resultTextStyle,
                  ),
                  Text(
                    weightGain,
                    style: resultTextStyle,
                  ),
                  Text(
                    fastGain,
                    style: resultTextStyle,
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
