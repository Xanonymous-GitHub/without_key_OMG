import 'package:flutter/material.dart';
import 'package:key_sharing/widgets/color_square.dart';

class DemoSquares {
  DemoSquares()
      : this.leftSquare = ColorSquare(),
        this.rightSquare = ColorSquare();

  final ColorSquare leftSquare;
  final ColorSquare rightSquare;

  void regenerate() {
    leftSquare.regenerateColor();
    rightSquare.regenerateColor();
  }

  void ensureDifferent() {
    while (leftSquare.color == rightSquare.color) {
      regenerate();
    }
  }

  List<ColorSquare> get extract {
    ensureDifferent();
    return [
      leftSquare,
      rightSquare,
    ];
  }
}

final DemoSquares demoSquares = DemoSquares();

class KeySubject extends StatefulWidget {
  const KeySubject({Key? key}) : super(key: key);

  @override
  _KeySubjectState createState() => _KeySubjectState();
}

class _KeySubjectState extends State<KeySubject> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: demoSquares.extract,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            demoSquares.regenerate();
          });
        },
        child: const Icon(Icons.cached),
      ),
    );
  }
}
