class CalculatorBrain {
  // Added the 'required' keyword to enforce that these parameters are passed in.
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  // Marking _bmi as late since it will be initialized later.
  late double _bmi;

  String calculateBMI() {
    // Ensuring _bmi gets a value when calculateBMI is called.
    _bmi = weight / (height * height) * 703;
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    // Ensure _bmi is initialized before this method is called.
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    // Ensure _bmi is initialized before this method is called.
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
