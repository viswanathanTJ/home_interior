import 'package:flutter/material.dart';
import 'package:home_interior/Database/AdminDB.dart';
import 'package:home_interior/LoginActivity.dart';
import 'package:home_interior/RegistrationActivity.dart';
import 'package:home_interior/UserPage.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // AdminDB().prinitDB();
    // AdminDB().init();
    return MaterialApp(
      theme: ThemeData(fontFamily: 'poppins'),
      home: UserPage(),
    );
  }
}
