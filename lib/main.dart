import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waka',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome to Waka")),
      body: Text("Waka"),
    );
  }
}

class WakaLogo extends StatefulWidget {
  @override
  _WakaLogoState createState() => _WakaLogoState();
}

class _WakaLogoState extends State<WakaLogo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
