class Calculator{

  num gcd(num a, num b){
    return b == 0 ? a : gcd(b, a % b);
  }

  num lcm(num a, num b){
    return (a / gcd(a, b)) * b;
  }

  num convertToBase2(num a){
    int number = a.round();    
    return num.tryParse(number.toRadixString(2)) ?? 0;
  }  

  num convertToBase10(num a){
    var source = a.round().toString();

    if (source.contains(RegExp('[2-9]'))) {
      return 0;
    }

    var result = 0;
    for (int x = 0; x < source.length; x++){
      var character = source[source.length - x - 1];
      result += int.parse(character) * exp(2, x);
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
}