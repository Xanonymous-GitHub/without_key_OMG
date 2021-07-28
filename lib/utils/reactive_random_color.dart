import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReactiveRandomColor {
  ReactiveRandomColor() : this.randomColor = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0).obs;

  late final Rx<Color> randomColor;

  Color call() => randomColor.value;

  void regenerateColor() {
    this.randomColor.value = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
}
