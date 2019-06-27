import 'dart:math';

class Point {
  num x, y;

  Point(this.x, this.y);

  num distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}

void main() {
  var p = Point(2,2);
  p.y = 3;
  print(p.y);

  num distance = p.distanceTo(Point(4, 4));

  print(distance);
  
}