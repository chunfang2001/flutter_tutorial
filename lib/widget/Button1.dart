import 'package:flutter/material.dart';

class Button1 extends StatefulWidget {
  const Button1({required this.label, required this.submitForm, Key? key}) : super(key: key);

  final String label ;
  final Function submitForm;
  @override
  _Button1State createState() => _Button1State();
}

class _Button1State extends State<Button1> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue[800])
      ),
      onPressed: (){
        widget.submitForm();
      },
      child: Text("${widget.label}",
      style: TextStyle(
        fontSize: 17
      ),)
    );
  }
}
