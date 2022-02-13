import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {

  List<PageViewModel> page_list = [
    PageViewModel(
      title: "Fractional shares",
      body:
      "Instead of having to buy an entire share, invest any amount you want.",
    ),
    PageViewModel(
      title: "Example",
      bodyWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Test"),
        ],
      ),
      image:SafeArea(child:Image.network(
          "https://www.lalpathlabs.com/blog/wp-content/uploads/2016/11/dengue-fever.jpg",
      ))
    ),
    PageViewModel(
      title: "Let's start",
      body:
      "Example for start button",
      footer: ElevatedButton(
        onPressed: (){},
        child:Text("Lets' start")
      )
    ),
  ];

  Future<void>setFirst()async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("first", false);
  }
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: page_list,
      onDone: (){
        setFirst();
        Navigator.pushReplacementNamed(context, "/home");
      },
      done: const Text("Done",
        style: TextStyle(
          color: Colors.blue
        ),
      ),
      showSkipButton: true,
      next: const Icon(Icons.navigate_next_sharp),
      skip: const Text("Skip",
        style: TextStyle(
            color: Colors.blue
        ),
      ),
    );
  }
}
