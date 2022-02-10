import 'package:flutter/material.dart';
import 'package:loginsystem/screen/Home.dart';
import 'package:loginsystem/screen/Login.dart';
import 'package:loginsystem/screen/Register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool login = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/login",
      routes: {
        "/home":(context)=>Home(),
        "/login": (context) => Login(),
        "/register":(context)=> Register(),
      },
    );
  }
}
