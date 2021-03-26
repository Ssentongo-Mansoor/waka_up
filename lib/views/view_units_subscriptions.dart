//import 'dart:html';

import 'package:flutter/material.dart';

class ViewUnitsSubscriptions extends StatefulWidget {
  @override
  _ViewUnitsSubscriptionsState createState() => _ViewUnitsSubscriptionsState();
}

class _ViewUnitsSubscriptionsState extends State<ViewUnitsSubscriptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("View Units")),
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
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Room ID',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                  label: Text(
                'Tenant ID',
                style: TextStyle(fontStyle: FontStyle.italic),
              )),
              DataColumn(
                  label: Text(
                'Start Date',
                style: TextStyle(fontStyle: FontStyle.italic),
              )),
              DataColumn(
                  label: Text(
                'End Date',
                style: TextStyle(fontStyle: FontStyle.italic),
              )),
              DataColumn(
                  label: Text(
                'Price',
                style: TextStyle(fontStyle: FontStyle.italic),
              )),
              DataColumn(
                  label: Text(
                'Paid',
                style: TextStyle(fontStyle: FontStyle.italic),
              )),
              DataColumn(
                  label: Text(
                'Remaining',
                style: TextStyle(fontStyle: FontStyle.italic),
              )),
              DataColumn(
                  label: Text(
                'Reference Code',
                style: TextStyle(fontStyle: FontStyle.italic),
              )),
            ],
            rows: const <DataRow>[
              DataRow(cells: <DataCell>[
                DataCell(Text('13')),
                DataCell(Text('7')),
                DataCell(Text('2021-02-18')),
                DataCell(Text('2021-02-28')),
                DataCell(Text('50000')),
                DataCell(Text('50000')),
                DataCell(Text('0')),
                DataCell(Text('602dbdc7e9696')),
              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text('13')),
                DataCell(Text('7')),
                DataCell(Text('2021-02-18')),
                DataCell(Text('2021-02-28')),
                DataCell(Text('50000')),
                DataCell(Text('50000')),
                DataCell(Text('0')),
                DataCell(Text('602dbdc7e9696')),
              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text('13')),
                DataCell(Text('7')),
                DataCell(Text('2021-02-18')),
                DataCell(Text('2021-02-28')),
                DataCell(Text('50000')),
                DataCell(Text('50000')),
                DataCell(Text('0')),
                DataCell(Text('602dbdc7e9696')),
              ]),
            ],
          ),
        ));
  }
}
