import 'package:flutter/material.dart';
import 'package:key_sharing/widgets/color_square.dart';

class KeySubject extends StatelessWidget {
  const KeySubject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: KeyDemo(),
          ),
        ),
      ),
    );
  }
}

class KeyDemo extends StatefulWidget {
  const KeyDemo({Key? key}) : super(key: key);

  @override
  _KeyDemoState createState() => _KeyDemoState();
}

class _KeyDemoState extends State<KeyDemo> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<ColorSquare> demos = (() {
    final leftSquare = ColorSquare();
    final rightSquare = ColorSquare();

    while (leftSquare.color == rightSquare.color) {
      leftSquare.regenerateColor();
      rightSquare.regenerateColor();
    }

    return [
      leftSquare,
      rightSquare,
    ];
  })();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: demos,
    );
  }
}
