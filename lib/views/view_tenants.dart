//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:waka/views/custom_color.dart';

class ViewTenants extends StatefulWidget {
  @override
  _ViewTenantsState createState() => _ViewTenantsState();
}

class _ViewTenantsState extends State<ViewTenants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("View Tenants")),
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
                  'First Name',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Last Name',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Other Name',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Gender',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'NIN',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Room Number',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Email Address',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Phone Number',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Registration Date',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Occupation',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Company',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Guma')),
                  DataCell(Text('Amutuhaire')),
                  DataCell(Text('Mujaidu')),
                  DataCell(Text('Male')),
                  DataCell(Text('CM19647887875')),
                  DataCell(Text('RM 001')),
                  DataCell(Text('amutuhaireguma10@gmail.com')),
                  DataCell(Text('+256-767-788-657')),
                  DataCell(Text('25/09/2021')),
                  DataCell(Text('Student')),
                  DataCell(Text('Makerere University')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Guma')),
                  DataCell(Text('Amutuhaire')),
                  DataCell(Text('Mujaidu')),
                  DataCell(Text('Male')),
                  DataCell(Text('CM19647887875')),
                  DataCell(Text('RM 001')),
                  DataCell(Text('amutuhaireguma10@gmail.com')),
                  DataCell(Text('+256-767-788-657')),
                  DataCell(Text('25/09/2021')),
                  DataCell(Text('Student')),
                  DataCell(Text('Makerere University')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Guma')),
                  DataCell(Text('Amutuhaire')),
                  DataCell(Text('Mujaidu')),
                  DataCell(Text('Male')),
                  DataCell(Text('CM19647887875')),
                  DataCell(Text('RM 001')),
                  DataCell(Text('amutuhaireguma10@gmail.com')),
                  DataCell(Text('+256-767-788-657')),
                  DataCell(Text('25/09/2021')),
                  DataCell(Text('Student')),
                  DataCell(Text('Makerere University')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Guma')),
                  DataCell(Text('Amutuhaire')),
                  DataCell(Text('Mujaidu')),
                  DataCell(Text('Male')),
                  DataCell(Text('CM19647887875')),
                  DataCell(Text('RM 001')),
                  DataCell(Text('amutuhaireguma10@gmail.com')),
                  DataCell(Text('+256-767-788-657')),
                  DataCell(Text('25/09/2021')),
                  DataCell(Text('Student')),
                  DataCell(Text('Makerere University')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Guma')),
                  DataCell(Text('Amutuhaire')),
                  DataCell(Text('Mujaidu')),
                  DataCell(Text('Male')),
                  DataCell(Text('CM19647887875')),
                  DataCell(Text('RM 001')),
                  DataCell(Text('amutuhaireguma10@gmail.com')),
                  DataCell(Text('+256-767-788-657')),
                  DataCell(Text('25/09/2021')),
                  DataCell(Text('Student')),
                  DataCell(Text('Makerere University')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Guma')),
                  DataCell(Text('Amutuhaire')),
                  DataCell(Text('Mujaidu')),
                  DataCell(Text('Male')),
                  DataCell(Text('CM19647887875')),
                  DataCell(Text('RM 001')),
                  DataCell(Text('amutuhaireguma10@gmail.com')),
                  DataCell(Text('+256-767-788-657')),
                  DataCell(Text('25/09/2021')),
                  DataCell(Text('Student')),
                  DataCell(Text('Makerere University')),
                ],
              ),
            ],
          ),
        ));
  }
}
