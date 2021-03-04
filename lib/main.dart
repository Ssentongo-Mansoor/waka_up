import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:waka/building_managers_dashboard.dart';

void main() {
  runApp(MaterialApp(
    title: 'Waka',
    theme: ThemeData(
      primarySwatch: Colors.red,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: FirstRoute(),
    debugShowCheckedModeBanner: false,
  ));
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Welcome to Waka')),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Get started',
              style: TextStyle(color: Colors.white, fontSize: 30)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login")),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: 350.0,
          height: 400.0,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Sign in",
                  style: TextStyle(color: Colors.red, fontSize: 25),
                ),
                Text("Email"),
                TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: "Enter you email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Password"),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                TextField(
                  obscureText: true,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: "Enter you password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Go back home!'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
