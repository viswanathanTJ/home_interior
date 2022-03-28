import 'package:flutter/material.dart';
import 'package:home_interior/LoginActivity.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'poppins'),
      home: LoginActivity(),
    );
  }
}
