//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:async/async.dart';

class ViewUnits extends StatefulWidget {
  @override
  _ViewUnitsState createState() => _ViewUnitsState();
}

class _ViewUnitsState extends State<ViewUnits> {
  final AsyncMemoizer _unitsListMemoizer = AsyncMemoizer();
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
                  'Unit ID',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                  label: Text(
                'Unit Name',
                style: TextStyle(fontStyle: FontStyle.italic),
              )),
              DataColumn(
                  label: Text(
                'Type',
                style: TextStyle(fontStyle: FontStyle.italic),
              )),
              DataColumn(
                  label: Text(
                'Rent',
                style: TextStyle(fontStyle: FontStyle.italic),
              )),
              DataColumn(
                  label: Text(
                'Status',
                style: TextStyle(fontStyle: FontStyle.italic),
              )),
            ],
            rows: const <DataRow>[
              DataRow(cells: <DataCell>[
                DataCell(Text('13')),
                DataCell(Text('T178')),
                DataCell(Text('commercial')),
                DataCell(Text('50000')),
                DataCell(Text('Occupied')),
              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text('14')),
                DataCell(Text('	Room Z')),
                DataCell(Text('commercial')),
                DataCell(Text('20000')),
                DataCell(Text('Occupied')),
              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text('15')),
                DataCell(Text('T178')),
                DataCell(Text('residential')),
                DataCell(Text('60000')),
                DataCell(Text('Vacant')),
              ])
            ],
          ),
        ));
  }
}
