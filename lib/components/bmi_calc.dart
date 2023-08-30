import 'dart:math';

class BMICALCULATOR {
  BMICALCULATOR({required this.height, required this.weight});

  final int height;
  final int weight;
  double _bmi = 0;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String feedBack() {
    if (_bmi >= 25) {
      return 'Your weight is above the normal body weight. Make exercise aand healthy diet your friend!';
    } else if (_bmi > 18.5) {
      return 'You have normal body weight . Good Job!';
    } else {
      return 'Your weight is below normal body weight. Try to eat more but sensibily!';
    }
  }
}
