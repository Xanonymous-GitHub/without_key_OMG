import 'package:flutter/material.dart';
import 'package:key_sharing/utils/switch_key.dart';
import 'package:key_sharing/widgets/stateful_color_square.dart';
import 'package:key_sharing/widgets/stateless_color_square.dart';

final List<SwitchKey> _switchKeys = [
  SwitchKey(UniqueKey().hashCode),
  SwitchKey(UniqueKey().hashCode),
];

final class DemoSquares {
  DemoSquares()
      : _statelessSquares = [
          StatelessColorSquare(),
          StatelessColorSquare(),
        ],
        _statefulSquares = [
          StatefulColorSquare(key: _switchKeys[0]),
          StatefulColorSquare(key: _switchKeys[1]),
        ];

  final List<StatelessColorSquare> _statelessSquares;
  final List<StatefulColorSquare> _statefulSquares;

  List<StatelessColorSquare> get extractStateless {
    ensureStatelessDifferent();
    return _statelessSquares;
  }

  List<StatefulColorSquare> get extractStateful {
    ensureStatefulDifferent();
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
      regenerateStateful();
    }
  }

  void switchStatelessColor() {
    _statelessSquares.insert(0, _statelessSquares.removeLast());
  }

  void switchStatefulColor() {
    _statefulSquares.insert(0, _statefulSquares.removeLast());
  }

  void enableStatefulKey() {
    for (int i = 0; i < _statefulSquares.length; i++) {
      _switchKeys[i].enableKeyProvide();
    }
  }

  void disableStatefulKey() {
    for (int i = 0; i < _statefulSquares.length; i++) {
      _switchKeys[i].disableKeyProvide();
    }
  }
}
