//import 'dart:html';

import 'package:flutter/material.dart';

class ManagePayments extends StatefulWidget {
  @override
  _ManagePaymentsState createState() => _ManagePaymentsState();
}

class _ManagePaymentsState extends State<ManagePayments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Manage Payments")),
        ),
        body: Center(child: Container()));
  }
}
