import 'dart:async';
import 'dart:math';

// create a simple future function that calaculates the area of a circle with a delay of 1 min
Future<double> AreaOfCircle(double radius) async {
  await Future.delayed(Duration(minutes: 1));
  double area = pi * radius * radius;
  return (area);
}

void main() async {
  double radius = 5.0;
  print('calculating the area..... wait for 1 minute');
  double area = await AreaOfCircle(radius);
  print(area);
}
