import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReactiveRandomColor {
  ReactiveRandomColor() : this.randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)].obs;

  late final Rx<Color> randomColor;

  Color call() => randomColor.value;

  void regenerateColor() {
    this.randomColor.value = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }
}
