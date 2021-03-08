//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:waka/manage_units.dart';

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
        body: Center(
            child: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            // padding: EdgeInsets.all(20.0),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Room Name",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: "Room Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Type",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: "Choose Type",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Features",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: "Add Features",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rent",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: "Rent",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Status",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: "Status",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
              Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: FlatButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ManageUnits()),
                    );
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
