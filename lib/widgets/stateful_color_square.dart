import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_sharing/constants.dart';
import 'package:key_sharing/utils/reactive_random_color.dart';

class StatefulColorSquare extends StatefulWidget {
  StatefulColorSquare({Key? key}) : super(key: key);

  final _StatefulColorSquareState state = _StatefulColorSquareState();

  Color get color => state.color;

  void regenerateColor() => state.regenerateColor();

  @override
  _StatefulColorSquareState createState() => state;
}

class _StatefulColorSquareState extends State<StatefulColorSquare> {
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
