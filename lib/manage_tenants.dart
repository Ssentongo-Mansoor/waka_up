//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:waka/add_tenant.dart';

class ManageTenants extends StatefulWidget {
  @override
  _ManageTenantsState createState() => _ManageTenantsState();
}

class _ManageTenantsState extends State<ManageTenants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Manage Tenants")),
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
        body: ListView(padding: EdgeInsets.zero, children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddTenant()),
                  );
                },
                child: Text('Add Tenant'),
              ),
            ],
          ),
          Container(
            width: 340,
            height: 300,
            color: Colors.white,
            child: Center(child: Text("No Entries Yet")),
          ),
        ]));
  }
}
