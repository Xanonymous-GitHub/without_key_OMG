import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_sharing/pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      home: HomePage(),
    ),
  );
}
