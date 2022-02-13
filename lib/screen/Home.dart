import 'package:flutter/material.dart';
import 'package:intro_app/screen/Intro.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Home"),
          ),
        ),
        body:Center(
          child: Text("Welcome"),
        )
      );

  }
}
