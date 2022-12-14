import 'constants.dart';
import 'package:intl/intl.dart';

class Calculator {
  Calculator(
      {required this.height,
      required this.weight,
      required this.gender,
      required this.age,
      required this.strActivities});

  final int height;
  final int weight;
  final Gender gender;
  final int age;
  final String strActivities;
  var formatter = NumberFormat.decimalPattern('id');

  double getActivityLevel() {
    var lvl = 0.0;
    if (strActivities == 'Sedentary: little or no exercise') {
      lvl = 1.2;
    } else if (strActivities == 'Light: exercise 1-3 times/week') {
      lvl = 1.375;
    } else if (strActivities == 'Moderately Active: exercise 3-5 times/week') {
      lvl = 1.55;
    } else if (strActivities ==
        'Very Active: intense exercise 6-7 times/week') {
      lvl = 1.725;
    } else if (strActivities ==
        'Extra Active: very intense exercise daily, or physical job') {
      lvl = 1.9;
    }
    return lvl;
  }

  double _bmi = 0.0;

  double calculate() {
    double tdee = 0;
    if (gender == Gender.male) {
      _bmi = 5;
      _bmi += 9.99 * weight;
      _bmi += 6.25 * height;
      _bmi -= 4.92 * age;
      tdee = _bmi.floor() * getActivityLevel().floorToDouble();
    } else if (gender == Gender.female) {
      _bmi += 10 * weight;
      _bmi += 6.25 * height;
      _bmi -= 5 * age;
      _bmi -= 161;
      tdee = _bmi * getActivityLevel();
    }
    return tdee;
  }

  String getCalculate() {
    return formatter.format(calculate());
  }

  String getCalculateWeek() {
    return formatter.format(calculate() * 7);
  }
}
