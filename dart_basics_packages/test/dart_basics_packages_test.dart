import 'package:dart_basics_packages/src/helper.dart';
import 'package:test/test.dart';

void main() {

  group('Calculator tests', () {
    final calc = Calculator();

    setUp(() {

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

    test("Numbers from string test", (){
      expect(calc.getNumbersFromString("sou12rce"), List<num>.from([1, 2]));
    });

    test("Words counter test", (){
      expect(calc.wordsCounter(List<String>.from(["word1","word2","word2"])), Map<String, int>.from({'word1': 1, 'word2': 2}));
    });

    test("Words to numbers test", (){
      expect(calc.numbersFromWords(List<String>.from(["one", "two", "too"])), Set<int>.from([1,2]));
    });
  });
}