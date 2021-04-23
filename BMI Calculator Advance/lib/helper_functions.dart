import 'dart:math';

List<String> getResult(int height, int weight) {
  double bmi = weight / pow(height / 100, 2);
  if (bmi >= 25)
    return [
      bmi.toStringAsFixed(1),
      'Over Weight',
      'You have a higher weight than normal.'
    ];
  else if (bmi >= 18.5)
    return [
      bmi.toStringAsFixed(1),
      'Normal Weight',
      'You have a normal weight.'
    ];
  else if (bmi < 18.5)
    return [
      bmi.toStringAsFixed(1),
      'Under Weight',
      'You have a lower weight than normal'
    ];
}
