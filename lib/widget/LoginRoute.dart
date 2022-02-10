import 'package:flutter/material.dart';

class LoginRoute extends StatelessWidget {
  const LoginRoute({required this.label, required this.route,Key? key}) : super(key: key);

  final Function route;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: (){
        route();
      },
      child: Text("$label",
          style: TextStyle(
            color: Colors.blue[700],
            decoration:  TextDecoration.underline
          )
      ),
    );
  }
}
