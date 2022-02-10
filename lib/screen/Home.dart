import 'package:flutter/material.dart';
import 'package:loginsystem/model/user.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Login app")
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text("${user.name}")
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              margin: EdgeInsets.all(0),
              child: Text("${user.name}"),
              decoration: BoxDecoration(
                color: Colors.blue[500]
              ),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(
                Icons.person,
              ),
              title:Text("profile")
            ),
            ListTile(
                onTap: (){
                  Navigator.pushReplacementNamed(context, "/login");
                },
                leading: Icon(
                  Icons.directions_run,
                ),
                title:Text("logout")
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: "home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
            label: 'profile'
          ),

        ],
        currentIndex: index,
        selectedItemColor: Colors.black,
        onTap: (value){
          print(value);
        },
      ),
    );
  }
}
