import 'dart:math';

class Helper {
  static int? convertWordToNumber(String word) {
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

extension Ex on num {
  num toPrecision(int n) {
    
    num fac = pow(10, n);
    return (this * fac).round() / fac;
  }

  num customSqrt(int n) {
    if (this == null || this == 0) throw FormatException("Невозможно определить корень от указанного числа");
    if (n <= 0) throw FormatException("Невозможно определить корень от $n степени");
    if (n == 1) return this;  
    if (n > 10) throw FormatException("Числа больше 10 это миф");
    
    double result = 0;
    
    try {
      double root = this / n;
      double eps = 0.001;
      double delX = 100;

      while (delX > eps) {
        result = (1 / n) * ((n - 1) * root + this / root.exp(n - 1));
        delX = (result - root).abs();
        root = result;
      }
    } catch (ex) {
      throw FormatException("При вычислении корня $n степени произошла ошибка: $ex");
    }

    return result;
  }

  num exp(int n) {
    if (n == 0) return 1;
    if (n == 1) return this;
    var r = (this * this).exp(n ~/ 2);
    if (n % 2 == 1) r *= this;
    return r;
  }
}
