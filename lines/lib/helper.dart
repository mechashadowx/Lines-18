import 'package:flutter/material.dart';

final blackBlue = Color(0xFF050719);
final purple = Color(0xFF1A2252);
final cyan = Color(0xFF9888A8);

final List<Pair> codeBases = [
  Pair('Google', '20,000,000,000'),
  Pair('Facebook', '62,000,000'),
  Pair('Microsoft', '50,000,000'),
  Pair('Android', '13,500,000'),
  Pair('Kernal', '12,000,000'),
  Pair('GTAV', '1,500,000'),
  Pair('Unreal Engine 4', '2,292,918'),
  Pair('Chrome', '6,700,000'),
  Pair('Minecraft', '4,815,162,342'),
  Pair('Uber', '428,685'),
  Pair('Ubuntu', '50,000,000'),
  Pair('Car Software', '100,000,000'),
  Pair('Flappy Bird', '20'),
  Pair('Car Software', '100,000,000'),
  Pair('Car Software', '100,000,000'),
];

class Pair {
  final String title;
  final String lines;
  Pair(this.title, this.lines);
}
