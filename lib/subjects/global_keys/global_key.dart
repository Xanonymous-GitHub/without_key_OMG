import 'package:flutter/material.dart';

class GlobalKeySubject extends StatelessWidget {
  const GlobalKeySubject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text('global_key'),
        ),
      ),
    );
  }
}
