import 'package:flutter/material.dart';

class KeySubject extends StatelessWidget {
  const KeySubject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text('key'),
        ),
      ),
    );
  }
}
