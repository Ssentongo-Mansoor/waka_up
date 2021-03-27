import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waka/providers/tenantsprovider.dart';

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
            rows: _tenantsRows(),
          ),
        ));
  }

  List<DataRow> _tenantsRows() {
    var tenantsProvider = Provider.of<TenantsProvider>(context);
    return tenantsProvider.getTenantList
        .map(
          (data) => DataRow(
            cells: [
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.firstName),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.lastName),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.otherName),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.gender),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.nationalIdNumber),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.roomId),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.emailAddress),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.phoneNumber),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.registrationDate),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.occupation),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.companyName),
                ),
              )
            ],
          ),
        )
        .toList();
  }
}
