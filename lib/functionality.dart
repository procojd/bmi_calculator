import 'dart:math';
import 'main.dart';

class Brain {
  Brain({required this.height, required this.weight});

  final int height;
  final int weight;
  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'underweight';
    }
  }

  String getInstruction() {
    if (_bmi >= 25) {
      return 'You have a higher body weight than normal , Try to Exercise more';
    } else if (_bmi > 18.5) {
      return 'Congrats 🥳🥳 your body weight is normal';
    } else {
      return 'You have a lower body weight than normal , Try to Eat more';
    }
  }
}
