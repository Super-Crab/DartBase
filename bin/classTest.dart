import 'dart:math';

class Point {
  num x;
  num y;
  final num distanceFromOrigin;

  Point(this.x, this.y) : distanceFromOrigin = sqrt(x * x + y * y);
}

void main() {
  var point = new Point(2, 3);
  print(point.x);
  print(point.y);
  print(point.distanceFromOrigin);
}
