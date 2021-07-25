import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_sharing/constants.dart';
import 'package:key_sharing/utils/reactive_random_color.dart';

class StatefulColorSquare extends StatefulWidget {
  StatefulColorSquare({Key? key}) : super(key: key);

  @override
  StatefulColorSquareState createState() => StatefulColorSquareState();
}

class StatefulColorSquareState extends State<StatefulColorSquare> {
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
