import 'dart:math';

import 'package:flutter/material.dart';

const double squareSize = 100;

class ColorSquare extends StatelessWidget {
  final Color _randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: squareSize,
      height: squareSize,
      color: _randomColor,
    );
  }
}
