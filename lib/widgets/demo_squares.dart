import 'package:flutter/material.dart';
import 'package:key_sharing/utils/switch_key.dart';
import 'package:key_sharing/widgets/stateful_color_square.dart';
import 'package:key_sharing/widgets/stateless_color_square.dart';

final List<SwitchGlobalKey> _switchGlobalKeys = [
  SwitchGlobalKey<StatefulColorSquareState>(),
  SwitchGlobalKey<StatefulColorSquareState>(),
  SwitchGlobalKey<StatefulColorSquareState>(),
  SwitchGlobalKey<StatefulColorSquareState>(),
];

void regenerateColor(int keyIndex) {
  (_switchGlobalKeys[keyIndex] as SwitchGlobalKey<StatefulColorSquareState>)
      .currentState
      ?.regenerateColor();
}

Color? getColor(int keyIndex) {
  return (_switchGlobalKeys[keyIndex]
          as SwitchGlobalKey<StatefulColorSquareState>)
      .currentState
      ?.color;
}

final List<SwitchKey> _switchKeys = [
  SwitchKey(),
  SwitchKey(),
];

final statelessSquares = [
  StatelessColorSquare(),
  StatelessColorSquare(),
];

final statefulSquares = [
  StatefulColorSquare(key: _switchGlobalKeys[0]),
  StatefulColorSquare(key: _switchGlobalKeys[1]),
];

final statefulSquaresInPadding = [
  StatefulColorSquare(key: _switchGlobalKeys[2]..enableKeyProvide()),
  StatefulColorSquare(key: _switchGlobalKeys[3]..enableKeyProvide()),
];

final paddingWithSquares = [
  Padding(
    key: _switchKeys[0],
    padding: const EdgeInsets.all(10.0),
    child: statefulSquaresInPadding[0],
  ),
  Padding(
    key: _switchKeys[1],
    padding: const EdgeInsets.all(10.0),
    child: statefulSquaresInPadding[1],
  ),
];

class DemoSquares {
  DemoSquares()
      : this._statelessSquares = statelessSquares,
        this._statefulSquares = statefulSquares,
        this._paddingWithSquares = paddingWithSquares;

  final List<StatelessColorSquare> _statelessSquares;
  final List<StatefulColorSquare> _statefulSquares;
  final List<Padding> _paddingWithSquares;

  List<StatelessColorSquare> get extractStateless {
    ensureStatelessDifferent();
    return _statelessSquares;
  }

  List<StatefulColorSquare> get extractStateful {
    ensureStatefulDifferent();
    return _statefulSquares;
  }

  List<Padding> get extractPaddingWithSquares {
    ensureStatefulInPaddingDifferent();
    return _paddingWithSquares;
  }

  void regenerateStateless() {
    _statelessSquares[0].regenerateColor();
    _statelessSquares[1].regenerateColor();
  }

  void regenerateStateful() {
    regenerateColor(0);
    regenerateColor(1);
  }

  void regenerateStatefulInPadding() {
    regenerateColor(2);
    regenerateColor(3);
  }

  void ensureStatelessDifferent() {
    while (_statelessSquares[0].color == _statelessSquares[1].color) {
      regenerateStateless();
    }
  }

  void ensureStatefulDifferent() {
    while (getColor(0) == getColor(1)) {
      regenerateStateful();
    }
  }

  void ensureStatefulInPaddingDifferent() {
    while (getColor(2) == getColor(3)) {
      regenerateStatefulInPadding();
    }
  }

  void switchStatelessSquare() {
    _statelessSquares.insert(0, _statelessSquares.removeLast());
  }

  void switchStatefulSquare() {
    _statefulSquares.insert(0, _statefulSquares.removeLast());
  }

  void switchPaddingWithSquares() {
    _paddingWithSquares.insert(0, _paddingWithSquares.removeLast());
  }

  void enableStatefulKey() {
    for (int i = 0; i < _statefulSquares.length; i++)
      _switchKeys[i].enableKeyProvide();
  }

  void disableStatefulKey() {
    for (int i = 0; i < _statefulSquares.length; i++)
      _switchKeys[i].disableKeyProvide();
  }

  void enableStatefulInPaddingKey() {
    _switchGlobalKeys[2].enableKeyProvide();
    _switchGlobalKeys[3].enableKeyProvide();
    _switchKeys[0].disableKeyProvide();
    _switchKeys[1].disableKeyProvide();
  }

  void disableStatefulInPaddingKey() {
    _switchGlobalKeys[2].disableKeyProvide();
    _switchGlobalKeys[3].disableKeyProvide();
    _switchKeys[0].enableKeyProvide();
    _switchKeys[1].enableKeyProvide();
  }
}
