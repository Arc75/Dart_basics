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
      result += int.parse(character) * exp(2, x);
    }

    return result;
  }

  List<num> getNumbersFromString(String source) {
    var regex = RegExp("[0-9]");

    final result = List<num>.empty(growable: true);
    for (var match in regex.allMatches(source, 0)){
      result.add(num.parse(match.group(0)!));
    }

    return result;
  }

  int exp(int x, int n) {
    if (n == 0) return 1;
    if (n == 1) return x;
    var r = exp(x * x, n ~/ 2);
    if (n % 2 == 1) r *= x;
    return r;
  }

  Map<String, int> wordsCounter(List<String> wordsList) {
    var result = Map<String, int>();

    for (var word in wordsList){
      if (result.containsKey(word)){
        result[word] = result[word]! + 1;
      }
      else{
        result[word] = 1;
      }
    }

    return result;
  }

  Set<int> numbersFromWords(List<String> wordsList){
    var result = Set<int>();

    for (var word in wordsList){
      var convertedValue = _convertWordToNumber(word);

      if (convertedValue != null){
        result.add(convertedValue);
      }        
    }

    return result;
  }

  int? _convertWordToNumber(String word) {
    switch (word.trim().toLowerCase()) {
      case "zero":
        return 0;
        case "one":
        return 1;
        case "two":
        return 2;
        case "three":
        return 3;
        case "four":
        return 4;
        case "five":
        return 5;
        case "six":
        return 6;
        case "seven":
        return 7;
        case "eight":
        return 8;
        case "nine":
        return 9;        
      default:
        return null;        
    }
  }
}  