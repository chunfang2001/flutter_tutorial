import 'package:flutter/material.dart';
import 'package:loginsystem/model/user.dart';
import 'package:loginsystem/widget/LoginRoute.dart';
import 'package:loginsystem/widget/MainTitle.dart';
import 'package:loginsystem/widget/Button1.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = new TextEditingController();

  void submitForm (){
    if(formKey.currentState!.validate()){
      Navigator.pushReplacementNamed(context, "/home",arguments: new User(email.text));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MainTitle(title: "Login"),
          SizedBox(height: 30),
          Form(
            key:formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
              child: Column(
                children: [
                  TextFormField(
                    controller: email,
                    validator: (value){
                      if(value==null||value.isEmpty){
                        return "Please enter something";
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Email",
                      label: Text("Email"),
                    ),
                    maxLength: 50,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (value){
                      if(value==null||value.isEmpty){
                        return "Please enter something";
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Password",
                      label: Text("Password"),
                    ),
                    maxLength: 20,
                  ),
                  Button1(label:"login", submitForm: submitForm),
                  SizedBox(height: 10),
                  LoginRoute(label: "register now",route:(){
                    Navigator.pushNamed(context, "/register");
                  })
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
