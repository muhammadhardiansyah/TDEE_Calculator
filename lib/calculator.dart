import 'dart:math';
import 'constants.dart';

class Calculator {
  Calculator(
      {required this.height, required this.weight, required this.gender, required this.age, required this.strActivities});

  final int height;
  final int weight;
  final Gender gender;
  final int age;
  final String strActivities;

  double getActivityLevel(){
    var lvl = 0.0;
    if (strActivities == 'Sedentary: little or no exercise'){
      lvl = 1.2;
    }
    else if (strActivities == 'Light: exercise 1-3 times/week'){
      lvl = 1.375;
    }
    else if (strActivities == 'Moderately Active: exercise 3-5 times/week'){
      lvl = 1.55;
    }
    else if (strActivities == 'Very Active: intense exercise 6-7 times/week'){
      lvl = 1.725;
    }
    else if (strActivities == 'Extra Active: very intense exercise daily, or physical job'){
      lvl = 1.9;
    }
    return lvl;
  }

  double _bmi = 0.0;

  double calculate() {
    if (gender == Gender.male){
      _bmi = 88.362;
      _bmi += 13.397 * weight;
      _bmi += 4.799 * height;
      _bmi -= 5.677 * age;
    }
    else if (gender == Gender.female){
      _bmi = 447.593;
      _bmi += 9.247 * weight;
      _bmi += 3.098 * height;
      _bmi -= 4.330 * age;
    }
    return _bmi*getActivityLevel();
  }
  String getCalculate(){
    return (calculate()).toStringAsFixed(1);
  }
  String getMildWeightLoss(){
    return (calculate() * 0.91).toStringAsFixed(1);
  }
  String getWeightLoss(){
    return (calculate() * 0.81).toStringAsFixed(1);
  }
  String getExtremeWeightLoss(){
    return (calculate() * 0.63).toStringAsFixed(1);
  }
  String getMildWeightGain(){
    return (calculate() * 1.09).toStringAsFixed(1);
  }
  String getWeightGain(){
    return (calculate() * 1.19).toStringAsFixed(1);
  }
  String getFastWeightGain(){
    return (calculate() * 1.37).toStringAsFixed(1);
  }
}
