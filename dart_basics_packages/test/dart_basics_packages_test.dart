import 'dart:math';
import 'package:dart_basics_packages/src/point.dart';
import 'package:dart_basics_packages/src/calculator.dart';
import 'package:dart_basics_packages/src/helper.dart';
import 'package:dart_basics_packages/src/user.dart';
import 'package:test/test.dart';

void main() {
  group('Basics tests', () {
    final calc = Calculator();

    setUp(() {});

    test('GCD test', () {
      expect(calc.gcd(15, 20), 5);
    });

    test("LCM test", () {
      expect(calc.lcm(15, 20), 60);
    });

    test("ToBase2 test", () {
      expect(calc.convertToBase2(15), 1111);
    });

    test("ToBase10 test", () {
      expect(calc.convertToBase10(1111), 15);
    });

    test("Numbers from string test", () {
      expect(calc.getNumbersFromString("sou12rce"), List<num>.from([1, 2]));
    });

    test("Words counter test", () {
      expect(calc.wordsCounter(List<String>.from(["word1", "word2", "word2"])),
          Map<String, int>.from({'word1': 1, 'word2': 2}));
    });

    test("Words to numbers test", () {
      expect(calc.numbersFromWords(List<String>.from(["one", "two", "too"])),
          Set<int>.from([1, 2]));
    });

    test("Point test", () {
      expect(Point.undefined(), Point(1, 1, 1));
      expect(Point(1, 2, 3), isNot(equals(Point(4, 5, 6))));
      expect(Point(1, 2, 3).distanceTo(Point(4, 5, 6)).toPrecision(2), 5.2);
    });

    test("Root test", () {
      expect(81.customSqrt(4).toPrecision(2), 3.0);
      expect(3.exp(4), 81);
      expect(4.15738729.toPrecision(2), 4.16);
    });

    test("User test", () {
      expect(AdminUser("waeg@wau.ru").runtimeType,
          isNot(GeneralUser("waeg@wau.ru").runtimeType));

      final manager = UserManager();

      manager.addUser(AdminUser("wegijo@yandex.ru"));
      manager.addUser(GeneralUser("wapegjpojwage@google.com"));
      expect(manager.printUsersEmails(), "yandex.ru,wapegjpojwage@google.com");
    });
  });
}
