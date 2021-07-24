import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

const double squareSize = 100;

class ColorSquare extends StatelessWidget {
  final ReactiveRandomColor _randomColor = ReactiveRandomColor();

  Color get color => _randomColor();

  void regenerateColor() => _randomColor.regenerateColor();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: squareSize,
        height: squareSize,
        color: color,
      ),
    );
  }
}

class ReactiveRandomColor {
  ReactiveRandomColor() : this.randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)].obs;

  late final Rx<Color> randomColor;

  Color call() => randomColor.value;

  void regenerateColor() {
    this.randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)].obs;
  }
}
