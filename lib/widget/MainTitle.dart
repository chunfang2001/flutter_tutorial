import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.blue[800],
          ),
        )
    );
  }
}
