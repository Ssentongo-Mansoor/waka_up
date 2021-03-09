//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:waka/add_payment.dart';

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
        body: ListView(padding: EdgeInsets.zero, children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddPayment()),
                  );
                },
                child: Text('Add Payment'),
              ),
            ],
          ),
          Container(
            width: 340,
            height: 300,
            color: Colors.white,
            child: Center(child: Text("No entries Yet")),
          ),
        ]));
  }
}
