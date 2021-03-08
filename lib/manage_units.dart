//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:waka/add_unit.dart';

class ManageUnits extends StatefulWidget {
  @override
  _ManageUnitsState createState() => _ManageUnitsState();
}

class _ManageUnitsState extends State<ManageUnits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Manage Units")),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          iconSize: 25.0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: new Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: new Icon(Icons.settings), label: 'Settings'),
            BottomNavigationBarItem(
                icon: new Icon(Icons.person), label: 'Account')
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /*SizedBox(
                  height: 20,
                ),*/
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddUnit()),
                    );
                  },
                  child: Text('Add Unit'),
                ),
              ],
            ),
            Container(
              width: 340,
              height: 300,
              color: Colors.white60,
            ),
          ]),
        ));
  }
}
