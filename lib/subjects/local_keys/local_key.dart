import 'package:flutter/material.dart';

class LocalKeySubject extends StatelessWidget {
  const LocalKeySubject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text('local_key'),
        ),
      ),
    );
  }
}
