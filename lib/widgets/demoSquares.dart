import 'package:key_sharing/widgets/stateful_color_square.dart';
import 'package:key_sharing/widgets/stateless_color_square.dart';

class DemoSquares {
  DemoSquares()
      : this._statelessSquares = [
          StatelessColorSquare(),
          StatelessColorSquare(),
        ],
        this._statefulSquares = [
          StatefulColorSquare(),
          StatefulColorSquare(),
        ];

  final List<StatelessColorSquare> _statelessSquares;
  final List<StatefulColorSquare> _statefulSquares;

  List<StatelessColorSquare> get extractStateless {
    ensureStatelessDifferent();
    return _statelessSquares;
  }

  List<StatefulColorSquare> get extractStateful {
    ensureStatelessDifferent();
    return _statefulSquares;
  }

  void regenerateStateless() {
    _statelessSquares[0].regenerateColor();
    _statelessSquares[1].regenerateColor();
  }

  void regenerateStateful() {
    _statefulSquares[0].regenerateColor();
    _statefulSquares[1].regenerateColor();
  }

  void ensureStatelessDifferent() {
    while (_statelessSquares[0].color == _statelessSquares[1].color) {
      regenerateStateless();
    }
  }

  void ensureStatefulDifferent() {
    while (_statefulSquares[0].color == _statefulSquares[1].color) {
      regenerateStateless();
    }
  }

  void switchStatelessColor() {
    _statelessSquares.insert(0, _statelessSquares.removeLast());
  }

  void switchStatefulColor() {
    _statefulSquares.insert(0, _statefulSquares.removeLast());
  }
}