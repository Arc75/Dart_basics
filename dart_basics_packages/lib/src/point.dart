import 'dart:math';
import 'package:dart_basics_packages/src/helper.dart';

class Point {
  int x = 0;
  int y = 0;
  int z = 0;

  static final Map<String, Point> _cache = <String, Point>{};

  Point.undefined(){
    x = 1;
    y = 1;
    z = 1;

    var key = "$x$y$z";
    _cache[key] = this;
  }

  Point._internal(num xC, num yC, num zC) {
    x = xC.round();
    y = yC.round();
    z = zC.round();

    var key = "$x$y$z";
    _cache[key] = this;
  }

  factory Point(num xC, num yC, num zC) {
    var key = "${xC.round()}${yC.round()}${zC.round()}";

    if (_cache.containsKey(key)) {
      return _cache[key]!;
    } else {
      final instance = Point._internal(xC, yC, zC);
      return instance;
    }
  }

  num distanceTo(Point another) {
    var result = sqrt(pow((another.x - x), 2) + pow((another.y - y), 2) + pow((another.z - z), 2));
    return result;
  }
}
