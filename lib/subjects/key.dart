import 'package:flutter/material.dart';
import 'package:key_sharing/widgets/stateless_color_square.dart';

class DemoSquares {
  DemoSquares()
      : this._squares = [
          StatelessColorSquare(),
          StatelessColorSquare(),
        ];
  final List<StatelessColorSquare> _squares;

  void regenerate() {
    _squares[0].regenerateColor();
    _squares[1].regenerateColor();
  }

  void ensureDifferent() {
    while (_squares[0].color == _squares[1].color) {
      regenerate();
    }
  }

  void switchColor() {
    _squares.insert(0, _squares.removeLast());
  }

  List<StatelessColorSquare> get extract {
    ensureDifferent();
    return _squares;
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: demoSquares.extract,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      demoSquares.switchColor();
                    });
                  },
                  icon: Icon(Icons.compare_arrows),
                  label: Text('Switch Color'),
                )
              ],
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
