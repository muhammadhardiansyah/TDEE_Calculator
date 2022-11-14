import 'package:flutter/material.dart';
import 'package:tdee_calculator/components/custom_card.dart';
import 'package:tdee_calculator/components/icon_card.dart';
import 'package:tdee_calculator/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tdee_calculator/components/round_icon_button.dart';
import 'package:tdee_calculator/components/bottom_button.dart';
import 'package:tdee_calculator/calculator.dart';
import 'package:tdee_calculator/screens/result_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  var height = 130;
  var weight = 40;
  var age = 18;
  String selectedActivities = 'Sedentary: little or no exercise';
  var activities = [
    'Sedentary: little or no exercise',
    'Light: exercise 1-3 times/week',
    'Moderately Active: exercise 3-5 times/week',
    'Very Active: intense exercise 6-7 times/week',
    'Extra Active: very intense exercise daily, or physical job'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.all(10),
          child: const Text(
            "TDEE Calculator",
            style: titleTextStyle,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomCard(
                      color: selectedGender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconCard(
                        cardIcon: Icons.male,
                        caption: "Male",
                      ),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      color: selectedGender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconCard(
                        cardIcon: Icons.female,
                        caption: "Female",
                      ),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomCard(
                color: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: labelTextStyle,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: numberTextStyle,
                          ),
                          const Text(
                            ' cm',
                            style: labelTextStyle,
                          ),
                        ],
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double value) {
                          setState(() {
                            height = value.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomCard(
                            color: activeCardColor,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'WEIGHT',
                                  style: labelTextStyle,
                                ),
                                Text(
                                  weight.toString(),
                                  style: numberTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      icon: Icons.minimize,
                                      onPressed: () {
                                        setState(() {
                                          if (weight >= 30) {
                                            weight--;
                                          }
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomCard(
                            color: activeCardColor,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'AGE',
                                  style: labelTextStyle,
                                ),
                                Text(
                                  age.toString(),
                                  style: numberTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      icon: Icons.minimize,
                                      onPressed: () {
                                        setState(() {
                                          if (age >= 0) {
                                            age--;
                                          }
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomCard(
                color: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Activity',
                      style: labelTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        // Initial Value
                        isExpanded: true,
                        menuMaxHeight: 145.0,
                        borderRadius: BorderRadius.circular(10.0),
                        dropdownColor: Color(0xFF14202E),
                        value: selectedActivities,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items: activities.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedActivities = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                Calculator cal = Calculator(
                    height: height,
                    weight: weight,
                    gender: selectedGender,
                    age: age,
                    strActivities: selectedActivities);
                String tdee = cal.getCalculate();
                String tdeeWeek = cal.getCalculateWeek();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      tdee: tdee,
                      tdeeWeek: tdeeWeek,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
