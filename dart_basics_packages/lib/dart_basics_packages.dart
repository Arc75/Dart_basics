library dart_basics_packages;

import 'dart:math';
import 'package:powers/powers.dart';

import 'package:dart_basics_packages/src/helper.dart';
import 'package:dart_basics_packages/src/calculator.dart';
import 'package:dart_basics_packages/src/point.dart';

void main() {
  final calc = Calculator();

  var gcd = calc.gcd(12, 30);
  var lcm = calc.lcm(12, 30);
  var base2 = calc.convertToBase2(120.0);
  var base10 = calc.convertToBase10(base2);
  var numbers = calc.getNumbersFromString("waejgoaew7578w9af78ewauf9887v8d89");
  var wordsMap = calc.wordsCounter(List<String>.from(["word1", "word2", "word2", "word3"]));
  var numbersSet = calc.numbersFromWords(List<String>.from(["one", "four", "dog", "floor"]));
  var distance = Point(1, 2, 3).distanceTo(Point(4, 5, 6));

  var lib = 81.root(4);
  var custom = 81.customSqrt(4).toPrecision(2);

  print(gcd);
  print(lcm);
  print(base2);
  print(base10);
  print(numbers.join(','));
  wordsMap.forEach((key, value) {print("$key - $value"); });
  print(numbersSet.join(','));
  print(distance.toPrecision(2));
  print("$lib $custom");
}
