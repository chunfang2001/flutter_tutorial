import 'package:flutter/material.dart';
import 'package:loginsystem/widget/LoginRoute.dart';
import 'package:loginsystem/widget/MainTitle.dart';
import 'package:loginsystem/widget/Button1.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();

  void submitForm (){
    if(formKey.currentState!.validate()){
      Navigator.pushReplacementNamed(context, "/home");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MainTitle(title: "Register"),
          SizedBox(height: 30),
          Form(
              key:formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                child: Column(
                  children: [
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
                    Button1(label:"register", submitForm: submitForm),
                    SizedBox(height: 10),
                    LoginRoute(label: "login now",route:(){
                      Navigator.pushNamed(context, "/login");
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
