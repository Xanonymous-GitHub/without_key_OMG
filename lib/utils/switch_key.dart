import 'package:flutter/material.dart';

class SwitchKey<T> extends ValueKey {
  SwitchKey() : super(UniqueKey().hashCode);

  final List<bool> isKeyProvide = [false];

  void disableKeyProvide() {
    isKeyProvide[0] = false;
  }

  void enableKeyProvide() {
    isKeyProvide[0] = true;
  }

  @override
  bool operator ==(Object other) {
    if (isKeyProvide[0]) {
      if (other.runtimeType != runtimeType) return false;
      return other is ValueKey<T> && other.value == super.value;
    }
    return true;
  }

  @override
  int get hashCode => hashValues(runtimeType, super.value);
}

class SwitchGlobalKey<T extends State<StatefulWidget>> extends SwitchKey {
  SwitchGlobalKey()
      : this._globalKey = GlobalKey<T>(),
        super();

  final GlobalKey<T> _globalKey;

  BuildContext? get currentContext => _globalKey.currentContext;

  Widget? get currentWidget => _globalKey.currentWidget;

  T? get currentState => _globalKey.currentState;
}
