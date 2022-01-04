import 'package:dart_basics_packages/dart_basics_packages.dart';
import 'package:dart_basics_packages/src/helper.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final calc = Calculator();

    setUp(() {
      // Additional setup goes here.
    });

    test('GCD test', () {
      expect(calc.gcd(15, 20), 5);
    });
  });
}
