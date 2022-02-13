import 'package:flutter/material.dart';
import 'package:intro_app/screen/Home.dart';
import 'package:intro_app/screen/Intro.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/splash",
      routes: {
        "/home":(context)=>Home(),
        "/splash":(context)=>Splash()
      },
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future<bool> getFirst() async{
    await Future.delayed(Duration(seconds: 1),(){});
    final prefs = await SharedPreferences.getInstance();
    final bool first = await prefs.getBool('first')??true;
    return first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<bool>(
        future: getFirst(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            if(snapshot.data == false){
              return Home();
            }else{
              return Intro();
            }
          }else{
              return Center(
                child: Icon(Icons.home,size: 100)
              );
          }
        },
      )
    );
  }
}



