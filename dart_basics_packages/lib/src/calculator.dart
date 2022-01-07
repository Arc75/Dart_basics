import 'package:dart_basics_packages/src/helper.dart';

class Calculator {
  num gcd(num a, num b) {
    return b == 0 ? a : gcd(b, a % b);
  }

  num lcm(num a, num b) {
    return (a / gcd(a, b)) * b;
  }

  num convertToBase2(num a) {
    int number = a.round();
    return num.tryParse(number.toRadixString(2)) ?? 0;
  }

  num convertToBase10(num a) {
    var source = a.round().toString();

    if (source.contains(RegExp('[2-9]'))) {
      return 0;
    }

    var result = 0;
    for (int x = 0; x < source.length; x++) {
      var character = source[source.length - x - 1];
      result += int.parse(character) * 2.exp(x).toInt();
    }

    return result;
  }

  List<num> getNumbersFromString(String source) {
    var regex = RegExp("[0-9]");

    final result = List<num>.empty(growable: true);
    for (var match in regex.allMatches(source, 0)) {
      result.add(num.parse(match.group(0)!));
    }

    return result;
  }

  Set<int> numbersFromWords(List<String> wordsList) {
    var result = Set<int>();

    for (var word in wordsList) {
      var convertedValue = Helper.convertWordToNumber(word);

      if (convertedValue != null) {
        result.add(convertedValue);
      }
    }

    return result;
  }

  Map<String, int> wordsCounter(List<String> wordsList) {
    var result = Map<String, int>();

    for (var word in wordsList) {
      if (result.containsKey(word)) {
        result[word] = result[word]! + 1;
      } else {
        result[word] = 1;
      }
    }

    return result;
  }
}
