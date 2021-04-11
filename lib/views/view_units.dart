//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:async/async.dart';
import 'package:waka/providers/roomsprovider.dart';
import 'package:provider/provider.dart';

class ViewUnits extends StatefulWidget {
  @override
  _ViewUnitsState createState() => _ViewUnitsState();
}

class _ViewUnitsState extends State<ViewUnits> {
  final AsyncMemoizer _unitsListMemoizer = AsyncMemoizer();
  @override
  Widget build(BuildContext context) {
    var _unitsProvider = Provider.of<RoomsProvider>(context);
    final _unitsListFuture = this._unitsListMemoizer.runOnce(() async {
      await Future.delayed(Duration(seconds: 2));
      return _unitsProvider.getRoomsListInfo();
    });
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
            child: FutureBuilder(
              future: _unitsListFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  try {
                    return DataTable(
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
                      rows: _unitsRows(),
                    );
                  } catch (e) {
                    print('Units snapshot error: ' + e.toString());
                  }
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Something went wrong'),
                  );
                }
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            )));
  }

  List<DataRow> _unitsRows() {
    var _unitsProvider = Provider.of<RoomsProvider>(context);
    return _unitsProvider.getRoomList
        .map(
          (data) => DataRow(
            cells: [
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.roomId),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.roomName),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.type),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.rent),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.status),
                ),
              ),
            ],
          ),
        )
        .toList();
  }
}
