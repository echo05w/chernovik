import 'package:flutter_test/flutter_test.dart';

class Calculator {
  int add(int a, int b) => a + b;
}

void main() {
  final calc = Calculator();

  test('positive numbers', () {
    var result = calc.add(2, 3);
    expect(result, 5);
  });

  test('negative numbers', () {
    var result = calc.add(-2, -3);
    expect(result, -5);
  });

  test('zero number', () {
    var result = calc.add(5, 0);
    expect(result, 5);
  });

  test('mixed numbers', () {
    var result = calc.add(-5, 10);
    expect(result, 5);
  });
}
