library dart_basics_packages;

import 'package:dart_basics_packages/src/helper.dart';

void main() {
  var calc = Calculator();

  var result = calc.gcd(12, 30);
  print(result);
}