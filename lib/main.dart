import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:waka/LoginPage.dart';
//import 'package:waka/building_managers_dashboard.dart';
//import 'package:waka/add_tenant.dart';

void main() {
  runApp(MaterialApp(
    title: 'Waka',
    theme: ThemeData(
      primarySwatch: Colors.red,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Center(child: Text('Welcome to Waka')),
      ),*/
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Waka",
            style: TextStyle(color: Colors.red, fontSize: 125),
          ),
          Center(
            child: FlatButton(
              child: Text('Get started',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    decoration: TextDecoration.underline,
                  )),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginRoute()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
