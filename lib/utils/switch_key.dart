import 'package:flutter/material.dart';

final class SwitchKey<T> extends ValueKey {
  SwitchKey(this.selfValue) : super(selfValue);

  final T selfValue;

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
      return other is ValueKey<T> && other.value == value;
    }
    return true;
  }

  @override
  int get hashCode => Object.hash(runtimeType, selfValue);
}
