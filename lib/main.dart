import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:waka/LoginPage.dart';
//import 'package:waka/custom_color.dart';

void main() {
  runApp(WakaHome());
}

class WakaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waka',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
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
            style: TextStyle(color: Colors.purple[900], fontSize: 125),
          ),
          Center(
            child: FlatButton(
              child: Text('Get started',
                  style: TextStyle(
                    color: Colors.purple[900],
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
