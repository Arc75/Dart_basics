import 'package:dart_basics_packages/src/helper.dart';
import 'package:test/test.dart';

void main() {
  group('Calculator tests', () {
    final calc = Calculator();

    setUp(() {
      // Additional setup goes here.
    });

    test('GCD test', () {
      expect(calc.gcd(15, 20), 5);
    });

    test("LCM test", (){
      expect(calc.lcm(15, 20), 60);
    });

    test("ToBase2 test", (){
      expect(calc.convertToBase2(15), 1111);
    });

    test("ToBase10 test", (){
      expect(calc.convertToBase10(1111), 15);
    });
  });
}