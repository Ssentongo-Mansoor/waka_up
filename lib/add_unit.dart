//import 'dart:html';

import 'package:flutter/material.dart';

class AddUnit extends StatefulWidget {
  @override
  _AddUnitState createState() => _AddUnitState();
}

class _AddUnitState extends State<AddUnit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Add a Unit")),
        ),
        body: Center(child: Container()));
  }
}
