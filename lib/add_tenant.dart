//import 'dart:html';

import 'package:flutter/material.dart';

class AddTenant extends StatefulWidget {
  @override
  _AddTenantState createState() => _AddTenantState();
}

class _AddTenantState extends State<AddTenant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Tenant"),
        ),
        body: Container(width: 100, height: 100, color: Colors.red));
  }
}
