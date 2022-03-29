import 'package:flutter/material.dart';
import 'package:house_interior/Database/AdminDB.dart';
import 'package:house_interior/HomeActivity.dart';
import 'package:house_interior/LoginActivity.dart';
import 'package:house_interior/RegistrationActivity.dart';
import 'package:house_interior/UserPage.dart';
void main() => runApp(MainApp());
class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // AdminDB().prinitDB();
    // AdminDB().init();
    return MaterialApp(
      theme: ThemeData(fontFamily: 'poppins'),
      // home: HomeActivity("admin"),
      home: LoginActivity(),
    );
  }
}