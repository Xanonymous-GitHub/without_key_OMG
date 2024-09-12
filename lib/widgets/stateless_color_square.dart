import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_sharing/constants.dart';
import 'package:key_sharing/utils/reactive_random_color.dart';

@immutable
final class StatelessColorSquare extends StatelessWidget {
  final ReactiveRandomColor _randomColor = ReactiveRandomColor();

  StatelessColorSquare({super.key});

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
