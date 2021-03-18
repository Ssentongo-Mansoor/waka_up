//import 'dart:html';

import 'package:flutter/material.dart';

class ViewPayments extends StatefulWidget {
  @override
  _ViewPaymentsState createState() => _ViewPaymentsState();
}

class _ViewPaymentsState extends State<ViewPayments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("View Payments")),
        ),
        body: Container());
  }
}
